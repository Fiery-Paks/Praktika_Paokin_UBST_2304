using System.Globalization;
using Microsoft.ML;
using Microsoft.ML.Data;
using ExcelDataReader;

[Serializable]
public class VehicleData
{
    [LoadColumn(0)] public float TypeVehicleID;
    [LoadColumn(1)] public string Name;
    [LoadColumn(2)] public float MaxWeight;
    [LoadColumn(3)] public string Description;
    [LoadColumn(4)] public float GrossWeight;
    [LoadColumn(5)] public float TareWeight;
    public float NetWeight => GrossWeight - TareWeight;
}

[Serializable]
public class VehiclePrediction
{
    [ColumnName("PredictedLabel")]
    public float PredictedLabel;
}

class Program
{
    static void Main()
    {
        // Режим работы: 1 - обучение, 2 - тестирование
        int mode = 2;

        System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);

        if (mode == 1)
        {
            TrainAndSaveModel();
        }
        else
        {
            TestLoadedModel();
        }
    }

    static void TrainAndSaveModel()
    {
        Console.WriteLine("Режим обучения модели...");

        var data = LoadDataFromExcel("SQLData.xlsx");

        var mlContext = new MLContext();

        // Преобразование данных в IDataView
        var dataView = mlContext.Data.LoadFromEnumerable(data);

        // Конвейер обработки данных (упрощенный, без NetWeight в Features)
        var pipeline = mlContext.Transforms
            .Conversion.MapValueToKey(outputColumnName: "Label", inputColumnName: "TypeVehicleID")
            .Append(mlContext.Transforms.Concatenate(
                outputColumnName: "Features",
                nameof(VehicleData.GrossWeight),
                nameof(VehicleData.TareWeight)
            )
            .Append(mlContext.MulticlassClassification.Trainers.LightGbm())
            .Append(mlContext.Transforms.Conversion.MapKeyToValue(outputColumnName: "PredictedLabel")));

        // Обучение модели
        Console.WriteLine("Обучение модели...");
        var model = pipeline.Fit(dataView);

        // Сохранение модели
        mlContext.Model.Save(model, dataView.Schema, "vehicle_classifier_mlnet.zip");
        Console.WriteLine("Модель сохранена в vehicle_classifier_mlnet.zip");

        // Тестирование сразу после обучения
        TestModel(mlContext, model);
    }

    static void TestLoadedModel()
    {
        Console.WriteLine("Режим тестирования загруженной модели...");

        var mlContext = new MLContext();

        try
        {
            Console.WriteLine("Загрузка модели...");
            var model = mlContext.Model.Load("vehicle_classifier_mlnet.zip", out var schema);

            // Тестирование модели
            TestModel(mlContext, model);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Тип ошибки: {ex.GetType().Name}");
            Console.WriteLine($"Сообщение: {ex.Message}");
            while (ex.InnerException != null)
            {
                ex = ex.InnerException;
                Console.WriteLine($"Вложенная ошибка: {ex.Message}");
            }
            Console.WriteLine("Попробуйте сначала обучить модель (установите mode = 1)");
        }
    }

    static void TestModel(MLContext mlContext, ITransformer model)
    {
        var predictionEngine = mlContext.Model.CreatePredictionEngine<VehicleData, VehiclePrediction>(model);

        // Тестовые данные для проверки
        var testCases = new[]
        {
            new VehicleData { GrossWeight = 2500, TareWeight = 1500 },
            new VehicleData { GrossWeight = 14500, TareWeight = 7000 },
            new VehicleData { GrossWeight = 35000, TareWeight = 13000 },
            new VehicleData { GrossWeight = 90000, TareWeight = 25000 }
        };

        Console.WriteLine("\nТестирование модели:");
        foreach (var testData in testCases)
        {
            var prediction = predictionEngine.Predict(testData);
            Console.WriteLine($"Входные данные: Gross={testData.GrossWeight}, Tare={testData.TareWeight} => Предсказанный класс: {prediction.PredictedLabel}");
        }
    }

    static VehicleData[] LoadDataFromExcel(string filePath)
    {
        using (var stream = File.Open(filePath, FileMode.Open, FileAccess.Read))
        using (var reader = ExcelReaderFactory.CreateReader(stream))
        {
            var result = reader.AsDataSet(new ExcelDataSetConfiguration()
            {
                ConfigureDataTable = (_) => new ExcelDataTableConfiguration()
                {
                    UseHeaderRow = true
                }
            });

            var table = result.Tables[0];

            return table.Rows
                .Cast<System.Data.DataRow>()
                .Select(row => new VehicleData
                {
                    TypeVehicleID = ParseFloat(row[0].ToString()),
                    Name = row[1].ToString(),
                    MaxWeight = ParseFloat(row[2].ToString()),
                    Description = row[3].ToString(),
                    GrossWeight = ParseFloat(row[4].ToString()),
                    TareWeight = ParseFloat(row[5].ToString())
                })
                .ToArray();
        }
    }

    static float ParseFloat(string value)
    {
        if (float.TryParse(value, NumberStyles.Any, CultureInfo.InvariantCulture, out float result))
            return result;
        return 0f;
    }
}
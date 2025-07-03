using Microsoft.ML.Data;

namespace WpfAppUserInterface.Classes.LerningModel
{
    [Serializable]
    public class VehicleData
    {
        public VehicleData(float grossWeight, float tareWeight)
        {
            GrossWeight = grossWeight;
            TareWeight = tareWeight;
        }

        [LoadColumn(0)] public float TypeVehicleID;
        [LoadColumn(1)] public string Name;
        [LoadColumn(2)] public float MaxWeight;
        [LoadColumn(3)] public string Description;
        [LoadColumn(4)] public float GrossWeight;
        [LoadColumn(5)] public float TareWeight;
        public float NetWeight => GrossWeight - TareWeight;

    }
}

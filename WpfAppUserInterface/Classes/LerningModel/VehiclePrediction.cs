using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System;
using Microsoft.ML;
using Microsoft.ML.Data;

namespace WpfAppUserInterface.Classes.LerningModel
{
    [Serializable]
    public class VehiclePrediction
    {
        [ColumnName("PredictedLabel")]
        public float PredictedLabel;
    }
}

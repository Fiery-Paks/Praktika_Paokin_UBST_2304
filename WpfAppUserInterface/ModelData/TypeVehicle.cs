using System;
using System.Collections.Generic;

namespace WpfAppUserInterface.ModelData;

public partial class TypeVehicle
{
    public int TypeId { get; set; }

    public string Name { get; set; } = null!;

    public double MaxWeight { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<Weighing> Weighings { get; set; } = new List<Weighing>();
}

using System;
using System.Collections.Generic;

namespace prac22.models;

public partial class Страны
{
    public string КодСтраны { get; set; } = null!;

    public string НазваниеСтраны { get; set; } = null!;

    public string? Материк { get; set; }

    public string? Столица { get; set; }

    public int? Население { get; set; }

    public string? Фото { get; set; }

    public virtual ICollection<ЭтническийСостав> ЭтническийСоставs { get; set; } = new List<ЭтническийСостав>();
}

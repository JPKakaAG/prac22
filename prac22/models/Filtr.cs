using System;
using System.Collections.Generic;

namespace prac22.models;

public partial class Filtr
{
    public int Год { get; set; }

    public string КодЯзыка { get; set; } = null!;

    public string КодСтраны { get; set; } = null!;
}

using System;
using System.Collections.Generic;

namespace prac22.models;

public partial class ЭтническийСостав
{
    public string КодСтраны { get; set; } = null!;

    public int Год { get; set; }

    public string КодЯзыка { get; set; } = null!;

    public int? НаселениеГоворящихНаЯзыке { get; set; }

    public virtual Страны КодСтраныNavigation { get; set; } = null!;

    public virtual Языки КодЯзыкаNavigation { get; set; } = null!;
}

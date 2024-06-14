using System;
using System.Collections.Generic;

namespace prac22.models;

public partial class Языки
{
    public string КодЯзыка { get; set; } = null!;

    public string НазваниеЯзыка { get; set; } = null!;

    public string? ЯзыковаяГруппа { get; set; }

    public string? ВидЗнаковойСистемы { get; set; }

    public virtual ICollection<ЭтническийСостав> ЭтническийСоставs { get; set; } = new List<ЭтническийСостав>();
}

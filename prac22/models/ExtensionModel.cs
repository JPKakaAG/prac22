using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace prac22.models
{
    public partial class Страны
    {
        public string PhotoFull
        {
            get
            {
                if (this.Фото == null)
                {
                    return null;
                }
                else
                {
                    string namePhoto = Directory.GetCurrentDirectory() + "\\image\\" + Фото;
                    return namePhoto;
                }
            }
        }
    }
}

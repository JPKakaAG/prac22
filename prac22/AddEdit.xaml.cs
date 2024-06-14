using Microsoft.EntityFrameworkCore;
using prac22.models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace prac22
{
    /// <summary>
    /// Логика взаимодействия для AddEdit.xaml
    /// </summary>
    public partial class AddEdit : Window
    {
        public AddEdit()
        {
            InitializeComponent();
        }
        Prac22Context _db = new Prac22Context();
        ЭтническийСостав _этническийсостав;
        OpenFileDialog open = new OpenFileDialog();

        private void WindowLoaded(object sender, RoutedEventArgs e)
        {
            if (Data.ЭтническийСостав == null)
            {
                _этническийсостав = new ЭтническийСостав();
            }
            else
            {
                _db.Страныs.Load();
                _db.Языкиs.Load();
                _этническийсостав = _db.ЭтническийСоставs.Find(Data.ЭтническийСостав.НаселениеГоворящихНаЯзыке, Data.ЭтническийСостав.Год, Data.ЭтническийСостав.КодСтраныNavigation.НазваниеСтраны, Data.ЭтническийСостав.КодЯзыкаNavigation.НазваниеЯзыка, Data.ЭтническийСостав.КодСтраныNavigation.PhotoFull);
            }
            WAddEdit.DataContext = _этническийсостав;
            _db.Страныs.Load();
            _db.Языкиs.Load();
        }

        private void AddClick(object sender, RoutedEventArgs e)
        {
            _db.Страныs.Load();
            _db.Языкиs.Load();
            StringBuilder errors = new StringBuilder();
            if (tbcountry.Text.Length == 0) errors.AppendLine("Введите страну");
            if (tblang.Text.Length == 0 ) errors.AppendLine("Введите язык");

            if (errors.Length > 0)
            {
                System.Windows.MessageBox.Show(errors.ToString());
                return;
            }
            try
            {
                if (open.SafeFileName.Length != 0)
                {
                    string newNamePhoto = Directory.GetCurrentDirectory() +
                        "\\image\\" + open.SafeFileName;
                    File.Copy(open.FileName, newNamePhoto, true);
                    _этническийсостав.КодСтраныNavigation.Фото = open.SafeFileName;
                }
            }
            catch { }
            try
            {
                if (Data.страны == null)
                {
                  
                    _db.ЭтническийСоставs.Add(_этническийсостав);
                    _db.SaveChanges();
                }
                else
                {
                    _db.SaveChanges();
                }
                this.Close();
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(ex.ToString());
            }

        }

        private void AddPhoto(object sender, RoutedEventArgs e)
        {
            open.Filter = "Все файлы |*.*| Файлы *.jpg|*.jpg";
            open.FilterIndex = 2;
            if (open.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                return;
            }
            BitmapImage img = new BitmapImage(new Uri(open.FileName));
            imgPhoto.Source = img;
        }

        private void NoClick(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}

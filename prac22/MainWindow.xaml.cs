using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using prac22.models;
using System.Reflection;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace prac22
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }
        private void WindowInitialized(object sender, EventArgs e)
        {
            Autorize f = new Autorize();
            f.ShowDialog();
            btndel.IsEnabled = true;
            btnred.IsEnabled = true;
            btnadd.IsEnabled = true;
            if (Data.Login == false) Close();
            if (Data.Right == "Администратор") ;
            else
            {
                btndel.IsEnabled = false;
                btnred.IsEnabled = false;
                btnadd.IsEnabled = false;
            }
        }
        private void WindowLoaded(object sender, RoutedEventArgs e)
        {
            LoadDBInListView();
        }

        void LoadDBInListView()
        {
            using (Prac22Context _db = new Prac22Context())
            {
                int selectedIndex = lv.SelectedIndex;
                _db.Страныs.Load();
                _db.Языкиs.Load();
                lv.ItemsSource = _db.ЭтническийСоставs.ToList();
                if (selectedIndex != -1)
                {
                    if (selectedIndex == lv.Items.Count) selectedIndex--;
                    lv.SelectedIndex = selectedIndex;
                    lv.ScrollIntoView(lv.Items[selectedIndex]);
                }
                lv.Focus();
            }
        }

        private void addCLick(object sender, RoutedEventArgs e)
        {
            Data.ЭтническийСостав = null;
            AddEdit ar = new AddEdit();
            ar.Owner = this;
            ar.ShowDialog();
            LoadDBInListView();
        }

        private void redCLick(object sender, RoutedEventArgs e)
        {
            if (lv.SelectedItems != null)
            {
                Data.ЭтническийСостав = (ЭтническийСостав)lv.SelectedItem;
                AddEdit ar = new AddEdit();
                ar.Owner = this;
                ar.WAddEdit.Title = "Редактирование записи";
                ar.btnadd.Content = "Редактировать";
                ar.ShowDialog();
                LoadDBInListView();
            }
        }

        private void delClick(object sender, RoutedEventArgs e)
        {
            MessageBoxResult result;
            result = MessageBox.Show("Удалить запись?", "Удаление записи", MessageBoxButton.YesNo);
            if (result == MessageBoxResult.Yes)
            {
                try
                {
                    ЭтническийСостав row = (ЭтническийСостав)lv.SelectedItem;
                    if (row != null)
                    {
                        using (Prac22Context _db = new Prac22Context())
                        {
                            _db.ЭтническийСоставs.Remove(row);
                            _db.SaveChanges();
                        }
                        LoadDBInListView();
                    }
                }
                catch
                {
                    MessageBox.Show("Ошибка удаления");
                }
            }
            else lv.Focus();
        }

        private void autoClick(object sender, RoutedEventArgs e)
        {
            WindowInitialized(sender, e);
        }

        private void filtrClick(object sender, RoutedEventArgs e)
        {
            if (filtrtb.Text.IsNullOrEmpty() == false)
            {
                using (Prac22Context _db = new Prac22Context())
                {
                    _db.Страныs.Load();
                    var filtered = _db.ЭтническийСоставs.Where(p => p.КодСтраныNavigation.НазваниеСтраны.Contains(filtrtb.Text) ||
                    p.Год.ToString().Contains(filtrtb.Text) ||
                    p.КодЯзыкаNavigation.НазваниеЯзыка.ToString().Contains(filtrtb.Text));
                    lv.ItemsSource = filtered.ToList();
                }
            }
            else
            {
                LoadDBInListView();
            }
        }
        private void sbrosClick(object sender, RoutedEventArgs e)
        {
            LoadDBInListView();
            filtrtb.Clear();
        }

        private void findCLick(object sender, RoutedEventArgs e)
        {
            if (findtb.Text.IsNullOrEmpty() == false)
            {
                List<ЭтническийСостав> listItem2 = (List<ЭтническийСостав>)lv.ItemsSource;
                var finded2 = listItem2.Where(p => p.КодСтраныNavigation.НазваниеСтраны.ToString().Contains(findtb.Text) ||
                    p.Год.ToString().Contains(findtb.Text) ||
                    p.КодЯзыкаNavigation.НазваниеЯзыка.ToString().Contains(findtb.Text));
                if (finded2.Count() > 0)
                {
                    ЭтническийСостав item = finded2.First();
                    lv.SelectedItem = item;
                    lv.ScrollIntoView(item);
                    lv.Focus();
                }
            }
        }
    }
}
using Dapper;
using Magazyn.Infrastructure;
using Magazyn.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Magazyn
{
    /// <summary>
    /// Interaction logic for DostawyWindow.xaml
    /// </summary>
    public partial class DostawyWindow : Window
    {
        private readonly IDbConnection _sqlConnection = SqlConnectionFactory.GetConnection();
        DateTime dateDostawy = DateTime.Now;
        public int progressID = 0;
        public DostawyWindow()
        {
            InitializeComponent();
            RefleshProduct();
            RefleshTowary();
            var sqlGetLastID = "SELECT TOP 1 ID_Towaru from Towary ORDER BY ID_Towaru DESC";
            Towary lastID = _sqlConnection.Query<Towary>(sqlGetLastID).SingleOrDefault();
            progressID = lastID.ID_Towaru;
        }

        private void DatePicker_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            var picker = sender as DatePicker;

            // ... Get nullable DateTime from SelectedDate.
            DateTime? date = picker.SelectedDate;
            if (date == null)
            {
                // ... A null object.
                dateDostawy = date.Value;
            }
          
        }

        public void RefleshProduct()
        {

            comboProdukt.Items.Clear();
      
            var sql = "SELECT * FROM Produkt";
            Produkt[] products = _sqlConnection.Query<Produkt>(sql).ToArray();

            foreach (Produkt item in products)
            {
                comboProdukt.Items.Add(item);

            }

        }
        public void RefleshTowary()
        {
            listboxTowaries.Items.Clear();
            var sql = "SELECT  T.*,P.* FROM Towary T INNER JOIN  Produkt P ON T.ID_Produktu  =P.ID_Produktu  ";
            Opis_towaru[] towaries = _sqlConnection.Query<Opis_towaru>(sql).ToArray();

            foreach (Opis_towaru item in towaries)
            {
                listboxTowaries.Items.Add(item);

            }

        }
        private void addProduktBtn(object sender, RoutedEventArgs e)
        {
            Produkt Ity = comboProdukt.SelectedItem as Produkt;
            var ID_Produktu = Ity.ID_Produktu;

            var sqlCreateProduct = "INSERT INTO Towary (ID_Towaru, ID_Produktu ,Data , Ilosc , Cena ) VALUES (@id ,@id_Productu, @Data, @ilosc,@cena)";
            _sqlConnection.Execute(sqlCreateProduct, new { id = progressID + 1, id_Productu = ID_Produktu, Data = dateDostawy , ilosc = int.Parse(txtQuantity.Text), cena = float.Parse(txtCena.Text) });
            RefleshTowary();
        }
    }
}

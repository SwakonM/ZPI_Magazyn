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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Magazyn
{
    /// <summary>
    /// Interaction logic for Produkt.xaml
    /// </summary>
    public partial class ProduktWindow : Window
    {

        private readonly IDbConnection _sqlConnection = SqlConnectionFactory.GetConnection();
        public int progressID = 0;
        public void RefleshType()
        {
            comboTyp.Items.Clear();

            var sql = "SELECT * FROM Typy";
            Typy[] Typs = _sqlConnection.Query<Typy>(sql).ToArray();

            foreach (Typy klient in Typs)
            {
                comboTyp.Items.Add(klient);
            }
        }

        public void RefleshProducts()
        {
            listboxProdukt.Items.Clear();
            var sql = "SELECT P1.*,P2.* ,T.* FROM  Produkt P1 INNER JOIN Producenci P2 ON P1.ID_Producenta =P2.ID_Producenta INNER JOIN Typy T ON P1.ID_Typu =T.ID_Typu";
            Opis_productu[] products = _sqlConnection.Query<Opis_productu>(sql).ToArray();

            foreach (Opis_productu item in products)
            {
                listboxProdukt.Items.Add(item);

            }

        }
        public void RefleshProducents()
        {
            comboProducent.Items.Clear();

            var sql = "SELECT * FROM Producenci";
            Producenci[] Producents = _sqlConnection.Query<Producenci>(sql).ToArray();

            foreach (Producenci item in Producents)
            {
                comboProducent.Items.Add(item);

            }

        }
        public ProduktWindow()
        {
            InitializeComponent();
            RefleshType();
            RefleshProducents();
            RefleshProducts();
            comboProducent.SelectedIndex = 0;
            comboTyp.SelectedIndex = 0;
            var sqlGetLastID = "SELECT TOP 1 ID_Produktu from Produkt ORDER BY ID_Produktu DESC";
            Produkt lastID = _sqlConnection.Query<Produkt>(sqlGetLastID).SingleOrDefault();
            progressID = lastID.ID_Produktu;
            RefleshProducts();
        }

        private void addProduktBtn(object sender, RoutedEventArgs e)
        {
            Typy Ity = comboTyp.SelectedItem as Typy;
            var ID_Typu = Ity.ID_Typu;
            Producenci producent = comboProducent.SelectedItem as Producenci;
            var ID_Producenta = producent.ID_Producenta;
            var ProduktName = txtNazwaProduktu.Text;
            var sqlCreateProduct = "INSERT INTO Produkt (ID_Produktu ,Nazwa_Produktu, ID_Producenta, ID_Typu) VALUES (@id ,@name, @id_producenta, @id_typu)";
            NewProduct(ID_Typu, ID_Producenta, ProduktName, sqlCreateProduct);
            RefleshProducts();
        }

        private void NewProduct(int ID_Typu, int ID_Producenta, string ProduktName, string sqlCreateProduct)
        {
            try
            {
                _sqlConnection.Execute(sqlCreateProduct, new { id = progressID + 1, name = ProduktName, id_producenta = ID_Producenta, id_typu = ID_Typu });
            }
            catch (Exception x)
            {

                System.Console.WriteLine(x.Message);
            }
        }
    }
}
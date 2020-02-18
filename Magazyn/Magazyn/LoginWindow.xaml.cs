using Dapper;
using Magazyn.Models;
using Magazyn.Infrastructure;
using System.Data;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
    /// Logika interakcji dla klasy LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        private readonly IDbConnection _sqlConnection = SqlConnectionFactory.GetConnection();
        public LoginWindow()
        {
            InitializeComponent();
            errorLabel.Content = "";
        }
        private void loginSubmitBtn(object sender, RoutedEventArgs e)
        {


             var res = _sqlConnection.ExecuteScalar<int>("SELECT COUNT(*) FROM Uzytkownicy WHERE Login = @log AND Password = @pass", new { log = txtUsername.Text, pass = txtPassword.Password});

            if (res == 1)
            {
                string user = txtUsername.Text;
                MainWindow mainWindow = new MainWindow(user);
                mainWindow.Show();
                this.Close();
            }
            else
            {
                //MessageBox.Show("Wrong username or password");
                errorLabel.Content = "Błędny login lub hasło!";
            }
        }
    }
}

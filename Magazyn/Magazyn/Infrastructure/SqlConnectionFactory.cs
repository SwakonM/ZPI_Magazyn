﻿using System.Data;
using System.Data.SqlClient;

namespace Magazyn.Infrastructure
{
    public static class SqlConnectionFactory
    {
        //Data Source = DESKTOP - 9N69PM3;Integrated Security = True
        private readonly static string _connectionString = @"Data Source=DESKTOP-9N69PM3;Integrated Security=True";

        private static IDbConnection _connection;

        public static IDbConnection GetConnection()
        {
            if(_connection == null || _connection.State != ConnectionState.Open)
            {
                _connection = new SqlConnection(_connectionString);
            }
            return _connection;
        }
        public static void Dispose()
        {
            if (_connection.State == ConnectionState.Open)
                _connection.Close();
        }
    }
}

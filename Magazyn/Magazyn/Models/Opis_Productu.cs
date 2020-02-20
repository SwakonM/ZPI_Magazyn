﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Magazyn.Models
{
    class Opis_productu
    {
        public int ID_Produktu { get; set; }
        public string Nazwa_Produktu { get; set; }
        public int ID_Producenta { get; set; }
        public string Nazwa_Producenta { get; set; }
        public int ID_Typu { get; set; }
        public string Nazwa_Typu { get; set; }
        //public ICollection<Towary> Towary { get; set; }
        public override string ToString()
        {
            return string.Format("{0,-20}  {0,-20} {0,-20}", Nazwa_Produktu, Nazwa_Producenta, Nazwa_Typu);
        }
    }
}

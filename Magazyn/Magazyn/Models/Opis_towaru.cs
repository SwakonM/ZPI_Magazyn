using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Magazyn.Models
{
    class Opis_towaru
    {
        public int ID_Produktu { get; set; }
        public string Nazwa_Produktu { get; set; }
        public DateTime Data { get; set; }
        public int Ilosc { get; set; }
        public float Cena { get; set; }
        public int ID_Towaru { get; set; }

        public override string ToString()
        {
            return string.Format("{0,-20} {1,5} {2,8}", Nazwa_Produktu, Ilosc, Cena);
        }
    }
}

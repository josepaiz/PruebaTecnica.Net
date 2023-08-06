using System;
using System.Data.SqlClient;

namespace Inciso4
{
    class Program
    {


        static void Main(string[] args)
        {
               
        metodos obj = new metodos();
            obj.GetData("SELECT * FROM PRODUCTO" , "Data Source = DESK\\SQLEXPRESS; Initial Catalog = PruebaTecnica; user id = sa; password = 123");
            obj.Sentences("DELETE FROM PROYECTO WHERE PROYECTO = 3", "Data Source = DESK\\SQLEXPRESS; Initial Catalog = PruebaTecnica; user id = sa; password = 123");
            obj.SentencesConsole("UPDATE PROYECTO SET NOMBRE = 'PRUEBA' WHERE PROYECTO = 1", "Data Source = DESK\\SQLEXPRESS; Initial Catalog = PruebaTecnica; user id = sa; password = 123");

        }
    }
}

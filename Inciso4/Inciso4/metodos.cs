using System;
using System.Data;
using System.Data.SqlClient;

namespace Inciso4
{

    class metodos
    {

        public SqlConnection conexion = new SqlConnection();
        
        // PARA RETORNAR DATOS 
        public DataSet GetData(string qry, string cadena ) 
        {

            try
            {
                conexion.ConnectionString = cadena;
                SqlDataAdapter adapter;
                DataSet ds = new DataSet();

                string query = qry;
                conexion.Open();
                adapter = new SqlDataAdapter(query, conexion);
                adapter.Fill(ds, "SELECT");
                conexion.Close();
                return ds;
        }
            catch(Exception e)
            {
                conexion.Close();

            }
            return null;
         
            

        }

        public string Sentences(string query , string cadena)
        {
            try
            {
                conexion.ConnectionString = cadena;
                bool Select = query.ToUpper().Contains("SELECT");

                if (Select == true)
                {
                    SqlDataAdapter adapter;
                    DataSet ds = new DataSet();
                    DataTable t = new DataTable();
                    string query1 = query;
                    conexion.Open();
                    adapter = new SqlDataAdapter(query1, conexion);
                    adapter.Fill(t);
                    conexion.Close();

                    int count = 0;
                    DataRow[] rows;

                    rows = t.Select();
                    count = rows.Length;

                    string response = ("Los registros de la consulta son: " + count.ToString());
                    return response;
                }
                else
                {
                    int Cantidad;
                    string qry = query;
                    SqlCommand cmd = new SqlCommand(qry, conexion);
                    conexion.Open();
                    Cantidad = cmd.ExecuteNonQuery();
                    conexion.Close();
                    string response = ("Los registros afectados son: " + Cantidad + "");
                    return response;
                }
            }
            catch (Exception e)
            {
                return e.Message;
            }


        }


        // VER DATOS EN CONSOLA 

        public void SentencesConsole(string query, string cadena)
        {
            try
            {
                conexion.ConnectionString = cadena;
                bool Select = query.ToUpper().Contains("SELECT");

                if (Select == true)
                {
                    SqlDataAdapter adapter;
                    DataSet ds = new DataSet();
                    DataTable t = new DataTable();
                    string query1 = query;
                    conexion.Open();
                    adapter = new SqlDataAdapter(query1, conexion);
                    adapter.Fill(t);
                    conexion.Close();

                    int count = 0;
                    DataRow[] rows;

                    rows = t.Select();
                    count = rows.Length;

                    Console.WriteLine("Los registros de la consulta son: " + count.ToString());
                   
                }
                else
                {
                    int Cantidad;
                    string qry = query;
                    SqlCommand cmd = new SqlCommand(qry, conexion);
                    conexion.Open();
                    Cantidad = cmd.ExecuteNonQuery();
                    conexion.Close();
                    Console.WriteLine("Los registros afectados son: " + Cantidad + "");
                    
                }
            }
            catch (Exception e)
            {
                Console.WriteLine( e.Message);
            }


        }
    }
    }

 

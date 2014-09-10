using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Data;
using System.Web.UI.WebControls;
using System.IO;

//Version: 1.7
namespace drvvv
{
    public static class Csv
    {
        public static List<string[]> GetCsv(FileUpload fileUpload)
        {
            List<string[]> sampleCsvData = new List<string[]>();
            using (BinaryReader sampleReader = new BinaryReader(fileUpload.PostedFile.InputStream))
            {
                byte[] sampleFile = sampleReader.ReadBytes(fileUpload.PostedFile.ContentLength);
                MemoryStream sampleMemoryStream = new MemoryStream(sampleFile);
                using (StreamReader sampleStreamReader = new StreamReader(sampleMemoryStream))
                {
                    string[] sampleFileLines = sampleStreamReader.ReadToEnd().Split(new string[1] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
                    var sampleQuery = from sampleLine in sampleFileLines select sampleLine.Split(',');

                    sampleCsvData.AddRange(sampleQuery);
                }
            }
            return sampleCsvData;
        }
        public static void ExportCSV(DataTable data, string fileName)
        {
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ContentType = "text/csv";
            HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=" + fileName + ".csv");
            HttpContext.Current.Response.Charset = string.Empty;
            HttpContext.Current.Response.ContentEncoding = Encoding.GetEncoding(1255); 
           
            StringBuilder sb = new StringBuilder();
            // Write header
            for (int i = 0; i <= data.Columns.Count - 1; i++)
            {
                if (i > 0) sb.Append(",");
                sb.Append(data.Columns[i].ColumnName);

            }
            sb.Append(Environment.NewLine);
            // Write data
            foreach (DataRow row in data.Rows)
            {
                for (int i = 0; i <= data.Columns.Count - 1; i++)
                {
                    if (i > 0)

                    sb.Append(",");
                    //sb.Append("\"" + row[i].ToString().Replace("\"", "\"\"") + "\"");
                    sb.Append(row[i].ToString());


                }
                sb.Append(Environment.NewLine);
            }
            HttpContext.Current.Response.Write(sb.ToString());
            HttpContext.Current.Response.End();
        }
        //מעבירים למתודה ExportCSV שני פרמטרים:
        //DataTable ושם לקובץ ה CSV שניצור.
        //ExportCSV(oDataTable, "Offers");
    }
}

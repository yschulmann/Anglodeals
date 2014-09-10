using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

// תוצאות חיפוש
public class SearchResult
{
    public int ID { get; set; }
    public string Title { get; set; }
    public string Subject { get; set; }
    public string ImgName { get; set; }
    public int ClassificationID { get; set; }
    public int Priority { get; set; }
}

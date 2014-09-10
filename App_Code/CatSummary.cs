using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

// החזרת תקציר עבור תכנים
// verison: 1.6

namespace drvvv
{
    public class CatSummary
    {
        public static string Cat(string summary, int numlength)
        {
            string newSummary = summary;
            if (newSummary != null)
            {
                newSummary = Regex.Replace(summary, @"<(.|)*?>", string.Empty);

                int newnumlength = newSummary.Length;
                if (newnumlength > numlength)
                {
                    newSummary = newSummary.Substring(0, numlength);
                    newSummary = newSummary.Substring(0, newSummary.LastIndexOf(" "));
                }
            }
            return newSummary;
        }
        public static string CatLength(string summary, int numlength)
        {
            string newSummary = summary;
            if (newSummary != null)
            {
                newSummary = Regex.Replace(summary, @"<*?div(.|)*?>", string.Empty);

                int newnumlength = newSummary.Length;
                if (newnumlength > numlength)
                {
                    newSummary = newSummary.Substring(0, numlength);
                    newSummary = newSummary.Substring(0, newSummary.LastIndexOf(" "));
                }
            }
            return newSummary;
        }
        public static string ReplaceBr(string summary)
        {
            if (summary != null && summary != "")
            {
              summary = summary.Replace("\n", "<br />");
            }
            return summary;
        }
        public static string CompletionUrl(string Url)
        {
            if(!string.IsNullOrEmpty(Url) && !Url.StartsWith("http://") && !Url.StartsWith("https://"))
                Url = string.Format("http://{0}", Url);

            return Url;
        }
        public static string CleanUrl(string url)
        {
            return url.Replace('"', ' ').Replace(":", "").Replace("*", "").Replace("'", "").Replace('+', '-').Replace("?", "").Replace('/', '-').Trim().Replace(' ', '_'); // Regex.Replace(url, @"[#%&*{}\:<>?/+""]", string.Empty)
        }
    }
}

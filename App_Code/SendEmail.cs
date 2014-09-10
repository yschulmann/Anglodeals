using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

// Version: 2.1

namespace drvvv
{
    public static class SendEmail
    {
        public static bool Send(string issue, string body, string to, string from)
        {
            try
            {
                MailMessage myMessage = new MailMessage();

                myMessage.To.Add(new MailAddress(to));
                myMessage.Bcc.Add(new MailAddress("8109200@gmail.com"));
                myMessage.From = new MailAddress(from);
                myMessage.Subject = issue;
                myMessage.Body = body;
                //myMessage.IsBodyHtml = true;
                SmtpClient mySmtp = new SmtpClient();
                //mySmtp.EnableSsl = true; 
                mySmtp.Send(myMessage);

                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}

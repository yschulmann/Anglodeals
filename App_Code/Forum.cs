using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Forum
/// </summary>
namespace drvvv
{
    public static class Forum
    {
        public static string GetUrlMsg(Message msg)
        {
            return string.Format("http://{0}.co.il/ForumMessage.aspx?Discussion={1}", (drvvv.Sites)msg.SiteID, msg.FromMessagesID.HasValue ? msg.FromMessagesID.Value : msg.ID);
        }
    }
}
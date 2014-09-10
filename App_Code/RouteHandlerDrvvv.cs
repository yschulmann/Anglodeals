using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Compilation;
using System.Web.UI;

public class RouteHandlerEn : IRouteHandler
{
    public IHttpHandler GetHttpHandler(RequestContext requestContext)
    {
        string fileNameEn;
        if (requestContext.RouteData.Values.Count() > 0)
        {
            if (string.IsNullOrEmpty((string)requestContext.RouteData.Values["name"]))
                fileNameEn = "Default.aspx";
            else if (((string)requestContext.RouteData.Values["name"]).ToLower().EndsWith("manager/"))
                fileNameEn = "manager/Default.aspx";
            else
                fileNameEn = requestContext.RouteData.Values["name"].ToString();

            //throw new HttpException(fileNameEn);
        }
        else
            fileNameEn = "default.aspx";

        return (IHttpHandler)BuildManager.CreateInstanceFromVirtualPath("~/" + fileNameEn, typeof(System.Web.UI.Page));
    }
}
//public class SampleRoutingHandler : IRouteHandler
//{
//    private string WhereToRoute;
//    public SampleRoutingHandler(string dest)
//    {
//        WhereToRoute = dest.Replace("/en/", "");
//    }
//    public IHttpHandler GetHttpHandler(RequestContext requestContext)
//    {
//        foreach (var item in requestContext.RouteData.Values)
//        {
//            requestContext.HttpContext.Items.Add(item.Key, item.Value);
//        }

//        return (IHttpHandler)BuildManager.CreateInstanceFromVirtualPath(WhereToRoute, typeof(Page));
//    }
//}

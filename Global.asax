<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Threading" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Linq" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Import Namespace="System.Diagnostics" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        //RouteTable.Routes.Add(new Route("fr/{*name}", new RouteHandlerEn()));
        //RouteTable.Routes.Add(new Route("He/{*name}", new RouteHandlerEn()));
        
        //RouteTable.Routes.RouteExistingFiles = true; 
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    {
        // Code that runs when an unhandled error occurs
      
        //        'additional actions...









    }
    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>

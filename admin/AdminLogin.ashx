<%@ WebHandler Language="C#" Class="AdminLogin" %>

using System;
using System.Web;
using System.Data;
using System.Web.SessionState;

public class AdminLogin : IHttpHandler, IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        string adminName = context.Request.Form["login_user"];
        string adminPwd = context.Request.Form["login_pwd"];
        DataSet ds = DBHelper.getDataSet("select * from T_admin where admin='" + adminName + "' and pwd='" + adminPwd + "'");
        int cnt = ds.Tables[0].Rows.Count;

        if (cnt > 0)
        {
            context.Session["Id"] = ds.Tables[0].Rows[0]["id"].ToString();
            context.Session["Name"] = ds.Tables[0].Rows[0]["admin"].ToString();
            context.Session["Limit"] = ds.Tables[0].Rows[0]["limit"].ToString();
            context.Response.Redirect("EditBooks.aspx");
        }
        else
        {
            context.Response.Redirect("login.htm");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
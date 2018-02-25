<%@ WebHandler Language="C#" Class="useLogin" %>

using System;
using System.Web;
using System.Data;
using System.Web.SessionState;

public class useLogin : IHttpHandler, IRequiresSessionState
{
    
    public void ProcessRequest (HttpContext context) {
        string username = context.Request.Form["username"];
        string password = context.Request.Form["password"];
        DataSet ds = DBHelper.getDataSet("select * from T_user where uname='" + username + "' and pwd='" + password + "'");
        int cnt = ds.Tables[0].Rows.Count;

        if (cnt > 0)
        {
            string id = ds.Tables[0].Rows[0]["id"].ToString();
            DataSet ds2 = DBHelper.getDataSet("select * from T_userInfo where uname="+id+"");
            int cnt2 = ds2.Tables[0].Rows.Count;
            if (cnt2==0)
            {
                DBHelper.exeDML("insert into T_userInfo(mail,myimg,phone,birthday,balance,uname)values(' ','img/u_pic.png',' ',' ',0.00," + id + ")");
            }
           
            context.Session["adminId"] = ds.Tables[0].Rows[0]["id"].ToString();
            context.Session["adminName"] = ds.Tables[0].Rows[0]["uname"].ToString();
            context.Session["adminLimit"] = ds.Tables[0].Rows[0]["utype"].ToString();
            context.Response.Redirect("bookself.aspx");
        }
        else
        {
            context.Response.Redirect("useLogin.htm");
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
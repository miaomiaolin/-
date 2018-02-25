<%@ WebHandler Language="C#" Class="AddAdminUser" %>

using System;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Text;

public class AddAdminUser : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "application/json";
        string limit = context.Request["limit"];
        string adminName = context.Request["adminName"];
        string adminPwd = context.Request["adminPwd"];
        string outstr = AddAdmin(limit, adminName, adminPwd);
        context.Response.Write(outstr);
    }

    public string AddAdmin(string limit, string adminName, string adminPwd)
    {

        string sql = "insert into T_admin values('"+adminName+"','"+adminPwd+"',"+limit+")";
        int n = DBHelper.exeDML(sql);
        StringBuilder Builder = new StringBuilder();


        Builder.Append("{");
        Builder.Append("\"loginok\":" + n);

        Builder.Append("}");
        return Builder.ToString();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}
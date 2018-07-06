<%@ WebHandler Language="C#" Class="userReg" %>

using System;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Text;

public class userReg : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "application/json";
        string regName = context.Request["regName"];
        string regPwd = context.Request["regPwd"];
        string outstr = AddUser(regName, regPwd);
        context.Response.Write(outstr);
    }
    public string AddUser(string regName, string regPwd)
    {

        string sql = "insert into T_user values('" + regName + "','" + regPwd + "',0)";
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
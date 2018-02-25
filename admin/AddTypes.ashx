<%@ WebHandler Language="C#" Class="AddTypes" %>

using System;
using System.Web;
using System.Data.OleDb;
using System.Data;
using System.Text;

public class AddTypes : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "application/json";
        string typeName = context.Request["typeName"];
        string outstr = AddThisType(typeName);
        context.Response.Write(outstr);
    }
    public string AddThisType(string typeName)
    {

        string sql = "insert into T_category values('"+typeName+"');";
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
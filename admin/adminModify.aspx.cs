using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class adminModify : System.Web.UI.Page
{
    public string name = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        string sql = "select*from T_admin where id=" + id + "";
        DataSet ds = DBHelper.getDataSet(sql);
        string admin = ds.Tables[0].Rows[0]["admin"].ToString();
        name = "" + admin + "";
        
    }
    protected void adminChangeBtn_ServerClick(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        string adminPwd = Request.Form["adminPwd"];
        string limit = Request.Form["limit"];
        if (adminPwd == "")
        {
            Response.Write("<script>alert('密码不能为空！');</script>");
            return;
        }
        int lim = int.Parse(limit);
        string sql = "update T_admin set pwd='" + adminPwd + "',limit=" + lim + " where id=" + id + "";
        int n = DBHelper.exeDML(sql);
        if (n > 0)
        {
            Response.Redirect("EditAdminUsers.aspx");
        }
    }
}

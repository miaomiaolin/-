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

public partial class admin_adminIndex : System.Web.UI.MasterPage
{
    public string adminId = "";
    public string adminName = "";
    public string adminLimit = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        adminLimit = Session["Limit"].ToString();
        if (null == adminLimit)
        {//没有登录过
            Response.Redirect("login.htm");
        }
        else
        {
            adminId = Session["Id"].ToString();
            adminName = Session["Name"].ToString();
            string limit = adminLimit.ToString();
            if (limit!="True")
            {
                adminAdd.Visible = false;
                adminEit.Visible = false;
            }
        }
    }
}

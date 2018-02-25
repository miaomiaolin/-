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

public partial class admin_articleModify : System.Web.UI.Page
{
    public string bookName = "";//书籍名称
    public string articleName = "";//章节名称
    public string conText = "";//章节内容
    protected void Page_Load(object sender, EventArgs e)
    {
        string bookid = Request.QueryString["bookid"];
        string articleId = Request.QueryString["articleId"];
        string sql = "select*from T_bookInfo where id=" + bookid + "";
        DataSet ds = DBHelper.getDataSet(sql);
        string bname = ds.Tables[0].Rows[0]["title"].ToString();
        bookName += "" + bname + "";
        DataSet da = DBHelper.getDataSet("select * from T_section where id=" + articleId + "");
        string aname = da.Tables[0].Rows[0]["s_name"].ToString();
        string content = da.Tables[0].Rows[0]["s_text"].ToString();
        articleName += ""+aname+"";
        conText += "" + content + "";

    }
    protected void conChangeBtn_ServerClick(object sender, EventArgs e)
    {
        string bookid = Request.QueryString["bookid"];
        string articleId = Request.QueryString["articleId"];
        string articleName = Request.Form["articleName"];//章节名称
        string content = Request.Form["content"];//内容
        if (articleName == "")
        {
            Response.Write("<script>alert('章节名称不能为空！');</script>");
            return;
        }
        if (content == "")
        {
            Response.Write("<script>alert('内容不能为空！');</script>");
            return;
        }
        string sql = "update T_section set s_name='" + articleName + "',s_text='" + content + "' where id=" + articleId + "";
        int n = DBHelper.exeDML(sql);
        if (n > 0)
        {
            Response.Redirect("EditArticle.aspx?bookid=" + bookid + "");
        }
    }
}

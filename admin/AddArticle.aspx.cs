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

public partial class admin_AddArticle : System.Web.UI.Page
{
    public string bookName = "";//书籍名称
    public string articleName = "";//章节名称
    protected void Page_Load(object sender, EventArgs e)
    {
        string bookid = Request.QueryString["bookid"];
        string sql = "select*from T_bookInfo where id="+bookid+"";
        DataSet ds = DBHelper.getDataSet(sql);
        string name = ds.Tables[0].Rows[0]["title"].ToString();
        bookName += "" + name + "";

    }
    protected void addConBtn_ServerClick(object sender, EventArgs e)
    {
        string bookid = Request.QueryString["bookid"];
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
        string sql = "insert into T_section(s_name,the_book,s_text) values('" + articleName + "'," + bookid + ",'" + content + "');";
        int n = DBHelper.exeDML(sql);
        if (n > 0)
        {
            Response.Redirect("EditArticle.aspx?bookid="+bookid+"");
        }
    }
}

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

public partial class admin_EditArticle : System.Web.UI.Page
{
    public string articlelist = "";//章节列表
    public string AddBtn = "";//添加章节按钮
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string bookid = Request.QueryString["bookid"];
            string action = Request.QueryString["action"];
            if (bookid == null)
            {
                //章节列表
                string sql = "select T_section.id ,T_section.s_name,T_bookInfo.title from T_section inner join T_bookInfo on T_section.the_book=T_bookInfo.id";
                getOutputList(sql);
            }
            else
            {
                //章节列表
                string sql = "select T_section.id ,T_section.s_name,T_section.the_book,T_bookInfo.title from T_section inner join T_bookInfo on T_section.the_book=T_bookInfo.id where the_book=" + bookid + "";
                AddBtn += "<button type=\"button\" class=\"btn btn-fined fr\" onclick=\"window.location.href='AddArticle.aspx?bookid=" + bookid + "'\">添加章节</button>";
                if (action == null)
                {
                    //章节列表
                    getOutputList(sql);
                }
                else if (action.Equals("del"))
                {
                    //删除
                    string articleId = Request.QueryString["articleId"];
                    del(articleId,sql,bookid);
                }

            }
        }
    }
    private string getOutputList(string sql)
    {
        DataSet ds = DBHelper.getDataSet(sql);
        articlelist += "<thead><tr><th width=\"15%\">ID</th><th width=\"25%\">书名</th><th width=\"30%\">章节名</th><th width=\"30%\">操作</th></tr></thead><tbody>";
        string bookid = Request.QueryString["bookid"];
        //3:显示数据
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string ArticleName = ds.Tables[0].Rows[i]["s_name"].ToString();
            string BookName = ds.Tables[0].Rows[i]["title"].ToString();

            //显示字符串
            articlelist += "<tr><td> " + id + "</td><td> " + BookName + "</td><td>" + ArticleName + "</td><td> <button type=\"button\" class=\"btn btn-close\"onclick=\"window.location.href='EditArticle.aspx?action=del&bookid=" + bookid + "&articleId=" + id + "'\">删除</button><button type=\"button\" class=\"btn btn-open\" style=\"margin-left:5px;\" onclick=\"window.location.href='articleModify.aspx?bookid=" + bookid + "&articleId=" + id + "'\"> 修改</button></td></tr>";

        }
        articlelist += "</tbody>";
        return articlelist;

    }
    void del(string id,string sql,string bookid)
    {
        if (id != null)
        {
            string sql2 = "delete from T_section where id=" + id;
            int n = DBHelper.exeDML(sql2);
            if (n > 0)
            {
                Response.Redirect("EditArticle.aspx?bookid=" + bookid + "");
            }
        }
        getOutputList(sql);
    }
}

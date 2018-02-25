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

public partial class admin_EditBooks : System.Web.UI.Page
{
    public string booklist = "";//书籍列表
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string action = Request.QueryString["action"];
            if (action == null)
            {
                //书籍列表
                string sql = "select*from T_bookInfo order by id desc";
                getOutputList(sql);
            }
            else if (action.Equals("search"))
            {
                //搜索
                search();
            }
            else if (action.Equals("del"))
            {
                //删除
                string id = Request.QueryString["id"];
                del(id);
            }
        }
    }
    private string getOutputList(string sql)
    {
        booklist += "<thead><tr><th width=\"15%\">ID</th><th width=\"15%\">图片</th><th width=\"25%\">名称</th><th width=\"15%\">会员优惠</th><th width=\"30%\"> 操作</th></tr></thead><tbody>";
        DataSet ds = DBHelper.getDataSet(sql);
        //3:显示数据
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string BookName = ds.Tables[0].Rows[i]["title"].ToString();//书籍名称
            string cover = ds.Tables[0].Rows[i]["cover"].ToString();//封面
            string member = ds.Tables[0].Rows[i]["member"].ToString();//会员
            int a = i + 1;
            //显示字符串
            booklist += "<tr><td>" + a + "</td><td><img src=\"../" + cover + "\" alt=\"1\" /></td><td> " + BookName + "</td><td><span>" + member + "</span></td><td>" +
                   "<button type=\"button\" class=\"btn btn-close\" onclick=\"window.location.href='EditBooks.aspx?action=del&id=" + id + "'\">删除</button><button type=\"button\" class=\"btn btn-open\" onclick=\"window.location.href='EditArticle.aspx?bookid=" + id + "'\" style=\"margin-left:5px;\">管理章节</button><button type=\"button\" class=\"btn btn-open\" style=\"margin-left:5px;\" onclick=\"window.location.href='bookModify.aspx?id="+id+"'\"> 修改</button></td></tr>";

        }
        booklist += "</tbody>";
        return booklist;

    }
    void search()
    {
        string sql = "select * from T_bookInfo ";
        string name = Request.Form["name"];
        if (!name.Equals(""))
        {
            sql += " where title like '%" + name + "%'";
        }
        getOutputList(sql);
    }
    void del(string id)
    {
        if (id != null)
        {
            string sql2 = "delete from T_bookInfo where id=" + id;
            int n = DBHelper.exeDML(sql2);
            if (n > 0)
            {
                Response.Redirect("EditBooks.aspx");
            }
        }
        string sql = "select * from T_bookInfo ";
        getOutputList(sql);
    }
}

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

public partial class typePage : System.Web.UI.Page
{
    public string list = "";
    public string category = "";
    public string categoryId = "";
    public string user_name = "";
    public string hello = "";
    public string login = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminId"] != null)
        {
            user_name  = Session["adminName"].ToString();
            hello = "你好,";
            login = " 退出";
        }
        else 
        {
            login = "登录";
        }
        if (!IsPostBack)
        {
            string id = Request.QueryString["id"];
            string change = Request.QueryString["change"];
            string action = Request.QueryString["action"];
            categoryId = ""+id+"";
            if (null == id)
            {//参数为空
                Response.Redirect("index.aspx");
            }
            else
            {
                if (action == null)
                {
                    string sql = "select id,title,cover,price from T_bookInfo where category=" + id;
                    string sql2 = "select category from T_category where id=" + id;
                    DataSet ds = DBHelper.getDataSet(sql2);
                    category = ds.Tables[0].Rows[0]["category"].ToString();

                    if (null == change)
                    {
                        list = getOutputList(sql);
                    }
                    else
                    {
                        int ord = int.Parse(change);
                        if (ord == 1)
                        {
                            string sql3 = sql + " order by ctr desc";
                            list = getOutputList(sql3);
                        }
                        if (ord == 2)
                        {
                            string sql4 = sql + " order by onlinetime desc";
                            list = getOutputList(sql4);
                        }
                    }
                }
                else if (action.Equals("search"))
                {
                    search();
                }                               
            }

        }
    }
    void search()
    {
        string search = Request.Form["search"]; ;
        string id = Request.QueryString["id"];
        if (!search.Equals(""))
        {
            string sql = "select id from T_bookInfo where title='" + search + "'";
            DataSet ds = DBHelper.getDataSet(sql);
            int cnt = ds.Tables[0].Rows.Count;
            if (cnt == 0)
            {
                Response.Redirect("typePage.aspx?id=" + id + "");
            }
            else
            {
                for (int i = 0; i < cnt; i++)
                {
                    string bookId = ds.Tables[0].Rows[i]["id"].ToString();
                    Response.Redirect("detailPage.aspx?id=" + bookId + "");
                }
            }
        }
        else
        {
            Response.Redirect("typePage.aspx?id=" + id + "");
        }

    }
    private string getOutputList(string sql)
    {
        string str = "";

        DataSet ds = DBHelper.getDataSet(sql);
        //3:显示数据
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string title = ds.Tables[0].Rows[i]["title"].ToString();
            string cover = ds.Tables[0].Rows[i]["cover"].ToString();
            string price = ds.Tables[0].Rows[i]["price"].ToString();

            //显示字符串
            str += "<div class=\"book\"><a href=\"detailPage.aspx?id=" + id + "\"><img src=\"" + cover + "\" alt=\"book\"></a><p><a href=\"detailPage.aspx?id=" + id + "\">" + title + "</a></p><span>￥" + price + "</span></div>";

        }
        return str;

    }
}

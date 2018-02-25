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

public partial class memberPage : System.Web.UI.Page
{
    public string list = "";
    public string user_name = "";
    public string hello = "";
    public string login = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["adminId"] != null)
        {
            user_name = Session["adminName"].ToString();
            hello = "你好,";
            login = " 退出";
        }
        else
        {
            login = "登录";
        }
        if (!IsPostBack)
        {
            string change = Request.QueryString["change"];
            string sql = "select id,title,cover,price from T_bookInfo where member=1";
            string action = Request.QueryString["action"];
            if (action == null)
            {
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
    void search()
    {
        string search = Request.Form["search"]; ;
        if (!search.Equals(""))
        {
            string sql = "select id from T_bookInfo where title='" + search + "'";
            DataSet ds = DBHelper.getDataSet(sql);
            int cnt = ds.Tables[0].Rows.Count;
            if (cnt == 0)
            {
                Response.Redirect("memberPage.aspx");
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
            Response.Redirect("memberPage.aspx");
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
            str += "<div class=\"book\"><a href=\"detailPage.aspx?id=" + id + "\"><img src=\"" + cover + "\" alt=\"book\"></a><p><a href=\"detailPage.aspx?id=" + id + "\">" + title + "</a></p><span>会员免费</span></div>";

        }
        return str;

    }
}

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

public partial class index : System.Web.UI.Page
{
    public string hostlist = "";//热门推荐
    public string recommendList = ""; //主编推荐
    public string newlist = "";//新书推荐
    public string banlist = "";//导航
    public string bookId = "";//书籍ID
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
            string sql4 = "select top 4 T_banner.id,bTitle,bCover,theBook from T_banner inner join T_bookInfo on T_banner.theBook=T_bookInfo.id where T_banner.isrecommend=1 order by T_banner.onlinetime desc";
            banlist = getBannerList(sql4);
            string action = Request.QueryString["action"];
            
            if (action == null)
            {
                //热门推荐
                string sql = "select top 12 id,title,cover,price from T_bookInfo order by ctr desc";
                hostlist = getOutputList(sql);
                //主编推荐
                string sql2 = "select top 12 id,title,cover,price from T_bookInfo where isrecommend=1 order by onlinetime desc";
                recommendList = getOutputList(sql2);
                //新书推荐
                string sql3 = "select top 12 id,title,cover,price from T_bookInfo order by onlinetime desc";
                newlist = getOutputList(sql3);
            }else if (action.Equals("search"))
            {
                //搜索
                search();
            }

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
    private string getBannerList(string sql)
    {
        string str = "";

        DataSet ds = DBHelper.getDataSet(sql);
        //3:显示数据
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string title = ds.Tables[0].Rows[i]["bTitle"].ToString();
            string cover = ds.Tables[0].Rows[i]["bCover"].ToString();
            string theBook = ds.Tables[0].Rows[i]["theBook"].ToString();

            //显示字符串
            str += "<li><a href=\"detailPage.aspx?id="+theBook+"\"><img src=\"" + cover + "\" alt=\"" + title + "\"/></a></li>";

        }
        return str;

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
                Response.Redirect("index.aspx");
            }
            else
            {
                for (int i = 0; i < cnt; i++)
                {
                    bookId = ds.Tables[0].Rows[i]["id"].ToString();
                    Response.Redirect("detailPage.aspx?id=" + bookId + "");
                }
            }

        }
        else {
            Response.Redirect("index.aspx");
        }
           

        
    }
}

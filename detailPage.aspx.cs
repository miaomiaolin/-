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

public partial class detailPage : System.Web.UI.Page
{
    public string hostlist = "";//热门推荐
    public string title = "";//书名
    public string cover = "";//封面
    public string author = "";//作者
    public string price = "";//价格
    public string brief = "";//简介
    public string section = "";//章节
    public string read = "";//进入阅读
    public string book = "";
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
            //热门推荐
            string sql = "select top 4 id,title,cover,price from T_bookInfo order by ctr desc";
            hostlist = getOutputList(sql);
            string id = Request.QueryString["id"];
            book = Request.QueryString["id"];
            if (null == id)
            {//参数为空
                Response.Redirect("index.aspx");
            }
            else
            { //参数不为空
                string sql2 = "select id,title,cover,author,price,brief from T_bookInfo where id=" + id;
                string sql3 = "select id,s_name,the_book from T_section where the_book=" + id;
                DataSet ds = DBHelper.getDataSet(sql2);
                string action = Request.QueryString["action"];
                //3:显示数据
                int cnt = ds.Tables[0].Rows.Count;
                if (0 == cnt)
                {
                    Response.Redirect("index.aspx");
                }
                else
                {
                    
                    if (action == null)
                    {
                        title = ds.Tables[0].Rows[0]["title"].ToString();
                        cover = ds.Tables[0].Rows[0]["cover"].ToString();
                        author = ds.Tables[0].Rows[0]["author"].ToString();
                        price = ds.Tables[0].Rows[0]["price"].ToString();
                        brief = ds.Tables[0].Rows[0]["brief"].ToString();
                        //增加点击率
                        hitAdd(id);
                        section = getSectionList(sql3);
                        read = getSectionId(sql3);
                    }
                    else if (action.Equals("search"))
                    {
                        search();
                    }
            
                   
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
                Response.Redirect("detailPage.aspx?id=" + id + "");
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
            Response.Redirect("detailPage.aspx?id=" + id + "");
        }

    }
    private string getSectionList(string sql)
    {

        string str = "";

        DataSet ds = DBHelper.getDataSet(sql);
        //3:显示数据
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string s_name = ds.Tables[0].Rows[i]["s_name"].ToString();
            string the_book = ds.Tables[0].Rows[i]["the_book"].ToString();

            //显示字符串
            str += "<div class=\"det_c_text\"><a href=\"text.aspx?Book=" + the_book + "&Section="+id+"\"><p><span>" + s_name + "</span></p></a></div>";

        }
        return str;
    }
    private string getSectionId(string sql)
    {

        string str = "";

        DataSet ds = DBHelper.getDataSet(sql);
        //3:显示数据
        int cnt = ds.Tables[0].Rows.Count;
        if (cnt>0)
        {
            string id = ds.Tables[0].Rows[0]["id"].ToString();
            string s_name = ds.Tables[0].Rows[0]["s_name"].ToString();
            string the_book = ds.Tables[0].Rows[0]["the_book"].ToString();

            //显示字符串
            str += "<a href=\"text.aspx?Book="+the_book+"&Section="+id+"\"><img src=\"img/icon/toRead_btn.jpg\"/></a>";

        }
        return str;
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
            str += "<div class=\"book fl\"><a href=\"detailPage.aspx?id=" + id + "\"><img src=\"" + cover + "\" alt=\"book\"></a>" +
                "<p><a href=\"detailPage.aspx?id=" + id + "\">" + title + "</a></p><span>￥" + price + "</span></div>";

        }
        return str;

    }
    private void hitAdd(string id)
    {
        string sql = "update T_bookInfo set ctr = ctr+1 where id =" + id;
        DBHelper.exeDML(sql);
    }
    protected void Button1_ServerClick(object sender, EventArgs e)
    {
        object Type = Session["adminLimit"];
        string bookid = Request.QueryString["id"];
        
        if (null == Type)
        {
            Response.Redirect("userLogin.htm");
        }
        else {
            string userId = Session["adminId"].ToString();
            //获得账号余额
            string sql2 = "select*from T_userInfo where uname=" + userId;
            DataSet ds = DBHelper.getDataSet(sql2);
            string balance = ds.Tables[0].Rows[0]["balance"].ToString();
            float bal = float.Parse(balance);
            //获得书籍价格
            string sql3 = "select id,title,cover,author,price,brief,member from T_bookInfo where id=" + bookid;
            DataSet ds2 = DBHelper.getDataSet(sql3);
            string price = ds2.Tables[0].Rows[0]["price"].ToString();
            string member = ds2.Tables[0].Rows[0]["member"].ToString();
            float money = float.Parse(price);
            if (member == "False")
            {
                if (bal >= money)
                {
                    float balChange = bal - money;
                    string sql4 = "update T_userInfo set balance=" + balChange + " where uname=" + userId + "";
                    int n2 = DBHelper.exeDML(sql4);
                    string sql = "insert into T_mybook(book,person) values(" + bookid + "," + userId + ");";
                    int n = DBHelper.exeDML(sql);
                    if (n > 0 && n2 > 0)
                    {
                        Response.Redirect("bookself.aspx");
                    }
                }
                else
                {
                    Response.Redirect("detailPage.aspx?id=" + bookid + "");
                }
            }
            else 
            {
                string sql5 = "select*from T_user where id=" + userId;
                DataSet ds5 = DBHelper.getDataSet(sql5);
                string utype = ds5.Tables[0].Rows[0]["utype"].ToString();
                if (utype == "True")
                {
                    string sql = "insert into T_mybook(book,person) values(" + bookid + "," + userId + ");";
                    int n = DBHelper.exeDML(sql);
                    if (n > 0 )
                    {
                        Response.Redirect("bookself.aspx");
                    }
                }
                else
                {
                    if (bal >= money)
                    {
                        float balChange = bal - money;
                        string sql4 = "update T_userInfo set balance=" + balChange + " where uname=" + userId + "";
                        int n2 = DBHelper.exeDML(sql4);
                        string sql = "insert into T_mybook(book,person) values(" + bookid + "," + userId + ");";
                        int n = DBHelper.exeDML(sql);
                        if (n > 0 && n2 > 0)
                        {
                            Response.Redirect("bookself.aspx");
                        }
                    }
                    else
                    {
                        Response.Redirect("detailPage.aspx?id=" + bookid + "");
                    }
                }
            }
           
        }
        
    }
}

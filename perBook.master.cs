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

public partial class perBook : System.Web.UI.MasterPage
{
    public string user_id = "";
    public string user_name = "";
    public string adminType = "";
    public string myimg = "";
    public string balance = "";
    public string member = "";
    public string bookId = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //string search = Request.Form["search"];
        //if (search == null)
        //{
            user_id = Session["adminId"].ToString();
            string sql = "select utype from T_user where id=" + user_id;
            DataSet ds = DBHelper.getDataSet(sql);
            string utype = ds.Tables[0].Rows[0]["utype"].ToString();
            if (utype == "True")
            {
                member = "<p class=\"per_mon\" style=\"line-height:30px;\">永久会员</p>";
            }
            string action = Request.QueryString["action"];
        //}
        //else
        //{ abc(); }
        
        //if (action == null)
        //{
        //    //Response.Redirect("bookself.aspx");
        //}
        //else if (action.Equals("search"))
        //{
            
        //}
    }
    //void search()
    //{
    //    string search = Request.Form["search"]; 
    //    string id = Request.QueryString["id"];
    //    if (!search.Equals(""))
    //    {
    //        string sql = "select id from T_bookInfo where title='" + search + "'";
    //        DataSet ds = DBHelper.getDataSet(sql);
    //        int cnt = ds.Tables[0].Rows.Count;
    //            if (cnt == 0)
    //            {
    //            Response.Redirect("bookself.aspx");
    //        }
    //        else
    //        {
    //            for (int i = 0; i < cnt; i++)
    //            {
    //                bookId = ds.Tables[0].Rows[i]["id"].ToString();
    //            }
    //        }
    //    }
    //    else
    //    {
    //        Response.Redirect("bookself.aspx");
    //    }

    //}
    void abc()
    {
        string search = Request.Form["search"];
        if (search != "")
        {
            string sql = "select id from T_bookInfo where title='" + search + "'";
            DataSet ds = DBHelper.getDataSet(sql);
            int cnt = ds.Tables[0].Rows.Count;
            if (cnt == 0)
            {
                Response.Redirect("bookself.aspx");
            }
            else
            {
                   bookId = ds.Tables[0].Rows[0]["id"].ToString();

            }
        }
        else
        {
            Response.Redirect("bookself.aspx");
        }

    }
    //void mybook(string id)
    //{
    //    DataSet ds = DBHelper.getDataSet("select*from T_userInfo where uname=" + id);
    //    int cnt = ds.Tables[0].Rows.Count;
    //    if (cnt == 0)
    //    {
    //        string sql = "insert into T_userInfo(mail,myimg,phone,birthday,balance,uname)values(' ','img/u_pic.png',' ',' ',0.00," + id + ")";
    //        DBHelper.exeDML(sql);
    //    }
    //}
    protected void Page_Init(object sender, EventArgs e)
    {
        object Type = Session["adminLimit"];

        if (null == Type)
        {//没有登录过
            Response.Redirect("userLogin.htm");
        }
        else
        {
            user_id = Session["adminId"].ToString();
            user_name = Session["adminName"].ToString();
            adminType = Session["adminLimit"].ToString();
            string sql = "select myimg,balance from T_userInfo where uname=" + user_id;
            DataSet ds = DBHelper.getDataSet(sql);
            int cnt = ds.Tables[0].Rows.Count;
            if (cnt > 0)
            {
                myimg = ds.Tables[0].Rows[0]["myimg"].ToString();
                balance = ds.Tables[0].Rows[0]["balance"].ToString();
            }
            else 
            {
                myimg = "img/u_pic.png";
                balance = "0.00";
            }
        }
    }
}

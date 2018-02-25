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

public partial class text : System.Web.UI.Page
{
    public string s_name = "";//章节
    public string s_text = "";//内容
    public string title = "";//书名
    public string thisBook = "";//书
    public string toSection = "";//上一章
    public string nextSection = "";//下一章
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            string Book = Request.QueryString["Book"];
            string Section = Request.QueryString["Section"];
            if (null == Section || null == Book)
            {//参数为空
                Response.Redirect("detailPage.aspx?id="+Book+"");
            }
            else
            { //参数不为空
                //string sql = "select id,s_name,s_text from T_section where id=" + Section+" and the_book="+Book;
                //string sql2 = "select id,title from T_bookInfo where id=" + Book;
                //DataSet ds = DBHelper.getDataSet(sql);
                // DataSet ds2 = DBHelper.getDataSet(sql2);
                ////3:显示数据
                //int cnt = ds.Tables[0].Rows.Count;
                //if (0 == cnt)
                //{
                //    Response.Redirect("detailPage.aspx?id=" + Book + "");
                //}
                //else
                //{
                //    s_name = ds.Tables[0].Rows[0]["s_name"].ToString();
                //    s_text = ds.Tables[0].Rows[0]["s_text"].ToString();
                //    title = ds2.Tables[0].Rows[0]["title"].ToString();
                //    thisBook=""+Book+"";
                //    int to = int.Parse(Section) -1;
                //    toSection = "" + to + "";
                //    int next = int.Parse(Section) +1;
                //    //int next = Section + 1;
                //    nextSection = "" + next + "";
                //}
                getSectionList1();
            }

       }
    }
    void getSectionList1()
    {
        string Book = Request.QueryString["Book"];
        string Section = Request.QueryString["Section"];
        if (Session["adminId"] == null)
        {
            string sql = "select id,s_name,s_text from T_section where id=" + Section + " and the_book=" + Book;
            string sql2 = "select id,title from T_bookInfo where id=" + Book;
            DataSet ds = DBHelper.getDataSet(sql);
            DataSet ds2 = DBHelper.getDataSet(sql2);
            //3:显示数据
            int cnt = ds.Tables[0].Rows.Count;
            if (0 == cnt)
            {
                Response.Redirect("detailPage.aspx?id=" + Book + "");
            }
            else
            {

                s_name = ds.Tables[0].Rows[0]["s_name"].ToString();
                s_text = ds.Tables[0].Rows[0]["s_text"].ToString();
                title = ds2.Tables[0].Rows[0]["title"].ToString();
                thisBook = "" + Book + "";
                string sql3 = "select top 3 id,s_name,s_text from T_section where the_book=" + Book;
                DataSet ds3 = DBHelper.getDataSet(sql3);
                string sectionState = ds3.Tables[0].Rows[0]["id"].ToString();
                int state = int.Parse(sectionState);
                if (int.Parse(Section) < state + 3)
                {
                    int to = int.Parse(Section) - 1;
                    toSection = "" + to + "";
                    int next = int.Parse(Section) + 1;
                    //int next = Section + 1;
                    nextSection = "" + next + "";
                }
                else
                {
                    Response.Redirect("detailPage.aspx?id=" + Book + "");
                }


            }
        }
        else 
        {
            string sql = "select id,s_name,s_text from T_section where id=" + Section + " and the_book=" + Book;
            string sql2 = "select id,title from T_bookInfo where id=" + Book;
            DataSet ds = DBHelper.getDataSet(sql);
            DataSet ds2 = DBHelper.getDataSet(sql2);
            //3:显示数据
            int cnt = ds.Tables[0].Rows.Count;
            if (0 == cnt)
            {
                Response.Redirect("detailPage.aspx?id=" + Book + "");
            }
            else
            {
                string id = Session["adminId"].ToString();
                string sql4 = "select * from T_mybook where book="+Book+" and person="+id;
                DataSet ds4 = DBHelper.getDataSet(sql4);
                int cnt4 = ds4.Tables[0].Rows.Count;
                if (0 == cnt4)
                {
                    s_name = ds.Tables[0].Rows[0]["s_name"].ToString();
                    s_text = ds.Tables[0].Rows[0]["s_text"].ToString();
                    title = ds2.Tables[0].Rows[0]["title"].ToString();
                    thisBook = "" + Book + "";
                    string sql3 = "select id,s_name,s_text from T_section where the_book=" + Book;
                    DataSet ds3 = DBHelper.getDataSet(sql3);
                    string sectionState = ds3.Tables[0].Rows[0]["id"].ToString();
                    int state = int.Parse(sectionState);
                    if (int.Parse(Section) < state + 20)
                    {
                        int to = int.Parse(Section) - 1;
                        toSection = "" + to + "";
                        int next = int.Parse(Section) + 1;
                        //int next = Section + 1;
                        nextSection = "" + next + "";
                    }
                    else
                    {
                        Response.Redirect("detailPage.aspx?id=" + Book + "");
                    }
                }
                else 
                {
                    s_name = ds.Tables[0].Rows[0]["s_name"].ToString();
                    s_text = ds.Tables[0].Rows[0]["s_text"].ToString();
                    title = ds2.Tables[0].Rows[0]["title"].ToString();
                    thisBook = "" + Book + "";

                    int to = int.Parse(Section) - 1;
                    toSection = "" + to + "";
                    int next = int.Parse(Section) + 1;
                    //int next = Section + 1;
                    nextSection = "" + next + "";
                }
                

            }
        }
        
    }
    void getSectionList2() 
    {
    
    }
}

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

public partial class bookself : System.Web.UI.Page
{
    public string list = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            string id = Session["adminId"].ToString();
            string action = Request.QueryString["action"];
            if (null == id)
            {//参数为空
                Response.Redirect("userLogin.htm");
            }
            else
            {
                
                if (action == null)
                {

                    string sql = "select T_bookInfo.id,title,cover from T_mybook inner join T_bookInfo on T_mybook.book=T_bookInfo.id where person="+id;
                    list = getOutputList(sql);
                }
                else if (action.Equals("del"))
                {
                    //删除
                    string bid = Request.QueryString["bid"];
                    del(id, bid);
                }

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

            //显示字符串
            str += "<div class=\"per_b_in\"><div style=\"position:relative;width:115px;height:153px;\"><a href=\"detailPage.aspx?id=" + id + "\"><img src=\"" + cover + "\" alt=\"book\"></a><div style=\"width:115px;height:153px;background:rgba(0,0,0,0.5);border-radius:5px; position:absolute;top:0;left:0; display:none;\" class=\"delete_mask\"><input onclick=\"window.location.href='bookself.aspx?action=del&bid="+id+"'\"  type=\"button\" style=\"width:25px;cursor:pointer;height:25px;border:none;background:url(img/delete.png); background-size:25px 25px;margin-left: 70px;margin-top: 10px;\"/></div></div><a href=\"detailPage.aspx?id=" + id + "\"><p>" + title + "</p></a></div>";
         }
        return str;

    }
    void del(string id, string bid)
    {
        if (id != null)
        {
            string sql2 = "delete from T_mybook where book=" + bid + " and person=" + id;
            int n = DBHelper.exeDML(sql2);
            if (n > 0)
            {
                Response.Redirect("bookself.aspx");
            }
        }
        string sql = "select T_bookInfo.id,title,cover from T_mybook inner join T_bookInfo on T_mybook.book=T_bookInfo.id where person=" + id;
        list=getOutputList(sql);
    }
    
}

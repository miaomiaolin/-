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

public partial class admin_EditBanner : System.Web.UI.Page
{
    public string bannerlist = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string action = Request.QueryString["action"];
            if (action == null)
            {
                string sql = "select*from T_banner order by id desc";
                getOutputList(sql);
            }
            else if (action.Equals("del"))
            {
                //删除
                string id = Request.QueryString["id"];
                del(id);
            }
            else if (action.Equals("change"))
            {
                string id = Request.QueryString["id"];
                change(id);
            }
        }
    }
    private string getOutputList(string sql)
    {
        bannerlist += "<thead><tr><th width=\"15%\"> ID</th><th width=\"25%\">图片</th><th width=\"25%\">名称</th><th width=\"15%\">是否上架</th><th width=\"20%\"> 操作</th></tr></thead><tbody>";
        DataSet ds = DBHelper.getDataSet(sql);
        //3:显示数据
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string bTitle = ds.Tables[0].Rows[i]["bTitle"].ToString();
            string bCover = ds.Tables[0].Rows[i]["bCover"].ToString();
            string isrecommend = ds.Tables[0].Rows[i]["isrecommend"].ToString();
            int a = i + 1;
            //显示字符串
            bannerlist += "<tr><td>"+a+"</td><td><img src=\"../" + bCover + "\" alt=\"" + bTitle + "\"></td>" +
                        "<td> " + bTitle + "</td><td><button type=\"button\" class=\"btn btn-open\" onclick=\"window.location.href='EditBanner.aspx?action=change&id=" + id + "'\">" + isrecommend + "</button></td>" +
                        "<td><button type=\"button\" class=\"btn btn-close\" onclick=\"window.location.href='EditBanner.aspx?action=del&id=" + id + "'\">删除</button></tr>";

        }
        bannerlist += "</tbody>";
        return bannerlist;

    }
    void del(string id)
    {
        if (id != null)
        {
            string sql2 = "delete from T_banner where id=" + id;
            int n = DBHelper.exeDML(sql2);
            if (n > 0)
            {
                Response.Redirect("EditBanner.aspx");
            }
        }
        string sql = "select * from T_banner ";
        getOutputList(sql);
    }
    void change(string id)
    {
        string sql = "select * from T_banner ";
        string sql4 = "select * from T_banner where isrecommend=1";
        DataSet ds1 = DBHelper.getDataSet(sql4);
        int cnt = ds1.Tables[0].Rows.Count;
        if (id != null)
        {
            string sql3 = "select * from T_banner where id=" + id;
            DataSet ds = DBHelper.getDataSet(sql3);
            string isrecommend = ds.Tables[0].Rows[0]["isrecommend"].ToString();
            if (isrecommend == "True" &&cnt>4)
            {
                string sql2 = "update T_banner set isrecommend=0 where id=" + id;
                int n = DBHelper.exeDML(sql2);
                if (n > 0)
                {
                    Response.Redirect("EditBanner.aspx");
                }
            }
            else 
            {
                string sql2 = "update T_banner set isrecommend=1 where id=" + id;
                int n = DBHelper.exeDML(sql2);
                if (n > 0)
                {
                    Response.Redirect("EditBanner.aspx");
                }

            }

        }
        else {
            Response.Redirect("EditBanner.aspx");
        }
        
        getOutputList(sql);
    }
}

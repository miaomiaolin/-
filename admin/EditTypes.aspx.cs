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

public partial class admin_EditTypes : System.Web.UI.Page
{
    public string typelist = "";//类别列表
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string action = Request.QueryString["action"];
            if (action == null)
            {
                //类别列表
                string sql = "select*from T_category";
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
        typelist += "<thead><tr><th width=\"30%\">ID</th><th width=\"35%\">类别</th><th width=\"35%\">操作</th></tr></thead><tbody>";
        DataSet ds = DBHelper.getDataSet(sql);
        //3:显示数据
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string type = ds.Tables[0].Rows[i]["category"].ToString();//类别

            //显示字符串
            typelist += "<tr><td>" + id + "</td><td> " + type + "</td><td>" +
                   "<button type=\"button\" class=\"btn btn-close\" onclick=\"window.location.href='EditTypes.aspx?action=del&id=" + id + "'\">删除</button><button type=\"button\" class=\"btn btn-open\" style=\"margin-left:5px;\"> 修改</button></td></tr>";

        }
        typelist += "</tbody>";
        return typelist;

    }
    void search()
    {
        string sql = "select * from T_category ";
        string name = Request.Form["name"];
        if (!name.Equals(""))
        {
            sql += " where category like '%" + name + "%'";
        }
        getOutputList(sql);
    }
    void del(string id)
    {
        if (id != null)
        {
            string sql2 = "delete from T_category where id=" + id;
            int n = DBHelper.exeDML(sql2);
            if (n > 0)
            {
                Response.Redirect("EditTypes.aspx");
            }
        }
        string sql = "select * from T_category ";
        getOutputList(sql);
    }
}

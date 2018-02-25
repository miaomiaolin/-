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

public partial class admin_EditAdminUsers : System.Web.UI.Page
{
    public string adminlist = "";//管理员列表
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string action = Request.QueryString["action"];
            if (action == null)
            {
                //管理员列表
                string sql = "select * from T_admin";
                adminlist = getOutputList(sql);
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
        adminlist += "<thead><tr><th width=\"15%\">ID</th><th width=\"20%\">用户名</th><th width=\"20%\">密码</th><th width=\"20%\">类型</th><th width=\"25%\"> 操作</th></tr></thead><tbody>";
        DataSet ds = DBHelper.getDataSet(sql);
        //3:显示数据
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string name = ds.Tables[0].Rows[i]["admin"].ToString();
            string pwd = ds.Tables[0].Rows[i]["pwd"].ToString();
            string limit = ds.Tables[0].Rows[i]["limit"].ToString();

            //显示字符串
            adminlist += "<tr><td>" + id + "</td><td> " + name + "</td><td> " + pwd + "</td><td>" + limit + "</td><td><button type=\"button\" class=\"btn btn-close\" onclick=\"window.location.href='EditAdminUsers.aspx?action=del&id=" + id + "'\"> 删除</button><button type=\"button\" class=\"btn btn-open\" style=\"margin-left:5px;\" onclick=\"window.location.href='adminModify.aspx?id=" + id + "'\">修改</button></td></tr>";

        }
        adminlist += "</tbody>";
        return adminlist;

    }
    void search()
    {
        string sql = "select * from T_admin ";
        string name = Request.Form["name"];
        if (!name.Equals(""))
        {
            sql += " where admin like '%" + name + "%'";
        }
        getOutputList(sql);
    }
    void del(string id)
    {
        if (id != null)
        {
            string sql2 = "delete from T_admin where id=" + id;
            int n = DBHelper.exeDML(sql2);
            if (n > 0)
            {
                Response.Redirect("EditAdminUsers.aspx");
            }
        }
        string sql = "select * from T_admin ";
        getOutputList(sql);
    }
}

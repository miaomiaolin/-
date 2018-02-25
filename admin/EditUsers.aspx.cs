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

public partial class admin_EditUsers : System.Web.UI.Page
{
    public string userslist = "";//用户列表
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string action = Request.QueryString["action"];
            if (action == null)
            {
                //用户列表
                string sql = "select*from T_user";
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
        DataSet ds = DBHelper.getDataSet(sql);
        userslist += "<thead><tr><th width=\"15%\">ID</th><th width=\"20%\">用户名</th> <th width=\"20%\"> 密码</th><th width=\"20%\">会员</th><th width=\"25%\">操作</th></tr></thead><tbody>";
        
        //3:显示数据
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string uname = ds.Tables[0].Rows[i]["uname"].ToString();
            string pwd = ds.Tables[0].Rows[i]["pwd"].ToString();
            string utype = ds.Tables[0].Rows[i]["utype"].ToString();//类别

            //显示字符串
            userslist += "<tr><td>" + id + "</td><td> " + uname + "</td><td>" + pwd + "</td><td>" + utype + "</td><td>" +
                   "<button type=\"button\" class=\"btn btn-close\" onclick=\"window.location.href='EditUsers.aspx?action=del&id=" + id + "'\">删除</button></td></tr>";

        }
        userslist += "</tbody>";
        return userslist;

    }
    void search()
    {
        string sql = "select * from T_user";
        string name = Request.Form["name"];
        if (!name.Equals(""))
        {
            sql += " where uname like '%" + name + "%'";
        }
        getOutputList(sql);
    }
    void del(string id)
    {
        if (id != null)
        {
            string sql2 = "delete from T_user where id=" + id;
            int n = DBHelper.exeDML(sql2);
            if (n > 0)
            {
                Response.Redirect("EditUsers.aspx");
            }
        }
        string sql = "select * from T_user ";
        getOutputList(sql);
    }
}

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

public partial class per_member : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void addMoneyBtn_ServerClick(object sender, EventArgs e)
    {
            string id = Session["adminId"].ToString();
            string money = Request.Form["money"];

            if (money == "  ")
            {
                Response.Write("<script>alert('充值金额不能为空');</script>");

            }
            else
            {
                float price = float.Parse(money);
                string sql = "select*from T_userInfo where uname=" + id;
                DataSet ds = DBHelper.getDataSet(sql);
                string balance = ds.Tables[0].Rows[0]["balance"].ToString();
                float bal = float.Parse(balance);
                float theMoney = bal + price;
                string sql2 = "update T_userInfo set balance=" + theMoney + " where uname=" + id + "";
                int n = DBHelper.exeDML(sql2);
                if (n > 0)
                {
                    Response.Redirect("per_member.aspx");
                    Response.Write("<script>alert('充值成功！');</script>");
                }


            }
        
    }
    protected void memberBtn_ServerClick(object sender, EventArgs e)
    {
        string id = Session["adminId"].ToString();
        string sql = "select*from T_userInfo where uname=" + id;
        string sql3 = "select*from T_user where id=" + id;
        DataSet ds = DBHelper.getDataSet(sql);
        DataSet ds2 = DBHelper.getDataSet(sql3);
        string utype = ds2.Tables[0].Rows[0]["utype"].ToString();
        string balance = ds.Tables[0].Rows[0]["balance"].ToString();
        float bal = float.Parse(balance);
        float theMoney = bal - 88;
        if (utype == "False")
        {
            if (bal >= 88)
            {
                string sql2 = "update T_user set utype=1 where id=" + id + "";
                int n = DBHelper.exeDML(sql2);
                string sql4 = "update T_userInfo set balance=" + theMoney + " where uname=" + id + "";
                int n2 = DBHelper.exeDML(sql4);
                if (n > 0 && n2 > 0)
                {

                    Response.Write("<script>alert('恭喜你成为永久会员，海量图书随你看！');</script>");
                    Response.Redirect("per_member.aspx");
                }
            }
            else 
            {
                Response.Write("<script>alert('你的余额不足88元！');</script>");
            }
        }
        else {
            Response.Write("<script>alert('你已经是永久会员了哦！');</script>");
        }

    }
}

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
using System.IO;

public partial class per_info : System.Web.UI.Page
{
    public string user_name = "";
    public string mail = "";
    public string myimg = "";
    public string phone = "";
    public string birthday = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Session["adminId"].ToString();
        user_name = Session["adminName"].ToString();
        string sql = "select * from  T_userInfo where uname="+id;
        DataSet ds = DBHelper.getDataSet(sql);
        int cnt = ds.Tables[0].Rows.Count;
        if (cnt == 0)
        {
            myimg = "img/u_pic.png";
            Response.Redirect("per_info.aspx");   
        }
        else 
        {
            mail = ds.Tables[0].Rows[0]["mail"].ToString();
            myimg = ds.Tables[0].Rows[0]["myimg"].ToString();
            phone = ds.Tables[0].Rows[0]["phone"].ToString();
            birthday = ds.Tables[0].Rows[0]["birthday"].ToString();
        }
    }
    protected void addUserInfoBtn_ServerClick(object sender, EventArgs e)
    {
        string id = Session["adminId"].ToString();
        string imgUrl = "";//存放图片的数据库保存路径
        string birthday = Request.Form["birthday"];
        string mail = Request.Form["mail"];
        string phone = Request.Form["phone"];
        if (phone == "")
        {
            Response.Write("<script>alert('手机号不能为空！');</script>");
            return;
        }
        if (mail == "")
        {
            Response.Write("<script>alert('邮箱不能为空！');</script>");
            return;
        }
        string sql = "select * from  T_userInfo where uname=" + id;
        DataSet ds = DBHelper.getDataSet(sql);
        int cnt = ds.Tables[0].Rows.Count;
        //1:图片上传
        Boolean fileOK = false;
        string path = Server.MapPath("img/user/");
        //判断文件夹是否存在
        if (!Directory.Exists(path))
        {
            Directory.CreateDirectory(path);
            //创建成功
        }
        //判断是否已经选取文件
        if (FileUpload1.HasFile)
        {
            //取得文件的扩展名，并转成小写
            //FileUpload1.FileName.Substring(FileUpload1.FileName.LastIndexOf(".")).ToLower();
            string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
            //限定只能上传jpg和gif图片
            string[] allowExtension ={ ".jpg", ".gif", ".png", ".jpeg" };
            //对上传的文件的类型进行一个个匹对
            for (int i = 0; i < allowExtension.Length; i++)
            {
                if (fileExtension == allowExtension[i])
                {
                    fileOK = true;
                    imgUrl = "img/user/" + FileUpload1.FileName;
                    break;
                }
            }
            if (!fileOK)
            {
                Response.Write("<script>alert('图片文件格式不正确');</script>");
                return;
            }
            if (fileOK)
            {
                FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);

            }
            if (cnt == 0)
            {
                string sql2 = "insert into T_userInfo(mail,myimg,phone,birthday,balance,uname)values(" + mail + "','" + imgUrl + "','" + phone + "','" + birthday + "',0," + id + ");";
                int n = DBHelper.exeDML(sql2);
                if (n > 0)
                {
                    Response.Redirect("per_info.aspx");
                    Response.Write("<script>alert('个人信息修改成功！');</script>");
                }
            }
            else
            {
                string sql2 = "update T_userInfo set mail='" + mail + "',myimg='" + imgUrl + "',phone='" + phone + "' ,birthday='" + birthday + "' where uname=" + id + "";
                int n = DBHelper.exeDML(sql2);
                if (n > 0)
                {
                    Response.Redirect("per_info.aspx");
                    Response.Write("<script>alert('个人信息修改成功！');</script>");
                }
            }
        }
        else//没有上传图片
        {   
            if (cnt == 0)
            {
                string sql2 = "insert into T_userInfo(mail,myimg,phone,birthday,balance,uname)values(" + mail + "','img/u_pic.png','" + phone + "','" + birthday + "',0," + id + ");";
                int n = DBHelper.exeDML(sql2);
                if (n > 0)
                {
                    Response.Redirect("per_info.aspx");
                    Response.Write("<script>alert('个人信息修改成功！');</script>");
                }
            }
            else
            {
                string sql2 = "update T_userInfo set mail='" + mail + "',phone='" + phone + "' ,birthday='" + birthday + "' where uname=" + id + "";
                int n = DBHelper.exeDML(sql2);
                if (n > 0)
                {
                    Response.Redirect("per_info.aspx");
                    Response.Write("<script>alert('个人信息修改成功！');</script>");
                }
            }
        }
        //如果扩展名符合条件，则上传
       
       
        

    }
}

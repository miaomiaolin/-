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

public partial class admin_bookModify : System.Web.UI.Page
{
    public string bookType = "";//书籍类别
    public string bookName = "";//书籍名称
    public string money = "";
    public string author = "";
    public string brief = "";
    public string cover = "";
    public string isrecom = "";
    public string theMember = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        if (null == id)
        {//参数为空
            Response.Redirect("EditBooks.aspx");
        }
            else
            { //参数不为空
                string sql = "select * from T_bookInfo where id =" + id;
                DataSet ds = DBHelper.getDataSet(sql);
                //3:显示数据
                int cnt = ds.Tables[0].Rows.Count;
                if (0 == cnt)
                {
                    Response.Redirect("EditBooks.aspx");
                }
                else
                {
                    bookName = ds.Tables[0].Rows[0]["title"].ToString();
                    money = ds.Tables[0].Rows[0]["price"].ToString();
                    author = ds.Tables[0].Rows[0]["author"].ToString();
                    brief = ds.Tables[0].Rows[0]["brief"].ToString();
                    cover = ds.Tables[0].Rows[0]["cover"].ToString();
                    string isrecommend = ds.Tables[0].Rows[0]["isrecommend"].ToString();
                    if (isrecommend =="True")
                    {
                        isrecom = "<option value=\"1\">是</option>"
                        + "<option value=\"0\">否</option>";
                    }
                    else
                    {
                        isrecom = "<option value=\"0\">否</option>"
                        + "<option value=\"0\">否</option>";
                       
                    }
                    string member = ds.Tables[0].Rows[0]["member"].ToString();
                    if (member == "True")
                    {
                        theMember = "<option value=\"1\">是</option>"
                       + "<option value=\"0\">否</option>";
                    }
                    else
                    {
                        theMember = "<option value=\"1\">是</option>"
                       + "<option value=\"0\">否</option>";
                    }
                    string tid = ds.Tables[0].Rows[0]["category"].ToString();
                    displayTypes(tid);
                }
            }
    }
    protected void changeBookBtn_ServerClick(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        string imgUrl = Request["cover"];//存放图片的数据库保存路径
        string path = Server.MapPath("~/img/book/");
        //1:图片上传
        Boolean fileOK = false;
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
                    imgUrl = "img/book/" + FileUpload1.FileName;
                    break;
                }
            }
            if (!fileOK)
            {
                Response.Write("<script>alert('图片文件格式不正确');</script>");
                return;
            }
        }
        //如果扩展名符合条件，则上传
        if (fileOK)
        {
            FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);
            Response.Write("<script>alert('封面上传成功');</script>");

        }
        bookName = Request.Form["bookName"];//名称
        money = Request.Form["money"];//价格
        author = Request.Form["author"];//作者
        brief = Request.Form["brief"];//简介
        string tid = Request.Form["types"];
        string isrecommend = Request.Form["isrecommend"];
        string member = Request.Form["member"];
        string types = Request.Form["types"];
        int isrec = int.Parse(isrecommend);
        int mem = int.Parse(member);
        if (bookName == "")
        {
            Response.Write("<script>alert('书籍名称不能为空！');</script>");
            return;
        }
        if (brief == "")
        {
            Response.Write("<script>alert('简介不能为空！');</script>");
            return;
        }
        if (money == "")
        {
            Response.Write("<script>alert('价格不能为空！');</script>");
            return;
        }
        if (author == "")
        {
            Response.Write("<script>alert('作者不能为空！');</script>");
            return;
        }
        float price = float.Parse(money);
        if (FileUpload1.HasFile)
        {
            string sql = "update T_bookInfo set title='" + bookName + "',cover='" + imgUrl + "',author='" + author + "',price=" + price + ",brief='" + brief + "',isrecommend=" + isrec + ",member=" + mem + ",category=" + types + "  where id =" + id;
            int n = DBHelper.exeDML(sql);
            if (n > 0)
            {
                Response.Redirect("EditBooks.aspx");
            }
        }
        else 
        {
            string sql = "update T_bookInfo set title='" + bookName + "',author='" + author + "',price=" + price + ",brief='" + brief + "',isrecommend=" + isrec + ",member=" + mem + ",category=" + types + "  where id =" + id;
            int n = DBHelper.exeDML(sql);
            if (n > 0)
            {
                Response.Redirect("EditBooks.aspx");
            }
        }
        
    }
    void displayTypes(string tid)
    {
        DataSet ds = DBHelper.getDataSet("select * from T_category ");
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string category = ds.Tables[0].Rows[i]["category"].ToString();
            if (id == tid)
            {
                bookType += "<option value='" + id + "' selected>" + category + "</option>";

            }
            else
            {
                bookType += "<option value=\"" + id + "\">" + category + "</option>";

            }
        }
    }
}

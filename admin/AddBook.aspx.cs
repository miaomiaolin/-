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

public partial class admin_AddBook : System.Web.UI.Page
{
    public string bookType = "";//书籍类别
    public string bookName = "";//书籍名称
    public string money = "";
    public string author = "";
    public string brief = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        displayTypes();
    }
    void displayTypes()
    {
        DataSet ds = DBHelper.getDataSet("select * from T_category");
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string category = ds.Tables[0].Rows[i]["category"].ToString();
            bookType += "<option value=\"" + id + "\">" + category + "</option>";
        }
    }
    protected void addBookBtn_ServerClick(object sender, EventArgs e)
    {
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
        int isrec = int.Parse(isrecommend);
        int mem = int.Parse(member);
        string onlinetime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
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
        string sql = "insert into T_bookInfo(title,cover,author,price,brief,isrecommend,onlinetime,member,ctr,category) values('" + bookName + "','" + imgUrl + "','" + author + "'," + price + ",' " + brief + "',"+isrec+",'" + onlinetime + "',"+mem+",0," + tid + ");;";
        int n = DBHelper.exeDML(sql);
        if (n > 0)
        {
            Response.Redirect("EditBooks.aspx");
        }
    }
}

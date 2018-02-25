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

public partial class AddBanner : System.Web.UI.Page
{
    public string book = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        displayTypes();
    }
    void displayTypes()
    {
        DataSet ds = DBHelper.getDataSet("select * from T_bookInfo");
        int cnt = ds.Tables[0].Rows.Count;
        for (int i = 0; i < cnt; i++)
        {
            string id = ds.Tables[0].Rows[i]["id"].ToString();
            string title = ds.Tables[0].Rows[i]["title"].ToString();
            book += "<option value=\"" + id + "\">" + title + "</option>";
        }
    }
    protected void addBannerBtn_ServerClick(object sender, EventArgs e)
    {
        string imgUrl = Request["cover"];//存放图片的数据库保存路径
        string path = Server.MapPath("~/img/banner/");
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
                    imgUrl = "img/banner/" + FileUpload1.FileName;
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
            Response.Write("<script>alert('轮播图上传成功');</script>");

        }
        string book = Request.Form["book"];
        string bannerName = Request.Form["bannerName"];
        string isrecommend = Request.Form["isrecommend"];
        string onlinetime = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        if (bannerName == "")
        {
            Response.Write("<script>alert('名称不能为空！');</script>");
            return;
        }

        string sql = "insert into T_banner(bTitle,bCover,isrecommend,onlinetime,theBook)values('" + bannerName + "','" + imgUrl + "'," + isrecommend + ",'" + onlinetime + "'," + book + ");";
        int n = DBHelper.exeDML(sql);
        if (n > 0)
        {
            Response.Redirect("EditBanner.aspx");
        }
    }
}

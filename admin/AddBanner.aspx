<%@ Page Language="C#" MasterPageFile="~/admin/adminIndex.master" AutoEventWireup="true" CodeFile="AddBanner.aspx.cs" Inherits="AddBanner" Title="新增轮播图" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <form method="post" id="form1" runat="server">

    <h3>
        &gt;新增轮播图</h3>
    <div class="userTab">
        <div class="userTab_in bookInfo" style="position:relative;">
            <div class="form_text">
                <ul>
                    <li>名称：</li><li style="padding-bottom:108px;">轮播图：</li><li>是否上架：</li><li>所属书籍：</li></ul>
            </div>
            <div class="form_input" style="position:relative;z-index: 3;">
                <input type="text" name="bannerName"/>
                <asp:FileUpload ID="FileUpload1" runat="server" Height="100px" Width="335px" BorderWidth="0px" BackColor="Transparent" BorderColor="Transparent" ForeColor="Transparent" Enabled="true" Visible="true" style="opacity: 0;" onchange="onFileChange(this);"/>
                <br />
                <select name="isrecommend">
                   <option value="0">否</option>
                   <option value="1">是</option>
                </select>
                <br />
                <select name="book">
                   <%=book %>
                </select>
                <br />
                <button class="btn btn-open" id="addBookBtn" onserverclick="addBannerBtn_ServerClick" runat="server">
                    提交</button>
                <button class="btn btn-close">重置</button>
            </div>
            <div class="bookImg" style="top: 72px;left: 107px;">
                    <div class="bookPic" style="position:relative;height:100px;width:335px;">
                        <img id="upImages" src="../img/banner/banner1.jpg" alt="上传图片"/>
                        <div class="upImages" style="">点击上传</div>
                    </div>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>
    </form>
    <script type="text/javascript">
    function onFileChange(sender) {  
        document.getElementById("upImages").src = window.URL.createObjectURL(sender.files[0]);  
    }; 
    </script>
</asp:Content>


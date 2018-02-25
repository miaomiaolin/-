<%@ Page Language="C#" MasterPageFile="~/admin/adminIndex.master" AutoEventWireup="true" CodeFile="bookModify.aspx.cs" Inherits="admin_bookModify" Title="修改书籍" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <form method="post" id="form1" runat="server">

    <h3>
        &gt;修改书籍</h3>
    <div class="userTab">
        <div class="userTab_in bookInfo" style="position:relative;">
            <div class="form_text">
                <ul>
                    <li>类别：</li><li>书名：</li><li style="padding-bottom: 127px;">封面：</li><li>推荐：</li><li>会员：</li><li>作者：</li><li>价格：</li><li>简介：</li></ul>
            </div>
            <div class="form_input" style="position:relative;z-index: 3;">
                <select name="types">
                   <%=bookType %>
                </select>
                
                <input type="text" name="bookName" value="<%=bookName %>"/>
                <asp:FileUpload ID="FileUpload1" runat="server" Height="133px" Width="92px" BorderWidth="0px" BackColor="Transparent" BorderColor="Transparent" ForeColor="Transparent" Enabled="true" Visible="true" style="opacity: 0;" onchange="onFileChange(this);"/>
                <select name="isrecommend">
                    <%=isrecom %>
                </select>
                </br>
                <select name="member">
                   <%=theMember%>
                </select>
                <input type="text" name="author" value="<%=author %>"/>
                <input type="text" name="money" value="<%=money %>"/>
                <textarea name="brief"><%=brief %></textarea>
                <br />
                <button class="btn btn-open" id="addBookBtn" onserverclick="changeBookBtn_ServerClick" runat="server">
                    提交</button>
                <button class="btn btn-close">重置</button>
            </div>
            <div class="bookImg">
                    <div class="bookPic" style="position:relative">
                        <img id="upImages" src="../<%=cover %>" alt="上传图片"/>
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


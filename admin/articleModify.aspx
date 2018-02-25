<%@ Page Language="C#" MasterPageFile="~/admin/adminIndex.master" AutoEventWireup="true" CodeFile="articleModify.aspx.cs" Inherits="admin_articleModify" Title="修改章节" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form method="post" id="form1" runat="server">
<h3>
        &gt;修改章节</h3>
    <div class="userTab">
        <div class="userTab_in bookInfo">
            <div class="form_text">
                <ul>
                    <li>书名：</li><li>章节名：</li><li>文章内容：</li></ul>
            </div>
            <div class="form_input b_con">
                <input type="text" value="<%=bookName %>" disabled="disabled" />
                <input type="text" value="<%=articleName %>" id="articleName" name="articleName"/>
                <textarea id="content" name="content"><%=conText %></textarea>
                <br/>
                <button  class="btn btn-open" id="conChangeBtn" onserverclick="conChangeBtn_ServerClick" runat="server">
                    提交</button>
                <button class="btn btn-close">重置</button>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>
</form>
<script type="text/javascript">

</script>
</asp:Content>


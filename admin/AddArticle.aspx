<%@ Page Language="C#" MasterPageFile="~/admin/adminIndex.master" AutoEventWireup="true"
    CodeFile="AddArticle.aspx.cs" Inherits="admin_AddArticle" Title="新增章节" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<form method="post" id="form1" runat="server">
    <h3>
        &gt;新增章节</h3>
    <div class="userTab">
        <div class="userTab_in bookInfo">
            <div class="form_text">
                <ul>
                    <li>书名：</li><li>章节名：</li><li>文章内容：</li></ul>
            </div>
            <div class="form_input b_con" id="DIV1">
                <input type="text" value="<%=bookName %>" disabled="value" />
                <input type="text" value=""  id="articleName" name="articleName"/>
                <textarea id="content" name="content"></textarea>
                <br/>
                <button class="btn btn-open" id="addConBtn" onserverclick="addConBtn_ServerClick" runat="server">
                    提交</button>
                <button class="btn btn-close">重置</button>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>
</form>

</asp:Content>

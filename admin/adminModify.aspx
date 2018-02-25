<%@ Page Language="C#" MasterPageFile="~/admin/adminIndex.master" AutoEventWireup="true" CodeFile="adminModify.aspx.cs" Inherits="adminModify" Title="修改管理员" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<form method="post" id="form1" runat="server">
 <h3>
        &gt;修改管理员</h3>
    <div class="userTab">
        <div class="userTab_in bookInfo">
            <div class="form_text">
                <ul>
                    <li>权限：</li>
                    <li>管理员名称：</li>
                    <li>密码：</li>
                    
                </ul>
            </div>
            <div class="form_input">
                <select id="limit" name="limit">
                    <option value="1">超级管理员</option>
                    <option value="0">普通管理员</option>
                </select>
                <input type="text" id="adminName" value="<%=name %>" disabled="disabled"/>
                <input type="text" id="adminPwd" name="adminPwd"/>
                <br />
                <button class="btn btn-open" onserverclick="adminChangeBtn_ServerClick" runat="server" >
                    提交</button>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>
 </form>
</asp:Content>


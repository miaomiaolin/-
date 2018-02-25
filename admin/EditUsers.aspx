<%@ Page Language="C#" MasterPageFile="~/admin/adminIndex.master" AutoEventWireup="true"
    CodeFile="EditUsers.aspx.cs" Inherits="admin_EditUsers" Title="编辑用户" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<form method="post" action="" id="listform">
    <h3>&gt;编辑用户</h3>
    <div class="userTab">
        <div class="userTab_in">
            <div style="height: 50px;">
                <h4 class="fl">
                    所有用户</h4>
                <button type="button" class="btn btn-fined fr"onclick="search();">
                    搜索</button>
                <input type="text" class="form-control fr" placeholder="输入用户" name="name"/>
            </div>
            <hr/>
            <table class="table">
            <%=userslist %>
                <%--<thead>
                    <tr>
                        <th width="15%">
                            ID</th>
                        <th width="20%">
                            用户名</th>
                        <th width="20%">
                            密码</th>
                        <th width="20%">
                            类型</th>
                        <th width="25%">
                            操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            1</td>
                        <td>
                            Mark</td>
                        <td>
                            Otto</td>
                        <td>
                            Otto</td>
                        <td>
                            <button type="button" class="btn btn-close">
                                删除</button>
                            <button type="button" class="btn btn-open">
                                修改</button>
                        </td>
                    </tr>
                </tbody>--%>
            </table>
        </div>
    </div>
    </form>
    <script type="text/javascript">
    function search(){
                    var form1 =document.getElementById('listform');
                    form1.action='EditUsers.aspx?action=search';
                    form1.submit();
                }

    </script>
</asp:Content>

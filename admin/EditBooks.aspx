<%@ Page Language="C#" MasterPageFile="~/admin/adminIndex.master" AutoEventWireup="true"
    CodeFile="EditBooks.aspx.cs" Inherits="admin_EditBooks" Title="编辑书籍" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<form method="post" action="" id="listform">
    <h3>
        &gt;编辑书籍</h3>
    <div class="userTab">
        <div class="userTab_in bookInfo">
            <div style="height: 50px;">
                <h4 class="fl">
                    所有书籍</h4>
                <button type="button" class="btn btn-fined fr" onclick="search();">
                    搜索</button>
                <input type="text" class="form-control fr" placeholder="输入书籍名称" name="name"/>
            </div>
            <hr/>
            <table class="table EditBook">
            <%=booklist%>
                <%--<thead>
                    <tr>
                        <th width="15%">
                            ID</th>
                        <th width="15%">
                            图片</th>
                        <th width="25%">
                            名称</th>
                        <th width="15%">
                            会员优惠</th>
                        <th width="30%">
                            操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            1</td>
                        <td>
                            <img src="../img/book1.jpg" alt="1" /></td>
                        <td>
                            Otto</td>
                        <td>
                            <span>是</span></td>
                        <td>
                            <button type="button" class="btn btn-close">
                                删除</button>
                            <button type="button" class="btn btn-open" onclick="window.location.href='EditArticle.aspx'">
                                管理章节</button>
                            <button type="button" class="btn btn-fined mg">
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
                    form1.action='EditBooks.aspx?action=search';
                    form1.submit();
                }
</script>
</asp:Content>

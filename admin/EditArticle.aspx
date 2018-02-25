<%@ Page Language="C#" MasterPageFile="~/admin/adminIndex.master" AutoEventWireup="true"
    CodeFile="EditArticle.aspx.cs" Inherits="admin_EditArticle" Title="编辑章节" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<form method="post" action="" id="listform">
    <h3>
        &gt;编辑章节</h3>
    <div class="userTab Article">
        <div class="userTab_in">
            <div class="art_header" style="height: 50px;">
                <h4 class="fl">
                    所有章节</h4>
                <%=AddBtn %><%--<button type="button" class="btn btn-fined fr" onclick="window.location.href='AddArticle.aspx'">添加章节</button>--%>
            </div>
            <hr/>
            <table class="table">
            <%=articlelist %>
                <%--<thead>
                    <tr>
                        <th width="25%">
                            ID</th>
                        <th width="25%">
                        书名</th>
                        <th width="25%">
                            章节名</th>
                        <th width="25%">
                            操作</th>
                    </tr>
                </thead>
                <tbody>--%>
                   <%-- <tr>
                        <td>
                            1</td>
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
                    <tr>
                        <td>
                            2</td>
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
                    <tr>
                        <td>
                            3</td>
                        <td>
                            Otto</td>
                        <td>
                            the Bird</td>
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
                    form1.action='EditArticle.aspx?action=search';
                    form1.submit();
                }
</script>
</asp:Content>

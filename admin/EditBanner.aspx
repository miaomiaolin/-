<%@ Page Language="C#" MasterPageFile="~/admin/adminIndex.master" AutoEventWireup="true"
    CodeFile="EditBanner.aspx.cs" Inherits="admin_EditBanner" Title="导航编辑" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>
        &gt;编辑轮播图</h3>
    <div class="userTab">
        <div class="userTab_in">
            <div style="height: 50px;">
                <h4 class="fl">
                    所有轮播图</h4>
            </div>
            <hr />
            <table class="table">
                <%=bannerlist%><%--<thead>
                    <tr>
                        <th width="15%">
                            ID</th>
                        <th width="25%">
                            图片</th>
                        <th width="25%">
                            名称</th>
                        <th width="15%">
                            状态</th>
                        <th width="20%">
                            操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            1</td>
                        <td>
                            <img src="../img/banner/banner1.jpg" alt="1"></td>
                        <td>
                            Otto</td>
                        <td>
                            <button type="button" class="btn btn-open">
                                上架</button></td>
                        <td>
                            <span>删除</span><span>修改</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            2</td>
                        <td>
                            <img src="../img/banner/banner2.jpg" alt="1"></td>
                        <td>
                            Thornton</td>
                        <td>
                            <button type="button" class="btn btn-close">
                                下架</button></td>
                        <td>
                            <button type="button" class="btn btn-close">
                                删除</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            3</td>
                        <td>
                            <img src="../img/banner/banner3.jpg" alt="1"></td>
                        <td>
                            the Bird</td>
                        <td>
                            <button type="button" class="btn btn-open">
                                上架</button></td>
                        <td>
                            <button type="button" class="btn btn-close">
                                删除</button>
                        </td>
                    </tr>
                </tbody> --%>
            </table>
        </div>
    </div>
</asp:Content>

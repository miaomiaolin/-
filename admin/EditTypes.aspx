<%@ Page Language="C#" MasterPageFile="~/admin/adminIndex.master" AutoEventWireup="true"
    CodeFile="EditTypes.aspx.cs" Inherits="admin_EditTypes" Title="类别编辑" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<form method="post" action="" id="listform">
    <h3>
        &gt;编辑类别</h3>
    <div class="userTab">
        <div class="userTab_in">
            <div style="height: 50px;">
                <h4 class="fl">
                    所有类别</h4>
                <button type="button" class="btn btn-fined fr" onclick="AddType();">
                    添加</button>
                <%--<button type="button" class="btn btn-fined fr" onclick="search();">
                添加</button>--%>
                <input type="text" class="form-control fr" placeholder="输入类别" name="name" id="typeName"/>
            </div>
            <hr>
            <table class="table">
            <%=typelist %>
                <%--<thead>
                    <tr>
                        <th width="30%">
                            ID</th>
                        <th width="35%">
                            类别</th>
                        <th width="35%">
                            操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            1</td>
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
    form1.action='EditTypes.aspx?action=search';
    form1.submit();
}
function AddType(){
		var typeName=document.getElementById("typeName").value;					
		
		var _json = jQuery.param({ "typeName": typeName});
		var request = $.ajax({  
            url: "AddTypes.ashx",  
            type: "POST",  
            async: false,  
            data: _json, //不能直接写成 {id:"123",code:"tomcat"}  
            dataType: "json",  
            // contentType: "charset=utf-8",  
            cache: false,  
            success: function (data) {  
                var json=data;
                debugger;
                 if(json.loginok=="1")
                 {
                   alert("新增类别成功！");
                   window.location.href="EditTypes.aspx";  
                 }
                 else
                 {
                    alert('对不起，插入数据不对，请重新填写。');                        
                 }
            },  
            error: function (XMLHttpRequest, textStatus, errorThrown) { alert(XMLHttpRequest.readyState); }  
        }); 
	}

</script>
</asp:Content>

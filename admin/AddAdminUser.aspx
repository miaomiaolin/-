<%@ Page Language="C#" MasterPageFile="~/admin/adminIndex.master" AutoEventWireup="true"
    CodeFile="AddAdminUser.aspx.cs" Inherits="admin_AddAdminUser" Title="新增管理员" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>
        &gt;新增管理员</h3>
    <div class="userTab">
        <div class="userTab_in bookInfo">
            <div class="form_text">
                <ul>
                    <li>权限：</li>
                    <li>管理员名称：</li>
                    <li>密码：</li>
                    <li>再次输入密码：</li>
                    
                </ul>
            </div>
            <div class="form_input">
                <select id="limit">
                    <option value="1">超级管理员</option>
                    <option value="0">普通管理员</option>
                </select>
                <input type="text" id="adminName"/>
                <input type="text" id="onePwd"/>
                <input type="text" id="adminPwd" />
                <br />
                <button class="btn btn-open" onclick="AddAdminUser();">
                    提交</button>
                <button class="btn btn-close">
                    重置</button>
            </div>
            <div class="clr">
            </div>
        </div>
    </div>
    <script type="text/javascript">
    		function AddAdminUser(){
			var limit=document.getElementById("limit").value;//管理员权限
			var adminName=document.getElementById("adminName").value;//管理员名称
			var onePwd=document.getElementById("onePwd").value;//第一次输入密码	
			var adminPwd=document.getElementById("adminPwd").value;//管理员密码	
			if(onePwd !=adminPwd){
			    alert('两次密码不一致！');
			    return;
			}					
			
			var _json = jQuery.param({ "limit": limit, "adminName": adminName,"adminPwd":adminPwd});
			var request = $.ajax({  
                url: "AddAdminUser.ashx",  
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
                       alert("新增管理员成功！");
                       window.location.href="EditAdminUsers.aspx";  
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

<%@ Page Language="C#" MasterPageFile="~/perBook.master" AutoEventWireup="true" CodeFile="per_info.aspx.cs" Inherits="per_info" Title="个人中心" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="per_r_tit">
				<span>个人信息</span>
			</div>
			<div class="per_book">
			<div class="userTab_in bookInfo" style="position:relative;">
            <div class="form_text" style="line-height: 32px;font-size: 14px;float: left;text-align: right;">
                <ul>
                    <li>用户名：</li><li style="padding-bottom:127px;">头像：</li><li style="padding-bottom:20px;">生日：</li><li style="padding-bottom:20px;">邮箱：</li><li>手机号：</li></ul>
            </div>
            <div class="form_input" style="position:relative;z-index: 3;">
                <input type="text" name="userName" style="display: block;line-height: 30px;margin: 20px 0;padding-left: 8px;color: #555;border: 1px solid #ccc;border-radius: 4px;width: 200px;font-size: 14px;" disabled="disabled" value="<%=user_name %>"/>
                <asp:FileUpload ID="FileUpload1" runat="server" Height="133px" Width="92px" BorderWidth="0px" BackColor="Transparent" BorderColor="Transparent" ForeColor="Transparent" Enabled="true" Visible="true" style="opacity: 0;color: Transparent;background-color: Transparent;border-color: Transparent;border-width: 0px;height: 120px;width: 120px;opacity: 0;" onchange="onFileChange(this);"/>
                <input type="text" name="birthday" value="<%=birthday %>" style="display: block;line-height: 30px;margin: 20px 0;padding-left: 8px;color: #555;border: 1px solid #ccc;border-radius: 4px;width: 200px;font-size: 14px;"/>
                <input type="text" name="mail" value="<%=mail %>" style="display: block;line-height: 30px;margin: 20px 0;padding-left: 8px;color: #555;border: 1px solid #ccc;border-radius: 4px;width: 200px;font-size: 14px;"/>
                <input type="text" name="phone" value="<%=phone %>" style="display: block;line-height: 30px;margin: 20px 0;padding-left: 8px;color: #555;border: 1px solid #ccc;border-radius: 4px;width: 200px;font-size: 14px;"/>
                <br />
                <button class="btn btn-open" id="addBookBtn" onserverclick="addUserInfoBtn_ServerClick" runat="server" style="padding:8px 25px;color: #fff;background-color: #449d44;border:1px solid #398439;border-radius: 5px;">提交</button>
            </div>
            <div class="bookImg" style="position: absolute;top:45px;z-index: 2;left:57px;">
                    <div class="bookPic" style="position:relative;width:120px;height:120px;">
                        <img id="upImages" src="<%=myimg %>" alt="上传图片" style="width: 100%;height: 100%;border-radius: 5px;"/>
                        <div class="upImages" style="width: 100%;height: 120px;position: absolute;top: 0;left: 0;background: rgba(0,0,0,0.4);color: #eee;text-align: center;font-size: 14px;line-height:8;font-weight: bold;border-radius: 3px;">点击上传</div>
                    </div>
            </div>
            <div class="clr">
            </div>
        </div>
			</div>
			 <script type="text/javascript">
    function onFileChange(sender) {  
        document.getElementById("upImages").src = window.URL.createObjectURL(sender.files[0]);  
    }; 
    </script>
</asp:Content>


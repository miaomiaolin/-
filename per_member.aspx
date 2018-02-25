<%@ Page Language="C#" MasterPageFile="~/perBook.master" AutoEventWireup="true" CodeFile="per_member.aspx.cs" Inherits="per_member" Title="充值中心" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
</script>

<div class="per_r_tit">
				<span>充值中心</span>
			</div>
			<div class="per_book">
                <input onblur="monye();" id="money" type="text" name="money" style="display: block;line-height: 30px;margin: 20px 0;padding-left: 8px;color: #555;border: 1px solid #ccc;border-radius: 4px;width: 200px;font-size: 14px;" placeholder="请输入充值金额"/>
			</div>
			<div class="clr"></div>
			<div class="toBuy">
				<input class="tobtn" style="border:none;" type="button" value="充值" id="Button1"  onserverclick="addMoneyBtn_ServerClick" runat="server"/>
				<input class="tobtn" style="border:none;background-color: #da4453;margin-left: 5px;" type="button" value="一键成为会员" onserverclick="memberBtn_ServerClick" runat="server"/>
			</div>
			<div class="clr"></div>
			<div class="maskFoot">
				<div class="fl warmPrompt">温馨提示</div>
				<div class="fl ptext">
					<p>1.请确认充值手机余额充足，可以正常收发短信。</p>
					<p>2.充值后，账户余额若长时间无变化，请致电书城客服：17774005385</p>
					<p>3.永久会员价格88元</p>
				</div>
			</div>
			<script type="text/javascript">
			function monye()
			{
			    var money=document.getElementById('money').value;
			    if(money=="")
			    {
			        alert('请输入充值金额');
			    }
			    
			}
			</script>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/perBook.master" AutoEventWireup="true" CodeFile="bookself.aspx.cs" Inherits="bookself" Title="我的书架" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="per_r_tit">
				<span>我的图书</span>
				<input onclick="noChoice();" id="nochoice" onclick="displayDelete();" type="button" value="取消" style="width:55px;height:25px;line-height: 25px;border:none;border-radius: 15px;font-size: 16px;color: #fff;text-align: center;float:right;margin-left:5px;display:none"/>
				<input onclick="displayDelete();" type="button" value="删除" style="width:55px;height:25px;line-height: 25px;border:none;background: #da4453;border-radius: 15px;font-size: 16px;color: #fff;text-align: center;float:right;"/>

			</div>
			<div class="per_book">
			<%=list %>
				<%--<div class="per_b_in" >
					<a href="text.html" >
					<div style="position:relative;width:115px;height:153px;">
						<img src="img/book3.jpg">
						<div style="width:115px;height:153px;background:rgba(0,0,0,0.5);border-radius:5px; position:absolute;top:0px;left:0;" class="delete_mask">
					    <input type="button" style="width:25px;height:25px;border:none;background:url(img/delete.png); background-size:25px 25px;margin-left: 70px;margin-top: 10px;"/>
					</div>
					</div>	
					</a>
					<a href="text.html">
						<p>谁动了我的奶酪</p>
					</a>
					
				</div>
				<div class="per_b_in">
					<a href="text.html">
						<img src="img/book3.jpg">
					</a>
					<a href="text.html">
						<p>谁动了我的奶酪</p>
					</a>
				</div>
				<div class="per_b_in">
					<a href="text.html">
						<img src="img/book3.jpg">
					</a>
					<a href="text.html">
						<p>谁动了我的奶酪</p>
					</a>
				</div>
				<div class="per_b_in">
					<a href="text.html">
						<img src="img/book3.jpg">
					</a>
					<a href="text.html">
						<p>谁动了我的奶酪</p>
					</a>
				</div>
				<div class="per_b_in">
					<a href="text.html">
						<img src="img/book3.jpg">
					</a>
					<a href="text.html">
						<p>谁动了我的奶酪</p>
					</a>
				</div>
				<div class="per_b_in">
					<a href="text.html">
						<img src="img/book3.jpg">
					</a>
					<a href="text.html">
						<p>谁动了我的奶酪</p>
					</a>
				</div>--%>
			</div>
			<script type="text/javascript">
			function displayDelete()
			{
			    var nochoice=document.getElementById('nochoice');
			    var del=document.getElementsByClassName('delete_mask');
			    for(var i=0;i<del.length;i++)
			    {
			        del[i].style.display='block';
			    }
			    nochoice.style.display='block';
			    alert('删除后无法恢复，请谨慎操作');
			    
			}
			function noChoice()
			{
			     var nochoice=document.getElementById('nochoice');
			    var del=document.getElementsByClassName('delete_mask');
			    for(var i=0;i<del.length;i++)
			    {
			        del[i].style.display='none';
			    }
			    nochoice.style.display='none';
			}
			</script>
</asp:Content>


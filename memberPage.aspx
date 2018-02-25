<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memberPage.aspx.cs" Inherits="memberPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>会员专区</title>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
    <form  method="post" action="" id="listform" runat="server">
    <div class="header">
	<div class="header_in">
		<div class="top">
			<div class="top_in">
				<span><%=hello %><%=user_name %><a href="userLogin.htm"><%=login %></a></span>
			</div>
		</div>
		<div class="head">
			<div class="logo">
				<img src="img/icon/logo.jpg" alt="logo">
			</div>
			<div class="search">
				<input type="text" placeholder="请输入书籍名称"/>
				<img src="img/icon/search.jpg" alt="search" onclick="search();"/>
			</div>
		</div>
		<div class="nav">
			<ul>
				<li><a href="index.aspx"  name="nav">首页</a></li>
				<li><a href="typePage.aspx?id=1">文学</a></li>
				<li><a href="typePage.aspx?id=2">小说</a></li>
				<li><a href="typePage.aspx?id=3">工具书</a></li>
				<li><a href="#">会员专区</a></li>
			</ul>
			<li class="mybook"><a href="bookself.aspx">我的书架</a></li>
		</div>
	</div>
</div>
<div class="main_reg">
	<div style="width: 100%"><img src="img/img01.jpg" style="width: 100%"/></div>
	<div class="main">
		<div class="main_top">
			<span><a href="memberPage.aspx?change=1#hot" name="hot">热销&nbsp;</a></span>
			<span><a href="memberPage.aspx?change=2#new" name="new">最新</a></span>
		</div>
		<div class="h_20"></div>
		<div class="conter clr">
			<div class="conter_in">
				<%-- <div class="book">
					<a href="detail_page.html"><img src="img/book1.jpg" alt="book"></a>
					<p><a href="detail_page.html">无证之罪</a></p>
					<span><a href="detail_page.html"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book2.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book3.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book4.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book5.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book6.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book1.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book2.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book3.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book4.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book5.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book6.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
			</div>
		</div>
		<div class="conter clr">
			<div class="conter_in">
				<div class="book">
					<a href="#"><img src="img/book1.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book2.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book3.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book4.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book5.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book6.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book1.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book2.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book3.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book4.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book5.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book6.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
			</div>
		</div>
		<div class="conter clr">
			<div class="conter_in">
				<div class="book">
					<a href="#"><img src="img/book1.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book2.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book3.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book4.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book5.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>
				<div class="book">
					<a href="#"><img src="img/book6.jpg" alt="book"></a>
					<p><a href="#">无证之罪</a></p>
					<span><a href="#"><i>¥</i>3.99</a></span>
				</div>--%><%=list %>
			</div>
		</div>
	</div>
</div>

<div class="footer">
	<div class="footer_in">
		<p>如有问题欢迎联系</p>
		<ul>
			<li>&copy;2017</li>
			<li><a href="#" onclick="alert('注销账号、忘记密码、充值疑问都可联系管理员17774005385');">使用123阅读网前必读</a>&nbsp|&nbsp</li>
			<li><a href="#" onclick="alert('本平台为在线阅读网站，在使用本平台过程中如有疑问都可联系管理员17774005385');">关于我们</a>&nbsp|&nbsp</li>
			<li><a href="#nav">网站导航</a>&nbsp|&nbsp</li>
			<li><a href="#" onclick="alert('请联系17774005385');">商务合作</a></li>
		</ul>
	</div>
</div>
    </form>
    <script type="text/javascript">
         function search(){
                    var form1 =document.getElementById('listform');
                    form1.action='memberPage.aspx?action=search';
                    form1.submit();
                }
    </script>
</body>
</html>

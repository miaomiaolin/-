<%@ Page Language="C#" AutoEventWireup="true" CodeFile="typePage.aspx.cs" Inherits="typePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <meta charset="UTF-8"/>
	<title><%=category %></title>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<script type="text/javascript">
	</script>
</head>
<body>
    <form  method="post" action="" id="listform">
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
				<input type="text" name="search" placeholder="请输入书籍名称"/>
				<img src="img/icon/search.jpg" alt="search" onclick="search();"/>
			</div>
		</div>
		<div class="nav">
			<ul>
				<li><a href="index.aspx"  name="nav">首页</a></li>
				<li><a href="typePage.aspx?id=1">文学</a></li>
				<li><a href="typePage.aspx?id=2">小说</a></li>
				<li><a href="typePage.aspx?id=3">工具书</a></li>
				<li><a href="memberPage.aspx">会员专区</a></li>
			</ul>
			<li class="mybook"><a href="bookself.aspx">我的书架</a></li>
		</div>
	</div>
</div>
<div class="main_reg">
	<div class="main">
		<div class="main_top">
			<span><a href="index.aspx">首页 >&nbsp</a></span>
			<span><%=category %></span>
		</div>
		<div class="nav main_nav">
				<ul>
					<li><a href="typePage.aspx?id=<%=categoryId %>&change=1">热度</a></li>
					<li><a href="typePage.aspx?id=<%=categoryId %>&change=2">最新</a></li>
				</ul>
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
				</div>--%><%=list%>
			</div>
		</div>
	</div>
</div>
<div class="back-to-top" style="position:fixed;bottom:10px;right:10px;padding:8px 10px;border:1px solid #555;cursor:pointer;background:#efefef">返回顶部</div>
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript">
         function search(){
                    var form1 =document.getElementById('listform');
                    form1.action='typePage.aspx?id=<%=categoryId %>&action=search';
                    form1.submit();
                }
</script>
</body>
</html>

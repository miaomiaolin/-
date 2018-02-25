<%@ Page Language="C#" AutoEventWireup="true" CodeFile="detailPage.aspx.cs" Inherits="detailPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%=title %></title>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
    <form  method="post" action="" id="listform" runat="server">
    <div>
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
				        <input type="text" name="search" placeholder="请输入书籍名称" value=""/>
				        <img src="img/icon/search.jpg" alt="search" onclick="search();"/>
			        </div>
		        </div>
		        <div class="nav">
			        <ul>
				        <li><a href="index.aspx" name="nav">首页</a></li>
				        <li><a href="typePage.aspx?id=1">文学</a></li>
				        <li><a href="typePage.aspx?id=2">小说</a></li>
				        <li><a href="typePage.aspx?id=3">工具书</a></li>
				        <li><a href="memberPage.aspx">会员专区</a></li>
			        </ul>
			        <li class="mybook"><a href="bookself.aspx">我的书架</a></li>
		        </div>
	        </div>
        </div>
        <div class="main clr">
	    <div class="h_20"></div>
	    <div class="detail_top ">
		    <div class="detail_t_l fl">
			    <img src="<%=cover %>"/>
		    </div>
		    <div class="detail_t_r fl">
			    <div class="det_r_c">
				    <h3><%=title %></h3>
				    <p>作者：<%=author %></p>
			    </div>
			    <div class="det_r_c">
				    <p>价格：<%=price %>元</p>
				    <div class="det_r_btn" style="width:90px;float:left">
					    <%=read%><%-- <a href="text.aspx?Book=<%=bookId %>&Section=<%=sectionId %>"><img src="img/icon/toRead_btn.jpg"/></a>
					    <a href="#"><img src="img/icon/addBook_btn.jpg"/></a>--%>
					    
				    </div>
				    <input type="button" value="加入书架"  style="float:left;margin-top: 10px;background:url(img/icon/addBook_btn.jpg)no-repeat;border:none;padding:6px 14px;color:transparent;" id="Button1" onserverclick="Button1_ServerClick" runat="server"/>
			    <div style="clear:both"></div>
			    </div>
			     <div style="clear:both"></div>
			    <div class="det_r_f">
				    <p><%=brief %><%--人们往往愿意相信事实和数据，但无意间却会被故事吸引，并沉浸其中。这是为什么呢？因为“我们无法通过智力去影响别人，情感却能做到这一点”（亚里士多德）。经过情感故事包装过的事实，会以洪流般的势头迅速打开人们的心门，进而极大程度地影响人们的心理走势。--%></p>
			    </div>
			   
		    </div>
	    </div>
	    <div class="h_20"></div>
	    <div class="detail_conter clr">
		    <div class="det_c_l fl">
			    <div class="det_c_text">
				    <h3>目录</h3>
			    </div>
			    <%=section %>
			    <%-- <div class="det_c_text">
				    <a href="text.html"><p><span>第一章 前尘往事</span></p></a>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>
			    <div class="det_c_text">
				    <p><span>第一章 前尘往事</span></p>
			    </div>--%>
		    </div>
		    <div class="det_c_r fr">
			    <div class="det_c_text">
				    <h3>热门推荐</h3>
			    </div>
			    <%--<div class="book fl">
				    <a href="#"><img src="img/book2.jpg" alt="book"></a>
				    <p><a href="#">无证之罪</a></p>
				    <span><a href="#"><i>¥</i>3.99</a></span>
			    </div>--%>
			    <%=hostlist %>
		    </div>
	    </div>
	    </div>
	    <div class="footer">
	            <div class="footer_in">
		            <p>如有问题欢迎联系17774005385</p>
		            <ul>
			            <li>&copy;2017</li>
			            <li><a href="#" onclick="alert('注销账号、忘记密码、充值疑问都可联系管理员17774005385');">使用123阅读网前必读</a>&nbsp|&nbsp</li>
			            <li><a href="#" onclick="alert('本平台为在线阅读网站，在使用本平台过程中如有疑问都可联系管理员17774005385');">关于我们</a>&nbsp|&nbsp</li>
			            <li><a href="#nav">网站导航</a>&nbsp|&nbsp</li>
			            <li><a href="#" onclick="alert('请联系17774005385');">商务合作</a></li>
		            </ul>
	            </div>
            </div>
    </div>
    </form>
    <script type="text/javascript">
         function search(){
                    var form1 =document.getElementById('listform');
                    form1.action='detailPage.aspx?id=<%=book %>&action=search';
                    form1.submit();
                }
    </script>
</body>
</html>

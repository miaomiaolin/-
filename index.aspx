<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>123阅读网</title>
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <style>
    .active{box-sizing:border-box;border:0;}
    </style>
</head>
<body onload="imgScoll()">
    <form method="post" action="" id="listform">
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
				        <img src="img/icon/logo.jpg" alt="logo"/>
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
        <div class="main">
	        <div class="h_20"></div>
	        <div class="banner">
		        <div class="banner_left">
			        <img src="img/isco.jpg" alt=""/>
			        <div class="save_button"><a href="memberPage.aspx" class="apply_btn"></a></div>
		        </div>
		        <div class="banner_bar ">
			        <ul id="imgBox" class="imgBox">
			            <%=banlist %>
				        <%-- <li><a href="#"><img src="img/banner/banner1.jpg" alt="banner1"/></a></li>
				        <li><a href="#"><img src="img/banner/banner2.jpg" alt="banner2"/></a></li>
				        <li><a href="#"><img src="img/banner/banner3.jpg" alt="banner3"/></a></li>
				        <li><a href="#"><img src="img/banner/banner2.jpg" alt="banner3"/></a></li>--%>
			        </ul>
			        <div id="list" class="imgNum">
				        <a href="#" class="active" ></a>
				        <a href="#" class=""></a>
				        <a href="#" class=""></a>
				        <a href="#" class=""></a>
			        </div>
		        </div>
	        </div>
	        <div class="h_20"></div>
	        <div class="con_main">
		        <div class="conter clr">
			        <div class="conter_tit">
				        <h3>主编推荐</h3>
				        
			        </div>
			        <div class="conter_in">
				        <%--<div class="book">
					        <a href="detail_page.html"><img src="img/book1.jpg" alt="book"></a>
					        <p><a href="detail_page.html">无证之罪</a></p>
					        <span><a href="detail_page.html"><i>¥</i>3.99</a></span>
				        </div>--%>
				        <%=recommendList %>
        				
			        </div>
		        </div>
		        <div class="conter clr">
			        <div class="conter_tit">
				        <h3>热门推荐</h3>
				        
			        </div>
			        <div class="conter_in">
				        <%=hostlist %>
			        </div>
		        </div>
		        <div class="conter clr">
			        <div class="conter_tit">
				        <h3>新书推荐</h3>
				        
			        </div>
			        <div class="conter_in">
				        <%=newlist%>
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
    </div>
    <div class="back-to-top" style="position:fixed;bottom:10px;right:10px;padding:8px 10px;border:1px solid #555;cursor:pointer;background:#efefef">返回顶部</div>
    </form>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript">
 function search(){
                    var form1 =document.getElementById('listform');
                    form1.action='index.aspx?action=search';
                    form1.submit();
                }
function imgScoll(){
    var pic=document.getElementById('imgBox').getElementsByTagName('li'),
        list=document.getElementById('list').getElementsByTagName('a'),
        index=0,
        timer=null;
      // 定义并调用自动播放函数
      timer=setInterval(autoPlay,2000);
      function autoPlay(){
        index++;
        //防止index无限加下去
        if(index >=list.length){
          index=0;
        }
        changePic(index);
      }
      // 定义图片切换函数
      function changePic(curIndex){
        for (var j=0;j<list.length;j++) {
          list[j].className='';
          pic[j].style.display='none';
        }
        //设置当前为高亮显示
        list[curIndex].className='active';
        pic[curIndex].style.display='block';
      }
     // 鼠标划过整个容器时停止自动播放
     for (var i = 0;i<list.length;i++) {
        list[i].id=i;
        list[i].onmouseover=function(){
          clearInterval(timer);
          changePic(this.id);
        }
        // 鼠标离开整个容器时继续播放至下一张
        list[i].onmouseout=function(){
          timer=setInterval(autoPlay,2000);
        } 
    }
     
  }
</script>
</body>
</html>

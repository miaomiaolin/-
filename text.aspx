<%@ Page Language="C#" AutoEventWireup="true" CodeFile="text.aspx.cs" Inherits="text" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%=title%>--<%=s_name%></title>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
    <form id="form1" runat="server">
   <div class="main_text">
	<div class="text_title">
		<span>
			<a href="detailPage.aspx?id=<%=thisBook %>"><%--《嗅玫瑰花的天牛》 --%>《<%=title%>》</a>
		</span>
		<span><%-- 荒石园--%><%=s_name%></span>
	</div>
	<div class="text_h3" style="line-height:100px;">
		<h4><%=s_name %></h4>
	</div>
	<div class="text_conter" style="line-height:2;">
		<%-- <p>前不久听说，业内最近出了《人类简史》这么一本“奇书”，作者是个名叫尤瓦尔·赫拉利的以色列年轻人。此书在2012年以希伯来文出版，很快就被翻译成近30种文字，不仅为全球学术界所瞩目，而且引起了公众的广泛兴趣。一部世界史新著竟能“火”成这样，实在是前所未闻。所以，当中信出版社请我为本书的中文版作序时，我也就出于好奇而暂时应承了下来：“先看看吧。”</p>
		<p>前不久听说，业内最近出了《人类简史》这么一本“奇书”，作者是个名叫尤瓦尔·赫拉利的以色列年轻人。此书在2012年以希伯来文出版，很快就被翻译成近30种文字，不仅为全球学术界所瞩目，而且引起了公众的广泛兴趣。一部世界史新著竟能“火”成这样，实在是前所未闻。所以，当中信出版社请我为本书的中文版作序时，我也就出于好奇而暂时应承了下来：“先看看吧。”</p>
		<p>前不久听说，业内最近出了《人类简史》这么一本“奇书”，作者是个名叫尤瓦尔·赫拉利的以色列年轻人。此书在2012年以希伯来文出版，很快就被翻译成近30种文字，不仅为全球学术界所瞩目，而且引起了公众的广泛兴趣。一部世界史新著竟能“火”成这样，实在是前所未闻。所以，当中信出版社请我为本书的中文版作序时，我也就出于好奇而暂时应承了下来：“先看看吧。”</p>
		<p>前不久听说，业内最近出了《人类简史》这么一本“奇书”，作者是个名叫尤瓦尔·赫拉利的以色列年轻人。此书在2012年以希伯来文出版，很快就被翻译成近30种文字，不仅为全球学术界所瞩目，而且引起了公众的广泛兴趣。一部世界史新著竟能“火”成这样，实在是前所未闻。所以，当中信出版社请我为本书的中文版作序时，我也就出于好奇而暂时应承了下来：“先看看吧。”</p>
		<p>前不久听说，业内最近出了《人类简史》这么一本“奇书”，作者是个名叫尤瓦尔·赫拉利的以色列年轻人。此书在2012年以希伯来文出版，很快就被翻译成近30种文字，不仅为全球学术界所瞩目，而且引起了公众的广泛兴趣。一部世界史新著竟能“火”成这样，实在是前所未闻。所以，当中信出版社请我为本书的中文版作序时，我也就出于好奇而暂时应承了下来：“先看看吧。”</p>
		<p>前不久听说，业内最近出了《人类简史》这么一本“奇书”，作者是个名叫尤瓦尔·赫拉利的以色列年轻人。此书在2012年以希伯来文出版，很快就被翻译成近30种文字，不仅为全球学术界所瞩目，而且引起了公众的广泛兴趣。一部世界史新著竟能“火”成这样，实在是前所未闻。所以，当中信出版社请我为本书的中文版作序时，我也就出于好奇而暂时应承了下来：“先看看吧。”</p>
	    --%> <%=s_text %>
	</div>
	<div class="text_footer">
		<div class="text_btn fl"><a href="text.aspx?Book=<%=thisBook %>&Section=<%=toSection %>">上一章</a></div>
		<div class="text_btn active fl"><a href="detailPage.aspx?id=<%=thisBook %>">目录</a></div>
		<div class="text_btn fl"><a href="text.aspx?Book=<%=thisBook %>&Section=<%=nextSection %>">下一章</a></div>
	</div>
</div>	
    </form>
</body>
</html>

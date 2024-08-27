<%@ page pageEncoding="UTF-8"%>
<%@ page import="jojo.farmerpapa.entity.Customer"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>FarmerPaPa</title>
		<link rel="stylesheet" type="text/css" href="style/fpapa.css">
		<style>
		
		</style>

	</head>
	<body>
		<header>
			<h2>FarmerPaPa test<sub>首頁</sub></h2>
			<hr>
		</header>
		<nav>
			<% 
	            Customer member = (Customer)session.getAttribute("memberLogin");	
	        %>
			
			<a href="product_list.jsp">買水果 | </a>
			
			<% if(member == null){ %>
					<a href="/fpapa/login.jsp">會員登入 | </a>
					<a href="/fpapa/register.jsp">會員註冊</a>
			<% 	}else{%>
					<a href="#">會員中心 | </a>
					<a href="/fpapa/logout.do">登出</a>
			<% } %>
			
			<br>
			
			<span class="welcomSpan"> <%= member != null ? member.getName() : "" %> 你好!</span>
			<hr>
		</nav>
		<article>
			<iframe width="560" height="315" src="https://www.youtube.com/embed/UQuHtbmXJ6c?si=8uJAgjn8p0_NK6DZ" title="YouTube video player" 
			frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
			referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			
			<br>
			<a href="">reload</a>	
			<hr>
			<img src="images/media_icon.png">
		</article>
		<footer>
		</footer>
	
	</body>
</html>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="jojo.farmerpapa.entity.Customer"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>FarmerPaPa</title>
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/header.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/index.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">
		
	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
			
		<%-- <jsp:include page="./subviews/header.jsp">
			<jsp:param value="果物市集" name="subheader"/>
		</jsp:include>  --%>
		
		<%@include file="./subviews/header.jsp" %>  <%--這個寫法有隱含變數的效果 --%>
			
		<div class="indexContent">	
			<article>
				<div class="kv">
					<!--  <img id="indexKV" alt="banner" src="images/pic-1.jpg" > -->
					<video id="indexKV" autoplay loop muted>
    					<source src="/fpapa/images/index-1.mp4" type="video/mp4" >
    				</video>    
					
					<h1>小農真心．果然新鮮</h1>
				</div>
				
				<div class="newsList">
					<h2>最新情報</h2>
				</div>
				
				<div class="productList">
					<h2>當季主打</h2>
				</div>
				
				<div class="productList">
					<h2>禮盒專區</h2>
				</div>
				
				
			</article>
		</div>
		<%@include file="./subviews/footer.jsp" %>
	
	</body>
</html>
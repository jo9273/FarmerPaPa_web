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
		<link rel="stylesheet" type="text/css" href="/fpapa/style/form.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">
		
	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
			
		<%-- <jsp:include page="./subviews/header.jsp">
			<jsp:param value="果物市集" name="subheader"/>
		</jsp:include>  --%>
		
		<%@include file="./subviews/header.jsp" %>
			
		<div class="indexContent">	
			<article>
				<div>
					<img id="indexKV" alt="banner" src="images/pic-1.jpg">
					
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
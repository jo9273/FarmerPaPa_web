<%@ page pageEncoding="UTF-8"%>
<%@ page import="jojo.farmerpapa.entity.Customer"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>FarmerPaPa</title>
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		<style>
		
		</style>

	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
		
		<jsp:include page="./subviews/header.jsp">
			<jsp:param value="果物市集" name="subheader"/>
		</jsp:include>
		
		<%@include file="./subviews/nav.jsp" %>
		
		<article>
			<iframe width="560" height="315" src="https://www.youtube.com/embed/UQuHtbmXJ6c?si=8uJAgjn8p0_NK6DZ" title="YouTube video player" 
			frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
			referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
			
			<br>
			<a href="">reload</a>	
			<hr>
			<img src="images/media_icon.png">
		</article>
		
		<%@include file="./subviews/footer.jsp" %>
	
	</body>
</html>
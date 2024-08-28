<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>404</title>
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">

    	<script></script>
    		        
    	<style>
    		img{width: 360px ; display: block ; margin: auto;}
    	</style>

	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
		<jsp:include page="/subviews/header.jsp">
			<jsp:param value="404" name="subheader"/>
		</jsp:include>

		<%@include file="/subviews/nav.jsp" %>
		
		<article>
<%-- 			<p>找不到檔案: <%= request.getAttribute("javax.servlet.error.request_uri") %> --%>
			<img src="/fpapa/images/404_icon.png">
			
		</article>
		
		<%@include file="/subviews/footer.jsp" %>
	
	</body>
</html>
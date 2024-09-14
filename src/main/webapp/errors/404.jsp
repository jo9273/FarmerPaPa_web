<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>找不到網頁 404</title>
		<link rel="stylesheet" type="text/css" href="/fpapa/style/header.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">
    	<script></script>
    		        
    	<style>
    		.notFound{
    			width: 100%;
    			text-align: center;
    			
    		}
    		
    		.notFound h2{
    			
    		}
    		
    		.notFound img{
    			width: 360px;
    		}
    	</style>

	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
		
		<jsp:include page="/subviews/header.jsp">
			<jsp:param value="404" name="subheader"/>
		</jsp:include>
		
		<div class="pageContent">
			<div class="notFound">
	<%-- <p>找不到檔案: <%= request.getAttribute("javax.servlet.error.request_uri") %> --%>
				<h2>找不到網頁</h2>
				<img src="/fpapa/images/404_icon.png">
				
			</div>
		</div>
		<%@include file="/subviews/footer.jsp" %>
	
	</body>
</html>
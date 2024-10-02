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
    		.notFound-content{
    			width: 80%;
				margin: 50px auto;
    		}
    	
    		.notFound{
    			text-align: center;
				margin: auto;
				width: 400px;
    		}
    		
    		.notFound img{
    			width: 100%;
    		}
    	</style>

	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
		
		<jsp:include page="/subviews/header.jsp">
			<jsp:param value="404" name="subheader"/>
		</jsp:include>
		
		<div class="pageContent">
			<div class="notFound-content">
			
				<div class="notFound">
		<%-- <p>找不到檔案: <%= request.getAttribute("javax.servlet.error.request_uri") %> --%>
					<h2>找不到網頁</h2>
					<img src="/fpapa/images/404.png">
					
				</div>
			</div>
		<%@include file="/subviews/footer.jsp" %>
		</div>
	</body>
</html>
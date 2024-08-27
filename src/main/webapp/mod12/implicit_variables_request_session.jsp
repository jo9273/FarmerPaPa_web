<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>隱含變數(request, session)</title>
		<link rel="stylesheet" type="text/css" href="../style/fpapa.css">

    	<script></script>
        
    	<style>
    		p label{color:blue; background: lightgray;}
    	</style>

	</head>
	<body>
		<h2>Implicit Variables隱含變數 (request, session)</h2>
		<hr>
		<h3>request</h3>
		<p> <label>request.getMethod():</label> <%= request.getMethod() %></p>
		<p> <label>request.getRequestURL():</label> <%= request.getRequestURL() %></p>
		<p> <label>request.getRequestURI():</label> <%= request.getRequestURI() %></p>
		<p> <label>request.getProtocol():</label> <%= request.getProtocol() %></p>
		<p> <label>request.getLocalName()[伺服器名稱]:</label> <%= request.getLocalName() %></p>
		<p> <label>request.getLocalPort()[伺服器port]:</label> <%= request.getLocalPort() %></p>
		<p> <label>request.getLocalAddr()[伺服器 ip address]:</label> <%= request.getLocalAddr() %></p>
		<p> <label>request.getRemoteHost()[Client 名稱]:</label> <%= request.getRemoteHost() %></p>
		<p> <label>request.getRemotePort()[Client port]:</label> <%= request.getRemotePort() %></p>
		<p> <label>request.getRemoteAddr()[Client ip address]:</label> <%= request.getRemoteAddr() %></p>
		<p> <label>request.getQueryString():</label> <%= request.getQueryString() %></p>
	
	</body>
</html>
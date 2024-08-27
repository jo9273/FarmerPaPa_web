<%@page pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

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
		<p> <label>request.getContextPath():</label> <%= request.getContextPath() %></p>
		<p> <label>request.getQueryString():</label> <%= request.getQueryString() %></p>
		<hr>
		<h3>request header</h3>
		<p> <label>request.getHeader("accept-language"):</label> <%= request.getHeader("accept-language") %></p>
		<p> <label>request.getHeader("user-agent"):</label> <%= request.getHeader("user-agent") %></p>
		<hr>
		<h3>request form data</h3>
		<form action="" method=POST>
			<input name="id" placeholder="請輸入id">
			<input type="submit" value="送出">
		</form>
		<p><label> id: </label> <%= request.getParameter("id") %></p>
		<p><label> name: </label> <%= request.getParameter("name") %></p>
		<p><label> phone: </label> <%= request.getParameter("phone") %></p>
		<hr>
		<h3>session(邏輯的連線)</h3>
		<p><label> session id: </label> <%= session.getId() %></p>
	
	</body>
</html>
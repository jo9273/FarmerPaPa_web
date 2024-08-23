<%@page import="java.util.Random"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>mod12 Test</title>
		<link rel="stylesheet" type="text/css" href="../style/fpapa.css">

    	<script></script>
        
    	<style></style>

	</head>
	<body>
	
	<% 
	Random random = new Random();
	int i = random.nextInt(20)+1;
	out.println(i>10?"<p>i大於10</p>":"<p>i小於10</p>");
	%>
	
	
	</body>
</html>
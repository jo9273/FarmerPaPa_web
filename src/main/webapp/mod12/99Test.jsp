<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>99乘法表</title>
		<link rel="stylesheet" type="text/css" href="../style/fpapa.css">

    	<script></script>
        
    	<style>
	    	#_99table {
	  		border-collapse: collapse;
	  		width: 100%;
			}
	
			#_99table td, #_99table th {
	  		border: 1px solid #ddd;
	 		padding: 8px;
			}
	
			#_99table tr:nth-child(even){background-color: #f2f2f2;}
	
			#_99table tr:hover {background-color: #ddd;}
	
			#_99table caption {
	  		padding-top: 12px;
	  		padding-bottom: 12px;
	  		background-color: #04AA6D;
	  		color: white;
			}
    	</style>

	</head>
	<body>
	
		<h2>99乘法表1</h2>
			<%
			for(int i = 1 ; i <= 3 ; i++){
				for(int j = 1 ; j <= 3 ; j++ ){
			%>
					<p><% out.print(i); %> * <%out.print(j);%> =  <%out.print(i*j);%></p>
			<%	}
			
			}%>
		
		
		<h2>99乘法表2</h2>
			<%for(int a = 1 ; a <= 3 ; a++){%>
				<%for(int b = 1 ; b <= 3 ; b++){%>
				<p><%= a %> * <%=b %>= <%= a * b %></p>
				
			<%	}
			}%>
	
	
		<h2>99乘法表3_Table</h2>
			<table id="_99table">
				<caption>99乘法表</caption>
				<tbody>
					<tr>
						<td>1*1=1</td>
						<td>1*2=2</td>
						<td>1*3=3</td>
					</tr>
					<tr>
						<td>2*1=1</td>
						<td>2*2=4</td>
						<td>2*3=6</td>
					</tr>
					<tr>
						<td>3*1=3</td>
						<td>3*2=6</td>
						<td>3*3=9</td>
					</tr>
				</tbody>
			
			</table>
		
	</body>
</html>
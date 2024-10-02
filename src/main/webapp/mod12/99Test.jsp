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
				
				<% 
				for(int m = 1 ; m <= 3 ; m++){
				%>	
					<tr>
					<% 
					for(int n = 1 ; n <= 5 ; n++){
					%>
						<td><%= m %>*<%= n %>= <%= m * n %></td>

				<% 	
					}
				%>
					</tr>
				<%	
				}
				%>
					
					
				</tbody>
			
			</table>
		
	</body>
</html>
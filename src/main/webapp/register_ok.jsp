<%@ page import="jojo.farmerpapa.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="10;url=./">
        <title>FarmerPaPa register ok</title>
        
        <link rel="stylesheet" type="text/css" href="/fpapa/style/header.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">
        
    </head>
    <body>
        <% request.setCharacterEncoding("utf-8"); %>
		
		<%@include file="./subviews/header.jsp" %>
        <div class="pageContent">
	        <div class="content">	
				<article>
			        <p>
			            <% 
			            	//Customer member = (Customer)request.getAttribute("member");
			            	//out.println(member != null ? member.getName() : "name不見了");
			            %>
			            <%= member != null ? member.getName() : "name不見了"%>, 註冊成功! 10秒後自動轉址至<a href="./">首頁</a>
			        </p>
					
					<%@include file="./subviews/footer.jsp" %>
				</article>
			</div>	
		</div>	
    </body>
</html>
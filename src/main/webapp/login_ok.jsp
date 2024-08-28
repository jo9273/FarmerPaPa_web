<%@ page import="jojo.farmerpapa.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="10;url=./">
        <title>FarmerPaPa login ok</title>
        <link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
    </head>
    <body>
        <% request.setCharacterEncoding("utf-8"); %>
		<jsp:include page="./subviews/header.jsp">
			<jsp:param value="果物市集" name="subheader"/>
		</jsp:include>
		
		<%@include file="./subviews/nav.jsp" %>
        
        <p>
            <% 
            	//Customer member = (Customer)session.getAttribute("memberLogin");
            	//out.println(member != null ? member.getName() : "name不見了");
            %>
            <%= member != null ? member.getName() : "" %> 你好! 10秒後自動轉址至<a href="./">首頁</a>
        </p>
        
		<%@include file="./subviews/footer.jsp" %>
    </body>
</html>
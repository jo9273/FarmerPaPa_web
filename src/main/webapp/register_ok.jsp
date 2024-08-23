<%@ page import="jojo.farmerpapa.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="refresh" content="10;url=./">
        <title>FarmerPaPa register ok</title>
        <link rel="stylesheet" type="text/css" href="style/fpapa.css">
    </head>
    <body>
        <h2><a href="./">FarmerPaPa </a><sub>註冊成功</sub></h2>
        <hr>
        <p>
            <% 
            	Customer member = (Customer)request.getAttribute("member");
            	//out.println(member != null ? member.getName() : "name不見了");
            %>
            <%= member != null ? member.getName() : "name不見了"%>, 註冊成功! 10秒後自動轉址至<a href="./">首頁</a>
        </p>

    </body>
</html>
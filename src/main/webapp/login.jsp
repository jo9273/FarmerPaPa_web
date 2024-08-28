<%@ page pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>FarmerPaPa login</title>
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">

		<script>
            function refreshCaptcha(){
                //alert("refreshCaptcha");
                var captchaImg = document.getElementById("captchaImg");
                captchaImg.src = "images/captcha.png?refresh=" + new Date();
            }

			function displayPwd(){
				//alert(theCheckbox.checked);
				if(theCheckbox.checked){
					thePassword.type = "text";
				}else{
					thePassword.type = "password";
				}
			}


        </script>
        
        <style>
        	#theErrorsDiv{color:darkred;background-color:lightgray}
        	
        </style>

	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
		<jsp:include page="./subviews/header.jsp">
			<jsp:param value="果物市集" name="subheader"/>
		</jsp:include>
		
		<%@include file="./subviews/nav.jsp" %>
		
		<% 
			List<String> errors = (List<String>)request.getAttribute("errors"); 
		%>
		<div id="theErrorsDiv">
			<%= errors != null ? errors : "" %>
		</div>
		
		<form action="login.do" method="post">
			<p>
				<label>帳號：</label>
				<input type="email" name="email" required placeholder="請輸入email">
			</p>
			
			<p>
				<label>密碼：</label>
				<input id="thePassword" type="password" name="password" required placeholder="請輸入密碼" minlength="2" maxlength="20">
				<input id="theCheckbox" type="checkbox" onchange="displayPwd()"><label>顯示密碼</label>
			</p>
			
			<p>
				<label>驗證碼：</label>
				<input type="text" name="captcha" required placeholder="請輸入驗證碼">
				<br>
				<img id="captchaImg" src="images/captcha.png" onclick="refreshCaptcha()" alt="驗證碼" title="點擊即可更新驗證碼">
			</p>
			<input type="submit" value="送出">
		</form>
		
		<%@include file="./subviews/footer.jsp" %>
	</body>
</html>
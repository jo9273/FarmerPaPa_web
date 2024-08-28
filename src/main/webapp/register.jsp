<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FarmerPaPa register</title>
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
			<%
				out.println(errors != null ? errors : "");
			%>
		
		</div>
		
		
		<form action="register.do" method="post">
			<p>
				<label>帳號：</label>
				<input type="email" name="email" required placeholder="請輸入email">
			</p>
			
			<p>
				<label>密碼：</label>
				<input id="thePassword" type="password" name="password" required placeholder="請輸入密碼6~20字" minlength="6" maxlength="20">
				<input id="theCheckbox" type="checkbox" onchange="displayPwd()"><label>顯示密碼</label>
			</p>

            <p>
				<label>手機號碼：</label>
				<input type="tel" name="phone" required placeholder="請輸入手機號碼" pattern="[0][9][0-9]{8}">
			</p>

            <p>
                <label>姓名</label>
                <input type="text" name="name" required placeholder="請輸入姓名2~20字" minlength="2" maxlength="20">
            </p>

            <p>
                <label>生日</label>
                <input type="date" name="birthday" required max="2012-09-19">
            </p>

            <p>
                <label>性別</label>
                <input type="radio" name="gender" required value="M"><label>男</label>
                <input type="radio" name="gender" required value="F"><label>女</label>
                <input type="radio" name="gender" required value="O"><label>不願透漏</label>
                <!--
                <select name="gender" required>
                    <option value="">請選擇性別</option>
                    <option value="M">男</option>
                    <option value="F">女</option>
                    <option value="O">不願透漏</option>
                </select>
                -->
            
            </p>

            <p>
                <label>地址</label>
                <textarea name="address" placeholder="請輸入地址(選填)" rows="2" cols="30"></textarea>
            </p>

            <p>
                <input type="checkbox" name="subscribed"><label>我願意訂閱電子報</label>
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
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>FarmerPaPa 修改會員</title>
		
		<link rel="stylesheet" type="text/css" href="../style/header.css">
		<link rel="stylesheet" type="text/css" href="../style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="../style/form.css">
		<link rel="stylesheet" type="text/css" href="../style/footer.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
        
        <script>
	        $(init);
			
			function init(){
								
				<% if(request.getMethod().equals("POST")){ %>
				//修改失敗要呼叫repopulateFormData
				repopulateFormData();
				}
			
			}
			
			function repopulateFormData(){
				$("input[name=email]").val('<%=request.getParameter("email")%>');
				$("input[name=phone]").val('<%=request.getParameter("phone")%>');
				$("input[name=name]").val('<%=request.getParameter("name")%>');
				$("input[name=birthday]").val('<%=request.getParameter("birthday")%>');
				$("input[name=gender][value=<%=request.getParameter("gender")%>]").prop('checked', 'true');
				$("textarea[name=address]").text('<%=request.getParameter("address")%>');
				$("input[name=subscribed]").prop('checked', <%=request.getParameter("subscribed")!=null%>);
		
			<%}else{ %>

				//進入修改時帶入會員資料
				$("input[name=email]").val('${sessionScope.memberLogin.getId()}');
				$("input[name=phone]").val('${sessionScope.memberLogin.getPhone()}');
				$("input[name=name]").val('${sessionScope.memberLogin.getName()}');
				$("input[name=birthday]").val('${sessionScope.memberLogin.getBirthday()}');
				$("input[name=gender][value=${sessionScope.memberLogin.getGender()}]").prop('checked', 'true');
				$("textarea[name=address]").text('${sessionScope.memberLogin.getAddress()}');
				$("input[name=subscribed]").prop('checked', ${sessionScope.memberLogin.isSubscribed()});
					
			<%} %>
			}
        
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
		
		<%@include file="../subviews/header.jsp" %>
		
		<% 
			List<String> signupErrors = (List<String>)request.getAttribute("signupErrors"); 
		%>
		<div id="theErrorsDiv">
			<%
				out.println(signupErrors != null ? signupErrors : "");
			%>
		
		</div>
		<div class="pageContent">
			<div class="formContent">	
				<article>
					<h1>會員註冊</h1>
					<div class="theForm">
						<form action="register.do" method="post">
							<p>
								<label>帳號：</label>
								<input type="email" name="email" disabled readonly placeholder="請輸入email">
							</p>
							
							<p>
								<label>原密碼：</label>
								<input id="thePassword" type="password" name="password" required placeholder="請輸入密碼6~20字" minlength="6" maxlength="20">
								<input id="theCheckbox" type="checkbox" onchange="displayPwd()"><label>顯示密碼</label>
							</p>
							
							<fieldset>
								<legend><input type="checkbox" name="changePwd">要修改密碼</legend>
								<label>新密碼：</label>
								<input id="newPwd" type="password" name="newPwd" disabled placeholder="請輸入新密碼6~20字" minlength="6" maxlength="20">
								<input id="newPwdCheckbox" type="checkbox" onchange="displayPwd()"><label>顯示密碼</label>
							</fieldset>
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
				                <input id="theRadio" type="radio" name="gender" required value="M"><label>男</label>
				                <input id="theRadio" type="radio" name="gender" required value="F"><label>女</label>
				                <input id="theRadio" type="radio" name="gender" required value="O"><label>不願透漏</label>
				               
				            
				            </p>
				
				            <p>
				                <label>地址</label>
				                <textarea name="address" placeholder="請輸入地址(選填)" rows="2" cols="30"></textarea>
				            </p>
				
				            <p>
				                <input id="theCheckbox" type="checkbox" name="subscribed"><label>我願意訂閱電子報</label>
				            </p>
				
							<!-- <input type="submit" value="送出">  -->
							<button type="submit">送出</button>
						
						</form>
					</div>
				</article>
			</div>
		</div>	
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
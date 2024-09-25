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
				
				// 綁定OldPwd顯示/隱藏密碼功能
			    $('#toggleOldPwd').on('click', ToggleOldPwdClick);

			    // 綁定NewPwd顯示/隱藏密碼功能
			    $('#toggleNewPwd').on('click', ToggleNewPwdClick);
				
				
			}
			
			function repopulateFormData(){
				$("input[name=email]").val('<%=request.getParameter("email")%>');
				$("input[name=password]").val('<%=request.getParameter("password")%>');
				$("input[name=phone]").val('<%=request.getParameter("phone")%>');
				$("input[name=name]").val('<%=request.getParameter("name")%>');
				$("input[name=birthday]").val('<%=request.getParameter("birthday")%>');
				$("input[name=gender][value=<%=request.getParameter("gender")%>]").prop('checked', 'true');
				$("textarea[name=address]").text('<%=request.getParameter("address")%>');
				$("input[name=subscribed]").prop('checked', <%=request.getParameter("subscribed")!=null%>);
		
			<%}else{ %>

				//進入修改時帶入會員資料
				$("input[name=email]").val('${sessionScope.memberLogin.getEmail()}');
				$("input[name=password]").val('${sessionScope.memberLogin.getPassword()}');
				$("input[name=phone]").val('${sessionScope.memberLogin.getPhone()}');
				$("input[name=name]").val('${sessionScope.memberLogin.getName()}');
				$("input[name=birthday]").val('${sessionScope.memberLogin.getBirthday()}');
				$("input[name=gender][value=${sessionScope.memberLogin.getGender()}]").prop('checked', 'true');
				$("textarea[name=address]").text('${sessionScope.memberLogin.getAddress()}');
				$("input[name=subscribed]").prop('checked', ${sessionScope.memberLogin.isSubscribed()});
					
			<%} %>
			}
			
			// 處理舊密碼顯示/隱藏密碼功能
			function ToggleOldPwdClick() {
			    togglePassword('#oldPassword', '#toggleOldPwd');
			}

			// 處理新密碼的顯示/隱藏密碼功能
			function ToggleNewPwdClick() {
			    togglePassword('#newPassword', '#toggleNewPwd');
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
			List<String> updateErrors = (List<String>)request.getAttribute("updateErrors"); 
		%>
		<div id="theErrorsDiv">
			<%
				out.println(updateErrors != null ? updateErrors : "");
			%>
		
		</div>
		<div class="pageContent">
			<div class="formContent">	
					<h1>修改會員資料</h1>
					
					<div class="formContent">
						<form action="<%= request.getContextPath()%>/member/update.do" method="post">
							<div class="form-detail">
								<label>帳號：</label>
								<input type="email" name="email" disabled readonly placeholder="請輸入email">
							</div>
							
							
							<fieldset>
								<legend><input type="checkbox" name="changePwd">要修改密碼</legend>
								
								<div class="form-detail">
									<label>舊密碼：</label>
									<input id="oldPassword" type="password" name="password"  placeholder="請輸入密碼6~20字" minlength="6" maxlength="20">
									<img id="toggleOldPwd" src="/fpapa/images/eye_slash_fill_icon.png" alt="顯示/隱藏密碼" style="cursor: pointer;">
								</div>
								<div class="form-detail">
									<label>新密碼：</label>
									<input id="newPassword" type="password" name="newPassword" placeholder="請輸入新密碼6~20字" minlength="6" maxlength="20">
									<img id="toggleNewPwd" src="/fpapa/images/eye_slash_fill_icon.png" alt="顯示/隱藏密碼" style="cursor: pointer;">
								</div>
							</fieldset>
							
				            <div class="form-detail">
								<label>手機號碼：</label>
								<input type="tel" name="phone" required placeholder="請輸入手機號碼" pattern="[0][9][0-9]{8}">
							</div>
				
				            <div class="form-detail">
				                <label>姓名：</label>
				                <input type="text" name="name" required placeholder="請輸入姓名2~20字" minlength="2" maxlength="20">
				            </div>
				
				            <div class="form-detail">
				                <label>生日：</label>
				                <input type="date" name="birthday" disabled max="<%= LocalDate.now().plusYears(-Customer.MIN_AGE)%>">
				            </div>
				
				            <div class="form-detail">
				                <label>性別：</label>
				                <input id="theRadio" type="radio" name="gender" required value="<%= Customer.MALE%>">
							    <span>男</span>
							    <input id="theRadio" type="radio" name="gender" required value="<%= Customer.FEMALE%>">
							    <span>女</span>
							    <input id="theRadio" type="radio" name="gender" required value="<%= Customer.OTHERS%>">
							    <span>不願透漏</span>
							</div>	
							
				            <div class="form-detail">
				                <label>地址：</label>
				                <textarea name="address" placeholder="請輸入地址(選填)" rows="2" cols="30"></textarea>
				            </div>
				
				            <div class="check-subscribed">
				                <input id="theCheckbox" type="checkbox" name="subscribed">
								<span>我願意訂閱電子報</span>
				            </div>
				
							<!-- <input type="submit" value="送出">  -->
							<button type="submit">送出</button>
						
						</form>
					</div>
			</div>
		</div>
			
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
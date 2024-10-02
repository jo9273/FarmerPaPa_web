<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!-- login start -->
<div id="loginModal" class="modal">
	<div class="modal-content">
		<span id="closeLogin" class="close">&times;</span>
		<h1>會員登入</h1>

		<div class="formContent">
			<form id="loginForm" action="<%=request.getContextPath()%>/login.do" method="post">
				<div class="form-detail">
					<div class="sign-row-title">
						<label><sup>*</sup>帳號：</label>
					</div>
					<div class="row-content">
						<input id="loginEmail" type="email" name="email" required placeholder="請輸入email">
					</div>
				</div>

				<div class="form-detail">
					<div class="sign-row-title">
						<label><sup>*</sup>密碼：</label>
					</div>
					<div class="row-content">
						<input id="loginPassword" type="password" name="password" required
							placeholder="請輸入密碼" minlength="6" maxlength="20"> <img
							id="toggleLoginPwd" src="/fpapa/images/eye_slash_fill_icon.png"
							alt="顯示/隱藏密碼" style="cursor: pointer;">
					</div>
				</div>

				<div class="form-detail">
					<div class="sign-row-title">
						<label><sup>*</sup>驗證碼：</label>
					</div>
					<div class="row-content">
						<input id="loginCaptcha" type="text" name="captcha" required placeholder="請輸入驗證碼">
						<img id="LoginCaptcha" class="captchaImg"
							src="/fpapa/images/captcha.png" onclick="refreshLoginCaptcha()"
							alt="驗證碼" title="點擊即可更新驗證碼">
					</div>
				</div>
				<!--  <input type="submit" value="送出"> -->

				<%
				List<String> loginErrors = (List<String>) request.getAttribute("errors");
				%>
				<div id="theErrorsDiv">
					<%=loginErrors != null ? loginErrors : ""%>
				</div>

				<button type="submit">送出</button>
			</form>
			<div class="link-wrapper">
				<a class="f-pwd">忘記密碼</a> <a id="toSignup" class="signup">註冊會員</a>
			</div>
		</div>
	</div>
</div>

<!-- login end -->
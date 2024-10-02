
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@page import="jojo.farmerpapa.entity.Customer"%>
<%@page pageEncoding="UTF-8"%>

<!-- register start -->
<div id="signupModal" class="modal">
	<div class="modal-content">
		<span id="closeSignup" class="close">&times;</span>
		<h1>會員註冊</h1>

		<div class="formContent">
			<form id="signupForm" action="<%= request.getContextPath()%>/register.do"
				method="post">
				<div class="form-detail">
					<div class="sign-row-title">
						<label><sup>*</sup>帳號：</label>
					</div>
					<div class="row-content">
						<input id="signupEmail" type="email" name="email" required placeholder="請輸入email">
					</div>
				</div>

				<div class="form-detail">
					<div class="sign-row-title">
						<label><sup>*</sup>密碼：</label>
					</div>
					<div class="row-content">
						<input id="signupPassword" type="password" name="password"
							required placeholder="請輸入密碼6~20字" minlength="6" maxlength="20">

						<img id="toggleSignupPwd"
							src="/fpapa/images/eye_slash_fill_icon.png" alt="顯示/隱藏密碼"
							style="cursor: pointer;">
					</div>
				</div>

				<div class="form-detail">
					<div class="sign-row-title">
						<label><sup>*</sup>手機號碼：</label>
					</div>
					<div class="row-content">
						<input type="tel" name="phone" required placeholder="請輸入手機號碼"
							pattern="[0][9][0-9]{8}">
					</div>
				</div>

				<div class="form-detail">
					<div class="sign-row-title">
						<label><sup>*</sup>姓名：</label>
					</div>
					<div class="row-content">
						<input type="text" name="name" required placeholder="請輸入姓名2~20字"
							minlength="2" maxlength="20">
					</div>
				</div>

				<div class="form-detail">
					<div class="sign-row-title">
						<label><sup>*</sup>生日：</label>
					</div>
					<div class="row-content">
						<input type="date" name="birthday" required
							max="<%= LocalDate.now().plusYears(-Customer.MIN_AGE)%>">
					</div>
				</div>

				<div class="form-detail">
					<div class="sign-row-title">
						<label><sup>*</sup>性別：</label>
					</div>
					<div class="row-content">
						<input id="theRadio" type="radio" name="gender" required
							value="<%= Customer.MALE%>"> <span>男</span> <input
							id="theRadio" type="radio" name="gender" required
							value="<%= Customer.FEMALE%>"> <span>女</span> <input
							id="theRadio" type="radio" name="gender" required
							value="<%= Customer.OTHERS%>"> <span>不願透漏</span>
					</div>
				</div>

				<div class="form-detail">
					<div class="sign-row-title">
						<label>地址：</label>
					</div>
					<div class="row-content">
						<textarea name="address" placeholder="請輸入地址(選填)" rows="2"
							cols="30"></textarea>
					</div>
				</div>

				<div class="form-detail">
					<div class="sign-row-title">
						<label><sup>*</sup>驗證碼：</label>
					</div>
					<div class="row-content">
						<input id="signupCaptcha" type="text" name="captcha" required placeholder="請輸入驗證碼">
						<img id="SignupCaptcha" class="captchaImg"
							src="/fpapa/images/captcha.png" onclick="refreshSignupCaptcha()"
							alt="驗證碼" title="點擊即可更新驗證碼">
					</div>
				</div>
				<!--  <input type="submit" value="送出"> -->

				<div class="form-detail">
					<div class="sign-row-title">
						<input id="theCheckbox" type="checkbox" name="subscribed">
					</div>
					<div class="row-content">
						<span>我願意訂閱電子報</span>
					</div>
				</div>

				<% 
					//List<String> signupErrors = (List<String>)request.getAttribute("errors"); 
				%>
				<div id="theErrorsDiv">
					<%--<%= signupErrors != null ? signupErrors : "" %>  --%>
					${requestScope.signupErrors}
				</div>

				<button type="submit">送出</button>
			</form>
			<div class="link-wrapper">
				<a id="toLogin" class="login-a">登入會員</a>

			</div>
		</div>
	</div>
</div>
<!-- register end -->
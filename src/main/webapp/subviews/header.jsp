<%@page import="java.time.LocalDate"%>
<%@page import="jojo.farmerpapa.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!-- header start -->
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="/fpapa/js/loginActions.js"></script>
		<script>
			$(init);
			
			function init(){
								
				<% if(request.getMethod().equals("POST")){ %>
				repopulateFormData();
	
			<%} %>
			}
			
			function repopulateFormData(){
				$("input[name=email]").val('<%=request.getParameter("email")%>');
				$("input[name=phone]").val('<%=request.getParameter("phone")%>');
				$("input[name=name]").val('<%=request.getParameter("name")%>');
				$("input[name=birthday]").val('<%=request.getParameter("birthday")%>');
				$("input[name=gender][value=<%=request.getParameter("gender")%>]").prop('checked', 'true');
				$("textarea[name=address]").text('<%=request.getParameter("address")%>');
				$("input[name=subscribed]").prop('checked', <%=request.getParameter("subscribed")!=null%>);
			}
		</script>
		
		<header>
			<div class="headerContent">
				
				<div class="menu">
					<a href="<%= request.getContextPath()%>/product_list.jsp">買果物</a>	<!-- ? 意思是產品列表預設為查詢全部產品或直接寫product_list.jsp -->
					<a href="<%= request.getContextPath()%>/news_list.jsp">最新情報</a>
					<a href="">常見問題</a>
				</div>
				
				<div class="logo">
					<h2><a href="<%= request.getContextPath()%>">FarmerPaPa </a>
						<%-- <sub><%= request.getParameter("subheader") == null ? "果物市集" : request.getParameter("subheader") %></sub> --%>
					</h2> 
				</div>
				
				<div class=headerActions>
					<div class="login-cart">
						<div class="login">
							<% request.setCharacterEncoding("utf-8"); %>
							<% 
					           Customer member = (Customer)session.getAttribute("memberLogin");	
					        %>
							<% if(member == null){ %>
							
							<span id="loginTrigger">
								會員登入/註冊
								<img alt="會員登入/註冊" src="/fpapa/images/user_circle_icon.png">
									<!--  <a href="/fpapa/register.jsp">會員註冊</a> -->	
							</span>
							
						<% 	}else{ %>
						  	
						  
							<!--<span>會員專區/登出</span> -->
							
							<a href="#">會員專區</a>
							<a href="<%= request.getContextPath()%>/logout.do">登出</a>
							
							<img alt="會員專區/登出" src="/fpapa/images/user_circle_icon.png">
							
						<% } %>
							
						<%-- <span class="welcomSpan"> <%= member != null ? member.getName() : "" %> 你好!</span> --%>					
						</div>
			
						<div id="loginModal" class="modal">
							<div class="modal-content">
								<span id="closeLogin" class="close">&times;</span>
	        					<h1>會員登入</h1>
										
								<div class="formContent">
									<form action="<%= request.getContextPath()%>/login.do" method="post">
										<div class="form-detail">
											<div class="sign-row-title">
												<label>帳號：</label>
											</div>
											<div class="row-content">
												<input type="email" name="email" required placeholder="請輸入email">					
											</div>
										</div>
												
										<div class="form-detail">
											<div class="sign-row-title">
												<label>密碼：</label>
											</div>
											<div class="row-content">
												<input id="loginPassword" type="password" name="password" required placeholder="請輸入密碼" minlength="6" maxlength="20">
													
												<img id="toggleLoginPwd" src="/fpapa/images/eye_slash_fill_icon.png" alt="顯示/隱藏密碼" style="cursor: pointer;">
											</div>				
										</div>
												
										<div class="form-detail">
											<div class="sign-row-title">
												<label>驗證碼：</label>
											</div>
											<div class="row-content">
												<input type="text" name="captcha" required placeholder="請輸入驗證碼">
												<img id="LoginCaptcha" class="captchaImg" src="/fpapa/images/captcha.png" onclick="refreshLoginCaptcha()" alt="驗證碼" title="點擊即可更新驗證碼">
											</div>
										</div>
										<!--  <input type="submit" value="送出"> -->
												
										<% 
											List<String> loginErrors = (List<String>)request.getAttribute("loginErrors"); 
										%>
										<div id="theErrorsDiv">
											<%= loginErrors != null ? loginErrors : "" %>
										</div>
												
										<button type="submit">送出</button>
									</form>
									<div class="link-wrapper">
										<a class="f-pwd">忘記密碼</a>
										<a id="toSignup" class="signup">註冊會員</a>
									</div>
								</div>
							</div>
						</div>
							
						<div id="signupModal" class="modal">
							<div class="modal-content">
								<span id="closeSignup" class="close">&times;</span>
	        					<h1>會員註冊</h1>
										
								<div class="formContent">
									<form action="<%= request.getContextPath()%>/register.do" method="post">
										<div class="form-detail">
											<div class="sign-row-title">
												<label>帳號：</label>
											</div>
											<div class="row-content">
												<input type="email" name="email" required placeholder="請輸入email">
												<span class="hint">必填</span>
											</div>
										</div>
												
										<div class="form-detail">
											<div class="sign-row-title">
												<label>密碼：</label>
											</div>
											<div class="row-content">
												<input id="signupPassword" type="password" name="password" required placeholder="請輸入密碼6~20字" minlength="6" maxlength="20">
													
												<img id="toggleSignupPwd" src="/fpapa/images/eye_slash_fill_icon.png" alt="顯示/隱藏密碼" style="cursor: pointer;">
												<span class="hint">必填</span>
											</div>
										</div>
											
										<div class="form-detail">
											<div class="sign-row-title">
												<label>手機號碼：</label>
											</div>
											<div class="row-content">
												<input type="tel" name="phone" required placeholder="請輸入手機號碼" pattern="[0][9][0-9]{8}">
												<span class="hint">必填</span>
											</div>
										</div>
											
										<div class="form-detail">
											<div class="sign-row-title">
												<label>姓名：</label>
											</div>
											<div class="row-content">
				               					<input type="text" name="name" required placeholder="請輸入姓名2~20字" minlength="2" maxlength="20">
												<span class="hint">必填</span>
											</div>
										</div>
											
										<div class="form-detail">
											<div class="sign-row-title">
												<label>生日：</label>
											</div>
											<div class="row-content">
			                					<input type="date" name="birthday" required max="<%= LocalDate.now().plusYears(-Customer.MIN_AGE)%>">
												<span class="hint">必填</span>
											</div>
										</div>
										
										<div class="form-detail">
											<div class="sign-row-title">
												<label>性別：</label>
											</div>
											<div class="row-content">
								                <input id="theRadio" type="radio" name="gender" required value="<%= Customer.MALE%>">
								                <span>男</span>
								                <input id="theRadio" type="radio" name="gender" required value="<%= Customer.FEMALE%>">
								                <span>女</span>
								                <input id="theRadio" type="radio" name="gender" required value="<%= Customer.OTHERS%>">
								                <span>不願透漏</span>
								            </div>
										</div>
										
										<div class="form-detail">
											<div class="sign-row-title">
												<label>地址：</label>
											</div>
											<div class="row-content">
			                					<textarea name="address" placeholder="請輸入地址(選填)" rows="2" cols="30"></textarea>
											</div>
										</div>
																			
										<div class="form-detail">
											<div class="sign-row-title">
												<label>驗證碼：</label>
											</div>
											<div class="row-content">
												<input type="text" name="captcha" required placeholder="請輸入驗證碼">
												<img id="SignupCaptcha" class="captchaImg" src="/fpapa/images/captcha.png" onclick="refreshSignupCaptcha()" alt="驗證碼" title="點擊即可更新驗證碼">
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
											List<String> signupErrors = (List<String>)request.getAttribute("signupErrors"); 
										%>
										<div id="theErrorsDiv">
											<%= signupErrors != null ? signupErrors : "" %>
										</div>
												
										<button type="submit">送出</button>
									</form>
									<div class="link-wrapper">											
										<a id="toLogin" class="login-a">登入會員</a>
										
									</div>
								</div>		
							</div>
						</div>
					
	
						<a class="cart-a" href="<%= request.getContextPath()%>/member/cart.jsp">
							<div class="cart">
								<span>(${sessionScope.cart.getTotalQuantity()!= null ? sessionScope.cart.totalQuantity : "0"})</span>								
								<img alt="購物車" src="/fpapa/images/cart_icon.png">
							</div>
						</a>
					</div>	
					
				<div class="searchContainer">
					<form class="searchForm" action="<%= request.getContextPath()%>/product_list.jsp" method="GET">
							
							<input class="keyword" type="search" name="keyword" required placeholder="請輸入關鍵字">
																
							<button type="submit" >
								<img class="subSearch" src="/fpapa/images/search_icon.png" alt="Submit">
							</button>
							
							
							<!-- <input class="subSearch" type="image" src="/fpapa/images/search_icon.png" alt="Submit">
						 	-->
					</form>
				</div>	
			</div>
			
		</div>	
	</header>
<!-- header end -->
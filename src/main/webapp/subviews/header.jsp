<%@page import="jojo.farmerpapa.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!-- header start -->
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="js/loginActions.js"></script>
				
		
		<header>
			<div class="headerContent">
				
				<div class="menu">
					<a href="product_list.jsp">買果物</a>	<!-- ? 意思是產品列表預設為查詢全部產品或直接寫product_list.jsp -->
					<a href="news_list.jsp">最新情報</a>
					<a href="">常見問題</a>
				</div>
				
				<div class="logo">
					<h2><a href="./">FarmerPaPa </a>
						<%-- <sub><%= request.getParameter("subheader") == null ? "果物市集" : request.getParameter("subheader") %></sub> --%>
					</h2> 
				</div>
				
				<div class=headerActions>
					<div class="login-cart">
						<div id="loginTrigger" class="login">
							<% 
					            Customer member = (Customer)session.getAttribute("memberLogin");	
					        %>
							<% if(member == null){ %>
							<span>會員登入/註冊</span>
							<img alt="會員登入/註冊" src="images/user_circle_icon.png">
								<!--  <a href="/fpapa/register.jsp">會員註冊</a> -->
						</div>
								
						<div id="loginModal" class="modal">
							<div class="modal-content">
								<span id="closeLogin" class="close">&times;</span>
	        					<h1>會員登入</h1>
										
								<div class="formContent">
									<form action="login.do" method="post">
										<div class="form-detail">
											<label>帳號：</label>
											<input type="email" name="email" required placeholder="請輸入email">
										</div>
												
										<div class="form-detail">
											<label>密碼：</label>
											<input id="loginPassword" type="password" name="password" required placeholder="請輸入密碼" minlength="2" maxlength="20">
												
											<img id="toggleLoginPwd" src="images/eye_slash_fill_icon.png" alt="顯示/隱藏密碼" style="cursor: pointer;">
												
										</div>
												
										<div class="form-detail">
											<label>驗證碼：</label>
											<input type="text" name="captcha" required placeholder="請輸入驗證碼">
											<img id="LoginCaptcha" src="images/captcha.png" onclick="refreshLoginCaptcha()" alt="驗證碼" title="點擊即可更新驗證碼">
										</div>
										<!--  <input type="submit" value="送出"> -->
												
										<% 
											List<String> errors = (List<String>)request.getAttribute("errors"); 
										%>
										<div id="theErrorsDiv">
											<%= errors != null ? errors : "" %>
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
									<form action="register.do" method="post">
										<div class="form-detail">
											<label>帳號：</label>
											<input type="email" name="email" required placeholder="請輸入email">
										</div>
												
										<div class="form-detail">
											<label>密碼：</label>
											<input id="signupPassword" type="password" name="password" required placeholder="請輸入密碼" minlength="2" maxlength="20">
												
											<img id="toggleSignupPwd" src="images/eye_slash_fill_icon.png" alt="顯示/隱藏密碼" style="cursor: pointer;">
										</div>
											
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
			                				<input type="date" name="birthday" required max="2012-09-19">
										</div>
										
										<div class="form-detail">
											<label>性別：</label>
							                <input id="theRadio" type="radio" name="gender" required value="M">
							                <span>男</span>
							                <input id="theRadio" type="radio" name="gender" required value="F">
							                <span>女</span>
							                <input id="theRadio" type="radio" name="gender" required value="O">
							                <span>不願透漏</span>
										</div>
										
										<div class="form-detail">
											<label>地址：</label>
			                				<textarea name="address" placeholder="請輸入地址(選填)" rows="2" cols="30"></textarea>
										</div>
																			
										<div class="form-detail">
											<label>驗證碼：</label>
											<input type="text" name="captcha" required placeholder="請輸入驗證碼">
											<img id="SignupCaptcha" src="images/captcha.png" onclick="refreshSignupCaptcha()" alt="驗證碼" title="點擊即可更新驗證碼">
										</div>
											<!--  <input type="submit" value="送出"> -->
											
										<div class="check-subscribed">
											<input id="theCheckbox" type="checkbox" name="subscribed">
											<span>我願意訂閱電子報</span>
										</div>
												
										<% 
											List<String> signupErrors = (List<String>)request.getAttribute("errors"); 
										%>
										<div id="theErrorsDiv">
											<%= signupErrors != null ? errors : "" %>
										</div>
												
										<button type="submit">送出</button>
									</form>
									<div class="link-wrapper">											
										<a id="toLogin" class="login-a">登入會員</a>
										
									</div>
								</div>		
							</div>
						</div>
								
								
						<% 	}else{ %>
							<a href="#">會員專區</a>
							<a href="/fpapa/logout.do">登出</a>
						<% } %>
							
						<%-- <span class="welcomSpan"> <%= member != null ? member.getName() : "" %> 你好!</span> --%>
						
					
					<a class="cart-a" href="">
						<div class="cart">
							<span>(0)</span>
							<img alt="購物車" src="images/cart_icon.png">
						</div>
					</a>
				</div>	
					
				<div class="searchContainer">
					<form class="searchForm" action="product_list.jsp" method="GET">
							
							<input class="keyword" type="search" name="keyword" required placeholder="請輸入關鍵字">
																
							<button type="submit" >
								<img class="subSearch" src="images/search_icon.png" alt="Submit">
							</button>
							
							
							<!-- <input class="subSearch" type="image" src="images/search_icon.png" alt="Submit">
						 	-->
					</form>
				</div>	
			</div>
			
		</div>	
	</header>
<!-- header end -->
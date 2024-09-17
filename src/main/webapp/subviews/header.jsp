<%@page import="jojo.farmerpapa.entity.Customer"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!-- header start -->
		<script type="text/javascript" src="js/jquery-3.7.1.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
		
		
		
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
						<div id="login" class="login">
							<% 
					            Customer member = (Customer)session.getAttribute("memberLogin");	
					        %>
							<% if(member == null){ %>
									<span>會員登入/註冊</span>
									<img alt="會員登入/註冊" src="images/user_circle_icon.png">
								<!--  <a href="/fpapa/register.jsp">會員註冊</a> -->
								
								<div id="loginModal" class="login-Popup">
									<div class="login-content">
										<span id="close" class="close">&times;</span>
	        							<h1>會員登入</h1>
										
										<div class="formContent">
											<form action="login.do" method="post">
												<div class="form-detail">
													<label>帳號：</label>
													<input type="email" name="email" required placeholder="請輸入email">
												</div>
												
												<div class="form-detail">
													<label>密碼：</label>
													<input id="thePassword" type="password" name="password" required placeholder="請輸入密碼" minlength="2" maxlength="20">
													<input id="theCheckbox" type="checkbox" onchange="displayPwd()"><label>顯示密碼</label>
												</div>
												
												<div class="form-detail">
													<label>驗證碼：</label>
													<input type="text" name="captcha" required placeholder="請輸入驗證碼">
													<img id="captchaImg" src="images/captcha.png" onclick="refreshCaptcha()" alt="驗證碼" title="點擊即可更新驗證碼">
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
										</div>
	        							
									</div>
									
								</div>
								
								
							<% 	}else{ %>
								<a href="#">會員專區</a>
								<a href="/fpapa/logout.do">登出</a>
							<% } %>
							
							<%-- <span class="welcomSpan"> <%= member != null ? member.getName() : "" %> 你好!</span> --%>
						</div>
					
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
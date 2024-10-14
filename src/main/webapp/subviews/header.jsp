
<%@page import="jojo.farmerpapa.entity.Customer"%>
<%@page pageEncoding="UTF-8"%>

<!-- header start -->
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="/fpapa/js/loginActions.js"></script>
		<script type="text/javascript" src="/fpapa/js/loginCheck.js"></script>
		<script>
			$(init);
			
			function init(){
								
				<% if(request.getMethod().equals("POST")){ %>
				repopulateFormData();
	
			<%} %>
			}
			
			function repopulateFormData(){
				$("input[name=email]").val('${param.email}');	//EL寫法
				$("input[name=phone]").val('${param.phone}');
				$("input[name=name]").val('${param.name}');
				$("input[name=birthday]").val('${param.birthday}');
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
					<a href="<%= request.getContextPath()%>/qa.jsp">常見問題</a>
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
					           Customer member = (Customer)session.getAttribute("member");	
					        %>
							<% if(member == null){ %>
							
							
							<span id="loginTrigger">
								會員登入/註冊
								<img alt="會員登入/註冊" src="/fpapa/images/user-profile.png">
									<!--  <a href="/fpapa/register.jsp">會員註冊</a> -->	
							</span>							
							
						<% 	}else{ %>
						  	
						  
							<!--<span>會員專區/登出</span> -->
							<div class="dropdown">
								<span>會員專區</span>
								<div class="for-member">
									<h4>會員專區</h4>
									<hr>
									<a href="<%= request.getContextPath()%>/member/update.jsp">修改會員資料</a>
									<a href="<%= request.getContextPath()%>/member/orders_history.jsp">查詢訂單</a>
									<a href="<%= request.getContextPath()%>/logout.do">登出</a>
								</div>
							</div>
							
							<img alt="會員專區/登出" src="/fpapa/images/user-profile.png">
							
						<% } %>
							
						<%-- <span class="welcomSpan"> <%= member != null ? member.getName() : "" %> 你好!</span> --%>					
						</div>
			
						<%@include file="login_lightbox.jsp" %>
							
						<%@include file="register_lightbox.jsp" %>
					
	
						<a id="login-check" class="cart-a" href="<%= request.getContextPath()%>/member/cart.jsp">
							<div class="cart">
								(<span class="totalQtySpan">${sessionScope.cart.getTotalQuantity()+0}</span>)  <%--EL寫法:null會顯示空字串,且沒有字串相加, 所以null就會顯示0 --%>							
								<img alt="購物車" src="/fpapa/images/basket.png">
							</div>
						</a>
					</div>	
					
				<div class="searchContainer">
					<form class="searchForm" action="<%= request.getContextPath()%>/product_list.jsp" method="GET">
							
							<input class="keyword" type="search" name="keyword" required placeholder="請輸入關鍵字" 
													value="${param.keyword}">
																
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
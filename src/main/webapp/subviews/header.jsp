<%@page import="jojo.farmerpapa.entity.Customer"%>
<%@page pageEncoding="UTF-8"%>

<!-- header start -->
		<header>
			<div class="headerContent">
				
				<div class="menu">
					<% 
			            Customer member = (Customer)session.getAttribute("memberLogin");	
			        %>
					
					<a href="product_list.jsp">買果物</a>	<!-- ? 意思是產品列表預設為查詢全部產品或直接寫product_list.jsp -->
					<a href="news_list.jsp">最新情報</a>
					<!-- 
					<a href="">當季主打</a>
					<a href="">禮盒專區</a>
					<a href="">常見問題</a>
					 -->
					<% if(member == null){ %>
						<a href="/fpapa/login.jsp">會員登入</a>
						<a href="/fpapa/register.jsp">會員註冊</a>
					<% 	}else{ %>
						<a href="#">會員專區</a>
						<a href="/fpapa/logout.do">登出</a>
					<% } %>
					
					<%-- <span class="welcomSpan"> <%= member != null ? member.getName() : "" %> 你好!</span> --%>
				</div>
				
				<div class="logo">
					<h2><a href="./">FarmerPaPa </a>
						<%-- <sub><%= request.getParameter("subheader") == null ? "果物市集" : request.getParameter("subheader") %></sub> --%>
					</h2> 
				</div>
				
				<div class=headerActions>
					<a class="cartButton" href="">
						<img alt="購物車" src="images/cart_icon.png">
					</a>
					
					<form class="searchForm" action="product_list.jsp" method="GET">
						<div class="searchContainer">
							<input class="keyword" type="search" name="keyword" required placeholder="請輸入關鍵字">
							
							
							<button type="submit" >
								<img class="subSearch" src="images/search_icon.png" alt="Submit">
							</button>
						
						
							<!-- <input class="subSearch" type="image" src="images/search_icon.png" alt="Submit">
						 	-->
						</div>
					</form>
				</div>
			
			</div>	
		</header>
<!-- header end -->
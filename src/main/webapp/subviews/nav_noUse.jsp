<%@page import="jojo.farmerpapa.entity.Customer"%>
<%@page pageEncoding="UTF-8"%>

<!-- nav start -->
		<nav>
			<% 
	            Customer member = (Customer)session.getAttribute("member");	
	        %>
			
			<a href="product_list.jsp">買果物 | </a>	<!-- ? 意思是產品列表預設為查詢全部產品或直接寫product_list.jsp -->
			<a href="">最新活動 | </a>
			<a href="">當季主打 | </a>
			<a href="">禮盒專區 | </a>
			<a href="">常見問題 | </a>
			
			<% if(member == null){ %>
				<a href="/fpapa/login.jsp">會員登入 | </a>
				<a href="/fpapa/register.jsp">會員註冊</a>
			<% 	}else{ %>
				<a href="#">會員專區 | </a>
				<a href="/fpapa/logout.do">登出</a>
			<% } %>
			
			<span class="welcomSpan"> <%= member != null ? member.getName() : "" %> 你好!</span>
			<hr>
		</nav>
<!-- nav end -->
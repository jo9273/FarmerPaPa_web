
<%@page pageEncoding="UTF-8"%>

<!-- header start -->
		<header>
			<h2><a href="./">FarmerPaPa </a>
				<sub><%= request.getParameter("subheader") == null ? "果物市集" : request.getParameter("subheader") %></sub>
			</h2> 
			
			<form action="product_list.jsp" method="GET">
				<input type="search" name="keyword" required placeholder="請輸入關鍵字">
				<input type="submit" value="查詢">
			</form>
			<hr>
		</header>
<!-- header end -->
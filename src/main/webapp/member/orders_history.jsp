<%@page import="jojo.farmerpapa.entity.Order"%>
<%@page import="jojo.farmerpapa.service.OrderService"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>insert title here</title>
				
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/header.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/order.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/footer.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
    	
    	<script></script>
        
    	<style></style>

	</head>
	<body>
	
		<%@include file="../subviews/header.jsp" %>
		<div class="pageContent">
			<div class="order-content">
				<div class="topInfoWrapper">
					<h1 class="topTitle">查詢訂單</h1>
					<div class="filterWrapper">
						<form method="get" action="orders_history.jsp">
							<div class="filterSelectWrapper">
								<label>查詢訂單</label>
								<input type="radio" value="1" name="range" required checked><label>1個月</label>
								<input type="radio" value="2" name="range" required checked><label>2個月</label>
								<input type="radio" value="6" name="range" required checked><label>6個月</label>
								<input type="radio" value="24" name="range" required checked><label>1年</label>
								<input class="search-time-btn" type="submit" value="查詢訂單">
							</div>
						</form>
					</div>
				</div>
				<%
					String range = request.getParameter("range");
					if(range == null || range.length()==0) 
						range = "1";
					
					//Customer member = (Customer)session.getAttribute("member");  //已經在header.jsp子網頁宣告過
					
					List<Order> list = null;
					OrderService oService = new OrderService();
					list = oService.getOrdersHistory(member);
				
				%>
				<%
					if(list == null || list.isEmpty()){
				%>
					<div class="noData">
						<h2>查無歷史訂單</h2>
						<img src="../images/no_data.png">
					</div>
				<%	}else{ %>
				
				<%--for測試畫面印出list內容 <%=list %> --%>
				<div class="orderInfoList">
					<ul type=none>
						<h3>歷史訂單</h3>
						<%for(Order order:list){ %>
						<li>
							<div>訂單編號:<%=order.getId()%></div>
							<div>訂單日期:<%=order.getCreatedDate()%></div>
							<div>訂單狀態:<%=order.getStatus()%></div>
							<div>運送方式:<%=order.getShippingType()%></div>
							<div>付款方式:<%=order.getPaymentType()%></div>
							<div>訂單金額:<%=order.getTotalAmount()%></div>
							<div>運費:<%=order.getShippingFee()%></div>
							<div>訂單總金額(含手續費):<%=order.getTotalAmountWithFee()%></div>
							<a href="order.jsp?orderId=<%=order.getId()%>">檢視明細</a>
						</li>
						<%} %>
					</ul>
				</div>
				<%} %>
				

			</div>
		</div>
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
<%@page import="jojo.farmerpapa.entity.OrderStatusLog"%>
<%@page import="jojo.farmerpapa.entity.PaymentType"%>
<%@page import="jojo.farmerpapa.entity.OrderItem"%>
<%@page import="java.util.Set"%>
<%@page import="jojo.farmerpapa.entity.Order"%>
<%@page import="jojo.farmerpapa.service.OrderService"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>FarmerPaPa 查詢訂單</title>
				
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/header.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/order.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/cart.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/footer.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
    	
    	<script></script>
        
    	<style></style>

	</head>
	<body>
	
		<%@include file="../subviews/header.jsp" %>
		<div class="pageContent">
			<div class="order-content">
				
				<%
					String orderId = request.getParameter("orderId");
					Order order = null;
					
					List<OrderStatusLog> statusLogList = null;
					OrderService oService = new OrderService();
					
					if(member!=null && orderId!=null){
						order = oService.getOrderById(member, orderId); 
						
						if(order!=null){
							statusLogList = oService.getOrderStatusLog(orderId);
						}
					}
						
				%>
				
				<%if(order == null){ %>
					<div class="noData">
						<h2>查無歷史訂單</h2>
						<img src="../images/no_data.png">
					</div>
				<%}else{ %>
					<div class = "breadCrumbs">
						<ul>
							<li>
								<a href="../">首頁</a>
							</li>
							<li>
								>
							</li>
							<li>
								<a href="orders_history.jsp">歷史訂單</a>
							</li>
							<li>
								>
							</li>
							<li>
								訂單編號：<%=order.getId()%>
							</li>
						</ul>
					</div>
				
					<div class="orderInfoList">
						<table class="cartDetails">
							<caption>訂單資訊</caption>
							
							<thead>
								<tr class="table-header">
									<td>訂單編號</td>
									<td>訂單時間</td>
									<td>訂單狀態</td>
									<td>運送方式</td>
									<td>訂單總金額</td>
								</tr>
							</thead>
							<tbody>
								<tr class="table-detail">
									<td>
										<div><%=order.getId()%></div>
									</td>
									<td>
										<div><%=order.getCreatedDate()%></div>
										<div><%=order.getCreatedTime()%></div>
									</td>
									<td>
										<div><%=order.getStatusDescription()%></div>
										
										<!-- 通知轉帳 -->
										<% if(order.getStatus() == 0 && order.getPaymentType() == PaymentType.ATM){ %>
										<a href='atm_transfered.jsp?orderId=<%= order.getId()%>'>已轉帳通知</a>
										<%} %>
										
									</td>
									<td>
										<div><%=order.getShippingType().getDescription()%></div>
									</td>
									<td>
										<div>$<%=order.getTotalAmountWithFee()%></div>
										<div class="order-payment-type"><%=order.getPaymentType()%></div>
									</td>
							</tbody>
						</table>
						
						<table class="cartDetails">
							<caption>購物明細</caption>
							<thead>
								<tr class="table-header">
									<td>產品</td>
									<td>單價</td>
									<td>數量</td>
									<td>小計</td>
											
								</tr>
							</thead>
							<tbody>
									
							<%
								Set<OrderItem> itemSet = order.getOrderItemSet();
								for(OrderItem item : itemSet){	
							%>
										
								<tr class="table-detail">
									<td class="order-products">
										<div class="product-photo">
											<img src="<%= item.getProductPhotoUrl() %>">
										</div>
										<div class="product-info">
											<span class="product-id">產品編號：<%= item.getProductId() %></span>									
											<span class="product-name"><%= item.getProductName() %></span>
												<%= !item.getSpecName().isEmpty() ? "<span>規格：" + item.getSpecName() + "</span>" : "" %>	
												<%= !item.getSpecGrade().isEmpty()? "<span>等級：" + item.getSpecGrade() + "</span>" : "" %>
										</div>
									</td>
										<td class="order-price">
											<span>產品售價： <%= item.getPrice() %>元</span>
									</td>
											
									<td>
										<div class="qty">
											<span class="qty-value">
											<%= item.getQuantity() %>
											</span>
										</div>
									</td>
									<td>
										<%= item.getAmount() %>元
									</td>
								</tr>
										
								<% } %>
										
							</tbody>
							<tfoot>
								<tr class="table-count">
									<td colspan="3">品項數量：<%= order.size() %>項</td>
									<td colspan="4">品項件數：<%= order.getTotalQuantity() %>件</td>
								</tr>
								<tr class="table-count">
									<td colspan="5">產品總金額：<span id="totalAmount"><%= order.getTotalAmount() %></span>元</td>
								</tr>
								
								<%if(order.isFreeShipping()){ %>
									<tr class="table-count" id="free-shipping-row">
										<td colspan="5">免運費</td>
									</tr>
								<%}else{ %>
								<tr class="table-count">
									<td colspan="5">運費：
										<span id="shippingFee"><%=order.getShippingFee()%></span>元
									</td>
								</tr>
								<%} %>
								
								<tr class="table-count">
									<td colspan="5" class="totalAmountWithFee-tr">訂單總金額：
										<span id="totalAmountWithFee-tr"><%= order.getTotalAmountWithFee()%></span>元
									</td>
								</tr>
							</tfoot>	
						</table>
					
					
					</div>
				<%} %>
		
			</div>
		</div>
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
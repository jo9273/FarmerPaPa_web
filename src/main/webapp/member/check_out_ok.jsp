<%@page import="jojo.farmerpapa.service.OrderService"%>
<%@page import="jojo.farmerpapa.entity.Order"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>購買完成</title>
				
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/header.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/cart.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/footer.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
    	<script type="text/javascript" src="/fpapa/js/loginCheck.js"></script>
    	<script></script>
        
    	<style></style>

	</head>
	<body>
	
		<%@include file="../subviews/header.jsp" %>
		<div class="pageContent">
			<div class="cart-content">
				<h2>購物車</h2>
				
				<ul class="steps">
					<li class="step">
						<span class="step-index">1</span>
						<p class="step-title">確認購物車</p>
					</li>
					
					<li class="step">
						<span class="step-index">2</span>
						<p class="step-title">確認收件與付款資料</p>
					</li>
					
					<li class="step-active">
						<span class="step-index">3</span>
						<p class="step-title">購買完成</p>
					</li>
				</ul>
				
				<div class="check-out-ok">
					<h2>購買完成, 訂單已成立</h2>
					<span>訂單編號：${order.id}</span>
					<img alt="order completed" src="../images/order-confirmed.png">
					<input class="orders-history-btn" type="button" value="歷史訂單" onclick='location.href="orders_history.jsp";'>
					<input class="check-order-btn" type="button" value="檢視訂單" onclick='location.href="order.jsp?orderId=${order.id}";'>
					
				</div>
				
				
									
		
			</div>
		</div>
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
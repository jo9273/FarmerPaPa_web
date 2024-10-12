<%@page import="jojo.farmerpapa.entity.Order"%>
<%@page import="jojo.farmerpapa.service.OrderService"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>查詢訂單</title>
				
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/header.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/order.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/cart.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/footer.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
    	
    	<script>
    	$(document).ready(init);
    	
    	function init(){
    		selectTimeHandler();
    	}
    	function selectTimeHandler(){
    		 // 取得 URL 中的 range 參數，沒有則預設為 '1'
            var urlParams = new URLSearchParams(window.location.search);
            var range = urlParams.get('range') || '1';

            // 選中對應的 radio button
            $('input[name="range"][value="' + range + '"]').prop('checked', true);
        
    	}
    	
    	
    	</script>
        

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
								<input type="radio" value="2" name="range" required><label>2個月</label>
								<input type="radio" value="6" name="range" required><label>6個月</label>
								<input type="radio" value="12" name="range" required><label>1年</label>
								<input class="search-time-btn" type="submit" value="查詢訂單">
							</div>
						</form>
					</div>
				</div>
				<%
					String range = request.getParameter("range");
					if(range == null || range.length()==0) 
						range = "1";
					
					int rangeInMonths = Integer.parseInt(range);
					
					//Customer member = (Customer)session.getAttribute("member");  //已經在header.jsp子網頁宣告過
					
					List<Order> list = null;
					OrderService oService = new OrderService();
					list = oService.getOrdersHistory(member, rangeInMonths);
				
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
				
					<table class="cartDetails">
						<caption>歷史訂單</caption>
						
						<thead>
							<tr class="table-header">
								<td>訂單編號</td>
								<td>訂單日期</td>
								<td>訂單狀態</td>
								<td>運送方式</td>
								<td>訂單總金額</td>
								<td>檢視明細</td>
							</tr>
						</thead>
						<tbody>
							<%for(Order order:list){ %>	
							
							<tr class="table-detail">
								<td>
									<div><%=order.getId()%></div>
								</td>
								<td>
									<div><%=order.getCreatedDate()%></div>
								</td>
								<td>
									<div><%=order.getStatusDescription()%></div>
								</td>
								<td>
									<div><%=order.getShippingType().getDescription()%></div>
								</td>
								<td>
									<div>$<%=order.getTotalAmountWithFee()%></div>
									<div class="order-payment-type"><%=order.getPaymentType()%></div>
								</td>
								<td>
									<input class="order-detail-btn" type="button" value="檢視訂單"
											onclick='location.href="order.jsp?orderId=${order.id}";'>
								</td>
							<%} %>
						</tbody>
					</table>
						
				</div>
				<%} %>
				

			</div>
		</div>
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
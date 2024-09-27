<%@page import="java.util.Set"%>
<%@page import="jojo.farmerpapa.entity.ShoppingCart"%>
<%@page import="jojo.farmerpapa.entity.CartItem"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>FarmerPaPa 購物車</title>
				
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/header.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/footer.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
    	
    	<script></script>
        
    	<style>
    	
    		.cartDetails {
    			border-collapse: collapse;
    			width: 85%;margin: auto;
			}
			
			
			.cartDetails td, .cartDetails th {
			 	border: 1px solid #ddd;
			  	padding: 8px;
			}
			
			.cartDetails tr:nth-child(even){
				background-color: #f2f2f2;}
			
			.cartDetails tr:hover {
				background-color: #ddd;}
			
			.cartDetails caption {
			  	padding-top: 12px;
			  	padding-bottom: 12px;		  
			  	background-color: #04AA6D;
			  	color: white;
			}
			
			.table-header{
				font-weight: bold;
				text-align: center;
				
			}
    		
    		.table-detail{
    			text-align: center;
    		}
    		
    		.order-products, .order-price{
    			text-align: left; 
    		}
    		
    		.order-products img{
    			width: 150px;
    			float: left;
    			margin-right: 15px;
    		}
    		
    		.order-products span, .order-price span{
    			display: block;
    			margin-bottom: 5px;
    		}
    		
    		    		
    	
    	</style>

	</head>
	<body>
	
		<%@include file="../subviews/header.jsp" %>
		<div class="pageContent">
			
			<%-- <p> ${sessionScope.cart} </p> --%>
			
			<%
				//"cart" 名稱要對應到servlet的setAttribute "cart"
				ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");  
				if(cart == null || cart.isEmpty()){
			%>
			
			<h2>購物車是空的</h2>
			
			<% }else{ %>
			
			<table class="cartDetails">
				<caption>購物明細</caption>
				<thead>
					<tr class="table-header">
						<td>產品編號</td>
						<td>產品名稱/規格/等級</td>
						<td>售價/折扣/優惠售價</td>
						<td>數量</td>
						<td>小計</td>
						<td>刪除</td>
					</tr>
				</thead>
				<tbody>
				
					<%
						Set<CartItem> itemSet = cart.getCartItemsSet();
						for(CartItem item:itemSet){	
					%>
					
					<tr class="table-detail">
						<td><%= item.getProductId() %></td>
						<td class="order-products">
							<img src="<%= item.getPhotoUrl() %>">
							<span>產品名稱:<%= item.getProductName() %></span>
							<span>規格:<%= item.getSpecName() %></span>
							<span>等級:<%= item.getSpecGrade() %></span>
						</td>
						<td class="order-price">
							<span>售價:<%= item.getListPrice() %></span>
							<span>折扣:<%= item.getDiscountString() %></span>
							<span>優惠售價: <%= item.getPrice() %>元</span>
						</td>
						<td><%= cart.getQuantity(item) %></td>
						<td><%= cart.getAmount(item) %></td>
						<td>不刪除</td>
					</tr>
					
					<% } %>
					
				</tbody>
				<tfoot>
					<tr class="table-count">
						<td>品項數量:<%= cart.size() %>項</td>
						<td>品項件數:<%= cart.getTotalQuantity() %>件</td>
						<td>商品總金額:<%= cart.getTotalAmount() %>元</td>
					</tr>
				</tfoot>
			</table>
			
			<% } %>
		
		
		</div>
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
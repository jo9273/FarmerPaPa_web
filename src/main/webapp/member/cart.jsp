<%@page import="jojo.farmerpapa.entity.SpecialOffer"%>
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
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/cart.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/footer.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
    	
    	<script>
	    	$(document).ready(init);
	    	
	    	function init() {
	    		 // 初始化頁面時檢查每個數量
	    	    $(".qty-value").each(function() {
	    	        var $qtyElement = $(this); // 獲取當下的數量元素
	    	        var currentQty = parseInt($qtyElement.text()); // 當下的數量
	    	        var $minusButton = $qtyElement.siblings(".qty-minus"); // get minus button
	    	       
	    	        // 如果當下數量為1，minus button disabled
	    	        if (currentQty === 1) {
	    	        	$minusButton.prop("disabled", true);
	    	        }
	    	    });
	    		 
				//綁定 minus, plus button
	            $(".qty-minus").on("click", minusQtyHandler);
	    	    $(".qty-plus").on("click", plusQtyHandler);
	    	    
	    	}
	
	    	function minusQtyHandler(e) {
	    		e.preventDefault();
	    	    var $qtyElement = $(this).siblings(".qty-value"); // 獲取數量顯示元素
	    	    var currentQty = parseInt($qtyElement.text()); // 當下的數量
	    	    var $inputElement = $(this).siblings("input[type=hidden]");
	
	    	    if (currentQty > 1) {
	    	    	$qtyElement.text(currentQty - 1); // 減少數量
	    	    	$inputElement.val(currentQty - 1); // 更新隱藏 input 的值

	    	        if (currentQty - 1 === 1) {
	    	            $(this).prop("disabled", true); // 當數量為 1，禁用減號按鈕
	    	        }
	    	    }
	    	}
	
	    	function plusQtyHandler(e) {
	    		e.preventDefault();
	    	    var $qtyElement = $(this).siblings(".qty-value"); // 獲取數量顯示元素
	    	    var currentQty = parseInt($qtyElement.text()); // 當前數量
	    	    var maxQty = parseInt($qtyElement.data("max")); // 最大庫存數量
	    	    var $inputElement = $(this).siblings("input[type=hidden]"); // 獲取隱藏的 input

	    	    
	    	    if (currentQty < maxQty) {
	    	    	$qtyElement.text(currentQty + 1); // 如果數量小於最大庫存，增加數量
	    	        $inputElement.val(currentQty + 1); // 更新隱藏 input 的值

	    	    	// 當數量大於 1，啟用減號按鈕
	    	        $(this).siblings(".qty-minus").prop("disabled", false);
	    	    }
	    	}

    	
    	</script>
        
	</head>
	<body>
	
		<%@include file="../subviews/header.jsp" %>
		<div class="pageContent">
			<div class="cart-content">
				<%-- <p> ${sessionScope.cart} </p> --%>
				
				<%
					//"cart" 名稱要對應到servlet的setAttribute "cart"
					ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");  
					if(cart == null || cart.isEmpty()){
				%>
			
				<div class="cart-empty">
					<h2>購物車空空的</h2>
					<img alt="empty" src="../images/cart-empty.png">
					<a class="empty-a" href="<%= request.getContextPath()%>/product_list.jsp">前往購物</a>
				
				</div>
				<% }else{ %>
				
				<h2>購物車</h2>
				
				<ul class="steps">
					<li class="step-active">
						<span class="step-index">1</span>
						<p class="step-title">確認購物車</p>
					</li>
					
					<li class="step">
						<span class="step-index">2</span>
						<p class="step-title">填寫收件資料</p>
					</li>
					
					<li class="step">
						<span class="step-index">3</span>
						<p class="step-title">確認付款方式</p>
					</li>
					
					<li class="step">
						<span class="step-index">4</span>
						<p class="step-title">購買完成</p>
					</li>
				</ul>
				
				<form action="<%= request.getContextPath()%>/member/update_cart.do" method="POST">
					<table class="cartDetails">
						<caption>購物明細</caption>
						<thead>
							<tr class="table-header">
								<td>產品</td>
								<td>單價</td>
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
								<td class="order-products">
									<div class="product-photo">
										<img src="<%= item.getPhotoUrl() %>">
									</div>
									<div class="product-info">
										<span class="product-id">產品編號：<%= item.getProductId() %></span>									
										<span class="product-name"><%= item.getProductName() %></span>
										<%= !item.getSpecName().isEmpty() ? "<span>規格：" + item.getSpecName() + "</span>" : "" %>	
										<%= !item.getSpecGrade().isEmpty()? "<span>等級：" + item.getSpecGrade() + "</span>" : "" %>
									</div>
								</td>
								<td class="order-price">
									<% if(item.getTheProduct() instanceof SpecialOffer){ %>
										<span class="u-price-st">售價：<%= item.getListPrice() %>元</span>
										<span>折扣：<%= item.getDiscountString() %></span>
										<span>優惠售價： <%= item.getPrice() %>元</span>
									<%}else{ %>
										<span>優惠售價: <%= item.getPrice() %>元</span>
									<%} %>
								</td>
								
								<td>
									<div class="qty">
										<button class="qty-minus" type="button">
											<img alt="minus" src="../images/minus.png">
										</button>
										<span class="qty-value" data-max="<%= item.getStock()%>">
											<%= cart.getQuantity(item) %>
										</span>
										<!-- 用來提交的隱藏數量輸入框，當數量改變時，value 會被同步更新 -->
										<input type="hidden" name="quantity<%=item.hashCode()%>" 
											max="<%= item.getStock()%>" 
											value="<%= cart.getQuantity(item) %>" required>
										
										<button class="qty-plus" type="button">
											<img alt="plus" src="../images/plus.png">
										</button>	
									</div>
									<div class="product-stock">
										<span class="stock">剩餘庫存：<%= item.getStock() %> </span>
									</div>
								</td>
								
								<td><%= cart.getAmount(item) %>元</td>
																
								<td>
									<input type="checkbox" name="delete<%=item.hashCode()%>">
								</td>	
							</tr>
							
							<% } %>
							
						</tbody>
						<tfoot>
							<tr class="table-count">
								<td colspan="3">品項數量：<%= cart.size() %>項</td>
								<td colspan="4">品項件數：<%= cart.getTotalQuantity() %>件</td>
							</tr>
							<tr class="table-count">
								<td colspan="5">產品總金額：<%= cart.getTotalAmount() %>元</td>
							</tr>
						</tfoot>	
					</table>
					<div class="cartAction">	
						<input class="update-btn" type="submit" value="修改購物車">
						<input class="gotoshop-btn" type="button" value="再逛一下" onclick="location.href='../product_list.jsp';">		
						<input class="checkout-btn" type="button" value="我要結帳" onclick="location.href='check_out.jsp';">
					</div>				
				</form>
				<% } %>
			
			</div>
		</div>
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
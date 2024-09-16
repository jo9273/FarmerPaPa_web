<%@page import="jojo.farmerpapa.entity.SpecialOffer"%>
<%@page import="jojo.farmerpapa.service.ProductService"%>
<%@page import="jojo.farmerpapa.entity.Product"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>product detail</title>
		<link rel="stylesheet" type="text/css" href="/fpapa/style/header.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/product_detail.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">

    	<script>
    	</script>
        
    	<style>

    	</style>

	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
		
		<%@include file="./subviews/header.jsp" %>
		
		<div class="pageContent">
			<%	// 取得request中的queryString
				String productId = request.getParameter("productId");
				Product p = null;
				
				ProductService pService = new ProductService();
				if(productId != null && (productId = productId.trim()).length()>0){
					p = pService.getProductById(productId);
				}
			%>
			<%
				// 查無資料
				if(p == null){
			%>	
					<div class="noData">
						<h2>查無產品資料</h2>
						<img src="images/no_data.png">
					</div>	
			<%
				}else{
			%>
		
			<div class = "breadCrumbs">
				<ul>
					<li>
						<a href="./">首頁</a>
					</li>
					<li>
						>
					</li>
					<li>
						<a href="product_list.jsp">買果物</a>
					</li>
					<li>
						>
					</li>
					<li>
						<%= p.getName()%>
					</li>
				</ul>
			</div>
			
			
			

			<div class="detailContent">		<!-- product_detail -->
				<img src="<%= p.getPhotoUrl()%>">
				<h3><%= p.getName()%></h3>
				
				<% if (p instanceof SpecialOffer){ %>
				<div>售價: <%= ((SpecialOffer)p).getListPrice() %> 元</div>
				<% } %>
				
				<div>優惠折扣:<%= p instanceof SpecialOffer ? ((SpecialOffer)p).getDiscountString():"" %> <%= p.getUnitPrice() %> 元</div>
				<div>分類: <%= p.getCategory() %></div>
				<div>庫存: <%= p.getStock() %></div>
				<div>上架日: <%= p.getReleaseDate() %></div>
				<form>
					<input type="hidden" name="productId" value="1">
					<div>
						<label>數量:</label>
						<input type="number" name="quantity" required  min="1" max="3">
						
					</div>
					<div>
						<input type="submit" value="加入購物車">
					</div>
				</form>
				
				<div class="productDesc">
					<p><%= p.getDescription() %></p>
				</div>

			</div>
			
			<%
				}
			%>
			
		</div>
		
		<%@include file="./subviews/footer.jsp" %>
		
	</body>
</html>
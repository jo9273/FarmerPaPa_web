<%@page import="jojo.farmerpapa.entity.ProductSpec"%>
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
		
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
    	
    	<script>
    		
    		$(document).ready(init);

    		function init() {
    			$(".spec img").on("click", changeSpecDate);
    		}
    	
    		function changeSpecDate() {
				
    			var photoUrl = $(this).attr("data-photo-src");
				var stock = $(this).attr("data-stock");
				var releaseDate = $(this).attr("data-release-data");
				var unitPrice = $(this).attr("data-unit-price");
    			//var specialOffer = $(this).attr("data-special-offer");
    			//var specialOfferPrice = $(this).attr("data-special-offer-price");
    			
    			//alert(stock);
    			//alert("change:" + $(this).attr("title"));
				//console.log("change" + $(this).attr("title"), $(this).attr("data-stock"));
				
				//修改畫面中指定位置的資料
				
    			$("#thePhoto").attr("src", photoUrl);
    			$("#theStock").text(stock);
				$("#theReleaseDate").text(releaseDate);
				$("#theUnitPrice").text(unitPrice);
				//$("#theSpecialOffer").text(specialOffer);
				//$("#theSpecialOfferPrice").text(specialOfferPrice);
				$("input[name=quantity]").attr("max", stock);
	
			}
    		
    	</script>
        
    	<style>
			/* HIDE RADIO */
			.spec input[type=radio] { 
			  position: absolute;
			  opacity: 0;
			  width: 1px;
			  height: 1px;
			}
			
			/* IMAGE STYLES */
			.spec input[type=radio] + img {
			  cursor: pointer;
			}
			
			/* CHECKED STYLES */
			.spec input[type=radio]:checked + img {
			  outline: 3px solid #d95834;
			}
			
			.spec img{
				width: 80px;
				margin-right: 10px;
				vertical-align: middle;
			}
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
			
			
			

			<div class="product-content">		<!-- product_detail -->
				<div class="product-detail">
					<div class="product-photo">
						<img id="thePhoto" src="<%= p.getPhotoUrl()%>">
					</div>
					
					<div class="product-info">
						<h2><%= p.getName()%></h2>
						
						
						<% if (p instanceof SpecialOffer){ %> 
<%-- 						<div>售價: <span id="theUnitPrice"><%= ((SpecialOffer)p).getListPrice() %> </span>元</div> --%>
												
						<div>優惠售價: <%= p.getUnitPrice() %> 元</div>
						<div>優惠折扣: <%= ((SpecialOffer)p).getDiscountString()%> </div>
						
						<% } else{%> 
						
						<div>
							售價: <span id="theUnitPrice"><%= p.getUnitPrice() %></span> 元
						</div>
						<%} %>	
											
						<div>分類: <%= p.getCategory() %></div>
						<div>庫存: <span id="theStock"><%= p.getStock() %> </span></div>
						<div>上架日:<span id="theReleaseDate"> <%= p.getReleaseDate() %></span></div>
						<div>
							<form>
								<input type="hidden" name="productId" value="<%= p.getId()%>">
								
								<% if(p.getSpecList() != null && p.getSpecList().size()>0){%>
									<div class="spec">
										<label>規格:</label>
										<% for(int i = 0 ; i < p.getSpecList().size() ; i++){ 
												ProductSpec spec = p.getSpecList().get(i);
										%>
											<label>
												<input type="radio" name="spec" value="<%=spec.getSpecName() %>" required>
												<img title="<%=spec.getSpecName() %>" alt="<%=spec.getSpecName() %>" src="<%= spec.getIconUrl() %>"
														data-photo-src="<%= spec.getPhotoUrl() %>" 
														data-release-data="<%=spec.getReleaseDate() %>" 
														data-stock="<%=spec.getStock() %>" 
														data-unit-price="<%=spec.getUnitPrice() %>">
														<!-- 
														data-special-offer=""
														data-special-offer-price="">
														 -->
											</label>
										<% } %>							
									</div>
								<% } %>
								
								<div>
									<label>數量:</label>
									<input type="number" name="quantity" required  min="1" max="3">
									
								</div>
								<div>
									<input type="submit" value="加入購物車">
								</div>
							</form>
						</div>
					</div>
				</div>
						
				<div class="product-desc">
						<p><%= p.getDescription() %></p>
				</div>
	
				
				<% } %>
			
		</div>
		
		<%@include file="./subviews/footer.jsp" %>
		
	</body>
</html>
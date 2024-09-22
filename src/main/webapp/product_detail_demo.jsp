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

    		function init(){
    			$(".spec img").on("click", changeSpecDate);
    			$("select[name=delivery-date]").on("change", changeDeliveryDate);
    			
    			// 預選第一個
    			//$("input[name=spec]:first").attr("checked", true);
    			
    			$(".iconImg:first").trigger("click");
    			$("#delivery-date").val($("#delivery-date option:first").val()).trigger("change");
    			
    			// 預設打開第一個頁籤
    			$(".tab-button").on("click", tabClickHandler);
    			openTabById('product-desc'); 
    		}
    	
    		function changeSpecDate(){
    			var specialOfferPrice = $(this).attr("data-special-offer-price");
    			var photoUrl = $(this).attr("data-photo-src");
				var stock = $(this).attr("data-stock");
				var releaseDate = $(this).attr("data-release-data");
				var unitPrice = $(this).attr("data-unit-price");
    			//var specialOffer = $(this).attr("data-special-offer");
    			
    			
    			//alert(stock);
    			//alert("change:" + $(this).attr("title"));
				//console.log("change" + $(this).attr("title"), $(this).attr("data-stock"));
				
				//修改畫面中指定位置的資料
				$("#theSpecialOfferPrice").text(specialOfferPrice);
    			$("#thePhoto").attr("src", photoUrl);
    			$("#theStock").text(stock);
				$("#theReleaseDate").text(releaseDate);
				$("#theUnitPrice").text(unitPrice);
				//$("#theSpecialOffer").text(specialOffer);
				
				$("input[name=quantity]").attr("max", stock);
			
			}
    		
    		function changeDeliveryDate(){
    			//alert("changeDeliveryDate :" + $("select[name=delivery-date] option:selected").attr("data-stock"));
    			    			
    			var stock = $("select[name=delivery-date] option:selected").attr("data-stock");
    			var listPrice = $("select[name=delivery-date] option:selected").attr("data-list-price");
    			var price = $("select[name=delivery-date] option:selected").attr("data-price");
    			
    			console.log(stock, listPrice, price);
    			
    			//TOTO 修改畫面中指定的位置 select 庫存
    			$("#can-buy-stock").text(stock);
    			$("input[name=quantity]").attr("max",  stock);
    			
    		}
    		
    		function tabClickHandler(){
    		    var targetTab = $(this).attr('data-tab');
    		    
    		    // 打開對應的頁籤
    		    openTabById(targetTab);
    		    
    		    // 移除其他按鈕的活動狀態，並為當前按鈕添加活動狀態
    		    $(".tab-button").removeClass('active-tab');
    		    $(this).addClass('active-tab');
    		}

    		function openTabById(tabId){
    		    // 隱藏所有頁籤內容
    		    $(".tab-content").hide();
    		    
    		    // 顯示對應的頁籤內容
    		    $("#" + tabId).show();
    		}
    		
    	</script>

	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
		
		<%@include file="./subviews/header.jsp" %>
		
		<div class="pageContent">
			<%	// 取得request中的queryString
				String productId = "1"; //request.getParameter("productId");
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
						<div class="product-tags">
							<ul>
								<li><%= p.getCategory() %></li>
							</ul>
						</div>
						<div class="release-date">
							上架日:<span id="theReleaseDate"> <%= p.getReleaseDate() %></span>
						</div>
						
						<div class="product-desc">
							<p><%= p.getDescription() %></p>
						</div>
						
						<div class="total-stock">
							總庫存: <span id="theStock"><%= p.getStock() %> </span>
						</div>
						
						<div class="can-buy-stock">
							可購買庫存:  <span id="can-buy-stock"> </span>
						</div>
						
						<% if (p instanceof SpecialOffer){ %> 
<%-- 						<div>售價: <span id="theUnitPrice"><%= ((SpecialOffer)p).getListPrice() %> </span>元</div> --%>
						
						<div class="u-price-st">
							售價: <span id="theUnitPrice"><%= p.getUnitPrice() %></span> 元
						</div>
						
						<div class="discount-string">
							優惠折扣: <%= ((SpecialOffer)p).getDiscountString()%>
						</div>
												
						<div class="s-o-price">
							優惠售價: <span id="theSpecialOfferPrice"><%= ((SpecialOffer)p).getUnitPrice() %> </span>元
						</div>
							
						
						
						<% } else{%> 
						
						<div class="u-price" >
							售價: <span id="theUnitPrice"><%= p.getUnitPrice() %></span> 元
						</div>
						<%} %>	
						
						
						
						
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
											<img class="iconImg" title="<%=spec.getSpecName() %>" alt="<%=spec.getSpecName() %>" src="<%= spec.getIconUrl() %>"
													data-photo-src="<%= spec.getPhotoUrl() %>" 
													data-release-data="<%=spec.getReleaseDate() %>" 
													data-stock="<%=spec.getStock() %>" 
													data-unit-price="<%=spec.getUnitPrice() %>"
													data-special-offer-price="<%=spec.getUnitPrice() %>">
													<!-- 
													data-special-offer=""
													 -->	
										</label>
										<% } %>							
									</div>
								<% } %>
								
								<!-- 到時候要記得拿掉 -->
								<div class="deliveryDate">
									<label>預計出貨日:</label>
									<select id="delivery-date" name="delivery-date" required="required">
										<option data-stock="5" data-list-price="1000" data-price="1000">2024-09-30</option>
										<option data-stock="8" data-list-price="800" data-price="80">2024-10-15</option>
										<option data-stock="10" data-list-price="700" data-price="70">2024-10-25</option>
									</select>
								</div>
								<!-- 到時候要記得拿掉 -->
								
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
				
				
				<div class="tabs">
				  <button class="tab-button" data-tab="product-desc">產品描述</button>
				  <button class="tab-button" data-tab="product-spec-desc">產品規格</button>
				  <button class="tab-button" data-tab="product-notice">注意事項</button>
				</div>

				<div id="product-desc" class="tab-content">
				  <p><%= p.getDescription() %></p>
				</div>
				
				<div id="product-spec-desc" class="tab-content" style="display:none;">
				  <h3>產品規格</h3>
				  <p>產品規格的內容。</p>
				</div>

				<div id="product-notice" class="tab-content" style="display:none;">
				  <h3>注意事項</h3>
				  <p>注意事項的內容</p>
				</div>
				
				<% } %>
			
		</div>
		
		<%@include file="./subviews/footer.jsp" %>
		
	</body>
</html>
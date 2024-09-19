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
    			var specialOffer = $(this).attr("data-special-offer");
    			var specialOfferPrice = $(this).attr("data-special-offer-price");
    			
    			//alert(stock);
    			//alert("change:" + $(this).attr("title"));
				//console.log("change" + $(this).attr("title"), $(this).attr("data-stock"));
				
				//修改畫面中指定位置的資料
    			$("#thePhoto").attr("src", photoUrl);
    			$("#theStock").text(stock);
				$("#theReleaseDate").text(releaseDate);
				$("#theUnitPrice").text(unitPrice);
				$("#theSpecialOffer").text(specialOffer);
				$("#theSpecialOfferPrice").text(specialOfferPrice);
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
						
						<% if (p instanceof SpecialOffer){ %>
						<div>售價: <span id="theUnitPrice"><%= ((SpecialOffer)p).getListPrice() %> </span>元</div>
						<% } %>
						
						<div>優惠折扣: <span id="theSpecialOffer"> <%= p instanceof SpecialOffer ? ((SpecialOffer)p).getDiscountString():"" %> </span> 
							<span id="theSpecialOfferPrice"><%= p.getUnitPrice() %></span> 元
						</div>
						<div>分類: <%= p.getCategory() %></div>
						<div>庫存: <span id="theStock"><%= p.getStock() %> </span></div>
						<div>上架日:<span id="theReleaseDate"> <%= p.getReleaseDate() %></span></div>
						<div>
							<form>
								<input type="hidden" name="productId" value="<%= p.getId()%>">
								<div class="spec">
									<label>規格:</label>
									<label>
										<input type="radio" name="spec" value="600g" required>
										<img title="600g" alt="600g" src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fproduct%2Fcover%403x-%E3%80%90%E9%99%90%E9%87%8F%E9%A0%90%E8%B3%BC%E3%80%91%E5%B1%B1%E6%A2%A8%E7%94%B2%E6%96%90%E7%8F%8D%E7%8F%A0%E9%BA%9D%E9%A6%99%E6%A1%90%E6%9C%A8%E5%96%AE%E6%88%BF%E7%A6%AE%E7%9B%92%28%E7%B4%84600g%E9%87%8D%29-ldTfTa6B7w172233095177012.jpg?alt=media"
												data-photo-src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fproduct%2Fcover%403x-%E3%80%90%E9%99%90%E9%87%8F%E9%A0%90%E8%B3%BC%E3%80%91%E5%B1%B1%E6%A2%A8%E7%94%B2%E6%96%90%E7%8F%8D%E7%8F%A0%E9%BA%9D%E9%A6%99%E6%A1%90%E6%9C%A8%E5%96%AE%E6%88%BF%E7%A6%AE%E7%9B%92%28%E7%B4%84600g%E9%87%8D%29-ldTfTa6B7w172233095177012.jpg?alt=media" 
												data-release-data="2024-09-17" 
												data-stock="5" 
												data-unit-price="3299"
												data-special-offer="89折"
												data-special-offer-price="2899">
										
									</label>
									<label>
										<input type="radio" name="spec" value="1200g" required>
										<img title="1200g" alt="1200g" src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fproduct%2Fcover%403x-%E3%80%90%E9%99%90%E9%87%8F%E9%A0%90%E8%B3%BC%E3%80%91%E5%B1%B1%E6%A2%A8%E7%94%B2%E6%96%90%E7%8F%8D%E7%8F%A0%E9%BA%9D%E9%A6%99%E6%A1%90%E6%9C%A8%E9%9B%99%E6%88%BF%E7%A6%AE%E7%9B%92%28%E7%B4%841.2kg%E9%87%8D%29-b2dT6FgTs3172233117513526.jpg?alt=media"
												data-photo-src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fproduct%2Fcover%403x-%E3%80%90%E9%99%90%E9%87%8F%E9%A0%90%E8%B3%BC%E3%80%91%E5%B1%B1%E6%A2%A8%E7%94%B2%E6%96%90%E7%8F%8D%E7%8F%A0%E9%BA%9D%E9%A6%99%E6%A1%90%E6%9C%A8%E9%9B%99%E6%88%BF%E7%A6%AE%E7%9B%92%28%E7%B4%841.2kg%E9%87%8D%29-b2dT6FgTs3172233117513526.jpg?alt=media" 
												data-release-data="2024-09-19" 
												data-stock="9" 
												data-unit-price="4299" 
												data-special-offer="79折" 
												data-special-offer-price="3899">
																				
									</label>								
								</div>
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
	
				
				<%
					}
				%>
			
		</div>
		
		<%@include file="./subviews/footer.jsp" %>
		
	</body>
</html>
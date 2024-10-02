<%@page import="jojo.farmerpapa.entity.SpecialOffer"%>
<%@page import="jojo.farmerpapa.entity.Product"%>
<%@page import="jojo.farmerpapa.service.ProductService"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>FarmerPaPa Product list</title>
		
		<link rel="stylesheet" type="text/css" href="/fpapa/style/header.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/product.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">

		<style>
		</style>
		
	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
		
		<%@include file="./subviews/header.jsp" %>
				
		<div class="pageContent">
			<div>
			<img class="banner" alt="banner" src="images/banner01.jpg">
			</div>
	
			<div class="productContent">	
				<section>
					<div class="category">
					<h3>當季新品</h3>
					<hr>
					<a href="?latest=">秋季限定</a>
					</div>
					<div class="category">
						<h3>送禮推薦</h3>
						<hr>
						<a href="?">台灣小農精選禮盒</a>
						<a href="?">進口農園契作禮盒</a>
					</div>
					<div class="category">
						<h3>產地專區</h3>
						<hr>
						<a href="?">台灣特色小農</a>
						<a href="?">海外空運直送</a>
					</div>
					<div class="category">
						<h3>商品類別</h3>
						<hr>
						<a href="?">全部</a>
						<a href="?category=葡萄">葡萄</a>
						<a href="?category=蘋果">蘋果</a>
						<a href="?category=桃子">桃子</a>	
						<a href="?category=梨子">梨子</a>
					</div>
				</section>
				
				<article>
					<%
						// 1. 取得request的form data / QueryString
						String keyword = request.getParameter("keyword");
						String latest = request.getParameter("latest");
						String category = request.getParameter("category");
						
						
						// 2. 呼叫商業邏輯
						ProductService pService = new ProductService();
						List<Product> list = null;
					
						if(keyword != null && (keyword = keyword.trim()).length()>0){
							list = pService.getProductsByKeyword(keyword);
							
						}else if(latest != null && (latest = latest.trim()).length()>=0){
							list = pService.getLatestProducts();
							
						}else if(category != null && (category = category.trim()).length()>0){
							list = pService.getProductsByCategory(category);
							
						}else {
							list = pService.getAllProducts();
						}
						
						// 查無資料
						if(list == null || list.size() == 0){
					%>		
							<div class="noData">
								<h2>查無產品資料</h2>
								<img src="images/no_data.png">
							</div>
							
					<% 	}else{	%>
							<!-- <%= list %>  -->
							
						<div id="productListDiv">
							<% for(int i = 0 ; i < list.size() ; i++){	
									Product p = list.get(i);
							%>		
									<div class="productItem">
										<a href="product_detail.jsp?productId=<%= p.getId() %>"><img src="<%= p.getPhotoUrl() %>"></a>    <!-- TODO:ajax+json -->
										<a href="product_detail.jsp?productId=<%= p.getId() %>"><h4><%= p.getName() %></h4></a>			 <!-- 同步GET請求 -->
										
										<div>售價$ <%= p.getUnitPrice() %> | 優惠折扣: <%= p instanceof SpecialOffer ? ((SpecialOffer)p).getDiscountString(): "" %></div>
									</div>
									
							<%	} %>
					<!-- 
							<div class="productItem">
								<img src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fproduct%2Fcover%403x-%E5%B2%A1%E5%B1%B1%E7%99%BD%E6%A1%83%E5%8E%9F%E8%A3%9D%E7%A6%AE%E7%9B%92%285~6%E5%85%A5%29-oIC88q76Y816908749063264.jpg?alt=media">
								<h4>【數量稀少採預購】岡山白桃原裝禮盒(5~6入)</h4>
								<div>售價$5,299 | 優惠價$4,299</div>
							</div>
					 -->		
			
						</div>
								
					<%  } %>
				</article>
			</div>
		</div>
		
		<%@include file="./subviews/footer.jsp" %>

	</body>
</html>
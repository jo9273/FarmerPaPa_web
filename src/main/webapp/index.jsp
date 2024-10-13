<%@page import="jojo.farmerpapa.entity.SpecialOffer"%>
<%@page import="jojo.farmerpapa.entity.Product"%>
<%@page import="jojo.farmerpapa.service.ProductService"%>
<%@page import="jojo.farmerpapa.entity.News"%>
<%@page import="jojo.farmerpapa.service.NewsService"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="jojo.farmerpapa.entity.Customer"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>FarmerPaPa</title>
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/header.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/index.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/product.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		
		<%
			NewsService nService = new NewsService();
			List<News> newsList = nService.getLatesNews();
		%>
		
		<%
			ProductService pService = new ProductService();
			List<Product> pList = pService.getLatestProducts();	
		%>
		
		<script type="text/javascript">
			
			var newsIndex = 0;
			var newsNum = <%= newsList.size()%>;
			
			var pIndex = 0;
			var pNum = <%= pList.size()%>;	
			
			$(document).ready(init);
			
			function init(){
				updateNewsBtns();
				$("#news-next").click(newsNextHandler);
				$("#news-prev").click(newsPrevHandler);
				
				updatePBtns();
				$("#p-next").click(pNextHandler);
				$("#p-prev").click(pPrevHandler);
				
				
			}

			function newsNextHandler(){
				// 只有當索引小於總篇數時，才允許進行下一頁
				if (newsIndex < newsNum - 1) {
					newsIndex++;  // 移動到下一篇
			        $("#news-container").animate({"left": -(newsIndex * 520) + "px"}, 500);  // 每次移動一篇寬度
			        updateNewsBtns();  // 每次更新按鈕狀態
			    }
				
			}
			
			function newsPrevHandler(){
				//alert("test");
				// 只有當索引大於0時，才允許返回上一頁
		        if (newsIndex > 0) {
		            newsIndex--;  // 移動到上一篇
		            $("#news-container").animate({"left": -(newsIndex * 520) + "px"}, 500);  // 每次移動一篇寬度
		            updateNewsBtns();  // 每次更新按鈕狀態
		        }
			}
			
			function updateNewsBtns(){
				// 當已經在第一篇時，禁用 "prev" 按鈕
		        if (newsIndex <= 0) {
		            $("#news-prev").attr("disabled", true);
		        } else {
		            $("#news-prev").removeAttr("disabled");
		        }

		        // 當已經在最後一篇時，禁用 "next" 按鈕
		        if (newsIndex >= newsNum - 1) {
		            $("#news-next").attr("disabled", true);
		        } else {
		            $("#news-next").removeAttr("disabled");
		        }
			}
			
			
			
			
			////////product
			function pNextHandler(){
				// 只有當索引小於總篇數時，才允許進行下一頁
				if (pIndex < pNum - 1) {
					pIndex++;  // 移動到下一篇
			        $("#p-container").animate({"left": -(pIndex * 320) + "px"}, 500);  // 每次移動一篇寬度
			        updatePBtns();  // 每次更新按鈕狀態
			    }
				
			}
			
			function pPrevHandler(){
				//alert("test");
				// 只有當索引大於0時，才允許返回上一頁
		        if (pIndex > 0) {
		        	pIndex--;  // 移動到上一篇
		            $("#p-container").animate({"left": -(pIndex * 320) + "px"}, 500);  // 每次移動一篇寬度
		            updatePBtns();  // 每次更新按鈕狀態
		        }
			}
			
			function updatePBtns(){
				// 當已經在第一篇時，禁用 "prev" 按鈕
		        if (pIndex <= 0) {
		            $("#p-prev").attr("disabled", true);
		        } else {
		            $("#p-prev").removeAttr("disabled");
		        }

		        // 當已經在最後一篇時，禁用 "next" 按鈕
		        if (pIndex >= pNum - 1) {
		            $("#p-next").attr("disabled", true);
		        } else {
		            $("#p-next").removeAttr("disabled");
		        }
			}
			
			
			
		
		</script>
		
	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
			
		<%-- <jsp:include page="./subviews/header.jsp">
			<jsp:param value="果物市集" name="subheader"/>
		</jsp:include>  --%>
		
		<%@include file="./subviews/header.jsp" %>  <%--這個寫法有隱含變數的效果 --%>
			
		<div class="indexContent">	
			<article>
				<div class="kv">
					<div class="kv-outer">
						<div class="kv-image" style="background-image: url('images/strawberries-5977280_1920.jpg');"></div>
						<div class="kv-image" style="background-image: url('images/juniper-5831917_1920.jpg');"></div>
						<div class="kv-image" style="background-image: url('images/tomatoes-5566741_1920.jpg');"></div>
						<div class="kv-image" style="background-image: url('images/apples-6741164_1920.jpg');"></div>
						
						<!-- 
						<video id="indexKV" autoplay loop muted>
	    					<source src="/fpapa/images/index-1.mp4" type="video/mp4" >
	    				</video>    
						 -->
					</div>
						 
					<h1>小農真心．果然新鮮</h1>
					<img alt="scorll down" src="/fpapa/images/down-arrow.png">
				</div>
				
				<% 	if(newsList != null || newsList.size() != 0){ %>
				<div class="content">
					<div class="title-wrapper">
						<h2>最新情報</h2>
						<a class="more-btn" href="/fpapa/news_list.jsp">
							更多情報 
							<img class="more-img" alt="more" src="/fpapa/images/right_arrow.png">
						</a>
					</div>
					
					<div class="info-wrapper">
						<div id="news-container" class="container">
						<% 	for(News news : newsList ){ %>
							<div class="list">
								<a class="item-link" href="news_detail.jsp?newsId=<%= news.getId() %>">
									<img src="<%= news.getImageUrl()%>">			
									<div class="detail">
										<span><%= news.getPublishDate() %></span>
										<ul>
											<li id="newsTag" class="tag"><%= news.getCategory() %></li>
										</ul>								
										<p class="title"><%= news.getTitle() %></p>
										<p class="desc"><%= news.getDesc() %></p>
									</div>
								</a>
							</div>
						<%} %>
						</div>
						<div class="arrow left-arrow" id="news-prev">&#10094;</div>
						<div class="arrow right-arrow" id="news-next">&#10095;</div>
					</div>	
					
				</div>
			<%} %>
			
			<% if(pList != null || pList.size() != 0){ %>
				<div class="content">
					<div class="title-wrapper">
						<h2>當季主打</h2>
						<a class="more-btn" href="/fpapa/product_list.jsp">
							更多商品
							<img class="more-img" alt="more" src="/fpapa/images/right_arrow.png">
						</a>
					</div>
					
					<div class="info-wrapper">
						<div id="p-container" class="container">
						<% 	for(Product p : pList ){ %>
							<div class="p-list">
								<a class="item-link" href="product_detail.jsp?productId=<%= p.getId() %>">
									<img src="<%= p.getPhotoUrl()%>">			
									
										<div class="product-name">
											<p><%= p.getName() %></p>		 
										</div>
										<div class="productPrice">
											<%if(p instanceof SpecialOffer){ %>
												<span class="list-price">原價：<%= ((SpecialOffer)p).getListPrice() %>元</span>
												<span class="discount">折扣：<%= ((SpecialOffer)p).getDiscountString()%></span>
												<span class="price">優惠價：<%= ((SpecialOffer)p).getUnitPrice()%></span>
											<%}else{ %>
												<span class="price">售價： <%= p.getUnitPrice() %> </span>
											<%}%>
										</div>	
									
								</a>
							</div>
						<%} %>
						</div>
						<div class="arrow left-arrow" id="p-prev">&#10094;</div>
						<div class="arrow right-arrow" id="p-next">&#10095;</div>
					</div>	
					
				</div>

			<%} %>
				<div class="productList">
					<h2>禮盒專區</h2>
				</div>
				
				
			</article>
		</div>
		<%@include file="./subviews/footer.jsp" %>
	
	</body>
</html>
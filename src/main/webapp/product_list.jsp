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
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		
		<style>
			#productListDiv{}
			.productItem{display: inline-block ; width: 250px ; height: 370px ; vertical-align: top ; box-shadow: lightgray 2px 3px ; margin: 5px ;}	/*border: lightgray 1px solid ;*/
			.productItem img{width: 250px ; display: block ; margin: auto}
			.productItem div{text-align: center;}
			
		</style>
		
	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
		
		<jsp:include page="./subviews/header.jsp">
			<jsp:param value="果物市集" name="subheader"/>
		</jsp:include>
		
		<%@include file="./subviews/nav.jsp" %>
		

		<article>
			<section>
				<a href="?latest=">新品</a>
				<a href="?">全部</a>
				<a href="?category=葡萄">葡萄</a>
				<a href="?category=蘋果">蘋果</a>
				<a href="?category=桃子">桃子</a>
				<a href="?category=梨子">梨子</a>
			
			</section>
		
			<%
				// 1. 取得request的form data
				String keyword = request.getParameter("keyword");
				
				// 2. 呼叫商業邏輯
				ProductService pService = new ProductService();
				List<Product> list = null;
			
				if(keyword != null && (keyword = keyword.trim()).length()>0){
					list = pService.getProductByKeyword(keyword);
				}else {
					list = pService.getAllProducts();
				}
				
				// 查無資料
				if(list == null || list.size() == 0){
			%>		
					<h2>查無產品資料</h2>
					<img src="images/no_data.png">
					
			<% 	}else{	%>
					<!-- <%= list %>  -->
					
				<div id="productListDiv">
					<% for(int i = 0 ; i < list.size() ; i++){	
							Product p = list.get(i);
					%>		
							<div class="productItem">
								<img src="<%= p.getPhotoUrl() %>">
								<h4><%= p.getName() %></h4>
								<div>售價$ <%= p.getUnitPrice() %> | 優惠折扣: <%= p instanceof SpecialOffer ? ((SpecialOffer)p).getDiscountString(): "無折扣" %></div>
							</div>
							
					<%	} %>
			<!-- 
					<div class="productItem">
						<img src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fproduct%2Fcover%403x-%E5%B2%A1%E5%B1%B1%E7%99%BD%E6%A1%83%E5%8E%9F%E8%A3%9D%E7%A6%AE%E7%9B%92%285~6%E5%85%A5%29-oIC88q76Y816908749063264.jpg?alt=media">
						<h4>【數量稀少採預購】岡山白桃原裝禮盒(5~6入)</h4>
						<div>售價$5,299 | 優惠價$4,299</div>
					</div>
					
					<div class="productItem">
						<img src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fproduct%2F394%2Fcover-wYZsTvMUWm16625339801775.jpg?alt=media">
						<h4>山形水蜜桃禮盒(約1.8kg)</h4>
						<div>售價$2,899 | 優惠價$2,600</div>
					</div>
					
					<div class="productItem">
						<img src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fproduct%2Fcover%403x-%E9%B3%A5%E5%8F%96%E4%BA%8C%E5%8D%81%E4%B8%96%E7%B4%80%E6%A2%A86%E5%85%A5%E7%A6%AE%E7%9B%92%282kg%29-vBcdvR7dqp16934532228571.jpg?alt=media">
						<h4>鳥取二十世紀梨6入禮盒(約2kg)</h4>
						<div>售價$2,699 | 優惠價$2,050</div>
					</div>
					
					<div class="productItem">
						<img src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fproduct%2Fcover%403x-%E6%99%BA%E5%88%A9%E5%AF%8C%E5%A3%AB%E8%98%8B%E6%9E%9C%E7%A6%AE%E7%9B%92%288%E5%85%A5%29-CFCMQnTzQT17231723151773.jpg?alt=media">
						<h4>智利富士蘋果禮盒(8入)</h4>
						<div>售價$1,299 | 優惠價$1,050</div>
					</div>
			 -->		
	
				</div>
						
			<%  } %>
		</article>
		
		<%@include file="./subviews/footer.jsp" %>


	</body>
</html>
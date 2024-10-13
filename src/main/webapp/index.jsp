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
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">
		
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
				
				<%
					NewsService nService = new NewsService();
					List<News> list = nService.getLatesNews();
				%>
				<% 	if(list != null || list.size() != 0){ %>
				<div class="newsList">
					<div class="title-wrapper">
						<h2>最新情報</h2>
						<a class="more-btn" href="/fpapa/news_list.jsp">
							更多情報 
							<img class="more-img" alt="more" src="/fpapa/images/right_arrow.png">
						</a>
					</div>
					<% 	for(News news : list ){ %>
					<div class="info-wrapper">
						<a class="newsLink" href="news_detail.jsp?newsId=<%= news.getId() %>">
							<div class="newsItem">	<!-- news -->
								<img src="<%= news.getImageUrl()%>">			
								<div class="newsDetail">
									<span><%= news.getPublishDate() %></span>
									<br>
									<ul>
										<li id="newsTag" class="tag"><%= news.getCategory() %></li>
									</ul>								
									<p class="newsTitle"><%= news.getTitle() %></p>
									<p class="newsDescription"><%= news.getDesc() %></p>
								</div>
							</div>
						</a>
					</div>	
					<%} %>
				</div>
			<%} %>
				<div class="productList">
					<h2>當季主打</h2>
				</div>
				
				<div class="productList">
					<h2>禮盒專區</h2>
				</div>
				
				
			</article>
		</div>
		<%@include file="./subviews/footer.jsp" %>
	
	</body>
</html>
<%@page import="jojo.farmerpapa.service.NewsService"%>
<%@page import="jojo.farmerpapa.entity.News"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<%	// 取得request中的queryString
				String newsId = request.getParameter("newsId");
				News news = null;
				NewsService nService = new NewsService();
				
				if(newsId != null && (newsId = newsId.trim()).length()>0){
					news = nService.getNewsById(newsId);
				}
		%>
		<%
				// 查無資料
				if(news == null){
		%>	
					<title>查無最新情報資料</title>
		<%
				}else{
		%>
    	<title><%=news.getTitle() %></title>
    	<%} %>
	
		<link rel="stylesheet" type="text/css" href="/fpapa/style/header.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/news.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">
		
	</head>
	<body>
		<%@include file="./subviews/header.jsp" %>
		
		<div class="pageContent">	<!-- fpapa -->
			<%
				// 查無資料
				if(news == null){
			%>	
					<div class="noData">
						<h2>查無最新情報資料</h2>
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
						<a href="news_list.jsp">最新情報</a>
					</li>
					<li>
						>
					</li>
					<li>
						<%=news.getTitle() %>
					</li>
				</ul>
			</div>
			
			<div class="newsContent">
				<div class="news-detail-title">
					<span><%=news.getPublishDate() %></span>
					<ul>
						<li id="newsTag"><%=news.getCategory() %></li>
					</ul>	
					<p class="newsTitle"><%=news.getTitle() %></p>
				</div>
				
				<div class=news-articles>
					<%=news.getContent() %>
				</div>
				
				<div class="share-wrapper">
					<p>分享：</p>
						<li>
							<a target="_blank" href="">
								<img class="socialIcon" alt="facebook" src="images/fb.png">
							</a>
						</li>
						<li>
							<a target="_blank" href="">
								<img class="socialIcon" alt="line" src="images/line.png">
							</a>
						</li>
				</div>
	
			</div>
			<%} %>
		
		</div>
		<%@include file="./subviews/footer.jsp" %>
	</body>
</html>
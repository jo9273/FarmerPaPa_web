<%@page import="java.util.Collections"%>
<%@page import="jojo.farmerpapa.entity.News"%>
<%@page import="jojo.farmerpapa.service.NewsService"%>

<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>FarmerPaPa 最新情報</title>
		<link rel="stylesheet" type="text/css" href="/fpapa/style/header.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/news.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">
		<stlye>
		</stlye>
	</head>
	<body>
		<%@include file="./subviews/header.jsp" %>
		
		<%
			String category = request.getParameter("category");
			String NewsYear = request.getParameter("year") ;
					
			NewsService nService = new NewsService();
			List<News> list = null;
					
			if(category != null && (category=category.trim()).length()>0){
				list = nService.getNewsByCategory(category);
					
			}else if(NewsYear != null && (NewsYear=NewsYear.trim()).length()>0){
				int year = Integer.parseInt(NewsYear);
				list =  nService.getNewsByYear(year);
					
			}else{
				list = nService.getAllNews();
			}
			
			// 撈取所有類別和年份，用於下拉選單
	        List<String> categoryList = nService.getAllCategories();
	        Collections.sort(categoryList);

	        List<Integer> yearList = nService.getAllYears();
	        Collections.sort(yearList, Collections.reverseOrder());
		%>
		
		
		<div class="pageContent">	<!-- fpapa -->
			<div class="newsContent">
				<div class="topInfoWrapper">	<!-- fpapa -->
					
					<h1 class="topTitle">最新情報</h1>	<!-- fpapa -->
					
					<div class="filterWrapper">	<!-- fpapa -->
						<form method="get" action="news_list.jsp">					
							<div class="filterSelectWrapper">	<!-- fpapa -->
								<label for="select">類別</label>
					  			<select id="select" name="category" onchange="this.form.submit()">
					  				<option value="">全部</option>
                               		 <% for(String cat : categoryList){ %>
                                	<option value="<%= cat %>" <%= cat.equals(category) ? "selected" : "" %>><%= cat %></option>
                               		<% } %>
								</select>
							</div>
						</form>
						
						<form method="get" action="news_list.jsp">	
							<div class="filterTimeWrapper">		<!-- fpapa -->
								<label for="year">時間</label>
					  			<select id="year" name="year" onchange="this.form.submit()">
						  			<option value="">全部</option>
                               		<% for(Integer year : yearList){ %>
                                	<option value="<%= year %>" <%= year.toString().equals(NewsYear) ? "selected" : "" %>><%= year %></option>
                                	<% } %>
								</select>
							</div>
						</form>
						
					</div>
				</div>
				
				<% 	
					if(list == null || list.size() == 0){
				%>
				<div class="noData">
					<h2>查無最新情報資料</h2>
					<img src="images/no_data.png">
				</div>
				<%}else{ %>	
					
				<div class="newsInfoList">	<!-- news -->
					<%for(int i = 0 ; i < list.size() ; i++){
						News news = list.get(i);
					%>
					<a class="newsLink" href="news_detail.jsp?newsId=<%= news.getId() %>">
						<div class="newsItem">	<!-- news -->
								<div class="newsImg">
									<img src="<%= news.getImageUrl()%>">
								</div>
									
								<div class="newsDetail">
									<span><%= news.getPublishDate() %></span>
									<br>
									<ul>
										<li id="newsTag"><%= news.getCategory() %></li>
									</ul>								
									<p class="newsTitle"><%= news.getTitle() %></p>
									<p class="newsDescription"><%= news.getDesc() %></p>
								</div>
						</div>
					</a>
					<%} %>
				</div>
				
				<%} %>
			</div>
			
		</div>
		<%@include file="./subviews/footer.jsp" %>
	</body>
</html>
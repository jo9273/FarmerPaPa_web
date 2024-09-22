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
		

		<div class="pageContent">	<!-- fpapa -->
			<div class="newsContent">
				<div class="topInfoWrapper">	<!-- fpapa -->
					
					<h1 class="topTitle">最新情報</h1>	<!-- fpapa -->
					
					<div class="filterWrapper">	<!-- fpapa -->
					
						<div class="filterSelectWrapper">	<!-- fpapa -->
							<label for="select">類別</label>
				  			<select id="select">
					  				<option value="all">全部</option>
					  				<option value="News">公告</option>
					  				<option value="Promotions">優惠活動</option>
					  				<option value="Knowsledge">小知識</option>
							</select>
							<img class="iconDropDown" src="">	<!-- fpapa -->
						</div>
						
						<div class="filterTimeWrapper">		<!-- fpapa -->
							<label for="time">時間</label>
				  			<select id="time">
					  				<option value="all">全部</option>
					  				<option value="2024">2024</option>
					  				<option value="2023">2023</option>
					  				<option value="2022">2022</option>
							</select>
							<img class="iconDropDown" src="">	<!-- fpapa -->
						</div>
					</div>
				</div>
			
				<div class="newsInfoList">	<!-- news -->
					<a class="newsLink" href="news_detail.jsp?newsId=">
						<div class="newsItem">	<!-- news -->
								<div class="newsImg">
									<img src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2FproductInfo%2Fcover%403x-undefined-TRSgnrqZei17252655062501.jpg?alt=media">
								</div>
									
								<div class="newsDetail">
									<span>2024/09/11</span>
									<br>
									<ul>
										<li id="newsTag">小知識</li>
									</ul>								
									<p class="newsTitle">水蜜桃知識篇 - 日本果物共選場</p>
									<p class="newsDescription">在台灣的我們之所以可以享用到美味的水蜜桃，有很大的原因是源自日本 _ 果物選果場 ( #共選場 )。</p>
								</div>
						</div>
					</a>
					<a class="newsLink" href="">
						<div class="newsItem">	<!-- news -->
								<div class="newsImg">
									<img src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2FproductInfo%2Fcover%403x-undefined-TRSgnrqZei17252655062501.jpg?alt=media">
								</div>
									
								<div class="newsDetail">
									<span>2024/09/11</span>
									<br>
									<ul>
										<li id="newsTag">小知識</li>
									</ul>								<p class="newsTitle">水蜜桃知識篇 - 日本果物共選場</p>
									<p class="newsDescription">在台灣的我們之所以可以享用到美味的水蜜桃，有很大的原因是源自日本 _ 果物選果場 ( #共選場 )。</p>
								</div>
						</div>
					</a>
				</div>
			</div>
			
		</div>
		<%@include file="./subviews/footer.jsp" %>
	</body>
</html>
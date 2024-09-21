<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>FarmerPaPa News</title>
		<link rel="stylesheet" type="text/css" href="/fpapa/style/header.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/news.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">
		
	</head>
	<body>
		<%@include file="./subviews/header.jsp" %>
		
		<div class="pageContent">	<!-- fpapa -->
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
						最新情報內容
					</li>
				</ul>
			</div>
			<div class="newsContent">
				<div class="news-detail-title">
					<span>2024/09/11</span>
					<ul>
						<li id="newsTag">小知識</li>
					</ul>	
					<p class="newsTitle">水蜜桃知識篇 - 日本果物共選場</p>
				</div>
				
				<div class=news-articles>
					
					<h4>什麼是共選場?</h4>
					<img class="squareImg" alt="水蜜桃知識篇 - 日本果物共選場" src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fimage-editor-hnf3l5XeGr17252655612046.jpg?alt=media">
					<p>共選場是農民在收穫農作物並將其運送到超市……等通路前，負責將新鮮收穫的作物進行分級、挑選和包裝的場所，不僅依賴傳統的人工分揀技術，還結合了現代的自動化設備，來提高效率和準確度。</p>
					
					<h4 style="color:#f04624">在共選場內，從挑選、檢查、分級到出貨共會經歷的5個步驟</h4>
					<h4>Step1. 農園採收並運往選果場 </h4>
					<img class="squareImg" alt="農園採收並運往選果場" src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fimage-editor-aUW7q69ABE172526568867010.jpg?alt=media">
					<p>農民將新鮮收穫的水蜜桃先根據品種與特性進行初步處理，為接下來的分級與檢測做好準備並運送到選果場。</p>
					<h4>Step2. 人工目視分選</h4>
					<img class="squareImg" alt="人工目視分選" src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fimage-editor-2TVsQUakDQ172526577881514.jpg?alt=media">
					<p>一旦進入選果場，首先會經過人工目視檢查。這主要是排除外觀有明顯缺陷的水果，如表皮破損或異常變形的水果。</p>
					<h4>Step3. 光學感測器檢測果實</h4>
					<img class="squareImg" alt="光學感測器檢測果實" src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fimage-editor-4pfCZdhsna172526604654628.jpg?alt=media">
					<p>經過人工初檢後，水蜜桃會被放於輸送帶托盤上並經過光學感測器，這些高精度的光學感測器能夠檢測出顏色、大小、形狀、甜度。</p>
					<h4>Step4. 依照等級進行包裝與捆包</h4>
					<img class="squareImg" alt="依照等級進行包裝與捆包" src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fimage-editor-KrE5POkrYI172526589511722.jpg?alt=media">
					<p>根據光學感測器的分析結果，水蜜桃會分級並自動送入相應的包裝產線，人工進行包裝並放入緩衝材料置入紙箱中，再透過輸送帶進行後續封箱作業，以確保在運輸過程中保持最佳狀態。</p>
					<h4>Step5 準備送往機場</h4>
					<img class="squareImg" alt="準備送往機場" src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fimage-editor-1vML4c4ByL172526603493326.jpg?alt=media">
					<p>最後，經過分級和包裝的水蜜桃會被裝載到冷藏集貨地進行裝櫃作業，準備運往出口到國際市場，以確保水果的新鮮度。</p>
				
				</div>
				<div class="share-wrapper">
					share to fb line 
				</div>
				
				
			</div>
			

			
			
		</div>
		<%@include file="./subviews/footer.jsp" %>
	</body>
</html>
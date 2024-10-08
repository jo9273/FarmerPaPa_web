<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>常見問題</title>
				
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/header.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/qa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/footer.css">	
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
	
		<script>
			$(document).ready(init);
	
			function init(){
												
				// 預設打開第一個頁籤
				$(".tab-button").on("click", tabClickHandler);
				openTabById('fq-order');
				$(".tab-button:first").addClass('active-tab');
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
	
		<%@include file="./subviews/header.jsp" %>
		<div class="pageContent">
			<div class="qa-content">
				<h2>常見問題</h2>
				
				<div class="tabs">
				 	<button class="tab-button" data-tab="fq-order">訂單與商品問題</button>
				 	<button class="tab-button" data-tab="fq-payment">付款問題</button>
					<button class="tab-button" data-tab="fq-shipping">配送問題</button>
				</div>
				
				<div id="fq-order" class="tab-content">
					<button class="accordion">如何知道我的訂單已經成立了呢？</button>
					<div class="panel">
				  		<p>於本網完成訂單後，系統會在網頁上顯示『購買完成』，即為訂單成立。</p>
					</div>
				
					<button class="accordion">我可以在官網中了解目前訂單的處理狀況嗎？</button>
					<div class="panel">
				  		<p>若您是我們的會員，您可以隨時點選網站『會員』功能查詢『歷史訂單』即可查詢個人訂單的處理狀況。</p>
				  	</div>
				  	
					<button class="accordion">如何使用折扣碼？</button>
					<div class="panel">
				  		<p>請先加入會員，並在結帳頁面輸入活動的折扣碼即可享優惠， 提醒您，折扣碼會區分中文英文大小寫及全形半形，輸入時請確保輸入正確的文字。</p>
					</div>
					
					<button class="accordion">為何我的折扣碼無法使用？</button>
					<div class="panel">
				  		<p>原因1:若活動時間已結束您的折扣碼將無法使用。 原因2:折扣碼每位會員只能折抵一次，有可能您曾經使用過了。 原因3:若活動有限制優惠人數，有可能折扣碼已達使用上限。</p>
					</div>
					
					<button class="accordion">我可以在訂單成立後，要求更改訂購數量/取消訂單嗎？</button>
					<div class="panel">
				  		<p>由於受限營運、認證中心和銀行規範，無法提供線上網路直接由顧客修改訂購數量，請聯繫線上客服，由專員指導您處理。 『已出貨』的訂單恕無法取消。</p>
					</div>
					
					<button class="accordion">水果冷藏可以放幾天？</button>
					<div class="panel">
				  		<p>因為每家的冰箱保鮮條件不同，無法跟您保證確定期限，所以建議收到後儘速食用完畢喔。</p>
					</div>
					
					<button class="accordion">收到商品後，發現商品瑕疵或數量有誤怎麼辦?</button>
					<div class="panel">
				  		<p>請收貨人務必到貨時，立即全程錄影開箱檢查，請檢查溫度是否退冰、品項、數量是否正確。如有因運送碰撞，造成果物大量瑕疵或失溫，請『維持商品原狀、拍照留存及留存問題商品』，並『立即於到貨日後24小時內聯絡客服人員』，將協助您申請換貨或商品退貨。退換貨商品須保留原包裝，若商品原包裝不在，旬果屋有權不予接受退換貨之申請。恕不接受無影像之證據客訴。</p>
					</div>
					
					<button class="accordion">生鮮類商品在退換貨方面有其他的規定嗎？</button>
					<div class="panel">
				  		<p>生鮮類商品性質具備消保法第十九條所定之合理例外情事「保存期限較短商品」，故不適用於7天鑑賞期退貨，不得以其他主觀認知差距個人因素（香氣、大小、甜度、色澤、口感、不喜歡、口味）等理由退貨。 若有重大瑕疵請立即拍照並在24hr內聯繫我們線上客服，將由專人為您處理後續，恕不接受無影像之證據客訴。</p>
					</div>
				</div>
				
				<div id="fq-payment" class="tab-content" style="display:none;">
					<button class="accordion">付款方式為何？</button>
					<div class="panel">
				  		<p>目前僅提供信用卡、ATM轉帳、超商取貨付款。</p>
					</div>
					
					<button class="accordion">可以開發票嗎?</button>
					<div class="panel">
				  		<p>會的，我們提供紙本發票or電子發票，請在訂購時選填您需求的選項，若需要開統編請務必在訂購過程中填寫資訊，若需更改請電洽或詢問Line客服。</p>
					</div>
					
					<button class="accordion">訂購完成後還可以更改付款方式嗎？</button>
					<div class="panel">
				  		<p>由於不同的付款方式分別是採用不同的作業系統，我們目前尚未提供您直接更改付款方式的服務。造成您的不便，敬請見諒。</p>
					</div>
					
					<button class="accordion">如何查詢是否付款成功？</button>
					<div class="panel">
				  		<p>付款成功後，金流服務單位將會發送至訂購人email信箱，也可由『歷史訂單』查詢付款狀態。</p>
					</div>
				</div>
				
				<div id="fq-shipping" class="tab-content" style="display:none;">
					<button class="accordion">大台北地區為哪些地區呢？</button>
					<div class="panel">
				  		<p>台北市區全區、 新北：中和區、永和區、新店區、土城區、板橋區、三重區、蘆洲區、新莊區、五股區 、泰山區、樹林區、鶯歌區、三峽區</p>
					</div>
					
					<button class="accordion">宅配費用如何計算？</button>
					<div class="panel">
				  		<p>我司僅可接受一商品寄送單一收件人、單一收件地址，並確保品質統一為冷藏宅配出貨，非物流繁盛時期台灣本島地區：100NT$/趟。</p>
					</div>
					
					<button class="accordion">我可以在官網中查詢目前訂單的配送狀況嗎？</button>
					<div class="panel">
				  		<p>您可以隨時點選網站『會員』功能查詢『歷史訂單』即可查詢個人訂單的處理狀況。</p>
					</div>
					
					<button class="accordion">是否能指定到貨時間？</button>
					<div class="panel">
				  		<p>我們會盡量配合客人的需求，但因每日檢貨時間/貨品狀況(Ex.草莓無法久放)/物流路線/配送狀況時間皆有不同，因此提供選擇時段，而無法選擇時間，請見諒。</p>
					</div>
					
				</div>
				
				<script type="text/javascript" src="/fpapa/js/accordion.js"></script>
			</div>
		</div>
		<%@include file="./subviews/footer.jsp" %>
	</body>
</html>
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
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		
		<script type="text/javascript">
			
			$(document).ready(init);
			
			var bnIndex = 1;
			var bnArray = ["banner_1.jpg","banner_2.jpg","banner_1.jpg","banner_2.jpg","banner_1.jpg","banner_2.jpg"];
			var bnCount = bnArray.length;
			var interval = 3000;  //3 秒
            var timer;
            var isAnimating = false; //用來判斷動畫狀態
		
			function init() {
				// 複製banner陣列，並在開頭和結尾個加一張圖，以用來做循環效果
                var extendedBns = [];
                extendedBns.push(bnArray[bnCount - 1]); // 最後一張banner
                extendedBns = extendedBns.concat(bnArray);
                extendedBns.push(bnArray[0]); // 第一張banner
                
             	// 動態放入banner
                for (var i = 0; i < extendedBns.length; i++) {
                    $('#banner-inner').append("<img class='banner' src='images/" + extendedBns[i] + "'>");
                }

                // 動態生成點點
                for (var i = 0; i < bnCount; i++) {
                    $('#dots').append('<span class="dot" data-index="' + i + '"></span>');
                }
                $('.dot').eq(0).addClass('active-dot');

                // 初始位置
                $('#banner-inner').css('transform', 'translateX(-100%)');

                // 綁定事件
                $('#next').on('click', nextSlide);
                $('#prev').on('click', prevSlide);
                $('.dot').on('click', function () {
                    var index = $(this).data('index');
                    goToSlide(index + 1); // 因為有一張額外的banner，所以加 1
                });

                // 開始自動輪播
                startTimer();
	
			}
			
			// 下一張
            function nextSlide() {
            	if (isAnimating) return; // 若動畫正在進行，則不執行
            	bnIndex++;
                updateCarousel();
                resetTimer();
            }

            // 上一張
            function prevSlide() {
            	if (isAnimating) return; // 若動畫正在進行，則不執行
            	bnIndex--;
                updateCarousel();
                resetTimer();
            }

            // 跳轉到指定的banner
            function goToSlide(index) {
            	if (isAnimating) return; // 若動畫正在進行，則不執行
            	bnIndex = index;
                updateCarousel();
                resetTimer();
            }

            // 更新輪播狀態
            function updateCarousel() {
            	isAnimating = true; // 設置動畫狀態為進行中
                $('#banner-inner').css('transition', 'transform 0.5s ease-in-out');
                $('#banner-inner').css('transform', 'translateX(-' + (bnIndex * 100) + '%)');

                // 更新點點的狀態
                var dotIndex = bnIndex - 1;
                if (dotIndex >= bnCount) {
                    dotIndex = 0;
                } else if (dotIndex < 0) {
                    dotIndex = bnCount - 1;
                }
                $('.dot').removeClass('active-dot');
                $('.dot').eq(dotIndex).addClass('active-dot');
                
                // 動態綁定 transitionend 事件
                $('#banner-inner').one('transitionend webkitTransitionEnd oTransitionEnd', function() {
                    if (bnIndex === 0) {
                        // 無縫跳轉到最後一張
                        $('#banner-inner').css('transition', 'none');
                        bnIndex = bnCount;
                        $('#banner-inner').css('transform', 'translateX(-' + (bnIndex * 100) + '%)');
                        // 強制重繪，確保 transition 屬性已移除
                        setTimeout(function() {
                            $('#banner-inner').css('transition', 'transform 0.5s ease-in-out');
                            isAnimating = false; // 動畫結束，允許新的點擊
                        }, 0);
                    } else if (bnIndex === bnCount + 1) {
                        // 無縫跳轉到第一張
                        $('#banner-inner').css('transition', 'none');
                        bnIndex = 1;
                        $('#banner-inner').css('transform', 'translateX(-' + (bnIndex * 100) + '%)');
                        // 強制重繪，確保 transition 屬性已移除
                        setTimeout(function() {
                            $('#banner-inner').css('transition', 'transform 0.5s ease-in-out');
                            isAnimating = false; // 動畫結束，允許新的點擊
                        }, 0);
                    } else {
                        // 正常情況
                        isAnimating = false; // 動畫結束，允許新的點擊
                    }
                });
            }

            // 自動輪播
            function startTimer() {
                timer = setInterval(function () {
                    nextSlide();
                }, interval);
            }

            // 重置計時器
            function resetTimer() {
                clearInterval(timer);
                startTimer();
            }

            // 處理循環
            $('#banner-inner').on('transitionend', function () {
                if (bnIndex === 0) {
                    $('#banner-inner').css('transition', 'none');
                    bnIndex = bnCount;
                    $('#banner-inner').css('transform', 'translateX(-' + (bnIndex * 100) + '%)');
                } else if (bnIndex === bnCount + 1) {
                    $('#banner-inner').css('transition', 'none');
                    bnIndex = 1;
                    $('#banner-inner').css('transform', 'translateX(-' + (bnIndex * 100) + '%)');
                }
            });

           
			
		</script>
		
	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
		
		<%@include file="./subviews/header.jsp" %>
				
		<div class="pageContent">
			<!-- 
			<div>
			<img class="banner" alt="banner" src="images/banner01.jpg">
			</div>
			 -->

			<div id="banner-outer">
				<div id="banner-inner">
				</div>
				
				<div class="carousel-controls">
					<div id="prev" >&#10094;</div>
					<div id="next">&#10095;</div>
				</div>
				
				<div id="dots"></div>
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
										<a href="product_detail.jsp?productId=<%= p.getId() %>"> <!-- 同步GET請求 -->
											<div class="product-name">
												<h4><%= p.getName() %></h4>		 
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
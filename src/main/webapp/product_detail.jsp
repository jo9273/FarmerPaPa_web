<%@page import="jojo.farmerpapa.entity.ProductSpec"%>
<%@page import="jojo.farmerpapa.entity.SpecialOffer"%>
<%@page import="jojo.farmerpapa.service.ProductService"%>
<%@page import="jojo.farmerpapa.entity.Product"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<%	// 取得request中的queryString
				String productId = request.getParameter("productId");
				Product p = null;
				
				ProductService pService = new ProductService();
				if(productId != null && (productId = productId.trim()).length()>0){
					p = pService.getProductById(productId);
				}
		%>
		<%
				// 查無資料
				if(p == null){
		%>	
					<title>查無產品資料</title>
		<%
				}else{
		%>
    	<title><%= p.getName()%></title>
    	<%} %>
		<link rel="stylesheet" type="text/css" href="/fpapa/style/header.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/product_detail.css">
		<link rel="stylesheet" type="text/css" href="/fpapa/style/footer.css">
		
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
    	<script type="text/javascript" src="/fpapa/js/loginCheck.js"></script>
    	<!-- TODO 直接購買 -->
    	
    	<script>
    		
    		$(document).ready(init);

    		function init(){
    			
    			$(".spec img").on("click", changeSpecData);
    			$("select[name=spec-grade]").on("change", changeSpecGrade);
    			
    			// 預選第一個
    			//$("input[name=spec]:first").attr("checked", true);
    			
    			$(".iconImg:first").trigger("click");
    			//$("#spec-grade").val($("#spec-grade option:first").val()).trigger("change");
    			
    			// 預設打開第一個頁籤
    			$(".tab-button").on("click", tabClickHandler);
    			openTabById('product-desc');
    			$(".tab-button:first").addClass('active-tab');
    		}
    	
    		function changeSpecData(){
    			var specName = $(this).attr("title");  
    			var specialOfferPrice = $(this).attr("data-price");
    			var photoUrl = $(this).attr("data-photo-src");
				var stock = $(this).attr("data-stock");
				var releaseDate = $(this).attr("data-release-data");
				//var unitPrice = $(this).attr("data-list-price");
    			//var specialOffer = $(this).attr("data-special-offer");
    			
    			
    			//alert(stock);
    			//alert("change:" + specName);
				//console.log("change" + $(this).attr("title"), $(this).attr("data-stock"));
				
				//修改畫面中指定位置的資料
				$("#theSpecialOfferPrice").text(specialOfferPrice);
    			$("#thePhoto").attr("src", photoUrl);
    			$("#theStock").text(stock);
				$("#theReleaseDate").text(releaseDate);
				//$("#theUnitPrice").text(unitPrice);
				//$("#theSpecialOffer").text(specialOffer);
				
				$("input[name=quantity]").attr("max", stock);
				ajaxGetSpecGradeOption(specName);	
			}
    		
    		function changeSpecGrade(){
    			//alert("changeSpecGrade :" + $("select[name=spec-grade] option:selected").attr("data-stock"));
    			  			
    			var stock = $("select[name=spec-grade] option:selected").attr("data-stock");
    			var listPrice = $("select[name=spec-grade] option:selected").attr("data-list-price");
    			var price = $("select[name=spec-grade] option:selected").attr("data-price");
    			
    			//console.log(stock, listPrice, price);
    			
    			
    			//TOTO 修改畫面中指定的位置 select 庫存
    			//$("#can-buy-stock").text(stock);
    			$("input[name=quantity]").attr("max",  stock);
    			
    			$("#theUnitPrice").text(listPrice);
    			$("#theSpecialOfferPrice").text(price);
    			
    		}
    		
    		function ajaxGetSpecGradeOption(specName){
				//Ajax請求 > get_delivery_date.jsp
				var productId = $("input[name=productId]").val();
				
    			$.ajax({
    				url: "get_spec_grade.jsp?specName=" + specName + "&productId=" + productId,
    				method: "GET"
    			}).done(ajaxGetSpecGradeOptionDone); //call back
			}
    		
    		function ajaxGetSpecGradeOptionDone(result, status, xhr){
				//alert(result);
				
				//將選項套用在 $("select[name=spec-grade]")，顯示選單
				$("select[name=spec-grade]").html(result);
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
    		
    		
    		
    		//非同步請求加入購物車
    		
    		var notAjax = false;
    		function sendAjaxAddToCart(){
				//alert("add to cart");
				
				//自行送出ajax非同步請求
				if(!notAjax){
					$.ajax({
						url: $("#cart-form").attr("action"),
						method: $("#cart-form").attr("method"),
						data: $("#cart-form").serialize()   //打包成
					
					}).done(sendAjaxAddToCartDoneHandler);
    			}
				
				//取消同步請求
				return notAjax;
				
    		}
    		
    		function sendAjaxAddToCartDoneHandler(result, status, xhr){
				alert("加入購物車成功, 共" + result.totalQty + "件");
				
				$(".totalQtySpan").text(result.totalQty);
    		}
    		
    	</script>

	</head>
	<body>
		<% request.setCharacterEncoding("utf-8"); %>
		
		<%@include file="./subviews/header.jsp" %>
		
		<div class="pageContent">
			
			<%
				// 查無資料
				if(p == null){
			%>	
					<div class="noData">
						<h2>查無產品資料</h2>
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
						<a href="product_list.jsp">買果物</a>
					</li>
					<li>
						>
					</li>
					<li>
						<%= p.getName()%>
					</li>
				</ul>
			</div>
	

			<div class="product-content">		<!-- product_detail -->
				<div class="product-detail">
				
					<div class="product-photo">
						<img id="thePhoto" src="<%= p.getPhotoUrl()%>">
					</div>
					
					<div class="product-info">
						<h2><%= p.getName()%></h2>
						<div class="product-tags">
							<ul>
								<li><%= p.getCategory() %></li>
							</ul>
						</div>
						<div class="release-date">
							上架日:<span id="theReleaseDate"> <%= p.getReleaseDate() %></span>
						</div>
						
						<div class="product-desc">
							<p><%= p.getDescription() %></p>
						</div>
						
						<div class="total-stock">
							總庫存: <span id="theStock"><%= p.getStock() %> </span>
						</div>
						
						
						<% if (p instanceof SpecialOffer){ %> 
<%-- 						<div>售價: <span id="theUnitPrice"><%= ((SpecialOffer)p).getListPrice() %> </span>元</div> --%>
						
						<div class="u-price-st">
							售價: <span id="theUnitPrice"><%= ((SpecialOffer)p).getListPrice() %></span>元
						</div>
						
						<div class="discount-string">
							優惠折扣: <%= ((SpecialOffer)p).getDiscountString()%>
						</div>
												
						<div class="s-o-price">
							優惠售價: <span id="theSpecialOfferPrice"><%= ((SpecialOffer)p).getUnitPrice() %></span>元
						</div>
							
						
						
						<% } else{%> 
						
						<div class="u-price" >
							售價: <span id="theUnitPrice"><%= p.getUnitPrice() %></span> 元
						</div>
						<%} %>	
						
						
						
						
						<div>
											  <!-- 把ajax的return false, 到這邊return給onsubmit, 取消送出同步請求 -->
							<form id="cart-form" action="add_to_cart.do" method="POST" onsubmit="return sendAjaxAddToCart()">  
								<input type="hidden" name="productId" value="<%= p.getId()%>">
								
								<% if(p.getSpecList() != null && p.getSpecList().size()>0){%>
									<div class="spec">
										<label>規格:</label>
										<% for(int i = 0 ; i < p.getSpecList().size() ; i++){ 
												ProductSpec spec = p.getSpecList().get(i);
										%>
										<label>
											<input type="radio" name="spec" value="<%=spec.getSpecName() %>" required>
											<img class="iconImg" title="<%=spec.getSpecName() %>" alt="<%=spec.getSpecName() %>" src="<%= spec.getIconUrl() %>"
													data-photo-src="<%= spec.getPhotoUrl() %>" 
													data-release-data="<%=spec.getReleaseDate() %>" 
													data-stock="<%=spec.getStock() %>" >
										</label>
										<% } %>							
									</div>
								<% } %>
								
								<!-- 是否有產品級別: -->
								<% if(p.getSpecGradeCount()>0) {%>
								
								<div class="specGrade">
									<label>產品級別:</label>
									<select id="spec-grade" name="spec-grade" required="required">
									<option value="">請先選擇規格</option>
										
									</select>
								</div>
								<% }%>
								
								<div>
									<label>數量:</label>
									<input type="number" name="quantity" required  min="1" max="3">
									
								</div>
								<div>
									<input class="addToCart-btn" type="submit" value="加入購物車">
									<!--  <button id="login-check" class="addToCart-btn" type="submit" name="submit" value="notAjax" onclick="notAjax = true;">直接購買</button>  -->
								</div>
							</form>
						</div>
					</div>
					
				</div>
				
				
				<div class="tabs">
				  <button class="tab-button" data-tab="product-desc">產品描述</button>
				  <button class="tab-button" data-tab="product-spec-desc">產品規格</button>
				  <button class="tab-button" data-tab="product-notice">注意事項</button>
				</div>

				<div id="product-desc" class="tab-content">
				  <p><%= p.getDescription() %></p>
				</div>
				
				<div id="product-spec-desc" class="tab-content" style="display:none;">
				  <h3>產品規格</h3>
				  <p>產品規格的內容。</p>
				</div>

				<div id="product-notice" class="tab-content" style="display:none;">
				  <h3>注意事項</h3>
				  <p>注意事項的內容</p>
				</div>
				
				
				<script>
					<% if(p.getSpecList().size() == 0 && p.getSpecGradeCount()>0){%>
							//alert("應帶入規格資料");
							ajaxGetSpecGradeOption("");
					<% }%>
				</script>
				
		<% } %>
			
		</div>
		
		<%@include file="./subviews/footer.jsp" %>
		
	</body>
</html>
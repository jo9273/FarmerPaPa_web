<%@page import="jojo.farmerpapa.entity.ShippingType"%>
<%@page import="jojo.farmerpapa.entity.ShoppingCart"%>
<%@page import="jojo.farmerpapa.entity.PaymentType"%>
<%@page import="jojo.farmerpapa.entity.SpecialOffer"%>
<%@page import="jojo.farmerpapa.entity.CartItem"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>購物車結帳</title>
				
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/header.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/cart.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/form.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/footer.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
    	<script type="text/javascript" src="/fpapa/js/loginCheck.js"></script>
    	<script>
    	 	$(init);
			
			function init(){
				$('#the-buyer-checkbox').on('change', sameWithBuyerHandler);
				
			    $("select[name=shippingType]").on("change", changeShippingOption);

			}
			
			function sameWithBuyerHandler(){

				if($(this).is(':checked')){
					getMemberInfo();
				}else{
					clearMemberInfo();
				}
			}
			
			// 同步訂購人資料到收件人欄位
			function getMemberInfo() {
			    // 將訂購人資料同步到貨運宅配
			    $('#recipt-name-home').val('${sessionScope.member.getName()}');
			    $('#recipt-phone-home').val('${sessionScope.member.getPhone()}');
			    $('#recipt-address-home').text('${sessionScope.member.getAddress()}');
			    
			    // 同步到超商取貨
			    $('#recipt-name-cvs').val('${sessionScope.member.getName()}');
			    $('#recipt-phone-cvs').val('${sessionScope.member.getPhone()}');
			    
			    // 同步到門市取貨
			    $('#recipt-name-store').val('${sessionScope.member.getName()}');
			    $('#recipt-phone-store').val('${sessionScope.member.getPhone()}');
			}

			// 清空收件人資料
			function clearMemberInfo() {
			    // 清空貨運宅配資料
			    $('#recipt-name-home').val('');
			    $('#recipt-phone-home').val('');
			    $('#recipt-address-home').text('');
			    
			    // 清空超商取貨資料
			    $('#recipt-name-cvs').val('');
			    $('#recipt-phone-cvs').val('');
			    
			    // 清空門市取貨資料
			    $('#recipt-name-store').val('');
			    $('#recipt-phone-store').val('');
			}
			
			
			function changeShippingOption(){				
			    // 根據選擇的配送方式顯示對應的欄位
			    var selectedShipping = $("select[name=shippingType] option:selected").val();
			    
			    // 隱藏所有的配送選項
			    $(".delivery-option").hide();

			    // 根據選擇的配送方式顯示對應的輸入欄位
			    if (selectedShipping === 'HOME') {
			        $("#home-delivery").show();
			    } else if (selectedShipping === 'STORE') {
			        $("#store-pickup").show();
			    } else if (selectedShipping === 'CVS') {
			        $("#cvs-pickup").show();
			    }
				
			 	//處理付款方式的邏輯
			    $("select[name=paymentType] option").prop("disabled", true);
			    $("select[name=paymentType] option[value='']").removeAttr("disabled");

			    if ($("select[name=shippingType] option:selected").val() != '') {
			        var array = $("select[name=shippingType] option:selected").attr("data-array").split(',');
			        for (var i = 0; i < array.length; i++) {
			            $("select[name=paymentType] option[value='" + array[i] + "']").removeAttr("disabled");
			        }
			    }

			    if ($("select[name=paymentType] option:selected").prop("disabled")) {
			        $("select[name=paymentType]").val("");
			    }
			    
			    // 呼叫 calculateFee 函數，計算費用
			    calculateFee();
			}
			
			
			function calculateFee(){
				//alert("calculateFee");
				var amount = Number($("#totalAmount").text());
				var shippingFee=0;
				var paymentFee=0;
				if($("select[name=shippingType] option:selected").val()!=''){
					shippingFee = Number($("select[name=shippingType] option:selected").attr("data-fee"));
				}
				if($("select[name=paymentType] option:selected").val()!=''){
					paymentFee = Number($("select[name=paymentType] option:selected").attr("data-fee"));
				}
				//alert(amount+shippingFee+paymentFee);
				$("#totalAmountWithFee").text(amount + shippingFee + paymentFee);				
			}
			
			
			
    	</script>
        
    	

	</head>
	<body>
	
		<%@include file="../subviews/header.jsp" %>
		<div class="pageContent">
			<div class="cart-content">
				
				<%
					//"cart" 名稱要對應到servlet的setAttribute "cart"
					ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");  
					if(cart == null || cart.isEmpty()){
				%>
			
				<div class="cart-empty">
					<h2>購物車空空的</h2>
					<img alt="empty" src="../images/cart-empty.png">
					<a class="empty-a" href="<%= request.getContextPath()%>/product_list.jsp">前往購物</a>
				
				</div>
				<% }else{ %>
			
			
				<h2>購物車</h2>
				
				<ul class="steps">
					<li class="step">
						<span class="step-index">1</span>
						<p class="step-title">確認購物車</p>
					</li>
					
					<li class="step-active">
						<span class="step-index">2</span>
						<p class="step-title">確認收件與付款資料</p>
					</li>
															
					<li class="step">
						<span class="step-index">3</span>
						<p class="step-title">購買完成</p>
					</li>
				</ul>

				<form action="" method="">
					<section>
						<h2 class="section-title">訂購人資料</h2>
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>訂購人姓名：</label>
							</div>
							<div class="row-content">
					        	<input type="text" name="name" required 
					        			placeholder="請輸入姓名2~20字" disabled minlength="2" maxlength="20"
					        			value="${sessionScope.member.getName()}">
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>訂購人手機號碼：</label>
							</div>
							<div class="row-content">	
								<input type="tel" name="phone" disabled required 
										placeholder="請輸入手機號碼" pattern="[0][9][0-9]{8}"
										value="${sessionScope.member.getPhone()}">
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>訂購人Email：</label>
							</div>
							<div class="row-content">	
								<input type="email" name="email" disabled required 
										placeholder="請輸入email"
										value="${sessionScope.member.getEmail()}">
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>訂購人地址：</label>
							</div>
							<div class="row-content">	
					            <textarea name="address" disabled placeholder="尚未設定地址" rows="2" cols="30">${sessionScope.member.getAddress()}</textarea>
							</div>
						</div>
					</section>
					<section>
						<h2 class="section-title">收件人資料</h2>
						
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>配送方式：</label>
							</div>
							<div class="row-content">
								<select name="shippingType" required onchange="changeShippingOption()">
									<option value=''>請選擇配送方式</option>
									<% for(int i=0;i<ShippingType.values().length;i++) {		
										ShippingType shType = ShippingType.values()[i];
									%>
									<option value='<%= shType.name()%>' data-fee="<%= shType.getFee()%>"
										data-array='<%= shType.getPaymentTypeArrayStr() %>'>									
										<%= shType%>									
									</option>
									<% } %>
							</select>
							</div>
						</div>

						<div class="form-detail">
							<div class="row-title">
								<input id="the-buyer-checkbox" type="checkbox" name="same-with-buyer">
							</div>
							<div class="row-content">	
								<span>同訂購人資料</span>
							</div>
						</div>
						
						<!-- 貨運宅配欄位 -->
						<div id="home-delivery" class="delivery-option" style="display:none;">
							<div class="form-detail">
								<div class="row-title">
									<label><sup>*</sup>收件人姓名：</label>
								</div>
								<div class="row-content">	
						       		<input id="recipt-name-home" type="text" name="name" required placeholder="請輸入姓名2~20字" minlength="2" maxlength="20">
								</div>
							</div>
							<div class="form-detail">
								<div class="row-title">
									<label><sup>*</sup>收件人手機號碼：</label>
								</div>
								<div class="row-content">	
									<input id="recipt-phone-home" type="tel" name="phone" required placeholder="請輸入手機號碼" pattern="[0][9][0-9]{8}">
								</div>
							</div>
							
							<div class="form-detail">
								<div class="row-title">
									<label><sup>*</sup>收件人地址：</label>
								</div>
								<div class="row-content">	
					           		<textarea id="recipt-address-home" name="address" required placeholder="請輸入地址" rows="2" cols="30"></textarea>
								</div>
							</div>
							<div class="form-detail">
								<div class="row-title">
									<label>希望配送時段：</label>
								</div>
								<div class="row-content">	
									<input id="theRadio" type="radio" name="delivery_time" value="not-specified" checked><span>不指定</span>
									<input id="theRadio" type="radio" name="delivery_time" value="13pm"><span>13:00前</span>
									<input id="theRadio" type="radio" name="delivery_time" value="18pm"><span>18:00前</span>
								</div>
							</div>
						</div>
						
						<!-- 超商取貨欄位 -->
						<div id="cvs-pickup" class="delivery-option" style="display:none;">
							<div class="form-detail">
								<div class="row-title">
									<label><sup>*</sup>收件人姓名：</label>
								</div>
								<div class="row-content">	
						       		<input id="recipt-name-cvs" type="text" name="name" required placeholder="請輸入姓名2~20字" minlength="2" maxlength="20">
								</div>
							</div>
							<div class="form-detail">
								<div class="row-title">
									<label><sup>*</sup>收件人手機號碼：</label>
								</div>
								<div class="row-content">	
									<input id="recipt-phone-cvs" type="tel" name="phone" required placeholder="請輸入手機號碼" pattern="[0][9][0-9]{8}">
								</div>
							</div>
							<div class="form-detail">
								<div class="row-title">
									<label><sup>*</sup>選擇超商門市：</label>
								</div>
								<div class="row-content">	
									<input type="button" value="選擇超商">	
								</div>
							</div>
						</div>
						
						<!-- 門市取貨欄位 -->
						<div id="store-pickup" class="delivery-option" style="display:none;">
							<div class="form-detail">
								<div class="row-title">
									<label><sup>*</sup>收件人姓名：</label>
								</div>
								<div class="row-content">	
						       		<input id="recipt-name-store" type="text" name="name" required placeholder="請輸入姓名2~20字" minlength="2" maxlength="20">
								</div>
							</div>
							<div class="form-detail">
								<div class="row-title">
									<label><sup>*</sup>收件人手機號碼：</label>
								</div>
								<div class="row-content">	
									<input id="recipt-phone-store" type="tel" name="phone" required placeholder="請輸入手機號碼" pattern="[0][9][0-9]{8}">
								</div>
							</div>
							<div class="form-detail">
								<div class="row-title">
									<label><sup>*</sup>選擇門市：</label>
								</div>
								<div class="row-content">	
									 <select name="storeList">
										<option>101旗艦店 台北市信義區信義路五段7號</option>
										<option>復北門市 台北市復興北路99號1F</option>									
							 		</select>
								</div>
							</div>
						
						</div>
						
						<div class="form-detail">
							<div class="row-title">
								<input id="theCheckbox" type="checkbox" name="check-for-gift">
							</div>
							<div class="row-content">	
								<span>是否送禮用</span>
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label>備註：</label>
							</div>
							<div class="row-content">	
				           		<textarea name="remark" placeholder="請輸入備註" rows="2" cols="30"></textarea>
							</div>
						</div>
					</section>
					
					<section>
						<h2 class="section-title">付款方式</h2>
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>付款方式：</label>
							</div>
							<div class="row-content">
								<select name="paymentType" required onchange="calculateFee()">
									<option value=''>請選擇付款方式</option>
									<% for(PaymentType pType:PaymentType.values()){ %>
									<option value='<%= pType.name()%>' data-fee=<%=pType.getFee() %>><%=pType %></option>
									<% } %>
								</select>
							</div>
							
						</div>
						
					</section>
					
					<section>
						<details>
							<summary class="summary">
								共<%= cart.getTotalQuantity() %>件, 總金額: <span id="totalAmountWithFee"><%= cart.getTotalAmount() %></span>元 (點選即可看到明細)
							</summary>
							<table class="cartDetails">
								<caption>購物明細</caption>
								<thead>
									<tr class="table-header">
										<td>產品</td>
										<td>單價</td>
										<td>數量</td>
										<td>小計</td>
										
									</tr>
								</thead>
								<tbody>
								
									<%
										Set<CartItem> itemSet = cart.getCartItemsSet();
										for(CartItem item:itemSet){	
									%>
									
									<tr class="table-detail">
										<td class="order-products">
											<div class="product-photo">
												<img src="<%= item.getPhotoUrl() %>">
											</div>
											<div class="product-info">
												<span class="product-id">產品編號：<%= item.getProductId() %></span>									
												<span class="product-name"><%= item.getProductName() %></span>
												<%= !item.getSpecName().isEmpty() ? "<span>規格：" + item.getSpecName() + "</span>" : "" %>	
												<%= !item.getSpecGrade().isEmpty()? "<span>等級：" + item.getSpecGrade() + "</span>" : "" %>
											</div>
										</td>
										<td class="order-price">
											<% if(item.getTheProduct() instanceof SpecialOffer){ %>
												<span class="u-price-st">售價：<%= item.getListPrice() %>元</span>
												<span>折扣：<%= item.getDiscountString() %></span>
												<span>優惠售價： <%= item.getPrice() %>元</span>
											<%}else{ %>
												<span>優惠售價: <%= item.getPrice() %>元</span>
											<%} %>
										</td>
										
										<td>
											<div class="qty">
												<span class="qty-value" data-max="<%= item.getStock()%>">
													<%= cart.getQuantity(item) %>
												</span>
											</div>
										</td>
										<td>
											<%= cart.getAmount(item) %>元
										</td>
									</tr>
									
									<% } %>
									
								</tbody>
								<tfoot>
									<tr class="table-count">
										<td colspan="3">品項數量：<%= cart.size() %>項</td>
										<td colspan="4">品項件數：<%= cart.getTotalQuantity() %>件</td>
									</tr>
									<tr class="table-count">
										<td colspan="5">產品總金額：<span id="totalAmount"><%= cart.getTotalAmount() %></span>元</td>
									</tr>
								</tfoot>	
							</table>
						</details>
					</section>
					
					<div class="cartAction">	
						<input class="gotoshop-btn" type="button" value="再逛一下" onclick="location.href='../product_list.jsp';">		
						<input id="login-check" class="checkout-btn" type="button" value="確認結帳" onclick="location.href='check_out.jsp';">
					</div>	

				</form>

				<% } %>
			</div>
		</div>
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
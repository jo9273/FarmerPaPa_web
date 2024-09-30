<%@page import="jojo.farmerpapa.entity.ShippingType"%>
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
    	
    	<script>
    	 	$(init);
			
			function init(){
				$('#the-buyer-checkbox').on('change', sameWithBuyerHandler);
			}
			
			function sameWithBuyerHandler(){

				if($(this).is(':checked')){
					getMemberInfo();
				}else{
					clearMemberInfo();
				}
			}
			
			function getMemberInfo(){
				$('#recipt-name').val('${sessionScope.memberLogin.getName()}');
				$('#recipt-phone').val('${sessionScope.memberLogin.getPhone()}');
				$('#recipt-address').text('${sessionScope.memberLogin.getAddress()}');
			}
			
			function clearMemberInfo(){
				$('#recipt-name').val('');
				$('#recipt-phone').val('');
				$('#recipt-address').text('');
			}
			
			
    	</script>
        
    	

	</head>
	<body>
	
		<%@include file="../subviews/header.jsp" %>
		<div class="pageContent">
			<div class="cart-content">
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
					        			value="${sessionScope.memberLogin.getName()}">
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>訂購人手機號碼：</label>
							</div>
							<div class="row-content">	
								<input type="tel" name="phone" disabled required 
										placeholder="請輸入手機號碼" pattern="[0][9][0-9]{8}"
										value="${sessionScope.memberLogin.getPhone()}">
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>訂購人Email：</label>
							</div>
							<div class="row-content">	
								<input type="email" name="email" disabled required 
										placeholder="請輸入email"
										value="${sessionScope.memberLogin.getEmail()}">
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>訂購人地址：</label>
							</div>
							<div class="row-content">	
					            <textarea name="address" disabled placeholder="尚未設定地址" rows="2" cols="30">${sessionScope.memberLogin.getAddress()}</textarea>
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
								<input id="shipping-ds" type="radio" name="shipping-type" value="<%=ShippingType.HOME%>" checked>
								<span><%=ShippingType.HOME.getDescription()%>, 運費:<%=ShippingType.HOME.getFee() %>元</span>
								
								<input id="shipping-cvs" type="radio" name="shipping-type" value="<%=ShippingType.CVS%>">
								<span><%=ShippingType.CVS.getDescription()%>, 運費:<%=ShippingType.CVS.getFee() %>元</span>
								
								<input id="shipping-store" type="radio" name="shipping-type" value="<%=ShippingType.STORE%>">
								<span><%=ShippingType.STORE.getDescription()%>, 運費:<%=ShippingType.STORE.getFee() %>元</span>
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
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>收件人姓名：</label>
							</div>
							<div class="row-content">	
					       		<input id="recipt-name" type="text" name="name" required placeholder="請輸入姓名2~20字" minlength="2" maxlength="20">
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>收件人手機號碼：</label>
							</div>
							<div class="row-content">	
								<input id="recipt-phone" type="tel" name="phone" required placeholder="請輸入手機號碼" pattern="[0][9][0-9]{8}">
							</div>
						</div>
						
						<div class="form-detail">
							<div class="row-title">
								<label><sup>*</sup>收件人地址：</label>
							</div>
							<div class="row-content">	
				           		<textarea id="recipt-address" name="address" required placeholder="請輸入地址" rows="2" cols="30"></textarea>
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
								<input id="payment-card" type="radio" name="payment-type" value="pay-in-card" checked><span>信用卡付款</span>
								<input id="payment-atm" type="radio" name="payment-type" value="pay-in-atm"><span>ATM轉帳</span>	
								<input id="payment-cvs" type="radio" name="payment-type" value="pay-in-cvs"><span>超商付款</span>
							</div>
						</div>
						
					</section>
					
					<div class="cartAction">	
						<input class="gotoshop-btn" type="button" value="再逛一下" onclick="location.href='../product_list.jsp';">		
						<input class="checkout-btn" type="button" value="確認結帳" onclick="location.href='check_out.jsp';">
					</div>	

				</form>
			</div>
		</div>
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
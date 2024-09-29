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
    	
    	<script></script>
        
    	<style></style>

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
						<p class="step-title">填寫收件資料</p>
					</li>
					
					<li class="step">
						<span class="step-index">3</span>
						<p class="step-title">確認付款方式</p>
					</li>
					
					<li class="step">
						<span class="step-index">4</span>
						<p class="step-title">購買完成</p>
					</li>
				</ul>
				
				<form action="" method="">
					<section>
						<h2 class="section-title">訂購人資料</h2>
						<div class="form-detail">
							<div class="row-title">
								<label>訂購人姓名：</label>
							</div>
							<div class="row-content">
					        	<input type="text" name="name" required placeholder="請輸入姓名2~20字" minlength="2" maxlength="20">
					        	<span class="hint">必填</span>
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label>訂購人手機號碼：</label>
							</div>
							<div class="row-content">	
								<input type="tel" name="phone" required placeholder="請輸入手機號碼" pattern="[0][9][0-9]{8}">
								<span class="hint">必填</span>
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label>訂購人Email：</label>
							</div>
							<div class="row-content">	
								<input type="email" name="email" required placeholder="請輸入email">
								<span class="hint">必填</span>
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label>訂購人地址：</label>
							</div>
							<div class="row-content">	
					            <textarea name="address" required placeholder="請輸入地址" rows="2" cols="30"></textarea>
								<span class="hint">必填</span>
							</div>
						</div>
					</section>
					<section>
						<h2 class="section-title">收件人資料</h2>
						<div class="form-detail">
							<div class="row-title">
								<input id="theCheckbox" type="checkbox" name="same-with-buyer">
							</div>
							<div class="row-content">	
								<span>同訂購人資料</span>
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label>收件人姓名：</label>
							</div>
							<div class="row-content">	
					       		<input type="text" name="name" required placeholder="請輸入姓名2~20字" minlength="2" maxlength="20">
								<span class="hint">必填</span>
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label>收件人手機號碼：</label>
							</div>
							<div class="row-content">	
								<input type="tel" name="phone" required placeholder="請輸入手機號碼" pattern="[0][9][0-9]{8}">
								<span class="hint">必填</span>
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label>收件人地址：</label>
							</div>
							<div class="row-content">	
				           		<textarea name="address" required placeholder="請輸入地址" rows="2" cols="30"></textarea>
								<span class="hint">必填</span>
							</div>
						</div>
						<div class="form-detail">
							<div class="row-title">
								<label>希望配送時段：</label>
							</div>
							<div class="row-content">	
								<input id="theRadio" type="radio" name="delivery_time" value="不指定" checked><span>不指定</span>
								<input id="theRadio" type="radio" name="delivery_time" value="13:00前"><span>13:00前</span>
								<input id="theRadio" type="radio" name="delivery_time" value="18:00前"><span>18:00前</span>
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
					<div class="cartAction">	
						<input class="gotoshop-btn" type="button" value="再逛一下" onclick="location.href='../product_list.jsp';">		
						<input class="checkout-btn" type="button" value="確認付款方式" onclick="location.href='check_out.jsp';">
					</div>	

				</form>
			</div>
		</div>
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
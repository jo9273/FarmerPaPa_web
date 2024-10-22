<%@page import="java.time.LocalDate"%>
<%@page import="jojo.farmerpapa.service.OrderService"%>
<%@page import="jojo.farmerpapa.entity.Order"%>
<%@page import="jojo.farmerpapa.entity.PaymentType"%>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

   <head>
   	  <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>通知已轉帳</title>

        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/header.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/order.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/form.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/cart.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/footer.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
    	

   </head>
   <body>

   <%@include file="../subviews/header.jsp" %>
   <div class="pageContent">

   <%           

         String orderId = request.getParameter("orderId");

         Order order = null;

         OrderService oService = new OrderService();

         if(member!=null && orderId!=null){

             order = oService.getOrderById(member, orderId);              

         }       

    %>

   		<div class="formContent">
   			<article>
				<h2>通知ATM轉帳</h2>
			    <% if(order==null || !(PaymentType.ATM==order.getPaymentType() && order.getStatus()==0)){%>
			
			         <p>查無需通知轉帳的訂單資料，回<a href='orders_history.jsp'>歷史訂單</a></p>
			
			    <% }else{%>
				<div class="theForm">
		    		<form action='atm_transfered.do' method='POST'>
		
				         <div class="form-detail">
				         	<div class="row-title">
								<label>訂單編號：</label>
							</div>
							<div class="row-content">
				             	<input type='hidden' name='orderId' value='<%= orderId%>' readonly>
								<input value='<%= order.getId()%>' readonly>
							</div>
				         </div>
				
				         <div class="form-detail">
							<div class="row-title">
				             	<label>轉帳銀行：</label>
							</div>
							<div class="row-content">
				             	<input name='bank' required placeholder='請輸入轉帳銀行名稱'>
							</div>
				         </div>
				
				         <div class="form-detail">
							<div class="row-title">
								<label>帳號後5碼：</label>
							</div>
							<div class="row-content">
				             	<input name='last5Code' required placeholder='請輸入轉帳帳號後5碼'>
							</div>
				         </div>
				
				         <div class="form-detail">
							<div class="row-title">
								<label>轉帳金額：</label>
							</div>
							<div class="row-content">
				             	<input name='amount' name='amount' required value='<%= order.getTotalAmountWithFee() %>' >
							</div>
				         </div>
				
				         <div class="form-detail">
							<div class="row-title">
								<label>轉帳時間：</label>
							</div>
							<div class="row-content">
				             	<input type='date' name='transDate' required min='<%= order.getCreatedDate()%>' max='<%= LocalDate.now()%>'>
				
				             	<input type='time' name='transTime' required>
							</div>
				         </div>
				
				         <div class="atmAction">
				
				             <input class="atm-reset-btn" type="reset" value='Reset'>
				
				             <input class="atm-submit-btn" type="submit" value='確定'>
				
				         </div>
				
				    </form>
				</div>
		
		    	<% } %>
		    </article>
		</div>
   </div>

   <%@include file='/subviews/footer.jsp' %>

</body>

</html>
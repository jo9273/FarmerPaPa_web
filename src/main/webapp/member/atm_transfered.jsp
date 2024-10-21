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

   <%           

         String orderId = request.getParameter("orderId");

         Order order = null;

         OrderService oService = new OrderService();

         if(member!=null && orderId!=null){

             order = oService.getOrderById(member, orderId);              

         }       

    %>

   <article>

    <% if(order==null || !(PaymentType.ATM==order.getPaymentType() && order.getStatus()==0)){%>

         <p>查無需通知轉帳的訂單資料，回<a href='orders_history.jsp'>歷史訂單</a></p>

    <% }else{%>

    <form action='atm_transfered.do' method='POST' style='width: 20em;margin: auto;'>

         <p>

             <label>訂單編號:</label>

             <input type='hidden' name='orderId' value='<%= orderId%>' readonly>

             <input value='<%= order.getId()%>' readonly>

         </p>

         <p>

             <label>轉帳銀行:</label>

             <input name='bank' required placeholder='請輸入轉帳銀行名稱'>

         </p>

         <p>

             <label>帳號後5碼:</label>

             <input name='last5Code' required placeholder='請輸入轉帳帳號後5碼'>

         </p>

         <p>

             <label>轉帳金額:</label>

             <input name='amount' name='amount' required value='<%= order.getTotalAmountWithFee() %>' >

         </p>

         <p>

             <label>轉帳時間:</label>

             <input type='date' name='transDate' required min='<%= order.getCreatedDate()%>' max='<%= LocalDate.now()%>'>

             <input type='time' name='transTime' required>

         </p>

         <p style='text-align:right'>

             <input type="reset" value='Reset'>

             <input type="submit" value='確定'>

         </p>

    </form>

    <% } %>

   </article>

   <%@include file='/subviews/footer.jsp' %>

</body>

</html>
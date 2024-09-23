<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<%
String specName = request.getParameter("specName");
String productId = request.getParameter("productId");
if ("1200g".equals(specName)){
%>

<!-- AJAX get_delivery_date_stock start-->
<option value="">請選擇</option>
<option data-stock="5">2024-09-30</option>

<%
} else{
%>
<option value="">請選擇</option>
<option data-stock="10">2024-10-25</option>
<%} %>

<!-- AJAX get_delivery_date_stock end-->
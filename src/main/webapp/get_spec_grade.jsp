<%@page import="jojo.farmerpapa.entity.ProductSpecGrade"%>
<%@page import="jojo.farmerpapa.service.ProductService"%>
<%@page import="jojo.farmerpapa.entity.ProductSpecGrade"%>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!-- AJAX get_delivery_date start-->
<%
	String specName = request.getParameter("specName");
	String productId = request.getParameter("productId");
	
	List<ProductSpecGrade> list=null;
	ProductService pService = new ProductService();
	
	if(productId != null && specName != null){
		list = pService.getSpecGradeByIdAndSpecName(productId, specName);
	}
	
	
	if(list != null && list.size() > 0){
%>
		<option value="">請選擇</option>
<%	
		for(int i = 0 ; i < list.size() ; i++){
			ProductSpecGrade psg = list.get(i);
%>
		<!-- data-list-price, data-price 目前沒用-->
		<option data-stock="<%= psg.getStock() %>"
				data-list-price="<%= psg.getUnitPrice() %>"
				data-price="<%= psg.getPrice() %>" >
				
				<%= psg.getSpecGrade() %>
		</option>
	
		<% } %>
	<%} else{ %>
	
	<option value="">查無日期</option>
	
	<%} %>

<!-- AJAX get_delivery_date end-->
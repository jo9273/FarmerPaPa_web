<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>FarmerPaPa 購物車</title>
				
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/header.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/footer.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
    	
    	<script></script>
        
    	<style>
    	
    		.cartDetails {
    			border-collapse: collapse;
    			width: 85%;margin: auto;
			}
			
			
			.cartDetails td, .cartDetails th {
			 	border: 1px solid #ddd;
			  	padding: 8px;
			}
			
			.cartDetails tr:nth-child(even){
				background-color: #f2f2f2;}
			
			.cartDetails tr:hover {
				background-color: #ddd;}
			
			.cartDetails caption {
			  	padding-top: 12px;
			  	padding-bottom: 12px;		  
			  	background-color: #04AA6D;
			  	color: white;
			}
			
			.table-header{
				font-weight: bold;
				text-align: center;
				
			}
    		
    		.table-detail{
    			text-align: center;
    		}
    		
    		.order-products, .order-price{
    			text-align: left; 
    		}
    		
    		.order-products img{
    			width: 150px;
    			float: left;
    			margin-right: 15px;
    		}
    		
    		.order-products span, .order-price span{
    			display: block;
    			margin-bottom: 5px;
    		}
    		
    		    		
    	
    	</style>

	</head>
	<body>
	
		<%@include file="../subviews/header.jsp" %>
		<div class="pageContent">
			
			<table class="cartDetails">
				<caption>購物明細</caption>
				<thead>
					<tr class="table-header">
						<td>產品編號</td>
						<td>產品名稱/規格/等級</td>
						<td>售價/折扣/優惠售價</td>
						<td>數量</td>
						<td>小計</td>
						<td>刪除</td>
					</tr>
				</thead>
				<tbody>
					<tr class="table-detail">
						<td>1</td>
						<td class="order-products">
							<img src="https://firebasestorage.googleapis.com/v0/b/wanwaninfo-public-tw/o/www.syunkaya.com.tw%2Fproduct%2Fcover%403x-%E3%80%90%E9%99%90%E9%87%8F%E9%A0%90%E8%B3%BC%E3%80%91%E5%B1%B1%E6%A2%A8%E7%94%B2%E6%96%90%E7%8F%8D%E7%8F%A0%E9%BA%9D%E9%A6%99%E6%A1%90%E6%9C%A8%E5%96%AE%E6%88%BF%E7%A6%AE%E7%9B%92%28%E7%B4%84600g%E9%87%8D%29-ldTfTa6B7w172233095177012.jpg?alt=media">
							<span>產品名稱:【限量預購】山梨甲斐珍珠麝香桐木禮盒</span>
							<span>規格:單房禮盒</span>
							<span>等級:特秀</span>
						</td>
						<td class="order-price">
							<span>售價:4299元</span>
							<span>折扣:79折</span>
							<span>優惠售價: 3396.21元</span>
						</td>
						<td>3</td>
						<td>10188.63</td>
						<td>不刪除</td>
					</tr>
				</tbody>
				<tfoot>
					<tr class="table-count">
						<td>購買數量:3件</td>
						<td>商品總金額:10,189元</td>
					</tr>
				</tfoot>
			</table>
			
			
		
		
		</div>
		<%@include file="../subviews/footer.jsp" %>
	</body>
</html>
<%@page import="java.util.List"%>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>insert title here</title>
				
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/header.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/fpapa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/qa.css">
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/style/footer.css">	
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
	
		<script>
			$(document).ready(init);
	
			function init(){
												
				// 預設打開第一個頁籤
				$(".tab-button").on("click", tabClickHandler);
				openTabById('fq-order'); 
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
			
		</script>
		
	</head>
	<body>
	
		<%@include file="./subviews/header.jsp" %>
		<div class="pageContent">
			<div class="qa-content">
				<h2>常見問題</h2>
				
				<div class="tabs">
				 	<button class="tab-button" data-tab="fq-order">訂單與商品問題</button>
				 	<button class="tab-button" data-tab="fq-payment">付款問題</button>
					<button class="tab-button" data-tab="fq-shipping">配送問題</button>
				</div>
				
				<div id="fq-order" class="tab-content">
					<button class="accordion">Section 1</button>
					<div class="panel">
				  		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
				
					<button class="accordion">Section 2</button>
					<div class="panel">
				  		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
				
					<button class="accordion">Section 3</button>
					<div class="panel">
				  		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
				</div>
				
				<div id="fq-payment" class="tab-content" style="display:none;">
					<button class="accordion">Section 1</button>
					<div class="panel">
				  		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
					<button class="accordion">Section 2</button>
					<div class="panel">
				  		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
					</div>
				</div>
				
				<div id="fq-shipping" class="tab-content" style="display:none;">
				</div>
				
				<script type="text/javascript" src="/fpapa/js/accordion.js"></script>
			</div>
		</div>
		<%@include file="./subviews/footer.jsp" %>
	</body>
</html>
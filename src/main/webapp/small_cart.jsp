<%@page import="jojo.farmerpapa.entity.ShoppingCart"%>
<%@page pageEncoding="UTF-8" contentType="application/json"%>


<%--
	ShoppingCart cart = (ShoppingCart)session.setAttribute("cart");
	if(cart != null && cart.size() > 0){
		Set<CartItem> cartItemSet = cart.getCartItemSet();
--%>

		{
		"totalQty": ${sessionScope.cart.getTotalQuantity()+0}
		}


<%--


		"cart":[
			{"name":"葡萄", "spec":"單房", "specGrade":"特秀", "qty":"2"},
			{"name":"葡萄", "spec":"雙房", "specGrade":"青秀", "qty":"2"}
			]
		}	
--%>
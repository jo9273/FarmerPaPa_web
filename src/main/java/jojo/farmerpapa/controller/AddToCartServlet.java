package jojo.farmerpapa.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jojo.farmerpapa.entity.Product;
import jojo.farmerpapa.entity.ProductSpecGrade;
import jojo.farmerpapa.entity.ShoppingCart;
import jojo.farmerpapa.exception.FarmerpapaException;
import jojo.farmerpapa.service.ProductService;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/add_to_cart.do")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddToCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> addToCartErrors = new ArrayList<>();
		HttpSession session = request.getSession();
		
		// 1. 取得request中的form data
		// productId=1&spec=單房禮盒&spec-grade=青秀&quantity=2
		String productId = request.getParameter("productId");
		String spec = request.getParameter("spec");
		String specGrade = request.getParameter("spec-grade");
		String quantity = request.getParameter("quantity");
		
		if(productId != null) {
			ProductService pService = new ProductService();
			
			try {
				Product p = pService.getProductById(productId);
				if(p != null) {
					ProductSpecGrade theSpecGrade = null;
					if(p.getSpecGradeCount()>0) {
						theSpecGrade = pService.getTheSpecGrade(productId, spec, specGrade);
					}
					
					if(quantity != null && quantity.matches("\\d+")) {
						ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
						
						if(cart == null) {
							cart = new ShoppingCart();
							session.setAttribute("cart", cart);
						}
						cart.addToCart(p, spec, theSpecGrade, Integer.parseInt(quantity));
						
					}else {
						addToCartErrors.add("加入Cart失敗, 購買數量不正確" + quantity);
					}
				}else {
					addToCartErrors.add("加入Cart失敗, 查無[" + productId + "]產品");
				}
			}catch (FarmerpapaException e) {
				this.log("加入cart失敗", e);
			}
		}else {
			addToCartErrors.add("加入Cart失敗, productId不得為null");
		}
		
		if(addToCartErrors.size()>0)
			this.log("加入Cart發生錯誤" + addToCartErrors);
		
		
		String submit = request.getParameter("submit");
		if( submit != null) {
			//3.原來是同步請求, 才會用外部轉址到cart.jsp
			// TODO 直接購買功能
			response.sendRedirect("member/cart.jsp");
		}else {
		
		//3.現在改成非同步請求, 內部轉交到small_cart.jsp
		request.getRequestDispatcher("small_cart.jsp").forward(request, response);
		}
	}

}

package jojo.farmerpapa.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jojo.farmerpapa.entity.Customer;
import jojo.farmerpapa.entity.Order;
import jojo.farmerpapa.entity.PaymentType;
import jojo.farmerpapa.entity.ShippingType;
import jojo.farmerpapa.entity.ShoppingCart;
import jojo.farmerpapa.exception.FarmerpapaException;
import jojo.farmerpapa.service.OrderService;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/member/check_out.do")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList<>();
		
		HttpSession session = request.getSession();
		Customer member = (Customer)session.getAttribute("member");
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		
		if(cart != null && cart.size() > 0) {
			//1. 取得form data
			String shippingType = request.getParameter("shippingType");
			String paymemntType = request.getParameter("paymentType");
			
			String name = request.getParameter("sh-name");
			String email = member.getEmail();
			String phone = request.getParameter("sh-phone");
			String shippingAddress = request.getParameter("sh-address");	
			
			//TODO: 檢查
			if(shippingType == null || (shippingType = shippingType.trim()).length() == 0)  //防止空白造成java.lang.IllegalArgumentException, 使用trim處理
				errors.add("必須選擇貨運方式");			
			
			if(paymemntType == null || (paymemntType = paymemntType.trim()).length() == 0) 
				errors.add("必須選擇付款方式");			
			
			if(name == null || (name = name.trim()).length() == 0) 
				errors.add("必須輸入收件人姓名");			
			
			if(email == null || (email = email.trim()).length() == 0) 
				errors.add("必須輸入收件人Email");			
			
			if(phone == null || (phone = phone.trim()).length() == 0) 
				errors.add("必須輸入收件人手機");			
			
			if(shippingAddress == null || (shippingAddress = shippingAddress.trim()).length() == 0) 
				errors.add("必須輸入取件地點");	
			
			
			//建立訂單()
			if(errors.isEmpty()) {
				try {
					ShippingType shType = ShippingType.valueOf(shippingType);		//編譯時 valueOf 會自動加static method		
					PaymentType pType = PaymentType.valueOf(paymemntType);
					
					Order order = new Order();
					order.setMember(cart.getMember());
					order.setCreatedDate(LocalDate.now());
					order.setCreatedTime(LocalTime.now());
					
					order.setShippingType(shType);
					order.setShippingFee(shType.getFee());
					
					order.setPaymentType(pType);
					order.setPaymentFee(pType.getFee());
					
					order.setRecipientName(name);
					order.setRecipientEmail(email);
					order.setRecipientPhone(phone);
					order.setRecipientAddress(shippingAddress);
					order.add(cart);
					
					
					OrderService oService = new OrderService();
					oService.checkOut(order);
					
					//3.1轉交給成功check_out_ok.jsp
					session.removeAttribute("cart");  //結帳務必要清除購物車session資料
					
					request.setAttribute("order", order);
					request.getRequestDispatcher("check_out_ok.jsp").forward(request, response);;
					return;
					
				}catch(FarmerpapaException e) {
					errors.add(e.getMessage() + ", 請聯絡Admin");
					this.log(e.getMessage(), e);
					
				}catch(Exception e) {
					errors.add("發生系統錯誤:" + e.getMessage() + ",請聯絡Admin");
					this.log("發生系統錯誤!", e);
				}
			}
		}else errors.add("購物車是空的,無法結帳");
		
		
		if(!errors.isEmpty())  
			System.out.println("結帳失敗: "+ errors); //for test
			
		//3.2
		request.setAttribute("errors", errors);
		request.getRequestDispatcher("check_out.jsp").forward(request, response);
	}

}

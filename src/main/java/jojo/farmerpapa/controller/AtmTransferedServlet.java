package jojo.farmerpapa.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jojo.farmerpapa.entity.Customer;
import jojo.farmerpapa.exception.FarmerpapaException;
import jojo.farmerpapa.service.OrderService;

/**
 * Servlet implementation class AtmTransferedServlet
 */
@WebServlet("/member/atm_transfered.do")
public class AtmTransferedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AtmTransferedServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 List<String> errors = new ArrayList<>();

		 

		    HttpSession session = request.getSession();

		    Customer member = (Customer) session.getAttribute("member");

		 

		    // 1.讀取request中的form data:

		    String orderId = request.getParameter("orderId");

		    String bank = request.getParameter("bank");

		    String last5Code = request.getParameter("last5Code");

		    String amount = request.getParameter("amount");

		    String transDate = request.getParameter("transDate");

		    String transTime = request.getParameter("transTime");

		   

		    if (orderId == null || !orderId.matches("\\d+")) errors.add("必須有orderId");     

		    if (bank == null || bank.length() == 0) errors.add("必須輸入bank name");

		    if (last5Code == null || !last5Code.matches("\\d{5}"))errors.add("必須輸入帳號後5碼");    

		    if (amount == null || amount.length() == 0) errors.add("必須輸入轉帳金額");     

		    if (transDate == null || transDate.length() == 0)errors.add("必須選擇轉帳日期");      

		    if (transTime == null || transTime.length() == 0) errors.add("必須輸入轉帳時間");

		   

		    // 2. 若無誤，則呼叫商業邏輯

		    if (errors.isEmpty()) {

		       OrderService oService = new OrderService();

		       try {

		           oService.updateStatusToTransfered(member, orderId, bank, last5Code, Double.parseDouble(amount),

		                  LocalDate.parse(transDate), transTime);

		           // 3.1 外部轉交至order.jsp

		           response.sendRedirect("order.jsp?orderId=" + orderId);

		           return;

		       } catch (NumberFormatException e) {

		           errors.add("轉帳金額不正確" + amount);

		       } catch (DateTimeParseException e) {

		           errors.add("transDate不正確" + transDate);

		       } catch (FarmerpapaException e) {

		           this.log("通知轉帳失敗:" + e.getMessage(), e);

		           errors.add("通知轉帳失敗:" + e.getMessage());

		       } catch (Exception e) {

		           this.log("通知轉帳發生錯誤:" + e.getMessage(), e);

		           errors.add("通知轉帳發生錯誤:" + e);

		       }

		    }

		 

		    //System.out.println(errors); //for test

		 

		    // 3.2 內部轉交至atm_transfered.jsp

		   request.setAttribute("errors", errors);

		   request.getRequestDispatcher("atm_transfered.jsp").forward(request, response);

		
	}

}

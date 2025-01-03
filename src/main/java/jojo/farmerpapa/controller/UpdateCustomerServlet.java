package jojo.farmerpapa.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jojo.farmerpapa.entity.Customer;
import jojo.farmerpapa.entity.VIP;
import jojo.farmerpapa.exception.DataInvalidException;
import jojo.farmerpapa.exception.FarmerpapaException;
import jojo.farmerpapa.service.CustomerService;

/**
 * Servlet implementation class UpdateCustomerServlet
 */
@WebServlet("/member/update.do")
public class UpdateCustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> updateErrors = new ArrayList();
		request.setCharacterEncoding("utf-8");
		
		// 取得client request 的 session
		HttpSession session = request.getSession();
		
		
		Customer member = (Customer)session.getAttribute("member");
		
		// 檢查必要欄位是否輸入
		if(member == null) {
			updateErrors.add("會員資料有誤，請重新登入");
			response.sendRedirect("../");
			
			return;
		}
		
		// 1.讀取request的form data:
		// 由於 email 和 birthday 不能被修改，從原會員資料中取得
		//String email = member.getEmail();
		//LocalDate birthday = member.getBirthday(); 
		
		String email = member.getEmail();
		String changePwd = request.getParameter("changePwd");
		String password = request.getParameter("password");
		String newPassword = request.getParameter("newPassword");	
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		LocalDate birthday = member.getBirthday();
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String subscribed = request.getParameter("subscribed");
		
		
		
		if(!member.getEmail().equals(email))
			updateErrors.add("Email為帳號，不可修改");
			
		//if(!member.getBirthday().equals(birthday))
		//	updateErrors.add("生日不可修改");
		
		if(phone == null || (phone = phone.trim()).length() == 0) 
			updateErrors.add("必須輸入手機號碼");
		
		if(name == null || (name = name.trim()).length() == 0) 
			updateErrors.add("必須輸入姓名");
		
		if(gender == null || gender.length() != 1) 
			updateErrors.add("必須選擇性別");
	
			
		if(changePwd != null) {
			if(!member.getPassword().equals(password)){
				updateErrors.add("舊密碼不正確!");
				
			}
			if(newPassword == null || newPassword.length() == 0){
					updateErrors.add("必須填寫新密碼");
				}else {
					password = newPassword;
				}
					
			}else {
				password = member.getPassword();
			}
			
				
		
		// 2. 檢查無誤才呼叫商業邏輯:CustomerService.register
		if(updateErrors.isEmpty()) {
			Customer c = null;
			
			try {
				c = member.getClass().newInstance();
			} catch (InstantiationException|IllegalAccessException e) {
				c = new Customer(); 
			}
			
			try {
				c.setEmail(email);
				c.setPassword(password);
				c.setPhone(phone);
				c.setName(name);
				c.setBirthday(birthday);
				c.setGender(gender.charAt(0));
				c.setAddress(address);
				c.setSubscribed(subscribed != null);
				
				CustomerService service = new CustomerService();
				service.updateCustomer(c);
				
				session.setAttribute("member", c);//取代session中的舊會員資料
				
				// 3.1 內部轉交(forward)修改成功 uptade.jsp
				// 將物件傳給jsp
				response.sendRedirect("../");
				return;
						
			} catch (DataInvalidException e) {
				updateErrors.add(e.getMessage());
							
			} catch (FarmerpapaException e) {
				this.log(e.getMessage(), e);	//for admin
				updateErrors.add(e.getMessage() + "請聯絡Admin");		//for user
						
			}catch (Exception e) {		// 幾乎是RuntimeException , 非預期的錯誤用父類別Exception拋出錯誤訊息
				this.log("會員修改資料時，系統發生錯誤", e);  //for admin
				updateErrors.add("系統發生錯誤" + e + ", 請聯絡Admin");		//for user
			}
								
		}
		
		//3.2 內部轉交(forward)修改失敗 update.jsp
		
		// 將物件傳給jsp
		request.setAttribute("updateErrors", updateErrors);
						
		// 派遣器把控制權轉交給前端畫面(相對路徑)
		RequestDispatcher dispatcher = request.getRequestDispatcher("update.jsp");
		dispatcher.forward(request, response);
		
	}

}

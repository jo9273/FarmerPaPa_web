package jojo.farmerpapa.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jojo.farmerpapa.entity.Customer;
import jojo.farmerpapa.exception.DataInvalidException;
import jojo.farmerpapa.exception.FarmerpapaException;
import jojo.farmerpapa.exception.LoginFailedException;
import jojo.farmerpapa.service.CustomerService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register.do")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errors = new ArrayList();
		request.setCharacterEncoding("utf-8");
		
		// 1. 讀取request的form data:
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String subscribed = request.getParameter("subscribed");
		String captcha = request.getParameter("captcha");
		
		// 檢查必要欄位是否輸入
		if(email == null || (email = email.trim()).length() == 0) errors.add("必須輸入email");
		if(password == null || password.length() == 0) errors.add("必須輸入密碼");
		if(phone == null || (phone = phone.trim()).length() == 0) errors.add("必須輸入手機號碼");
		if(name == null || (name = name.trim()).length() == 0) errors.add("必須輸入姓名");
		if(birthday == null || birthday.length() == 0) errors.add("必須輸入生日");
		if(gender == null || gender.length() != 1) errors.add("必須選擇性別");
		if(captcha == null || (captcha = captcha.trim()).length() == 0) errors.add("必須輸入驗證碼");
		
		// 2. 檢查無誤才呼叫商業邏輯:CustomerService.register
		if(errors.isEmpty()) {
			
			Customer c = new Customer();
			
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
				service.register(c);
				
				//3.1 顯示成功畫面
				response.setContentType("text/html ; charset = utf-8");
				//response.setCharacterEncoding("utf-8");	//也可以用上面的寫法
				
				try(
						PrintWriter out = response.getWriter();
					){
						out.println("<!DOCTYPE html>");
						out.println("<html>");
						out.println("<head>");
						out.println("<title>註冊成功</title>");
						out.println("</head>");
						out.println("<body>");
						out.println("<h2>" + c.getName() + "註冊成功</h2>");
						out.println("</body>");
						out.println("</html>");
					}
					return;
				} catch (DataInvalidException e) {
					errors.add(e.getMessage());
					
				} catch (FarmerpapaException e) {
					this.log(e.getMessage(), e);	//for admin
					errors.add(e.getMessage() + "請聯絡Admin");		//for user
				
				}catch (Exception e) {		// 幾乎是RuntimeException , 非預期的錯誤用父類別Exception拋出錯誤訊息
					this.log("會員註冊時，系統發生錯誤", e);  //for admin
					errors.add("系統發生錯誤" + e + ", 請聯絡Admin");		//for user
				}
						
		}
		
		//3.2TODO
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		
		
		try(
			PrintWriter out = response.getWriter();
		){
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>註冊失敗</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h2>" + errors + "</h2>");
			out.println("</body>");
			out.println("</html>");
			
		}
		
	
	}

}
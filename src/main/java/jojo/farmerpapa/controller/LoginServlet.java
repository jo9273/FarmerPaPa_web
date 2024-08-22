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
import jojo.farmerpapa.exception.FarmerpapaException;
import jojo.farmerpapa.exception.LoginFailedException;
import jojo.farmerpapa.service.CustomerService;

/**
 * Servlet implementation class LoginServlet
 */
// Servlet宣告的假網址一定要加/, ContextPath後加/login.do, http://localhost:8080/fpapa/login.do
// urlPatterns = "/login.do"
@WebServlet("/login.do")	
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<String> errors = new ArrayList(); 
		
		// 1. 讀取request中的form data: email, password, captcha
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String captcha = request.getParameter("captcha");
		
		// 檢查必要欄位是否輸入
		if(email == null || (email = email.trim()).length() == 0) errors.add("必須輸入emaill");
		
		if(password == null || password.length() == 0) errors.add("必須輸入密碼");	// 因為密碼有可能空白，所以.trim() 沒擋
		
		if(captcha == null || (captcha = captcha.trim()).length() == 0 ) errors.add("必須輸入驗證碼");
		
		
		// 2. 檢查無誤才呼叫商業邏輯:CustomerService.login
		
		if(errors.isEmpty()) {
			CustomerService service = new CustomerService();
			try {
				Customer c = service.login(email, password);
				
				//3.1 顯示成功畫面
				response.setContentType("text/html");
				response.setCharacterEncoding("utf-8");
				
				try(
					PrintWriter out = response.getWriter();
				){
					out.println("<!DOCTYPE html>");
					out.println("<html>");
					out.println("<head>");
					out.println("<title>登入成功</title>");
					out.println("</head>");
					out.println("<body>");
					out.printf("<h2>%s, 登入成功</h2>", c.getName());
					out.println("</body>");
					out.println("</html>");
				}
				return;
			} catch (LoginFailedException e) {
				errors.add(e.getMessage());
				
			} catch (FarmerpapaException e) {
				this.log(e.getMessage(), e);	//for admin
				errors.add(e.getMessage());		//for user
			
			} catch (Exception e) {		// 幾乎是RuntimeException , 非預期的錯誤用父類別Exception拋出錯誤訊息
				this.log("會員登入時，系統發生錯誤", e);  //for admin
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
			out.println("<title>登入失敗</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h2>" + errors + "</h2>");
			out.println("</body>");
			out.println("</html>");
		} 
	}

}

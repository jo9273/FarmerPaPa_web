package jojo.farmerpapa.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
		List<String> signupErrors = new ArrayList();
		request.setCharacterEncoding("utf-8"); 	//因為前端request的字串有中文 name
		
		// 取得client request 的 session
		HttpSession session = request.getSession();
		
		
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
		if(email == null || (email = email.trim()).length() == 0) signupErrors.add("必須輸入email");
		if(password == null || password.length() == 0) signupErrors.add("必須輸入密碼");
		if(phone == null || (phone = phone.trim()).length() == 0) signupErrors.add("必須輸入手機號碼");
		if(name == null || (name = name.trim()).length() == 0) signupErrors.add("必須輸入姓名");
		if(birthday == null || birthday.length() == 0) signupErrors.add("必須輸入生日");
		if(gender == null || gender.length() != 1) signupErrors.add("必須選擇性別");
		if(captcha == null || (captcha = captcha.trim()).length() == 0) {
			signupErrors.add("必須輸入驗證碼");
		}else {
			String captchaString = (String)session.getAttribute("captchaString");
			
			if(!captcha.equalsIgnoreCase(captchaString)) {
				signupErrors.add("驗證碼不正確");
			}
		}
		// 資安和記憶體考量,做完驗證碼就要清掉, 不論對錯
		session.removeAttribute("captchaString");
		
		// 準備回應的 JSON 字符串
        StringBuilder jsonResponse = new StringBuilder();
        jsonResponse.append("{");
		
		
		// 2. 檢查無誤才呼叫商業邏輯:CustomerService.register
		if(signupErrors.isEmpty()) {
			
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
				
				// 3.1 內部轉交(forward)註冊成功 register_ok.jsp
				// 將物件傳給jsp
				//request.setAttribute("member", c);
				
				// 註冊成功
                session.setAttribute("member", c);
                
                jsonResponse.append("\"success\":true,");
                jsonResponse.append("\"message\":\"註冊成功！\"");
                
				// 派遣器把控制權轉交給前端畫面(相對路徑)
				//RequestDispatcher dispatcher = request.getRequestDispatcher("register_ok.jsp");
				//dispatcher.forward(request, response);
				
				// ***return不可移除, 不然執行有問題時，後續處理的程式碼無法執行到
				//return;
				
				} catch (DataInvalidException e) {
					signupErrors.add(e.getMessage());
					
				} catch (FarmerpapaException e) {
					this.log(e.getMessage(), e);	//for admin
					signupErrors.add(e.getMessage() + "請聯絡Admin");		//for user
				
				}catch (Exception e) {		// 幾乎是RuntimeException , 非預期的錯誤用父類別Exception拋出錯誤訊息
					this.log("會員註冊時，系統發生錯誤", e);  //for admin
					signupErrors.add("系統發生錯誤" + e + ", 請聯絡Admin");		//for user
				}			
		}
		
		
		if (!signupErrors.isEmpty()) {
            jsonResponse.append("\"success\":false,");
            jsonResponse.append("\"errorMessage\":\"" + String.join(", ", signupErrors) + "\"");
        }

        jsonResponse.append("}");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
		
		//3.2 內部轉交(forward)註冊失敗 login.jsp
		
		// 將物件傳給jsp
		//request.setAttribute("signupErrors", signupErrors);
				
		// 派遣器把控制權轉交給前端畫面(相對路徑)
		//RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
		//dispatcher.forward(request, response);
		
	}

}

package jojo.farmerpapa.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jojo.farmerpapa.entity.Customer;

/**
 * Servlet implementation class CheckLoginStatus
 */
@WebServlet("/CheckLoginStatus")
public class CheckLoginStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLoginStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//不要自動建立新的 session，如果 session 已經存在則返回該 session，否則返回 null
		//因為只是要做會員登入狀態檢查
		HttpSession session = request.getSession(false);  
		
		Customer member = session != null ? (Customer) session.getAttribute("member") : null;

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        if (member != null) {
            // 已登入
            out.print("{\"isLoggedIn\": true}");
        } else {
            // 未登入
            out.print("{\"isLoggedIn\": false}");
        }
        out.flush();
	}

}

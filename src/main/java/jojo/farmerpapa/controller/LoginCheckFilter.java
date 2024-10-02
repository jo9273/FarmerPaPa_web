package jojo.farmerpapa.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jojo.farmerpapa.entity.Customer;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter("/member/*")
public class LoginCheckFilter implements Filter {

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		HttpSession session = httpRequest.getSession();
		
		Customer member = (Customer)session.getAttribute("member");
		
		// 檢查是否是 AJAX 請求
        String requestedWith = httpRequest.getHeader("X-Requested-With");
		
		if(member == null && !"XMLHttpRequest".equals(requestedWith)) {
			//String uri = httpRequest.getRequestURI();
			//session.setAttribute("previous_uri", uri);
			
			//原方法,轉導登入頁
			//httpResponse.sendRedirect("./login.jsp");
			
			 httpResponse.sendRedirect("../");
	         return;
			
			
		}

		// 交給下一棒
		chain.doFilter(request, response);
	}
}

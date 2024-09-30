package jojo.farmerpapa.controller;

import java.io.IOException;
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
//@WebFilter("/member/*")
public class LoginCheckFilter implements Filter {

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		
		HttpSession session =httpRequest.getSession();
		
		Customer member = (Customer)session.getAttribute("member");
		
		if(member == null) {
			String uri = httpRequest.getRequestURI();
			session.setAttribute("previous_uri", uri);
			httpResponse.sendRedirect("../login.jsp");
			return;
		}

		// 交給下一棒
		chain.doFilter(request, response);
	}

	

}

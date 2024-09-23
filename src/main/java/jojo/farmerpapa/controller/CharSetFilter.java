package jojo.farmerpapa.controller;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

/**
 * Servlet Filter implementation class CharSetFilter
 */
@WebFilter(urlPatterns = { "*.jsp", "*.do" }, dispatcherTypes = {DispatcherType.REQUEST, DispatcherType.ERROR})  //404也可以Filter轉編碼
public class CharSetFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public CharSetFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 前置處理
		// 如果要改其他編碼, 可以從這改即可
		request.setCharacterEncoding("UTF-8");
		request.getParameterNames();  //鎖定request編碼
		
		response.setCharacterEncoding("UTF-8");
		response.getWriter();   //鎖定response編碼

		// 這得不能移除, 如果移除頁面會全部空白
		// 交給下一棒(Filter/Servlet)  pass the request along the filter chain
		chain.doFilter(request, response);
		
		// 後續處理(這裡沒有要處理)
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

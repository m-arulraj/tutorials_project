package com.firstproject.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class FirstFilter
 */
@WebFilter(filterName = "FirstFilter", urlPatterns = {
		"/*" }, initParams = @WebInitParam(name = "excludeUrls", value = "/LoginServlet,/welcome.jsp,/login.jsp"))
public class FirstFilter implements Filter {

	private static List<String> excludeUrls;

	/**
	 * Default constructor.
	 */
	public FirstFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest rqst = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String requestUrl = rqst.getServletPath();
		if (excludeUrls.contains(requestUrl)) {
			chain.doFilter(request, response);
		} else {
			HttpSession session = rqst.getSession(false);
			Cookie[] cookies = rqst.getCookies();
			String userId = null;
			if (cookies != null || session != null) {
				userId = Arrays.asList(cookies).stream().filter(c -> "userId".equalsIgnoreCase(c.getName()))
						.map(Cookie::getValue).collect(Collectors.joining());
				if (userId == null || userId.trim().length() <= 0) {
					if (session != null)
						userId = session.getAttribute("userId").toString();
				}
				if (userId == null || userId.trim().length() <= 0) {
					res.sendRedirect("login.jsp");
				} else {
					chain.doFilter(request, response);
				}

			} else {
				res.sendRedirect("login.jsp");
			}

		}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		excludeUrls = Arrays.asList(fConfig.getInitParameter("excludeUrls").split(","));
	}

}

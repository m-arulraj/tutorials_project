package com.firstproject.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		List<String> errorCode = new ArrayList<>();
		if (userName == null || userName.trim().length() == 0) {
			errorCode.add("User name can't be empty");
		}
		if (password == null || password.trim().length() == 0) {
			errorCode.add("Password can't be empty");
		}
		if (errorCode.isEmpty()) {
			response.addCookie(new Cookie("userId", userName));
			HttpSession session = request.getSession(true);
			session.setAttribute("userId", userName);
			response.sendRedirect("home.jsp");
		} else {
			request.setAttribute("errorCodes", errorCode);
			response.sendRedirect("login.jsp");
		}
	}

}

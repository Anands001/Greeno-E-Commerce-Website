package ecommerce;
import entity.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class create
 */

public class create extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String name=request.getParameter("fullname");
		String email=request.getParameter("email");
		String phoneno=request.getParameter("phoneno");
		String secqns=request.getParameter("secqns");
		String secans=request.getParameter("answer");
		
		insertdb s=new insertdb();
		HttpSession session=request.getSession();
		try {
			if(s.insert(username, password,name,email,phoneno,secqns,secans)) {
			   session.setAttribute("imsg", "true");
			   response.sendRedirect("login.jsp");
			   
			   
			   
			}
			else {
				session.setAttribute("imsg", "false");
				response.sendRedirect("signup.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

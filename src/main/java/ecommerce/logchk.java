package ecommerce;
import entity.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class logchk
 */
public class logchk extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("username");
		String password=request.getParameter("password");
		HttpSession session=request.getSession();
		
		
		
	logincheck lg=new logincheck();
		
		try {
			if(lg.logcheck(username,password)!=null) {
				userentity ue=lg.logcheck(username, password);
				session.setAttribute("username",username);
				session.setAttribute("password", password);
				session.setAttribute("user", ue);
				response.sendRedirect("home.jsp");
				
			}
			else {
				session.setAttribute("msg","incorrect");
				response.sendRedirect("login.jsp");
			
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

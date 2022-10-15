package ecommerce;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class forgotservlet
 */

public class forgotservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		HttpSession session=request.getSession();
		session.setAttribute("username", username);
		
		logincheck l=new logincheck();
		try {
			String[] s=l.forgotpass(username);
			session.setAttribute("secqns", s[0]);
			session.setAttribute("secans", s[1]);
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("forgotpassword.jsp");
	}

}

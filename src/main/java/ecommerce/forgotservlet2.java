package ecommerce;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class forgotservlet2
 */
public class forgotservlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String secans=(String) session.getAttribute("secans");
		
		String ans=request.getParameter("answer");
		
		if(secans.equals(ans)) {
			session.setAttribute("out", "success");
		}
		else {
			session.setAttribute("out", "failed");
		}
		response.sendRedirect("forgotpassword.jsp");
	}

}

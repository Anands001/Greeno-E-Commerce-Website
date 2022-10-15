package ecommerce;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class forgotUpdate
 */
public class forgotUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();		
		String username=(String)session.getAttribute("username");
		String password=request.getParameter("newpassword");
		String cpassword=request.getParameter("newpassword1");
		
		passwordupdate p=new passwordupdate();
		if(password.equals(cpassword)) {
		try {
			p.psupdate(username, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.setAttribute("psmsg", "password changed");
		session.removeAttribute("out");
		response.sendRedirect("login.jsp");
		}
		else {
		   session.setAttribute("passwordmsg", "wrong");
		   response.sendRedirect("forgotpassword.jsp");
		}
		
		
	}

}

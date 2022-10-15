package ecommerce;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class passwordChange
 */

public class passwordChange extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public passwordChange() {
        super();}
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		String password=(String) session.getAttribute("password");
		
		String username=request.getParameter("username");
		String oldpassword=request.getParameter("oldpassword");
		String newpassword=request.getParameter("newpassword");
		
		
		
		if(password.equals(oldpassword)) {
			passwordupdate p=new passwordupdate();
			try {
				p.psupdate(username, newpassword);
				session.setAttribute("psmsg", "password changed");
				response.sendRedirect("login.jsp");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			session.setAttribute("psmsg", "incorrect");
			response.sendRedirect("changepassword.jsp");
		}
		
	}

}

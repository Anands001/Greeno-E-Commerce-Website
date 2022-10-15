package ecommerce;

import java.io.IOException;
import java.util.List;
import entity.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class detailservlet
 */
public class detailservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		mobiledao md=new mobiledao();
		int id=Integer.parseInt(request.getParameter("id"));
		try {
			  List<mobileentity> ml=md.mobiledet(id);
			  HttpSession session=request.getSession();
			  session.setAttribute("mlist", ml);
			  response.sendRedirect("productdetails.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

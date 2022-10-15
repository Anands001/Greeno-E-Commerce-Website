package ecommerce;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ViewCart
 */
@WebServlet("/ViewCart")
public class ViewCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		
		CartDao cd=new CartDao();
		
		try {
			List l=cd.cartitems(username);
			int cartitems=cd.cartItemCount(username);
			long cartitemstotprice=cd.cartTotalPrice(username);
			
			HttpSession session=request.getSession();
			session.setAttribute("cartlist", l);
			session.setAttribute("cartitems", cartitems);
			session.setAttribute("carttot", cartitemstotprice);
			response.sendRedirect("cart1.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

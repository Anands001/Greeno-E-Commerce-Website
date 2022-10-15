package ecommerce;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.userentity;

/**
 * Servlet implementation class profileservlet
 */
@WebServlet("/profileservlet")
public class profileservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profileservlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		String username=request.getParameter("username");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String phoneno=request.getParameter("phoneno");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		int pincode=Integer.parseInt(request.getParameter("pincode"));
		
		Profileupdate p=new Profileupdate();
		try {
			p.pupdate(name, email, phoneno, address, state, city, pincode, username);
			session.setAttribute("pmsg", "profile updated");
					
					userentity ue=(userentity) session.getAttribute("user");
					
					ue.setName(name);
					ue.setEmail(email);
					ue.setPhoneno(phoneno);
					ue.setAddress(address);
					ue.setState(state);
					ue.setCity(city);
					ue.setPincode(pincode);
					
			response.sendRedirect("profile.jsp");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}

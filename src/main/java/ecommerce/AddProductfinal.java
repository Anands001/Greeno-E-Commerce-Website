package ecommerce;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entity.*;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class AddProductfinal
 */
@WebServlet("/AddProductfinal")
public class AddProductfinal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		String product_name = null;
		double price = 0;
		double off_price = 0;
		String mobile_img;
		String badge = null;
		String category = null;
		String storage = null;
		String display = null;
		String camara = null;
		String battery = null;
		String processor = null;
		String color = null;
		String video = null;
		String description = null;

		AddProductDao ad = new AddProductDao();

		mobileentity m = (mobileentity) session.getAttribute("mobile");

		product_name = m.getProduct_name();
		price = m.getPrice();
		off_price = m.getOff_price();
		badge = m.getBadge();
		category = m.getCategory();
		description = m.getDescription();
		color = m.getColor();
		storage = m.getStorage();
		display = m.getDisplay();
		camara = m.getCamara();
		battery = m.getBattery();
		processor = m.getProcessor();
		video = m.getVideo();

		
        List<String> list=(List<String>) session.getAttribute("imglist");
		
        try {
			ad.addProduct(product_name, off_price, list.get(0), badge, category, price, description, list.get(0),
					list.get(1), list.get(2), list.get(3), list.get(4), storage, display, camara, battery, processor,
					color, video);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        session.removeAttribute("imglist");

	}

}

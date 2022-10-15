package ecommerce;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import entity.*;

@MultipartConfig

public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		/*List<String> list=new ArrayList<>();
		try {
			
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> l = upload.parseRequest(request);
			*/
		String productname=request.getParameter("productname");
		double orgprice=Double.parseDouble(request.getParameter("orgprice"));
		double offprice=Double.parseDouble(request.getParameter("offprice"));
		String badge=request.getParameter("badge");
		String category=request.getParameter("category");
		String description=request.getParameter("description");
		String color=request.getParameter("color");
		String storage=request.getParameter("storage");
		String display=request.getParameter("display");
		String camara=request.getParameter("camara");
		String battery=request.getParameter("battery");
		String processor=request.getParameter("processor");
		String video=request.getParameter("video");
		
		
		

		
			//FileItemFactory factory = new DiskFileItemFactory();
			//ServletFileUpload upload = new ServletFileUpload(factory);
			
		/*	String path = getServletContext().getRealPath("") + "images" + "\\" + "mobiles";
			System.out.println(path);
			
			System.out.println(l);

			for (FileItem f : l) {
				f.write(new File(path + File.separator + f.getName()));
				System.out.println(f.getName());
				list.add(f.getName());
				}
	 */
		
		
		
		System.out.println(productname);
		System.out.println(orgprice);
		System.out.println(offprice);
		System.out.println(badge);
		System.out.println(category);
		System.out.println(description);
		System.out.println(color);
		System.out.println(storage);
		System.out.println(display);
		System.out.println(camara);
		System.out.println(battery);
		System.out.println(processor);
		System.out.println(video);
		
		HttpSession session=request.getSession();
	/*	List<String> list=(List<String>) session.getAttribute("imgname");

      //  System.out.println(list.get(0));
        
        AddProductDao ad=new AddProductDao();
        try {
			ad.addProduct(productname,offprice,list.get(0),badge,category,orgprice,description,list.get(0),list.get(1),list.get(2),list.get(3),list.get(4),storage,display,camara,battery,processor,color,video);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	*/
		mobileentity m=new mobileentity();
		
		m.setProduct_name(productname);
		m.setPrice(orgprice);
		m.setOff_price(offprice);
		m.setBadge(badge);
		m.setCategory(category);
		m.setDescription(description);
		m.setColor(color);
		m.setStorage(storage);
		m.setDisplay(display);
		m.setCamara(camara);
		m.setBattery(battery);
		m.setProcessor(processor);
		m.setVideo(video);
		
		session.setAttribute("mobile", m);
		response.sendRedirect("fileupload.jsp");
	}

}

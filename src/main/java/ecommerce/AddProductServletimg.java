package ecommerce;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class AddProductServletimg
 */
public class AddProductServletimg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> list=new ArrayList<>();
		try {
			
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> l = upload.parseRequest(request);
			//String path = getServletContext().getRealPath("") + "images" + "\\" + "mobiles";
			String path = "C:\\Users\\sssan\\eclipse-workspace\\servletwork\\ecommerce\\src\\main\\webapp\\images\\mobiles";
			System.out.println(path);
			
			System.out.println(l);

			for (FileItem f : l) {
				f.write(new File(path + File.separator + f.getName()));
				list.add(f.getName());
				}
			 for(String s:list) {
			       System.out.println(s);
		        }
			}catch(Exception e) {
				e.printStackTrace();
			}
		HttpSession session=request.getSession();
		session.setAttribute("imglist", list);
		if(list.isEmpty()) 
		session.setAttribute("uimg", "Images uploading failed");
		else
			session.setAttribute("uimg", "Images uploaded successfully");
		response.sendRedirect("fileupload.jsp");
	}
}

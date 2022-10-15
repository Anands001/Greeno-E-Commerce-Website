package ecommerce;

import java.sql.*;

public class AddProductDao {

	public void addProduct(String productname, double offprice, String displayimg, String badge, String category,
			double originalprice, String description, String bimg1, String bimg2, String bimg3, String bimg4,
			String bimg5, String storage, String display, String camara, String battery, String processor, String color,
			String video) throws Exception {

		String query = "INSERT INTO `greeno`.`product` (`product_name`, `off_price`, `display_img`, `badge`, `category`, `org_price`, `description`, `bimg_1`, `bimg_2`, `bimg_3`, `bimg_4`, `bimg_5`, `storage`, `display`, `camara`, `battery`, `processor`, `color`, `video`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

		Connection con = dbConnect.connect();
		PreparedStatement pt = con.prepareStatement(query);
		pt.setString(1, productname);
		pt.setDouble(2, offprice);
		pt.setString(3, displayimg);
		pt.setString(4, badge);
		pt.setString(5, category);
		pt.setDouble(6, originalprice);
		pt.setString(7, description);
		pt.setString(8, bimg1);
		pt.setString(9, bimg2);
		pt.setString(10, bimg3);
		pt.setString(11, bimg4);
		pt.setString(12, bimg5);
		pt.setString(13, storage);
		pt.setString(14, display);
		pt.setString(15, camara);
		pt.setString(16, battery);
		pt.setString(17, processor);
		pt.setString(18, color);
		pt.setString(19, video);

		int count = pt.executeUpdate();
		System.out.println(count + "rows affected");
	}

	
	 /* public static void main(String args[]) throws Exception { 
		  AddProductDao a=new AddProductDao(); 
		  a.addProduct("1",1000, "1", "1", "1", 100, "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1"); 
		  }
	 */
	public void updateproduct(int productid,String productname, double offprice, String displayimg, String badge, String category,
			double originalprice, String description, String bimg1, String bimg2, String bimg3, String bimg4,
			String bimg5, String storage, String display, String camara, String battery, String processor, String color,
			String video) throws Exception {
		
		String query1 = "UPDATE `greeno`.`product` SET product_name = ?, off_price = ?, display_img = ?, badge = ?, category = ?, org_price = ?, description = ?, bimg_1 = ?, bimg_2 = ?, bimg_3 = ?, bimg_4 = ?, bimg_5 = ?, storage = ?, "
				+ "display = ?, camara = ?,battery = ?, processor = ?, color = ?, video = ? WHERE (product_id = ?)";
	
	
		Connection con = dbConnect.connect();
		PreparedStatement pt = con.prepareStatement(query1);
		pt.setString(1, productname);
		pt.setDouble(2, offprice);
		pt.setString(3, displayimg);
		pt.setString(4, badge);
		pt.setString(5, category);
		pt.setDouble(6, originalprice);
		pt.setString(7, description);
		pt.setString(8, bimg1);
		pt.setString(9, bimg2);
		pt.setString(10, bimg3);
		pt.setString(11, bimg4);
		pt.setString(12, bimg5);
		pt.setString(13, storage);
		pt.setString(14, display);
		pt.setString(15, camara);
		pt.setString(16, battery);
		pt.setString(17, processor);
		pt.setString(18, color);
		pt.setString(19, video);
		pt.setInt(20, productid);
	
		int count = pt.executeUpdate();
		System.out.println(count + "rows affected");
	}
	 public static void main(String args[]) throws Exception { 
		 AddProductDao a=new AddProductDao();
	 a.updateproduct(1,"1",1000, "1", "1", "1", 100, "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1"); 
	 }
}

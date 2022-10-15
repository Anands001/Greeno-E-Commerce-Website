package ecommerce;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import java.sql.Statement;


import entity.mobileentity;


public class CartDao {
	
	public void cartAdd(String username,int productid) throws Exception {
		
		Connection con=dbConnect.connect();
		
		String query="Insert into cart(username,productid) values(?,?)";
		
		PreparedStatement pt=con.prepareStatement(query);
		pt.setString(1, username);
		pt.setInt(2, productid);
		
		int count=pt.executeUpdate();
		System.out.println(count+" rows affected");
	}
	
	public List<mobileentity> cartitems(String username) throws Exception {
		Connection con=dbConnect.connect();
		
		String query="SELECT *\r\n"
				+ "FROM product\r\n"
				+ "INNER JOIN cart\r\n"
				+ "ON cart.productid = product.product_id where username=?";
		
		PreparedStatement pt=con.prepareStatement(query);
		pt.setString(1,username);
		ResultSet rs=pt.executeQuery();
		
		List l = new ArrayList<mobileentity>();
		
		mobileentity m = null;
		
		while(rs.next()) {
			m=new mobileentity();
			
			m.setProductid(rs.getInt(1));
			m.setProduct_name(rs.getString(2));
			m.setOff_price(rs.getDouble(3));
			m.setDisplay_img(rs.getString(4));
			m.setBadge(rs.getString(5));
			m.setCategory(rs.getString(6));
			m.setPrice(rs.getDouble(7));
			m.setDescription(rs.getString(8));
			m.setBimg1(rs.getString(9));
			m.setBimg2(rs.getString(10));
			m.setBimg3(rs.getString(11));
			m.setBimg4(rs.getString(12));
			m.setBimg5(rs.getString(13));
			m.setStorage(rs.getString(14));
			m.setDisplay(rs.getString(15));
			m.setCamara(rs.getString(16));
			m.setBattery(rs.getString(17));
			m.setProcessor(rs.getString(18));
			m.setColor(rs.getString(19));
			if(rs.getString(20)!=null) {
				m.setVideo(rs.getString(20));
			}
			
			l.add(m);
		}
			
		return l;
	}

	public boolean incart(String username,int productid) throws Exception {
		Connection con=dbConnect.connect();
		
		String query="select * from cart where username=? and productid=?";
		
		PreparedStatement pt=con.prepareStatement(query);
		pt.setString(1, username);
		pt.setInt(2, productid);
		ResultSet rs=pt.executeQuery();
		
		if(rs.next()) {
			return true;
		}else {
			return false;
		}
	}
	public void delcart(String username,int productid) throws Exception {
		Connection con=dbConnect.connect();
		
		String query="Delete from cart where username=? and productid=?";		
		PreparedStatement pt=con.prepareStatement(query);
		pt.setString(1, username);
		pt.setInt(2, productid);
		int count =pt.executeUpdate();
		
		System.out.print(count + "rows deleted");
	}
	
	/*public static void main(String args[]) throws Exception {
		CartDao cd=new CartDao();
		cd.cartItemCount("Anand100");
	} */
	public int cartItemCount(String username) throws Exception {
		Connection con=dbConnect.connect();
		
		String query="select count(*) from cart where username=?";		
		PreparedStatement pt=con.prepareStatement(query);
		pt.setString(1, username);
		ResultSet rs=pt.executeQuery();
		rs.next();
		int countitems=rs.getInt(1);
		return countitems;
	}
	public long cartTotalPrice(String username) throws Exception {
		Connection con=dbConnect.connect();
		
		String query="SELECT (sum(off_price))\r\n"
				+ "FROM product\r\n"
				+ "INNER JOIN cart\r\n"
				+ "ON cart.productid = product.product_id where username=?; ";		
		PreparedStatement pt=con.prepareStatement(query);
		pt.setString(1, username);
		ResultSet rs=pt.executeQuery();
		rs.next();
		long countitemstot=rs.getLong(1);
		return countitemstot;
	}
	
}

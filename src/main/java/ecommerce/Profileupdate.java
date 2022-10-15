package ecommerce;

import entity.*;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpSession;

public class Profileupdate {
	public void pupdate(String name,String email,String phoneno,String address,String state,String city,int pincode,String username) throws Exception {
		
		Connection con=dbConnect.connect();
		
		String query="update login set name=?,email=?,phone_no=?,address=?,pincode=?,state=?,city=? where username=?";
		
		PreparedStatement pt=con.prepareStatement(query);
		
		pt.setString(1, name);
		pt.setString(2, email);
		pt.setString(3, phoneno);
		pt.setString(4, address);
		pt.setInt(5, pincode);
		pt.setString(6, state);
		pt.setString(7, city);
		pt.setString(8, username);
		
		
		
		int count=pt.executeUpdate();
		
		System.out.println(count);
	}
}

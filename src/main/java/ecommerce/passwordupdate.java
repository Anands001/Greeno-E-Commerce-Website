package ecommerce;

import java.sql.Connection;
import java.sql.PreparedStatement;



public class passwordupdate {

	public void psupdate(String username,String password) throws Exception {
		
		
		
		String query="update login set password=? where username=?";
		Connection con=dbConnect.connect();
		
		PreparedStatement pt=con.prepareStatement(query);
		
		pt.setString(1, password);
		pt.setString(2, username);
		
		int count=pt.executeUpdate();
		
		System.out.println(count+" rows affected");
	
		pt.close();
		con.close();
	}
	
	/*
	public static void main(String[] args) throws Exception {
		passwordupdate p=new passwordupdate();
		p.psupdate("anand", "1234");
		
	}*/
}

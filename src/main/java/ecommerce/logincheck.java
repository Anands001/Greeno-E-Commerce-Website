package ecommerce;
import entity.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;





public class logincheck {

	public userentity logcheck(String user,String password) throws Exception {
		
	
		Connection con=dbConnect.connect();
		//boolean f=false;
		String query="select * from login where username=? and password=?";
		
		
		
			PreparedStatement st=con.prepareStatement(query);
			st.setString(1, user);
			st.setString(2, password);
			ResultSet rs=st.executeQuery();
			
			userentity ue =null;
			
			if(rs.next()) {
				ue=new userentity();
				
				ue.setUsername(rs.getString(1));
				ue.setPassword(rs.getString(2));
				ue.setName(rs.getString(3));
				ue.setEmail(rs.getString(4));
				ue.setPhoneno(rs.getString(5));
				ue.setAddress(rs.getString(6));
				ue.setState(rs.getString(7));
				ue.setCity(rs.getString(8));
				ue.setPincode(rs.getInt(9));
				ue.setSecurityqns(rs.getString(10));
				ue.setSecurityans(rs.getString(11));
				
			//	f=true;
			  }	
			con.close();
		return ue;
	}
	public String[] forgotpass(String username) throws Exception {

		Connection con=dbConnect.connect();
		String query1="select securityqns,securityans from login where username=?";
		
		PreparedStatement st1=con.prepareStatement(query1);
		st1.setString(1, username);
		
		ResultSet rs=st1.executeQuery();
		String[] sec=new String[100];
		if(rs.next()) {
		sec[0]=rs.getString(1);
		sec[1]=rs.getString(2);
		}
		return  sec;
		
	}
	

}
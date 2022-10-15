package ecommerce;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class insertdb {

	public boolean insert(String username,String password,String name,String email,String phoneno,String securityqns,String securityans)throws Exception {
		
		Connection con=dbConnect.connect();
		
		String query="insert into login(username,password,name,email,phone_no,securityqns,securityans) values(?,?,?,?,?,?,?)";
		String query1="select * from login where username like(?)";
		
		boolean b=false;
		
		PreparedStatement st1=con.prepareStatement(query1);
		st1.setString(1, username);
		ResultSet c=st1.executeQuery();
		
		
		if(c.next()) {
		b=false;
		}else {
		PreparedStatement st=con.prepareStatement(query);
		st.setString(1, username);
		st.setString(2,password);
		st.setString(3,name);
		st.setString(4,email);
		st.setString(5,phoneno);
		st.setString(6,securityqns);
		st.setString(7,securityans);
		
		st.executeUpdate();
		
		st.close();
		b=true;
		}
	    con.close();
		return b;
		
	}
	/*public static void main(String[] args) throws Exception {
		insertdb i=new insertdb();
		boolean count=i.insert("reacher101", "reacher", "jack reacher", "jackreacher@gmail.com", 98796867, "what is your favourite subject?","maths");
	System.out.print(count);
	}*/

}



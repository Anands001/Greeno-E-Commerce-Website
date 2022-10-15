package ecommerce;

import java.sql.Connection;
import java.sql.DriverManager;


public class dbConnect {
	public static Connection connect() throws Exception {

	String url="jdbc:mysql://localhost:3306/greeno";
	String uname="root";
	String pass="1234";
	
	
	String query="insert into login values(?,?)";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection(url,uname,pass);
	
	return con;
	}
	
}

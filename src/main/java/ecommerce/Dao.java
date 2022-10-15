package ecommerce;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;

import entity.productEntity;

import java.sql.*;
import java.sql.ResultSet;



public class Dao {

	public List<productEntity> product() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		
		String url="jdbc:mysql://localhost:3306/abc";
		String uname="root";
		String pass="1234";
		String query="select * from product";
		
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		Statement st=con.createStatement();	
		ResultSet rs = st.executeQuery(query);
		
		
		
		List<productEntity> l = new ArrayList();
		
		productEntity p=null;
		
		while(rs.next()) {
			p=new productEntity();
			p.setId(rs.getInt(1));
			p.setName(rs.getString(2));
			p.setImg(rs.getString(3));
			
			l.add(p);
		}
		
		return l;
	}
	/*public static void main(String argd[]) throws ClassNotFoundException, SQLException {
		
		Dao d=new Dao();
		
		List<productEntity> l1=d.product();
		
		for (productEntity p : l1) {
			System.out.println(p.getId());
			System.out.println(p.getName());
			System.out.println(p.getImg());
		}
	}*/
}


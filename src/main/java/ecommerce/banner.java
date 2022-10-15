package ecommerce;

import java.sql.*;
import java.util.*;

public class banner {

	public List bannerimg() throws Exception{
		
		Connection con=dbConnect.connect();
		
		String query="select * from banner";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		
		List l= new ArrayList();
		
		while(rs.next()) {
			l.add(rs.getString(1));
		}
		
		return l;
		
	}
}

package ecommerce;

import entity.*;


import java.sql.*;
import java.util.*;

public class mobiledao {
	public List mobile() throws Exception {

	Connection con=dbConnect.connect();
	
	String query="Select * from product order by rand()";
	
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery(query);
	
	List<mobileentity> l = new ArrayList<mobileentity>();
	
	mobileentity m = null;
	
	while(rs.next()) {
		m=new mobileentity();
		
		m.setProductid(rs.getInt(1));
		m.setProduct_name(rs.getString(2));
		m.setPrice(rs.getDouble(3));
		m.setDisplay_img(rs.getString(4));
		m.setBadge(rs.getString(5));
		m.setCategory(rs.getString(6));
		
		
		l.add(m);
	}
		
	return l;
	}
	public List mobiledet(int id) throws Exception {

	Connection con=dbConnect.connect();
	
	String query="Select * from product where product_id=?";
	
	PreparedStatement pt=con.prepareStatement(query);
	pt.setInt(1,id);
	ResultSet rs=pt.executeQuery();
	
	List<mobileentity> l = new ArrayList<mobileentity>();
	
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

	public List exclusive() throws Exception {
		Connection con=dbConnect.connect();
		
		String query="select * from product where badge='exclusive'";
		
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(query);
		
		List<mobileentity> l = new ArrayList<mobileentity>();
		
		mobileentity m = null;
		
		while(rs.next()) {
			m=new mobileentity();
			
			m.setProductid(rs.getInt(1));
			m.setProduct_name(rs.getString(2));
			m.setPrice(rs.getDouble(3));
			m.setDisplay_img(rs.getString(4));
			m.setBadge(rs.getString(5));
			m.setCategory(rs.getString(6));
			
			
			l.add(m);	
	}
		return l;
	}
		
}

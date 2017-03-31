package com.yike.DAO;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;

public class JDBCMysql {
	private Connection con;
	private static void loaddriver(){
		//System.out.println("-------- MySQL "
        //+ "JDBC Connection Testing ------------");

		try {

			Class.forName("com.mysql.jdbc.Driver");
		
		} catch (Exception e) {
		
			System.out.println("Where is your Mysql JDBC Driver? "
		            + "Include in your library path!");
			e.printStackTrace();
		
		}
		
		//System.out.println("Mysql JDBC Driver Registered!");
	}
	
	public Connection getconnect() {
		
		JDBCMysql.loaddriver();
//	    Connection connection = null;
	
		try {
//		   	con = DriverManager.getConnection(
//		   			"jdbc:mysql://192.168.99.178:3306/fswcdr?" +
//                    "user=freeswitch&password=freeswitch");
		   	con = DriverManager.getConnection(
		   			"jdbc:mysql://192.168.1.128:3306/fswcdr?" +
                    "user=freeswitch&password=freeswitch");
		} catch (SQLException e) {
	
            System.out.println("Connection Failed! Check output console");
            e.printStackTrace();
            return null;
	
	    }
	
		if (con != null) {
	        System.out.println("database connected!");
		} else {
	        System.out.println("Failed to make connection!");
	        return null;
		}
		return con;
	}
}

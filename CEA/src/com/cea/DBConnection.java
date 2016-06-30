package com.cea;

import java.util.*;
import java.sql.*;

public class DBConnection {
	public static final String PROGRAM_NAME = "DBConnection";

    public static Connection getConnection(Properties props) {
        String driver = props.getProperty("driver");
        String url = props.getProperty("url");

        if (driver == null || url == null) {
        	System.out.println ("No JDBC driver or db URL specified in properties");
        	return null;
        }

        String user = props.getProperty("user", "");
        String password = props.getProperty("password", "");
        
    	// load the JDBC driver using the current class loader and db URL
        try {        	
        	Class.forName(driver);         	
        	return DriverManager.getConnection(url, user, password);
        }
        catch (ClassNotFoundException ce){
        	System.out.println("JDBC Driver not found");
        	return null;
        }
        catch (SQLException ex) {
            javax.swing.JOptionPane.showMessageDialog(null, ex, "Failed to connect with database", javax.swing.JOptionPane.ERROR_MESSAGE);
            return null;
        }
    }
    
    public static void closeConnection ( java.sql.Connection conn){
    	if (conn !=null) {
    		try {
    			conn.close();
    		}
    		catch (SQLException e){
    			SQLError.print(e);
    		}
    	}
    }
    
}

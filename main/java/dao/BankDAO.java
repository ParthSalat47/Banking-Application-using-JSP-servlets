package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BankDAO 
{

	public int balanceInquiry(String username)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/customerInfo";
    		String uname = "root";
    		String pass = "root"; 
    		String query = "select accBalance from customerDetails"
    				+ " where username = (?);"; 
    		
    		Connection con = DriverManager.getConnection(url, uname, pass);
    		PreparedStatement st = con.prepareStatement(query); 
    		
    		st.setString(1, username);
    		
    		ResultSet rs = st.executeQuery();
    		rs.next();
    		
    		int balance = rs.getInt(1);
    		
    		st.close();
    		con.close();
    		
    		return balance;
		}
		catch (Exception e)
		{
			System.out.println(e);
			return -1;
		}
		
	}
	
	public boolean verifyLogin(String enteredUsername, String enteredPassword)
	{
		
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/customerInfo";
    		String uname = "root";
    		String pass = "root"; 
    		String query = "select username, password from customerDetails"
    				+ " where username = (?) and password = (?); "; 
    		
    		Connection con = DriverManager.getConnection(url, uname, pass);
    		PreparedStatement st = con.prepareStatement(query); 
    		
    		st.setString(1, enteredUsername);
    		st.setString(2, enteredPassword); 
    		
    		ResultSet rs = st.executeQuery();
    		
//    		st.close();
//    		con.close();
			
    		if(rs.next())
    		{
    			return true;
    		}
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		
		return false;
	}
	
	public boolean insertInDB(String customerName, String username, String password)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/customerInfo";
    		String uname = "root";
    		String pass = "root"; 
    		String query = "insert into customerDetails values (?, ?, ?, 0)"; 
    		
    		Connection con = DriverManager.getConnection(url, uname, pass);
    		PreparedStatement st = con.prepareStatement(query); 
    		
    		st.setString(1, username);
    		st.setString(2, password);
    		st.setString(3, customerName);
    		
    		int count = st.executeUpdate();
    		
    		System.out.println(count + " row(s) affected.");   
    		
    		st.close();
    		con.close();
    		
    		return true;
		}
		catch (Exception e)
		{
			System.out.println(e);
			return false;
		}
		
	}
	
	public boolean editBalance (String username, int amount)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/customerInfo";
    		String uname = "root";
    		String pass = "root"; 
    		String query = "update customerDetails"
    				+ " set accBalance = (?)"
    				+ " where username = (?);"; 
    		
    		Connection con = DriverManager.getConnection(url, uname, pass);
    		PreparedStatement st = con.prepareStatement(query); 
    		
    		st.setInt(1, amount);
    		st.setString(2, username);
    		
    		int count = st.executeUpdate();
    		
    		System.out.println(count + " row(s) affected.");   
    		
    		st.close();
    		con.close();
    		
    		return true;
		}
		catch (Exception e)
		{
			System.out.println(e);
			return false;
		}
	
	}

	public ResultSet accountHistory (String username)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/customerInfo";
    		String uname = "root";
    		String pass = "root"; 
    		String query = "select transactionType, amount from transactionDetails"
    				+ "	where username = (?);"; 
    		
    		Connection con = DriverManager.getConnection(url, uname, pass);
    		PreparedStatement st = con.prepareStatement(query); 
    		
    		st.setString(1, username);
    		
    		ResultSet rs = st.executeQuery();
    		
//    		st.close();
//    		con.close();
    		
    		return rs;
		}
		catch (Exception e)
		{
			System.out.println(e);
		}
		
		return null;
	
	}

	public boolean updateHistory (String username, String transactionType, int amount)
	{
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/customerInfo";
    		String uname = "root";
    		String pass = "root"; 
    		String query = "insert into transactionDetails (username, transactionType, amount)"
    				+ " values (?, ?, ?);"; 
    		
    		Connection con = DriverManager.getConnection(url, uname, pass);
    		PreparedStatement st = con.prepareStatement(query); 
    		
    		st.setString(1, username);
    		st.setString(2, transactionType);
    		st.setInt(3, amount);
    		
    		int count = st.executeUpdate();
    		
    		System.out.println(count + " lines updated by updateHistory DAO");
    		
    		st.close();
    		con.close();
    		
    		return true;
		}
		catch (Exception e)
		{
			System.out.println(e);
			return false;
		}
	
	}
	
	
	
}

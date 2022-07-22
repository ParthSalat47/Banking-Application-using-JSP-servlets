package login;

import dao.BankDAO; 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    	{
    		
    		Map<String, String> messages = new HashMap<String, String>();
    	    request.setAttribute("messages", messages); // Now it's available by ${messages}
    		
    		String username = request.getParameter("username");
    		String password = request.getParameter("password");
    		
    		BankDAO dao = new BankDAO();
    		
    		if(dao.verifyLogin(username, password))
    		{	
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				request.getSession().setAttribute("username", username);
				
				response.sendRedirect("Dashboard/Dashboard.jsp");
    		}
    		else
    		{
    			request.getSession().setAttribute("LoginFailed", "Incorrect credentials! Please login again");
    			response.sendRedirect("Login/Login.jsp");
    		}
    		
    		
    		
    		
    		
    		
    		
		//response.sendRedirect("Signup.html");
	}

}

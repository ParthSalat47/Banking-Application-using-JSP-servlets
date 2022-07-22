package signup;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BankDAO;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String customerName = request.getParameter("customerName");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Map<String, String> messages = new HashMap<String, String>();
	    request.setAttribute("messages", messages); // Now it's available by ${messages}
		
		BankDAO dao = new BankDAO();
		
		if(dao.insertInDB(customerName, username, password))
		{
			request.getSession().setAttribute("SignupSuccessful", "Signup successful! Please login to use our services.");
			response.sendRedirect("Login/Login.jsp");
		}
		else
		{
			messages.put("SignupFailed", "This username has already been taken. Please choose another username.");
			request.getRequestDispatcher("Signup/Signup.jsp").forward(request, response);
			 
		}
		
	
	}


}

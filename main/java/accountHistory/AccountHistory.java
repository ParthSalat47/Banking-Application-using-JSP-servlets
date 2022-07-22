package accountHistory;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BankDAO;

/**
 * Servlet implementation class AccountHistory
 */
@WebServlet("/AccountHistory")
public class AccountHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		BankDAO dao = new BankDAO();
		
		String username = (String) request.getSession().getAttribute("username");
		ResultSet rs = dao.accountHistory(username);
		
		if(rs == null)
		{
			System.out.println("RS is nullllllllllll");
			response.sendRedirect("Dashboard/AccountHistory/AccountHistoryFailed.jsp");
		}				
		
		try
		{
			String data = "";
			while(rs.next())
			{
				data += 	rs.getString(1) + " : " + rs.getInt(2) + "<br>---------------------<br>";
			}
			
			if(data=="")
				data = "No history to show.";
				
			request.setAttribute("data", data);
			request.getRequestDispatcher("Dashboard/AccountHistory/AccountHistory.jsp").forward(request, response);
			
		}
		catch(Exception e)
		{
			System.out.println(e);
			response.sendRedirect("Dashboard/AccountHistory/AccountHistoryFailed.jsp");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

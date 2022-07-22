package deposit;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BankDAO;

/**
 * Servlet implementation class Deposit
 */
@WebServlet("/Deposit")
public class Deposit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deposit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Map<String, String> messages = new HashMap<String, String>();
	    request.setAttribute("messages", messages); // Now it's available by ${messages}
		
		BankDAO dao = new BankDAO();
		
		//Find the current balance of the user
		String username = (String) request.getSession().getAttribute("username");
		int currentBalance = dao.balanceInquiry(username);
		
		String stringAmount = request.getParameter("amountDeposit");
		int amount=0;
		try
		{
			amount = Integer.parseInt(stringAmount);	
		}
		catch (NumberFormatException e)
		{
			messages.put("depositFail", "Please enter an amount less than " + Integer.MAX_VALUE);
			request.getRequestDispatcher("Dashboard/DepositMoney/DepositHome.jsp").forward(request, response);
		}
		
		
		
		if(amount <= 0)
		{
			messages.put("depositFail", "Please enter an amount greater than 0rs.");
			request.getRequestDispatcher("Dashboard/DepositMoney/DepositHome.jsp").forward(request, response);
			
		}
		
		else 
			//deposit it
		{
			if(dao.editBalance(username, amount+currentBalance) 
					& dao.updateHistory(username, "Deposit", amount)
					)
			{
				messages.put("depositSuccess", "Deposited " + amount + "rs successfully!");
				request.getRequestDispatcher("Dashboard/DepositMoney/DepositHome.jsp").forward(request, response);
				
			}
			else
			{
				messages.put("depositFail", "Deposit failed. Please try after some time.");
				request.getRequestDispatcher("Dashboard/DepositMoney/DepositHome.jsp").forward(request, response);
				
			}
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

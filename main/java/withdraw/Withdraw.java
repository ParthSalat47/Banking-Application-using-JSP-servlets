package withdraw;

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
 * Servlet implementation class Withdraw
 */
@WebServlet("/Withdraw")
public class Withdraw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Withdraw() {
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
		
		String stringAmount = request.getParameter("amountWithdraw");
		int amount=0;
		try
		{
			amount = Integer.parseInt(stringAmount);	
		}
		catch (NumberFormatException e)
		{
			messages.put("withdraw", "Please enter an amount less than " + Integer.MAX_VALUE);
			request.getRequestDispatcher("Dashboard/WithdrawMoney/WithdrawHome.jsp").forward(request, response);
		}
		
		if(currentBalance == 0)
		{
			messages.put("withdraw", "Your balance is nil. Please deposit first.");
			
			request.getRequestDispatcher("Dashboard/WithdrawMoney/WithdrawHome.jsp").forward(request, response);
		}
		else if(amount <= 0) 
		{
			
		    messages.put("withdraw", "Please enter an amount greater than 0rs.");
		    
			request.getRequestDispatcher("Dashboard/WithdrawMoney/WithdrawHome.jsp").forward(request, response);
			

			//request.getRequestDispatcher("Dashboard/WithdrawMoney/InvalidAmount1.jsp").forward(request, response);
		}
		else if(amount > currentBalance)
		{
			messages.put("withdraw", "Please enter an amount between 0 and " + currentBalance);
			request.getRequestDispatcher("Dashboard/WithdrawMoney/WithdrawHome.jsp").forward(request, response);
		}
		else 
			//withdraw it
		{
			if(dao.editBalance(username, currentBalance-amount)
					& dao.updateHistory(username, "Withdraw", amount)
					)
			{
				messages.put("withdrawSuccess", "Withdrawn " + amount +"rs successfully!");
				request.getRequestDispatcher("Dashboard/WithdrawMoney/WithdrawHome.jsp").forward(request, response);
			}
			else
			{
				messages.put("withdraw", "Withdraw failed. Please try again later.");
				request.getRequestDispatcher("Dashboard/WithdrawMoney/WithdrawHome.jsp").forward(request, response);
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

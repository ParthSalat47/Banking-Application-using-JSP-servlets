package signup;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 * Servlet Filter implementation class PasswordFilter
 */
@WebFilter("/Signup")
public class PasswordFilter implements Filter {

    /**
     * Default constructor. 
     */
    public PasswordFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		boolean valid = true;
		String password = request.getParameter("password");
		
		Map<String, String> messages = new HashMap<String, String>();
	    request.setAttribute("messages", messages); // Now it's available by ${messages}
		
	    //Putting this here just for reference:
	    Pattern pat = Pattern.compile("((?=.*\\W)|(?=.*_))(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])");
		Matcher mat = pat.matcher(password);
		
		if(password.length() < 6)
		{
			messages.put("SignupFailed", "Password length should be at least 6 characters.");
			request.getRequestDispatcher("Signup/Signup.jsp").forward(request, response);
			valid = false;
		}
		
		pat = Pattern.compile("((?=.*\\W)|(?=.*_))");
		mat = pat.matcher(password);
		
		if(!mat.find())
		{
			messages.put("SignupFailed", "Password doesn't contain any symbols.");
			request.getRequestDispatcher("Signup/Signup.jsp").forward(request, response);
			valid = false;
		}
		
		pat = Pattern.compile("(?=.*\\d)");
		mat = pat.matcher(password);
		
		if(!mat.find())
		{
			messages.put("SignupFailed", "Password doesn't contain any digits.");
			request.getRequestDispatcher("Signup/Signup.jsp").forward(request, response);
			valid = false;
		}
		
		pat = Pattern.compile("(?=.*[a-z])");
		mat = pat.matcher(password);
		
		if(!mat.find())
		{
			messages.put("SignupFailed", "Password doesn't contain any lowercase characters.");
			request.getRequestDispatcher("Signup/Signup.jsp").forward(request, response);
			valid = false;
		}
		
		pat = Pattern.compile("(?=.*[A-Z])");
		mat = pat.matcher(password);
		
		if(!mat.find())
		{
			messages.put("SignupFailed", "Password doesn't contain any uppercase characters.");
			request.getRequestDispatcher("Signup/Signup.jsp").forward(request, response);
			valid = false;
		}
		
		// pass the request along the filter chain
		if(valid)
			chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}

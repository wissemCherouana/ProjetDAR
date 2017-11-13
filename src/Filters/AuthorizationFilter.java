package Filters;

import javax.servlet.*;  
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AuthorizationFilter implements Filter {

    public static final String USER_SESSION = "id_cinephile";
    public static final String SIGNIN_PAGE = "Login.jsp";
    public static final String SIGNUP_PAGE = "Signup.jsp";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        // Getting the session;
        HttpSession session = request.getSession();
        if (request.getRequestURI().equals(request.getContextPath() + "/") && session.getAttribute(USER_SESSION) == null) {
        	filterChain.doFilter(request, response);
        }
        else if (request.getRequestURI().equals(request.getContextPath() + "/Signup.jsp") && session.getAttribute(USER_SESSION) == null) {
        	filterChain.doFilter(request, response);
        }
        else if (request.getRequestURI().equals(request.getContextPath() + "/Login.jsp") && session.getAttribute(USER_SESSION) == null) {
        	filterChain.doFilter(request, response);
        }
        // Checking if the user exists in the session;
        else if (session.getAttribute(USER_SESSION) == null) {
            // Redirect to connexion page;
            response.sendRedirect(SIGNIN_PAGE);
        }
        else {
            filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}

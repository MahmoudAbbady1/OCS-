package abbady.balancer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get the current session
        HttpSession session = request.getSession(false);
        
        // Remove all session attributes
        if (session != null) {
            // Remove all attributes
            session.removeAttribute("username");
            session.removeAttribute("role");
            session.removeAttribute("balance");
            session.removeAttribute("msisdn");
            
            // Invalidate the session
            session.invalidate();
        }
        
        // Remove all cookies
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                cookie.setMaxAge(0);
                cookie.setValue("");
                cookie.setPath("/");
                response.addCookie(cookie);
            }
        }
        
        // Redirect to login page
        response.sendRedirect("login.jsp");
    }
}

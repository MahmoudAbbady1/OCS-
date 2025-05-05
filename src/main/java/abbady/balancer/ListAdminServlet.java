package abbady.balancer;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin_dashboard")
public class ListAdminServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Check session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Check user role
        String role = (String) session.getAttribute("role");
        if (!"admin".equals(role)) {
            response.sendRedirect("user.jsp");
            return;
        }

        List<String[]> users = new ArrayList<>();

        try {
            Connection conn = DBConnection.openConnection();

            // Query to get all users
            String sql = "SELECT msisdn, username, balance, role FROM users ORDER BY msisdn";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String msisdn = rs.getString("msisdn");
                String username = rs.getString("username");
                String balance = rs.getString("balance");
                String userRole = rs.getString("role");
                users.add(new String[]{msisdn, username, balance, userRole});
            }

            request.setAttribute("users", users);

            rs.close();
            stmt.close();
            DBConnection.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error fetching users data: " + e.getMessage());
        }

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}

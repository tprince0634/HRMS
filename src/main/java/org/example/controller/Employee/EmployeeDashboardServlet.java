package org.example.controller.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Employee/dashboard")
public class EmployeeDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get current session
        HttpSession session = request.getSession(false);

        // If user is not logged in
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login"
            );
            return;
        }

        // Get logged-in user's ID
        int userId = (Integer) session.getAttribute("userId");

        // Get user information from session
        String firstName =
                (String) session.getAttribute("firstName");

        String userEmail =
                (String) session.getAttribute("userEmail");

        String userRole =
                (String) session.getAttribute("userRole");

        // Send data to JSP
        request.setAttribute("userId", userId);
        request.setAttribute("firstName", firstName);
        request.setAttribute("userEmail", userEmail);
        request.setAttribute("userRole", userRole);

        // Forward to dashboard JSP
        request.getRequestDispatcher(
                "/views/employee/dashboard.jsp"
        ).forward(request, response);
    }
}

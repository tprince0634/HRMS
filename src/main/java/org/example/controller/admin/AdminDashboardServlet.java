package org.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.example.service.AdminDashboardService;

import java.io.IOException;

@WebServlet("/Admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private AdminDashboardService adminDashboardService;
    @Override
    public void init() {
        adminDashboardService = new AdminDashboardService();
    }
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Get existing session
        HttpSession session = request.getSession(false);

        // Check login
        if (session == null ||
                session.getAttribute("userId") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );
            return;
        }

        // Check role
        String userRole =
                (String) session.getAttribute("userRole");

        if (userRole == null ||
                !"Admin".equalsIgnoreCase(userRole)) {

            response.sendRedirect(
                    request.getContextPath() + "/login"
            );
            return;
        }

        // Dashboard data
        request.setAttribute(
                "totalEmployees",
                adminDashboardService.getTotalEmployees()
        );

        request.setAttribute(
                "presentToday",
                adminDashboardService.getPresentToday()
        );

        request.setAttribute(
                "onLeave",
                adminDashboardService.getOnLeave()
        );

        request.setAttribute(
                "pendingLeaves",
                adminDashboardService.getPendingLeaves()
        );

        // Forward to JSP
        request.getRequestDispatcher(
                "/views/admin/dashboard.jsp"
        ).forward(request, response);

    }
}
package org.example.controller.Manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/Manager/dashboard")
public class ManagerDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.setAttribute("totalEmployees", 50);
        request.setAttribute("presentToday", 42);
        request.setAttribute("onLeave", 5);
        request.setAttribute("pendingLeaves", 3);

        request.getRequestDispatcher("/views/manager/dashboard.jsp")
                .forward(request, response);
    }
}
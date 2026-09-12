package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.example.model.User;
import org.example.service.AuthService;
import org.example.service.AuthServiceImpl;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private AuthService authService;

    @Override
    public void init() {
        authService = new AuthServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get login details
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Authenticate user
        User user = authService.authenticate(email, password);

        // Login failed
        if (user == null) {
            request.setAttribute("errorMessage", "Invalid email or password!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Login successful
        HttpSession session = request.getSession();
        session.setAttribute("userId", user.getUserId());
        session.setAttribute("userEmail", user.getEmail());
        session.setAttribute("userRole", user.getRoleName());
        session.setAttribute("firstName", user.getFirstName());
        session.setAttribute("lastName", user.getLastName());

        // Get role
        String role = user.getRoleName();

        // ==========================
        // ADMIN
        // ==========================
        if ("Admin".equalsIgnoreCase(role)) {
            response.sendRedirect(
                    request.getContextPath() +
                            "/Admin/dashboard"
            );
        }

        // ==========================
        // MANAGER
        // ==========================
        else if ("Manager".equalsIgnoreCase(role)) {
            response.sendRedirect(
                    request.getContextPath() +
                            "/Manager/dashboard"
            );
        }

        // ==========================
        // EMPLOYEE
        // ==========================
        else if ("Employee".equalsIgnoreCase(role)) {
            response.sendRedirect(
                    request.getContextPath() +
                            "/Employee/dashboard"
            );
        }

        // ==========================
        // UNKNOWN ROLE
        // ==========================
        else {

            response.sendRedirect(
                    request.getContextPath() +
                            "/index.jsp"
            );
        }
    }
}
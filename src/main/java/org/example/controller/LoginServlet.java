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
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // =========================================
        // 1. GET LOGIN DETAILS
        // =========================================

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // =========================================
        // 2. AUTHENTICATE USER
        // =========================================

        User user = authService.authenticate(email, password);


        // =========================================
        // 3. LOGIN FAILED
        // =========================================

        if (user == null) {
            request.setAttribute(
                    "errorMessage", "Invalid email or password!"
            );
            request.getRequestDispatcher("/login.jsp")
                    .forward(request, response);
            return;
        }

        // 4. CHECK USER STATUS
//     =========================================

        if (!"ACTIVE".equalsIgnoreCase(user.getStatus())) {
            request.setAttribute(
                    "errorMessage",
                    "Your account is inactive. Please contact the administrator."
            );
            request.getRequestDispatcher("/login.jsp")
                    .forward(request, response);
            return;
        }



        // =========================================
        // 4. GET ROLE
        // =========================================

        String role = user.getRoleName();
        // Safety check
        if (role == null || role.trim().isEmpty()) {
            request.setAttribute(
                    "errorMessage", "User role is not assigned!"
            );
            request.getRequestDispatcher("/login.jsp").forward(request, response);

            return;
        }
        role = role.trim();

        // =========================================
        // 5. CREATE SESSION
        // =========================================

        HttpSession session = request.getSession();

        // =========================================
        // 6. STORE USER INFORMATION IN SESSION
        // =========================================

        session.setAttribute("userId", user.getUserId());
        session.setAttribute("userEmail", user.getEmail());
        session.setAttribute("userRole", role);
        session.setAttribute("firstName", user.getFirstName());
        session.setAttribute("lastName", user.getLastName());

        // Store complete User object also
        session.setAttribute("loggedInUser", user);

        // =========================================
        // 7. ROLE BASED REDIRECTION
        // =========================================

        if ("Admin".equalsIgnoreCase(role)) {
            response.sendRedirect(
                    request.getContextPath()
                            + "/Admin/dashboard"
            );

        } else if ("Manager".equalsIgnoreCase(role)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/Manager/dashboard"
            );

        } else if ("Employee".equalsIgnoreCase(role)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/Employee/dashboard"
            );

        } else {

            // Unknown role
            session.invalidate();

            request.setAttribute(
                    "errorMessage",
                    "Invalid user role!"
            );

            request.getRequestDispatcher("/login.jsp")
                    .forward(request, response);
        }

    }
}
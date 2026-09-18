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
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");


        // =========================================
        // AUTHENTICATE
        // =========================================

        User user =
                authService.authenticate(
                        email,
                        password
                );


        // =========================================
        // LOGIN FAILED
        // =========================================

        if (user == null) {

            request.setAttribute(
                    "errorMessage",
                    "Invalid email or password!"
            );

            request.getRequestDispatcher(
                    "/login.jsp"
            ).forward(
                    request,
                    response
            );

            return;
        }


        // =========================================
        // LOGIN SUCCESS
        // =========================================

        HttpSession oldSession =
                request.getSession(false);

        if (oldSession != null) {
            oldSession.invalidate();
        }


        HttpSession session =
                request.getSession(true);


        // =========================================
        // SESSION DATA
        // =========================================

        session.setAttribute(
                "userId",
                user.getUserId()
        );

        session.setAttribute(
                "userEmail",
                user.getEmail()
        );

        session.setAttribute(
                "userRole",
                user.getRoleName()
        );

        session.setAttribute(
                "firstName",
                user.getFirstName()
        );

        session.setAttribute(
                "lastName",
                user.getLastName()
        );


        // =========================================
        // ROLE
        // =========================================

        String role =
                user.getRoleName();


        // =========================================
        // ADMIN
        // =========================================

        if ("Admin".equalsIgnoreCase(role)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/Admin/dashboard"
            );

        }


        // =========================================
        // MANAGER
        // =========================================

        else if ("Manager".equalsIgnoreCase(role)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/Manager/dashboard"
            );

        }


        // =========================================
        // EMPLOYEE
        // =========================================

        else if ("Employee".equalsIgnoreCase(role)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/Employee/dashboard"
            );

        }


        // =========================================
        // UNKNOWN ROLE
        // =========================================

        else {

            session.invalidate();

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );
        }
    }

}
package org.example.filter;

// Servlet filter classes
import jakarta.servlet.*;

// Used to register the filter using annotation
import jakarta.servlet.annotation.WebFilter;

// HTTP request, response and session classes
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


// Applies this filter to all incoming requests
@WebFilter("/*")
public class AuthFilter implements Filter {

    // Filter entry point executed for every matching request
    @Override
    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        // Convert generic request into HTTP request
        HttpServletRequest httpRequest =
                (HttpServletRequest) request;

        // Convert generic response into HTTP response
        HttpServletResponse httpResponse =
                (HttpServletResponse) response;

        // Get application context path, e.g. /HRMS
        String contextPath = httpRequest.getContextPath();

        // Get the complete requested URL path
        String requestURI = httpRequest.getRequestURI();

        // Remove context path to get URL inside the application
        String path = requestURI.substring(contextPath.length());


        // =========================================
        // PUBLIC URLS
        // =========================================

        // Allow login page and static resources without authentication
        if (path.equals("/login")
                || path.equals("/login.jsp")
                || path.startsWith("/css/")
                || path.startsWith("/js/")
                || path.startsWith("/images/")
                || path.startsWith("/assets/")) {

            // Continue request without authentication check
            chain.doFilter(request, response);

            // Stop filter execution
            return;
        }


        // =========================================
        // GET EXISTING SESSION
        // =========================================

        // Get existing session without creating a new one
        HttpSession session =
                httpRequest.getSession(false);


        // =========================================
        // CHECK LOGIN
        // =========================================

        // Check whether a valid logged-in session exists
        if (session == null ||
                session.getAttribute("userId") == null) {

            // Redirect unauthenticated user to login
            httpResponse.sendRedirect(
                    contextPath + "/login"
            );

            // Stop request from reaching the protected Servlet
            return;
        }


        // =========================================
        // GET ROLE
        // =========================================

        // Get the logged-in user's role from the session
        String userRole =
                (String) session.getAttribute("userRole");


        // =========================================
        // CHECK ROLE
        // =========================================

        // ADMIN URLS
        if (path.startsWith("/Admin/")) {

            // Only Admin can access Admin URLs
            if (userRole == null ||
                    !"Admin".equalsIgnoreCase(userRole)) {

                // Return 403 when user is not authorized
                httpResponse.sendError(
                        HttpServletResponse.SC_FORBIDDEN,
                        "Access Denied"
                );

                // Stop request processing
                return;
            }
        }


        // MANAGER URLS
        if (path.startsWith("/Manager/")) {

            // Admin and Manager can access Manager URLs
            if (userRole == null ||
                    (!"Manager".equalsIgnoreCase(userRole)
                            && !"Admin".equalsIgnoreCase(userRole))) {

                // Return 403 when user is not authorized
                httpResponse.sendError(
                        HttpServletResponse.SC_FORBIDDEN,
                        "Access Denied"
                );

                // Stop request processing
                return;
            }
        }


        // EMPLOYEE URLS
        if (path.startsWith("/Employee/")) {

            // Admin, Manager and Employee can access Employee URLs
            if (userRole == null ||
                    (!"Employee".equalsIgnoreCase(userRole)
                            && !"Manager".equalsIgnoreCase(userRole)
                            && !"Admin".equalsIgnoreCase(userRole))) {

                // Return 403 when user is not authorized
                httpResponse.sendError(
                        HttpServletResponse.SC_FORBIDDEN,
                        "Access Denied"
                );

                // Stop request processing
                return;
            }
        }


        // =========================================
        // ALLOW REQUEST
        // =========================================

        // Authentication and authorization passed; continue to Servlet
        chain.doFilter(request, response);
    }
}
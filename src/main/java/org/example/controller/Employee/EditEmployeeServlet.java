package org.example.controller.Employee;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.User;
import org.example.service.UserServiceImpl;

import java.io.IOException;

import java.io.IOException;

@WebServlet("/Employee/EditEmployee")
public class EditEmployeeServlet extends HttpServlet {

    private UserServiceImpl userService;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    // =========================================================
    // GET
    // Fetch employee details for Edit modal
    // =========================================================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String userIdParam = request.getParameter("userId");

        if (userIdParam == null || userIdParam.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "User ID is required"
            );

            return;
        }

        try {

            int userId = Integer.parseInt(userIdParam);
            User employee = userService.getEmployeeById(userId);

            if (employee == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Employee not found"
                );

                return;
            }

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            ObjectMapper objectMapper = new ObjectMapper();

            objectMapper.writeValue(
                    response.getWriter(),
                    employee
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid User ID"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to fetch employee details"
            );
        }
    }


    // =========================================================
    // POST
    // Update employee
    // =========================================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String userIdParam = request.getParameter("userId");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String status = request.getParameter("status");

        if (userIdParam == null || userIdParam.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "User ID is required"
            );

            return;
        }

        try {

            int userId = Integer.parseInt(userIdParam);

            userService.updateEmployee(
                    userId,
                    firstName,
                    lastName,
                    email,
                    phoneNumber,
                    status
            );

            // After successful update
            response.sendRedirect(
                    request.getContextPath()
                            + "/Employee/EmployeeList"
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid User ID"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to update employee"
            );
        }
    }
}
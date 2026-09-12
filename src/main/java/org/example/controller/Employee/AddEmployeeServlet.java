package org.example.controller.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.service.UserServiceImpl;

import java.io.IOException;

@WebServlet("/Employee/AddEmployee")
public class AddEmployeeServlet extends HttpServlet {

    private UserServiceImpl userService;

    @Override
    public void init() {

        userService = new UserServiceImpl();
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            // =================================================
            // BASIC INFORMATION
            // =================================================

            String firstName =
                    request.getParameter("firstName");

            String lastName =
                    request.getParameter("lastName");

            String email =
                    request.getParameter("email");

            String password =
                    request.getParameter("password");

            String phoneNumber =
                    request.getParameter("phoneNumber");

            // =================================================
            // ROLE / DEPARTMENT / DESIGNATION
            // =================================================

            int roleId =
                    Integer.parseInt(
                            request.getParameter("roleId")
                    );

            String departmentValue =
                    request.getParameter("departmentId");

            Integer departmentId =
                    departmentValue == null ||
                            departmentValue.isBlank()
                            ? null
                            : Integer.parseInt(departmentValue);

            String designationValue =
                    request.getParameter("designationId");

            Integer designationId =
                    designationValue == null ||
                            designationValue.isBlank()
                            ? null
                            : Integer.parseInt(designationValue);

            // =================================================
            // DATES
            // =================================================

            String dateOfJoining =
                    request.getParameter("dateOfJoining");

            String dateOfBirth =
                    request.getParameter("dateOfBirth");

            // =================================================
            // OTHER INFORMATION
            // =================================================

            String gender =
                    request.getParameter("gender");

            String address =
                    request.getParameter("address");

            String aboutEmployee =
                    request.getParameter("aboutEmployee");

            String reportingManager =
                    request.getParameter("reportingManager");

            String status =
                    request.getParameter("status");

            // =================================================
            // PROFILE PICTURE
            // =================================================

            String profilePicture =
                    "default-profile.png";

            // =================================================
            // CREATED BY
            // =================================================

            String createdBy =
                    (String) request.getSession()
                            .getAttribute("userEmail");

            if (createdBy == null) {
                createdBy = "Admin";
            }

            // =================================================
            // PASSWORD
            // =================================================

            // If your existing registration already hashes
            // passwords, USE THE SAME HASHING METHOD HERE.

            String passwordHash = password;

            // =================================================
            // SAVE EMPLOYEE
            // =================================================

            boolean saved =
                    userService.addEmployee(
                            firstName,
                            lastName,
                            email,
                            passwordHash,
                            phoneNumber,
                            roleId,
                            departmentId,
                            designationId,
                            dateOfJoining,
                            dateOfBirth,
                            gender,
                            address,
                            aboutEmployee,
                            profilePicture,
                            reportingManager,
                            status,
                            createdBy
                    );

            if (saved) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/Employee/EmployeeList"
                );

            } else {

                request.setAttribute(
                        "error",
                        "Employee could not be added."
                );

                request.getRequestDispatcher(
                        "/WEB-INF/views/EmployeeList.jsp"
                ).forward(request, response);
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Error while adding employee: "
                            + e.getMessage()
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/EmployeeList.jsp"
            ).forward(request, response);
        }
    }
}
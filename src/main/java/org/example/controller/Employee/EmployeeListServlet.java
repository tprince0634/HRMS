package org.example.controller.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.service.UserServiceImpl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/Employee/EmployeeList")
public class EmployeeListServlet extends HttpServlet {

    private UserServiceImpl userService;

    @Override
    public void init() {
        userService = new UserServiceImpl();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        try {

            // =================================================
            // FETCH EMPLOYEES
            // =================================================

            List<Map<String, Object>> employees =
                    userService.getAllEmployees();

            // =================================================
            // FETCH DROPDOWN DATA FROM DATABASE
            // =================================================

            List<Map<String, Object>> roles =
                    userService.getAllRoles();

            List<Map<String, Object>> departments =
                    userService.getAllDepartments();

            List<Map<String, Object>> designations =
                    userService.getAllDesignations();

            List<Map<String, Object>> managers =
                    userService.getAllManagers();

            // =================================================
            // SEND DATA TO JSP
            // =================================================

            request.setAttribute("employees", employees);

            request.setAttribute("roles", roles);
            request.setAttribute("departments", departments);
            request.setAttribute("designations", designations);
            request.setAttribute("managers", managers);

            // =================================================
            // SUMMARY COUNTS
            // =================================================

            int totalEmployees = employees.size();

            int activeEmployees = 0;
            int inactiveEmployees = 0;
            int newJoiners = 0;

            java.time.LocalDate today =
                    java.time.LocalDate.now();

            java.time.LocalDate newJoinerDate =
                    today.minusDays(30);

            for (Map<String, Object> employee : employees) {

                String status =
                        String.valueOf(employee.get("status"));

                if ("Active".equalsIgnoreCase(status)) {
                    activeEmployees++;
                }

                if ("Inactive".equalsIgnoreCase(status)) {
                    inactiveEmployees++;
                }

                Object joiningObject =
                        employee.get("dateOfJoining");

                if (joiningObject instanceof java.sql.Timestamp) {

                    java.sql.Timestamp timestamp =
                            (java.sql.Timestamp) joiningObject;

                    java.time.LocalDate joiningDate =
                            timestamp.toLocalDateTime()
                                    .toLocalDate();

                    if (!joiningDate.isBefore(newJoinerDate)
                            && !joiningDate.isAfter(today)) {

                        newJoiners++;
                    }
                }
            }

            // =================================================
            // SEND SUMMARY COUNTS TO JSP
            // =================================================

            request.setAttribute(
                    "totalEmployees",
                    totalEmployees
            );

            request.setAttribute(
                    "activeEmployees",
                    activeEmployees
            );

            request.setAttribute(
                    "inactiveEmployees",
                    inactiveEmployees
            );

            request.setAttribute(
                    "newJoiners",
                    newJoiners
            );

            // =================================================
            // OPEN EMPLOYEE LIST JSP
            // =================================================

            request.getRequestDispatcher(
                    "/views/employee/EmployeeList.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load employee list."
            );

            request.getRequestDispatcher(
                    "/views/employee/EmployeeList.jsp"
            ).forward(request, response);
        }
    }
}
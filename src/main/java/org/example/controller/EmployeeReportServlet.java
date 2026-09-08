package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.EmployeeReport;
import org.example.service.ReportService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/employee-report")
public class EmployeeReportServlet extends HttpServlet {

    private ReportService reportService;

    @Override
    public void init() {
        reportService = new ReportService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Fetch all employees
            List<EmployeeReport> employees =
                    reportService.getAllEmployees();

            // Send employee list to JSP
            request.setAttribute("employees", employees);

            // Total employees
            int totalEmployees = employees.size();

            // Active employees
            long activeEmployees = employees.stream()
                    .filter(employee ->
                            employee.getStatus() != null &&
                                    employee.getStatus().equalsIgnoreCase("Active"))
                    .count();

            // Inactive employees
            long inactiveEmployees = employees.stream()
                    .filter(employee ->
                            employee.getStatus() != null &&
                                    employee.getStatus().equalsIgnoreCase("Inactive"))
                    .count();

            // Total departments
            long totalDepartments = employees.stream()
                    .map(EmployeeReport::getDepartmentId)
                    .filter(id -> id != null)
                    .distinct()
                    .count();

            // Total roles
            long totalRoles = employees.stream()
                    .map(EmployeeReport::getRoleId)
                    .distinct()
                    .count();

            // Send statistics to JSP
            request.setAttribute("totalEmployees", totalEmployees);
            request.setAttribute("activeEmployees", activeEmployees);
            request.setAttribute("inactiveEmployees", inactiveEmployees);
            request.setAttribute("totalDepartments", totalDepartments);
            request.setAttribute("totalRoles", totalRoles);

            // Open JSP
            request.getRequestDispatcher(
                    "/views/admin/reports/employee-report.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to load employee report."
            );

            request.getRequestDispatcher(
                    "/views/admin/reports/employee-report.jsp"
            ).forward(request, response);
        }
    }
}
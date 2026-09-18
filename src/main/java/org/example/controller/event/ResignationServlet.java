package org.example.controller.event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.interfaces.ResignationDAO;
import org.example.model.Resignation;
import org.example.service.ResignationServiceImpl;
import org.example.util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/resignation")
public class ResignationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ResignationDAO resignationService;

    private static final DateTimeFormatter DATE_FORMATTER =
            DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @Override
    public void init() throws ServletException {

        resignationService = new ResignationServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        loadResignations(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action == null || action.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Action is required"
            );

            return;
        }

        try {

            switch (action) {

                case "add":

                    addResignation(request);

                    request.getSession().setAttribute(
                            "successMessage",
                            "Resignation added successfully."
                    );

                    break;

                case "update":

                    updateResignation(request);

                    request.getSession().setAttribute(
                            "successMessage",
                            "Resignation updated successfully."
                    );

                    break;

                case "delete":

                    deleteResignation(request);

                    request.getSession().setAttribute(
                            "successMessage",
                            "Resignation deleted successfully."
                    );

                    break;

                default:

                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "Invalid action"
                    );

                    return;
            }

        } catch (IllegalArgumentException e) {

            request.getSession().setAttribute(
                    "errorMessage",
                    e.getMessage()
            );

        } catch (Exception e) {

            e.printStackTrace();

            request.getSession().setAttribute(
                    "errorMessage",
                    "Something went wrong while processing the resignation."
            );
        }

        response.sendRedirect(
                request.getContextPath() + "/resignation"
        );
    }

    private void loadResignations(HttpServletRequest request,
                                  HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<Resignation> resignations =
                    resignationService.getAllResignations();

            request.setAttribute("resignations", resignations);

            /*
             * IMPORTANT:
             * Load only active Employee-role users for the
             * "Resigning Employee" dropdown.
             *
             * RoleId = 10 is Employee in this project.
             */
            loadAvailableEmployees(request);

            request.getRequestDispatcher(
                    "/views/admin/resignation/admin-resignation.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.getSession().setAttribute(
                    "errorMessage",
                    "Unable to load resignation records."
            );

            response.sendRedirect(
                    request.getContextPath() + "/resignation"
            );
        }
    }

    /*
     * ============================================================
     * LOAD AVAILABLE EMPLOYEES
     * ============================================================
     *
     * User table:
     *   UserId
     *   FirstName
     *   LastName
     *   RoleId
     *   DepartmentId
     *   Status
     *
     * Role table confirms RoleId 10 = Employee.
     *
     * Departments table:
     *   DepartmentId
     *   Name
     *
     * The JSP uses:
     *   ${employees}
     *
     * and each employee option gets:
     *   data-department-id
     *
     * so departmentId is automatically submitted.
     */
    private void loadAvailableEmployees(HttpServletRequest request) {

        List<EmployeeOption> employees =
                new ArrayList<>();

        String sql =
                "SELECT u.UserId, " +
                        "       u.FirstName, " +
                        "       u.LastName, " +
                        "       u.DepartmentId, " +
                        "       COALESCE(d.Name, '-') AS DepartmentName " +
                        "FROM `User` u " +
                        "LEFT JOIN `Departments` d " +
                        "       ON u.DepartmentId = d.DepartmentId " +
                        "WHERE u.RoleId = 10 " +
                        "  AND (u.Status = 'Active' OR u.Status IS NULL) " +
                        "ORDER BY u.FirstName, u.LastName";

        try (Connection connection =
                     DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet rs =
                     statement.executeQuery()) {

            while (rs.next()) {

                EmployeeOption employee =
                        new EmployeeOption();

                employee.setUserId(
                        rs.getInt("UserId")
                );

                employee.setFirstName(
                        rs.getString("FirstName")
                );

                employee.setLastName(
                        rs.getString("LastName")
                );

                int departmentId =
                        rs.getInt("DepartmentId");

                if (rs.wasNull()) {
                    departmentId = 0;
                }

                employee.setDepartmentId(
                        departmentId
                );

                employee.setDepartmentName(
                        rs.getString("DepartmentName")
                );

                employees.add(employee);
            }

            request.setAttribute(
                    "employees",
                    employees
            );

        } catch (Exception e) {

            e.printStackTrace();

            /*
             * Keep the page usable and show an error
             * instead of silently showing "Employee".
             */
            request.setAttribute(
                    "employees",
                    new ArrayList<EmployeeOption>()
            );

            request.setAttribute(
                    "employeeLoadError",
                    "Unable to load available employees."
            );
        }
    }

    private void addResignation(HttpServletRequest request) {

        int userId = parsePositiveInt(
                request.getParameter("userId"),
                "Invalid user ID"
        );

        int departmentId = parsePositiveInt(
                request.getParameter("departmentId"),
                "Invalid department ID"
        );

        LocalDateTime noticeDate =
                parseDate(
                        request.getParameter("noticeDate")
                );

        LocalDateTime resignDate =
                parseDate(
                        request.getParameter("resignDate")
                );

        String reason =
                request.getParameter("reason");

        if (reason == null || reason.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Reason is required"
            );
        }

        Resignation resignation =
                Resignation.builder()
                        .userId(userId)
                        .departmentId(departmentId)
                        .noticeDate(noticeDate)
                        .resignDate(resignDate)
                        .reason(reason.trim())
                        .build();

        boolean result =
                resignationService.addResignation(
                        resignation
                );

        if (!result) {

            throw new IllegalArgumentException(
                    "Unable to add resignation."
            );
        }
    }

    private void updateResignation(HttpServletRequest request) {

        int resignationId = parsePositiveInt(
                request.getParameter("resignationId"),
                "Invalid resignation ID"
        );

        int userId = parsePositiveInt(
                request.getParameter("userId"),
                "Invalid user ID"
        );

        int departmentId = parsePositiveInt(
                request.getParameter("departmentId"),
                "Invalid department ID"
        );

        LocalDateTime noticeDate =
                parseDate(
                        request.getParameter("noticeDate")
                );

        LocalDateTime resignDate =
                parseDate(
                        request.getParameter("resignDate")
                );

        String reason =
                request.getParameter("reason");

        if (reason == null || reason.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Reason is required"
            );
        }

        Resignation resignation =
                Resignation.builder()
                        .resignationId(resignationId)
                        .userId(userId)
                        .departmentId(departmentId)
                        .noticeDate(noticeDate)
                        .resignDate(resignDate)
                        .reason(reason.trim())
                        .build();

        boolean result =
                resignationService.updateResignation(
                        resignation
                );

        if (!result) {

            throw new IllegalArgumentException(
                    "Unable to update resignation."
            );
        }
    }

    private void deleteResignation(HttpServletRequest request) {

        int resignationId = parsePositiveInt(
                request.getParameter("resignationId"),
                "Invalid resignation ID"
        );

        boolean result =
                resignationService.deleteResignation(
                        resignationId
                );

        if (!result) {

            throw new IllegalArgumentException(
                    "Unable to delete resignation."
            );
        }
    }

    private int parsePositiveInt(String value,
                                 String message) {

        if (value == null || value.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    message
            );
        }

        try {

            int number =
                    Integer.parseInt(value);

            if (number <= 0) {

                throw new IllegalArgumentException(
                        message
                );
            }

            return number;

        } catch (NumberFormatException e) {

            throw new IllegalArgumentException(
                    message
            );
        }
    }

    private LocalDateTime parseDate(String value) {

        if (value == null || value.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Date is required"
            );
        }

        try {

            LocalDate date =
                    LocalDate.parse(
                            value.trim(),
                            DATE_FORMATTER
                    );

            return date.atStartOfDay();

        } catch (DateTimeParseException e) {

            throw new IllegalArgumentException(
                    "Invalid date. Please use dd/MM/yyyy format."
            );
        }
    }

    /*
     * Simple request DTO used only by this servlet.
     * This avoids depending on a separate Employee model/DAO.
     */
    public static class EmployeeOption {

        private int userId;
        private String firstName;
        private String lastName;
        private int departmentId;
        private String departmentName;

        public int getUserId() {
            return userId;
        }

        public void setUserId(int userId) {
            this.userId = userId;
        }

        public String getFirstName() {
            return firstName;
        }

        public void setFirstName(String firstName) {
            this.firstName = firstName;
        }

        public String getLastName() {
            return lastName;
        }

        public void setLastName(String lastName) {
            this.lastName = lastName;
        }

        public int getDepartmentId() {
            return departmentId;
        }

        public void setDepartmentId(int departmentId) {
            this.departmentId = departmentId;
        }

        public String getDepartmentName() {
            return departmentName;
        }

        public void setDepartmentName(String departmentName) {
            this.departmentName = departmentName;
        }
    }
}

package org.example.controller.event;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.Termination;
import org.example.service.TerminationServiceImpl;

import org.example.util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/termination")
public class TerminationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private final TerminationServiceImpl terminationService =
            new TerminationServiceImpl();

    private static final DateTimeFormatter INPUT_FORMAT =
            DateTimeFormatter.ofPattern("dd/MM/yyyy");

    private static final DateTimeFormatter DISPLAY_FORMAT =
            DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // Open edit modal for a particular termination.
        if ("edit".equalsIgnoreCase(action)) {

            int terminationId = parseInt(request.getParameter("id"));

            if (terminationId > 0) {

                Termination termination =
                        terminationService.getTerminationById(terminationId);

                if (termination != null) {

                    request.setAttribute(
                            "termination",
                            termination
                    );

                    request.setAttribute(
                            "noticeDateDisplay",
                            formatDate(termination.getNoticeDate())
                    );

                    request.setAttribute(
                            "resignDateDisplay",
                            formatDate(termination.getResignDate())
                    );

                    // The JSP accesses these through the termination object.
                    request.setAttribute("termination",
                            new TerminationView(termination));
                }
            }
        }

        loadTerminations(request);

        request.getRequestDispatcher(
                "/views/admin/Termination/admin-termination.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {

            if ("add".equalsIgnoreCase(action)) {

                Termination termination = buildTermination(request);

                boolean success =
                        terminationService.addTermination(termination);

                setMessage(request, success,
                        "Termination added successfully.",
                        "Failed to add termination.");

            } else if ("update".equalsIgnoreCase(action)) {

                Termination termination = buildTermination(request);

                termination.setTerminationId(
                        parseInt(request.getParameter("terminationId"))
                );

                boolean success =
                        terminationService.updateTermination(termination);

                setMessage(request, success,
                        "Termination updated successfully.",
                        "Failed to update termination.");

            } else if ("delete".equalsIgnoreCase(action)) {

                int terminationId =
                        parseInt(request.getParameter("terminationId"));

                boolean success =
                        terminationService.deleteTermination(terminationId);

                setMessage(request, success,
                        "Termination deleted successfully.",
                        "Failed to delete termination.");

            }

        } catch (IllegalArgumentException e) {

            request.setAttribute("error",
                    e.getMessage());

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Something went wrong while processing termination."
            );
        }

        // PRG pattern: redirect after successful POST.
        if (request.getAttribute("error") == null) {
            response.sendRedirect(
                    request.getContextPath() + "/termination"
            );
            return;
        }

        loadTerminations(request);

        request.getRequestDispatcher(
                "/views/admin/Termination/admin-termination.jsp"
        ).forward(request, response);
    }

    private Termination buildTermination(HttpServletRequest request) {

        int userId =
                parseInt(request.getParameter("userId"));

        String terminationType =
                trim(request.getParameter("terminationType"));

        String reason =
                trim(request.getParameter("reason"));

        LocalDateTime noticeDate =
                parseDate(request.getParameter("noticeDate"));

        LocalDateTime resignDate =
                parseDate(request.getParameter("resignDate"));

        if (userId <= 0) {
            throw new IllegalArgumentException(
                    "Please select a valid employee."
            );
        }

        if (terminationType.isEmpty()) {
            throw new IllegalArgumentException(
                    "Termination type is required."
            );
        }

        if (reason.isEmpty()) {
            throw new IllegalArgumentException(
                    "Termination reason is required."
            );
        }

        if (noticeDate == null || resignDate == null) {
            throw new IllegalArgumentException(
                    "Please enter valid notice and resignation dates."
            );
        }

        if (resignDate.isBefore(noticeDate)) {
            throw new IllegalArgumentException(
                    "Resignation date cannot be before notice date."
            );
        }

        return Termination.builder()
                .userId(userId)
                .terminationType(terminationType)
                .noticeDate(noticeDate)
                .resignDate(resignDate)
                .reason(reason)
                .build();
    }

    private void loadTerminations(HttpServletRequest request) {

        List<Termination> terminations =
                terminationService.getAllTerminations();

        request.setAttribute(
                "terminations",
                terminations
        );

        /*
         * Load employee name + department for the JSP.
         *
         * Termination table stores only UserId.
         * The JSP therefore needs the User table joined
         * with Departments to display:
         *
         * Employee Name
         * Department
         *
         * We intentionally load all Employee-role users here
         * so an already-terminated employee is still displayed
         * correctly even if their status is no longer Active.
         */
        loadEmployees(request);
    }

    private void loadEmployees(HttpServletRequest request) {

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

                String departmentName =
                        rs.getString("DepartmentName");

                if (departmentName == null ||
                        departmentName.trim().isEmpty()) {

                    departmentName = "-";
                }

                employee.setDepartmentName(
                        departmentName.trim()
                );

                employees.add(employee);
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "employeeLoadError",
                    "Unable to load employee details."
            );
        }

        request.setAttribute(
                "employees",
                employees
        );
    }

    private LocalDateTime parseDate(String value) {

        if (value == null || value.trim().isEmpty()) {
            return null;
        }

        value = value.trim();

        // Supports the existing date-picker format: dd/MM/yyyy.
        try {
            LocalDate date =
                    LocalDate.parse(value, INPUT_FORMAT);

            return LocalDateTime.of(
                    date,
                    LocalTime.MIDNIGHT
            );

        } catch (DateTimeParseException e) {

            // Also supports yyyy-MM-dd in case the browser/date picker
            // sends an HTML date value.
            try {
                LocalDate date =
                        LocalDate.parse(value);

                return LocalDateTime.of(
                        date,
                        LocalTime.MIDNIGHT
                );

            } catch (DateTimeParseException ignored) {
                throw new IllegalArgumentException(
                        "Invalid date. Use dd/MM/yyyy."
                );
            }
        }
    }

    private String formatDate(LocalDateTime dateTime) {

        if (dateTime == null) {
            return "";
        }

        return dateTime.format(DISPLAY_FORMAT);
    }

    private int parseInt(String value) {

        if (value == null || value.trim().isEmpty()) {
            return 0;
        }

        try {
            return Integer.parseInt(value.trim());

        } catch (NumberFormatException e) {
            return 0;
        }
    }

    private String trim(String value) {

        return value == null ? "" : value.trim();
    }

    private void setMessage(HttpServletRequest request,
                            boolean success,
                            String successMessage,
                            String errorMessage) {

        if (success) {
            request.setAttribute(
                    "message",
                    successMessage
            );
        } else {
            request.setAttribute(
                    "error",
                    errorMessage
            );
        }
    }

    /*
     * Small JSP view wrapper.
     *
     * Your Termination model contains LocalDateTime, while the JSP date
     * fields need dd/MM/yyyy. This wrapper exposes the same termination
     * fields and adds display values for the edit modal.
     */
    /*
     * ============================================================
     * EMPLOYEE OPTION
     * ============================================================
     *
     * Used by admin-termination.jsp to show the real employee
     * name and department instead of only the UserId.
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

    public static class TerminationView extends Termination {

        private final String noticeDateDisplay;
        private final String resignDateDisplay;

        public TerminationView(Termination source) {

            super(
                    source.getTerminationId(),
                    source.getUserId(),
                    source.getTerminationType(),
                    source.getNoticeDate(),
                    source.getResignDate(),
                    source.getReason()
            );

            this.noticeDateDisplay =
                    source.getNoticeDate() == null
                            ? ""
                            : source.getNoticeDate()
                            .format(DISPLAY_FORMAT);

            this.resignDateDisplay =
                    source.getResignDate() == null
                            ? ""
                            : source.getResignDate()
                            .format(DISPLAY_FORMAT);
        }

        public String getNoticeDateDisplay() {
            return noticeDateDisplay;
        }

        public String getResignDateDisplay() {
            return resignDateDisplay;
        }
    }
}

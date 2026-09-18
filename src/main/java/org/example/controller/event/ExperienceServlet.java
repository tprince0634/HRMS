package org.example.controller.event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.dao.DesignationDAOImpl;
import org.example.interfaces.DesignationDAO;
import org.example.model.Designation;
import org.example.model.Experience;
import org.example.service.ExperienceServiceImpl;
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
import java.util.List;


@WebServlet("/experience")
public class ExperienceServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    // =========================================================
    // SERVICE
    // =========================================================

    private ExperienceServiceImpl experienceService;


    // =========================================================
    // DESIGNATION DAO
    // =========================================================

    private DesignationDAO designationDAO;


    // =========================================================
    // DATE FORMAT
    // =========================================================

    private static final DateTimeFormatter DATE_FORMATTER =
            DateTimeFormatter.ofPattern("dd/MM/yyyy");


    // =========================================================
    // INIT
    // =========================================================

    @Override
    public void init() throws ServletException {

        experienceService =
                new ExperienceServiceImpl();

        designationDAO =
                new DesignationDAOImpl();
    }


    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        loadPage(request, response);
    }


    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action =
                request.getParameter("action");


        // =====================================================
        // ACTION VALIDATION
        // =====================================================

        if (action == null ||
                action.trim().isEmpty()) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Action is required"
            );

            return;
        }


        try {

            switch (action.trim()) {


                // =================================================
                // ADD
                // =================================================

                case "add":

                    addExperience(request);

                    request.getSession()
                            .setAttribute(
                                    "successMessage",
                                    "Experience added successfully."
                            );

                    break;


                // =================================================
                // UPDATE
                // =================================================

                case "update":

                    updateExperience(request);

                    request.getSession()
                            .setAttribute(
                                    "successMessage",
                                    "Experience updated successfully."
                            );

                    break;


                // =================================================
                // DELETE
                // =================================================

                case "delete":

                    deleteExperience(request);

                    request.getSession()
                            .setAttribute(
                                    "successMessage",
                                    "Experience deleted successfully."
                            );

                    break;


                // =================================================
                // INVALID
                // =================================================

                default:

                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "Invalid action"
                    );

                    return;
            }


        } catch (IllegalArgumentException e) {

            request.getSession()
                    .setAttribute(
                            "errorMessage",
                            e.getMessage()
                    );


        } catch (Exception e) {

            e.printStackTrace();

            request.getSession()
                    .setAttribute(
                            "errorMessage",
                            "Something went wrong while processing the experience."
                    );
        }


        // =====================================================
        // POST REDIRECT GET
        // =====================================================

        response.sendRedirect(
                request.getContextPath()
                        + "/experience"
        );
    }


    // =========================================================
    // LOAD PAGE
    // =========================================================

    private void loadPage(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {


            // =================================================
            // LOAD EXPERIENCE
            // =================================================

            List<Experience> experiences =
                    experienceService.getAllExperiences();

            request.setAttribute(
                    "experiences",
                    experiences
            );


            // =================================================
            // LOAD EMPLOYEES
            // =================================================

            loadAvailableEmployees(request);


            // =================================================
            // LOAD DESIGNATIONS
            // =================================================

            loadDesignations(request);


            // =================================================
            // FORWARD JSP
            // =================================================

            request.getRequestDispatcher(
                    "/views/admin/experience/admin-experience.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();

            request.getSession()
                    .setAttribute(
                            "errorMessage",
                            "Unable to load experience records."
                    );

            response.sendRedirect(
                    request.getContextPath()
                            + "/experience"
            );
        }
    }


    // =========================================================
    // LOAD DESIGNATIONS
    // =========================================================

    private void loadDesignations(
            HttpServletRequest request) {

        try {

            List<Designation> designations =
                    designationDAO.getAllDesignations();


            request.setAttribute(
                    "designations",
                    designations
            );


        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "designations",
                    new ArrayList<Designation>()
            );

            request.setAttribute(
                    "designationLoadError",
                    "Unable to load designations."
            );
        }
    }


    // =========================================================
    // ADD EXPERIENCE
    // =========================================================

    private void addExperience(
            HttpServletRequest request) {


        // =====================================================
        // USER ID
        // =====================================================

        int userId =
                parsePositiveInt(
                        request.getParameter("userId"),
                        "Invalid employee."
                );


        // =====================================================
        // DESIGNATION
        // =====================================================

        String designationName =
                request.getParameter(
                        "designationName"
                );


        // =====================================================
        // COMPANY
        // =====================================================

        String companyName =
                request.getParameter(
                        "companyName"
                );


        // =====================================================
        // FROM DATE
        // =====================================================

        LocalDateTime fromDate =
                parseDate(
                        request.getParameter(
                                "fromDate"
                        )
                );


        // =====================================================
        // TO DATE
        // =====================================================

        LocalDateTime toDate =
                parseDate(
                        request.getParameter(
                                "toDate"
                        )
                );


        // =====================================================
        // VALIDATE DESIGNATION
        // =====================================================

        if (designationName == null ||
                designationName.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Designation is required."
            );
        }


        // =====================================================
        // VALIDATE COMPANY
        // =====================================================

        if (companyName == null ||
                companyName.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Company name is required."
            );
        }


        // =====================================================
        // VALIDATE DATES
        // =====================================================

        validateDates(
                fromDate,
                toDate
        );


        // =====================================================
        // BUILD EXPERIENCE
        // =====================================================

        Experience experience =
                Experience.builder()

                        .userId(userId)

                        .designationName(
                                designationName.trim()
                        )

                        .companyName(
                                companyName.trim()
                        )

                        .fromDate(fromDate)

                        .toDate(toDate)

                        .build();


        // =====================================================
        // CALL SERVICE
        // =====================================================

        boolean result =
                experienceService.addExperience(
                        experience
                );


        if (!result) {

            throw new IllegalArgumentException(
                    "Unable to add experience."
            );
        }
    }


    // =========================================================
    // UPDATE EXPERIENCE
    // =========================================================

    private void updateExperience(
            HttpServletRequest request) {


        // =====================================================
        // EXPERIENCE ID
        // =====================================================

        int experienceId =
                parsePositiveInt(
                        request.getParameter(
                                "experienceId"
                        ),
                        "Invalid experience ID."
                );


        // =====================================================
        // USER ID
        // =====================================================

        int userId =
                parsePositiveInt(
                        request.getParameter(
                                "userId"
                        ),
                        "Invalid employee."
                );


        // =====================================================
        // DESIGNATION
        // =====================================================

        String designationName =
                request.getParameter(
                        "designationName"
                );


        // =====================================================
        // COMPANY
        // =====================================================

        String companyName =
                request.getParameter(
                        "companyName"
                );


        // =====================================================
        // FROM DATE
        // =====================================================

        LocalDateTime fromDate =
                parseDate(
                        request.getParameter(
                                "fromDate"
                        )
                );


        // =====================================================
        // TO DATE
        // =====================================================

        LocalDateTime toDate =
                parseDate(
                        request.getParameter(
                                "toDate"
                        )
                );


        // =====================================================
        // VALIDATE DESIGNATION
        // =====================================================

        if (designationName == null ||
                designationName.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Designation is required."
            );
        }


        // =====================================================
        // VALIDATE COMPANY
        // =====================================================

        if (companyName == null ||
                companyName.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Company name is required."
            );
        }


        // =====================================================
        // VALIDATE DATES
        // =====================================================

        validateDates(
                fromDate,
                toDate
        );


        // =====================================================
        // BUILD EXPERIENCE
        // =====================================================

        Experience experience =
                Experience.builder()

                        .experienceId(
                                experienceId
                        )

                        .userId(userId)

                        .designationName(
                                designationName.trim()
                        )

                        .companyName(
                                companyName.trim()
                        )

                        .fromDate(fromDate)

                        .toDate(toDate)

                        .build();


        // =====================================================
        // CALL UPDATE SERVICE
        // =====================================================

        boolean result =
                experienceService.updateExperience(
                        experience
                );


        if (!result) {

            throw new IllegalArgumentException(
                    "Unable to update experience."
            );
        }
    }


    // =========================================================
    // DELETE EXPERIENCE
    // =========================================================

    private void deleteExperience(
            HttpServletRequest request) {


        int experienceId =
                parsePositiveInt(
                        request.getParameter(
                                "experienceId"
                        ),
                        "Invalid experience ID."
                );


        boolean result =
                experienceService.deleteExperience(
                        experienceId
                );


        if (!result) {

            throw new IllegalArgumentException(
                    "Unable to delete experience."
            );
        }
    }


    // =========================================================
    // LOAD EMPLOYEES
    // =========================================================

    private void loadAvailableEmployees(
            HttpServletRequest request) {


        List<EmployeeOption> employees =
                new ArrayList<>();


        // =====================================================
        // EMPLOYEE QUERY
        // =====================================================

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


        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql);

                ResultSet rs =
                        statement.executeQuery()
        ) {


            while (rs.next()) {


                EmployeeOption employee =
                        new EmployeeOption();


                // =================================================
                // USER ID
                // =================================================

                employee.setUserId(
                        rs.getInt("UserId")
                );


                // =================================================
                // FIRST NAME
                // =================================================

                employee.setFirstName(
                        rs.getString("FirstName")
                );


                // =================================================
                // LAST NAME
                // =================================================

                employee.setLastName(
                        rs.getString("LastName")
                );


                // =================================================
                // DEPARTMENT ID
                // =================================================

                int departmentId =
                        rs.getInt("DepartmentId");


                if (rs.wasNull()) {

                    departmentId = 0;
                }


                employee.setDepartmentId(
                        departmentId
                );


                // =================================================
                // DEPARTMENT NAME
                // =================================================

                String departmentName =
                        rs.getString(
                                "DepartmentName"
                        );


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


        // =====================================================
        // SEND EMPLOYEES TO JSP
        // =====================================================

        request.setAttribute(
                "employees",
                employees
        );
    }


    // =========================================================
    // PARSE POSITIVE INTEGER
    // =========================================================

    private int parsePositiveInt(
            String value,
            String message) {


        if (value == null ||
                value.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    message
            );
        }


        try {

            int number =
                    Integer.parseInt(
                            value.trim()
                    );


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


    // =========================================================
    // PARSE DATE
    // =========================================================

    private LocalDateTime parseDate(
            String value) {


        if (value == null ||
                value.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Date is required."
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


    // =========================================================
    // VALIDATE DATES
    // =========================================================

    private void validateDates(
            LocalDateTime fromDate,
            LocalDateTime toDate) {


        if (fromDate == null) {

            throw new IllegalArgumentException(
                    "From date is required."
            );
        }


        if (toDate == null) {

            throw new IllegalArgumentException(
                    "To date is required."
            );
        }


        // =====================================================
        // TO DATE < FROM DATE
        // =====================================================

        if (toDate.isBefore(fromDate)) {

            throw new IllegalArgumentException(
                    "To date cannot be before From date."
            );
        }


        // =====================================================
        // FUTURE FROM DATE
        // =====================================================

        if (fromDate.isAfter(
                LocalDateTime.now()
        )) {

            throw new IllegalArgumentException(
                    "From date cannot be in the future."
            );
        }
    }


    // =========================================================
    // EMPLOYEE OPTION DTO
    // =========================================================

    public static class EmployeeOption {


        private int userId;

        private String firstName;

        private String lastName;

        private int departmentId;

        private String departmentName;


        // =====================================================
        // USER ID
        // =====================================================

        public int getUserId() {

            return userId;
        }


        public void setUserId(
                int userId) {

            this.userId =
                    userId;
        }


        // =====================================================
        // FIRST NAME
        // =====================================================

        public String getFirstName() {

            return firstName;
        }


        public void setFirstName(
                String firstName) {

            this.firstName =
                    firstName;
        }


        // =====================================================
        // LAST NAME
        // =====================================================

        public String getLastName() {

            return lastName;
        }


        public void setLastName(
                String lastName) {

            this.lastName =
                    lastName;
        }


        // =====================================================
        // DEPARTMENT ID
        // =====================================================

        public int getDepartmentId() {

            return departmentId;
        }


        public void setDepartmentId(
                int departmentId) {

            this.departmentId =
                    departmentId;
        }


        // =====================================================
        // DEPARTMENT NAME
        // =====================================================

        public String getDepartmentName() {

            return departmentName;
        }


        public void setDepartmentName(
                String departmentName) {

            this.departmentName =
                    departmentName;
        }
    }
}
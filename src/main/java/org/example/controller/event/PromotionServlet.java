package org.example.controller.event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.dao.DesignationDAOImpl;
import org.example.dao.PromotionDAOImpl;
import org.example.interfaces.DesignationDAO;
import org.example.interfaces.PromotionDAO;
import org.example.model.Designation;
import org.example.model.Promotion;
import org.example.service.PromotionServiceImpl;
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
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/promotion")
public class PromotionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private PromotionServiceImpl promotionService;

    private DesignationDAO designationDAO;

    /*
     * JSP date format:
     *
     * dd-MM-yyyy
     *
     * Example:
     * 24-09-2026
     */
    private static final DateTimeFormatter DATE_FORMATTER =
            DateTimeFormatter.ofPattern("dd-MM-yyyy");

    /*
     * Old format support
     *
     * Example:
     * 24/09/2026
     */
    private static final DateTimeFormatter OLD_DATE_FORMATTER =
            DateTimeFormatter.ofPattern("dd/MM/yyyy");


    // ============================================================
    // INIT
    // ============================================================

    @Override
    public void init() throws ServletException {

        PromotionDAO promotionDAO =
                new PromotionDAOImpl();

        promotionService =
                new PromotionServiceImpl(promotionDAO);

        /*
         * Designation DAO
         *
         * This fetches designations from
         * Designation table through:
         *
         * sp_get_all_designations()
         */
        designationDAO =
                new DesignationDAOImpl();
    }


    // ============================================================
    // GET
    // ============================================================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        try {

            /*
             * EDIT
             */
            if ("edit".equalsIgnoreCase(action)) {

                showEditPromotion(request, response);

            }

            /*
             * NORMAL LIST
             */
            else {

                showPromotionList(request, response);

            }

        } catch (Exception e) {

            e.printStackTrace();

            request.getSession().setAttribute(
                    "errorMessage",
                    "Unable to load promotion data."
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/promotion"
            );
        }
    }


    // ============================================================
    // POST
    // ============================================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action =
                request.getParameter("action");

        try {

            /*
             * ADD
             */
            if ("add".equalsIgnoreCase(action)) {

                addPromotion(request);

            }

            /*
             * UPDATE
             */
            else if ("update".equalsIgnoreCase(action)) {

                updatePromotion(request);

            }

            /*
             * DELETE
             */
            else if ("delete".equalsIgnoreCase(action)) {

                deletePromotion(request);

            }

            /*
             * INVALID
             */
            else {

                request.getSession().setAttribute(
                        "errorMessage",
                        "Invalid promotion action."
                );
            }

        }

        catch (NumberFormatException e) {

            e.printStackTrace();

            request.getSession().setAttribute(
                    "errorMessage",
                    "Please enter valid employee or promotion ID."
            );

        }

        catch (DateTimeParseException e) {

            e.printStackTrace();

            request.getSession().setAttribute(
                    "errorMessage",
                    "Please enter promotion date in dd-MM-yyyy format. Example: 24-09-2026"
            );

        }

        catch (IllegalArgumentException e) {

            e.printStackTrace();

            request.getSession().setAttribute(
                    "errorMessage",
                    e.getMessage()
            );

        }

        catch (Exception e) {

            e.printStackTrace();

            request.getSession().setAttribute(
                    "errorMessage",
                    "Operation failed."
            );
        }

        response.sendRedirect(
                request.getContextPath()
                        + "/promotion"
        );
    }


    // ============================================================
    // SHOW PROMOTION LIST
    // ============================================================

    private void showPromotionList(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        /*
         * Get all promotions
         */
        List<Promotion> promotions =
                promotionService.getAllPromotions();

        request.setAttribute(
                "promotions",
                promotions
        );


        /*
         * Load employees
         */
        loadEmployeeDirectory(request);


        /*
         * IMPORTANT
         *
         * Load designations from Designation table
         */
        loadDesignations(request);


        /*
         * Forward JSP
         */
        request.getRequestDispatcher(
                "/views/admin/promotion/admin-promotion.jsp"
        ).forward(
                request,
                response
        );
    }


    // ============================================================
    // SHOW EDIT PROMOTION
    // ============================================================

    private void showEditPromotion(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String id =
                request.getParameter("id");

        if (id == null ||
                id.trim().isEmpty()) {

            request.getSession().setAttribute(
                    "errorMessage",
                    "Promotion ID is required."
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/promotion"
            );

            return;
        }


        int promotionId =
                Integer.parseInt(id);


        /*
         * Get promotion by ID
         */
        Promotion promotion =
                promotionService.getPromotionById(
                        promotionId
                );


        if (promotion == null) {

            request.getSession().setAttribute(
                    "errorMessage",
                    "Promotion not found."
            );

            response.sendRedirect(
                    request.getContextPath()
                            + "/promotion"
            );

            return;
        }


        /*
         * Send selected promotion
         * to edit modal
         */
        request.setAttribute(
                "editPromotion",
                promotion
        );


        /*
         * Load all promotions
         */
        List<Promotion> promotions =
                promotionService.getAllPromotions();

        request.setAttribute(
                "promotions",
                promotions
        );


        /*
         * Load employees
         */
        loadEmployeeDirectory(request);


        /*
         * IMPORTANT
         *
         * Load designations also for EDIT
         */
        loadDesignations(request);


        /*
         * Forward JSP
         */
        request.getRequestDispatcher(
                "/views/admin/promotion/admin-promotion.jsp"
        ).forward(
                request,
                response
        );
    }


    // ============================================================
    // ADD PROMOTION
    // ============================================================

    private void addPromotion(
            HttpServletRequest request) {

        /*
         * Employee
         */
        String userIdValue =
                request.getParameter("userId");

        if (userIdValue == null ||
                userIdValue.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Employee is required."
            );
        }


        int userId =
                Integer.parseInt(
                        userIdValue.trim()
                );


        if (userId <= 0) {

            throw new IllegalArgumentException(
                    "Invalid employee."
            );
        }


        /*
         * Designation From
         *
         * Now this comes from dropdown
         */
        String designationFrom =
                request.getParameter(
                        "designationFrom"
                );


        /*
         * Designation To
         *
         * Now this comes from dropdown
         */
        String designationTo =
                request.getParameter(
                        "designationTo"
                );


        /*
         * Validate designation From
         */
        if (designationFrom == null ||
                designationFrom.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Designation From is required."
            );
        }


        /*
         * Validate designation To
         */
        if (designationTo == null ||
                designationTo.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Designation To is required."
            );
        }


        /*
         * Promotion Date
         */
        String dateValue =
                request.getParameter(
                        "date"
                );


        /*
         * Convert String -> LocalDateTime
         */
        LocalDateTime date =
                parseDate(dateValue);


        /*
         * Build Promotion
         */
        Promotion promotion =
                Promotion.builder()
                        .userId(userId)
                        .designationFrom(
                                designationFrom.trim()
                        )
                        .designationTo(
                                designationTo.trim()
                        )
                        .date(date)
                        .build();


        /*
         * Save
         */
        boolean saved =
                promotionService.addPromotion(
                        promotion
                );


        if (saved) {

            request.getSession().setAttribute(
                    "successMessage",
                    "Promotion added successfully."
            );

        } else {

            request.getSession().setAttribute(
                    "errorMessage",
                    "Promotion could not be added."
            );
        }
    }


    // ============================================================
    // UPDATE PROMOTION
    // ============================================================

    private void updatePromotion(
            HttpServletRequest request) {

        /*
         * Promotion ID
         */
        String promotionIdValue =
                request.getParameter(
                        "promotionId"
                );

        if (promotionIdValue == null ||
                promotionIdValue.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Promotion ID is required."
            );
        }


        int promotionId =
                Integer.parseInt(
                        promotionIdValue.trim()
                );


        /*
         * Employee
         */
        String userIdValue =
                request.getParameter(
                        "userId"
                );

        if (userIdValue == null ||
                userIdValue.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Employee is required."
            );
        }


        int userId =
                Integer.parseInt(
                        userIdValue.trim()
                );


        /*
         * Designation From
         */
        String designationFrom =
                request.getParameter(
                        "designationFrom"
                );


        /*
         * Designation To
         */
        String designationTo =
                request.getParameter(
                        "designationTo"
                );


        /*
         * Validate
         */
        if (designationFrom == null ||
                designationFrom.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Designation From is required."
            );
        }


        if (designationTo == null ||
                designationTo.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Designation To is required."
            );
        }


        /*
         * Date
         */
        String dateValue =
                request.getParameter(
                        "date"
                );


        LocalDateTime date =
                parseDate(dateValue);


        /*
         * Build object
         */
        Promotion promotion =
                Promotion.builder()
                        .promotionId(promotionId)
                        .userId(userId)
                        .designationFrom(
                                designationFrom.trim()
                        )
                        .designationTo(
                                designationTo.trim()
                        )
                        .date(date)
                        .build();


        /*
         * Update
         */
        boolean updated =
                promotionService.updatePromotion(
                        promotion
                );


        if (updated) {

            request.getSession().setAttribute(
                    "successMessage",
                    "Promotion updated successfully."
            );

        } else {

            request.getSession().setAttribute(
                    "errorMessage",
                    "Promotion could not be updated."
            );
        }
    }


    // ============================================================
    // DELETE PROMOTION
    // ============================================================

    private void deletePromotion(
            HttpServletRequest request) {

        String promotionIdValue =
                request.getParameter(
                        "promotionId"
                );


        if (promotionIdValue == null ||
                promotionIdValue.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Promotion ID is required."
            );
        }


        int promotionId =
                Integer.parseInt(
                        promotionIdValue.trim()
                );


        boolean deleted =
                promotionService.deletePromotion(
                        promotionId
                );


        if (deleted) {

            request.getSession().setAttribute(
                    "successMessage",
                    "Promotion deleted successfully."
            );

        } else {

            request.getSession().setAttribute(
                    "errorMessage",
                    "Promotion could not be deleted."
            );
        }
    }


    // ============================================================
    // LOAD DESIGNATIONS
    // ============================================================

    private void loadDesignations(
            HttpServletRequest request) {

        try {

            /*
             * Fetch designation list from
             * DesignationDAOImpl
             *
             * which calls:
             *
             * sp_get_all_designations()
             */
            List<Designation> designations =
                    designationDAO.getAllDesignations();


            /*
             * Send to JSP
             */
            request.setAttribute(
                    "designations",
                    designations
            );


        } catch (Exception e) {

            e.printStackTrace();


            /*
             * Prevent JSP error
             */
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


    // ============================================================
    // LOAD EMPLOYEE DIRECTORY
    // ============================================================

    private void loadEmployeeDirectory(
            HttpServletRequest request) {

        Map<Integer, String> userMap =
                new LinkedHashMap<>();

        Map<Integer, String> departmentMap =
                new LinkedHashMap<>();


        /*
         * Employee + Department
         */
        String sql =
                "SELECT u.UserId, " +
                        "       CONCAT(TRIM(u.FirstName), " +
                        "              CASE " +
                        "                WHEN u.LastName IS NULL " +
                        "                     OR TRIM(u.LastName) = '' " +
                        "                THEN '' " +
                        "                ELSE CONCAT(' ', TRIM(u.LastName)) " +
                        "              END) AS FullName, " +
                        "       COALESCE(d.Name, '-') AS DepartmentName " +
                        "FROM `User` u " +
                        "LEFT JOIN `Departments` d " +
                        "       ON u.DepartmentId = d.DepartmentId " +
                        "ORDER BY FullName";


        try (Connection connection =
                     DBConnection.getConnection();

             PreparedStatement statement =
                     connection.prepareStatement(sql);

             ResultSet rs =
                     statement.executeQuery()) {


            while (rs.next()) {

                int userId =
                        rs.getInt("UserId");


                String fullName =
                        rs.getString("FullName");


                String departmentName =
                        rs.getString(
                                "DepartmentName"
                        );


                if (fullName == null ||
                        fullName.trim().isEmpty()) {

                    fullName =
                            "User #" + userId;
                }


                if (departmentName == null ||
                        departmentName.trim().isEmpty()) {

                    departmentName = "-";
                }


                userMap.put(
                        userId,
                        fullName.trim()
                );


                departmentMap.put(
                        userId,
                        departmentName.trim()
                );
            }


        } catch (Exception e) {

            e.printStackTrace();


            request.setAttribute(
                    "employeeLoadError",
                    "Unable to load employee details."
            );
        }


        /*
         * Send maps to JSP
         */
        request.setAttribute(
                "userMap",
                userMap
        );


        request.setAttribute(
                "departmentMap",
                departmentMap
        );
    }


    // ============================================================
    // PARSE DATE
    // ============================================================

    private LocalDateTime parseDate(
            String value) {

        if (value == null ||
                value.trim().isEmpty()) {

            throw new DateTimeParseException(
                    "Promotion date is required",
                    "",
                    0
            );
        }


        String dateValue =
                value.trim();


        LocalDate date;


        /*
         * First:
         *
         * dd-MM-yyyy
         */
        try {

            date =
                    LocalDate.parse(
                            dateValue,
                            DATE_FORMATTER
                    );


        } catch (DateTimeParseException e) {

            /*
             * Backward compatibility:
             *
             * dd/MM/yyyy
             */
            date =
                    LocalDate.parse(
                            dateValue,
                            OLD_DATE_FORMATTER
                    );
        }


        /*
         * LocalDate -> LocalDateTime
         *
         * Time = 00:00:00
         */
        return LocalDateTime.of(
                date,
                LocalTime.MIDNIGHT
        );
    }
}
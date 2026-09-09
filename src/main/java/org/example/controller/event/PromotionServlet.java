
        package org.example.controller.event;

import org.example.dao.PromotionDAOImpl;
import org.example.interfaces.PromotionDAO;
import org.example.model.Promotion;
import org.example.service.PromotionServiceImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;

@WebServlet("/promotion")
public class PromotionServlet extends HttpServlet {

    private PromotionServiceImpl promotionService;

    /*
     * Main date format used by JSP.
     *
     * Example:
     * 24-09-2026
     */
    private static final DateTimeFormatter DATE_FORMATTER =
            DateTimeFormatter.ofPattern("dd-MM-yyyy");

    /*
     * Backup formatter.
     *
     * This allows:
     * 24/09/2026
     *
     * in case an old form/browser sends slash format.
     */
    private static final DateTimeFormatter OLD_DATE_FORMATTER =
            DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @Override
    public void init() throws ServletException {

        PromotionDAO promotionDAO =
                new PromotionDAOImpl();

        promotionService =
                new PromotionServiceImpl(promotionDAO);
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        try {

            if ("edit".equalsIgnoreCase(action)) {

                showEditPromotion(request, response);

            } else {

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

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");

        try {

            if ("add".equalsIgnoreCase(action)) {

                addPromotion(request);

            } else if ("update".equalsIgnoreCase(action)) {

                updatePromotion(request);

            } else if ("delete".equalsIgnoreCase(action)) {

                deletePromotion(request);

            } else {

                request.getSession().setAttribute(
                        "errorMessage",
                        "Invalid promotion action."
                );
            }

        } catch (NumberFormatException e) {

            e.printStackTrace();

            request.getSession().setAttribute(
                    "errorMessage",
                    "Please enter valid employee or promotion ID."
            );

        } catch (DateTimeParseException e) {

            e.printStackTrace();

            request.getSession().setAttribute(
                    "errorMessage",
                    "Please enter promotion date in dd-MM-yyyy format. Example: 24-09-2026"
            );

        } catch (Exception e) {

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

    /*
     * ============================================================
     * SHOW PROMOTION LIST
     * ============================================================
     */

    private void showPromotionList(HttpServletRequest request,
                                   HttpServletResponse response)
            throws ServletException, IOException {

        List<Promotion> promotions =
                promotionService.getAllPromotions();

        request.setAttribute(
                "promotions",
                promotions
        );

        request.getRequestDispatcher(
                "/views/admin/promotion/admin-promotion.jsp"
        ).forward(
                request,
                response
        );
    }

    /*
     * ============================================================
     * SHOW EDIT PROMOTION
     * ============================================================
     */

    private void showEditPromotion(HttpServletRequest request,
                                   HttpServletResponse response)
            throws ServletException, IOException {

        String id =
                request.getParameter("id");

        if (id == null || id.trim().isEmpty()) {

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

        request.setAttribute(
                "editPromotion",
                promotion
        );

        List<Promotion> promotions =
                promotionService.getAllPromotions();

        request.setAttribute(
                "promotions",
                promotions
        );

        request.getRequestDispatcher(
                "/views/admin/promotion/admin-promotion.jsp"
        ).forward(
                request,
                response
        );
    }

    /*
     * ============================================================
     * ADD PROMOTION
     * ============================================================
     */

    private void addPromotion(HttpServletRequest request) {

        String userIdValue =
                request.getParameter("userId");

        if (userIdValue == null
                || userIdValue.trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Employee is required."
            );
        }

        int userId =
                Integer.parseInt(
                        userIdValue
                );

        String designationFrom =
                request.getParameter(
                        "designationFrom"
                );

        String designationTo =
                request.getParameter(
                        "designationTo"
                );

        String dateValue =
                request.getParameter(
                        "date"
                );

        /*
         * Convert String date into LocalDateTime.
         */
        LocalDateTime date =
                parseDate(dateValue);

        Promotion promotion =
                Promotion.builder()
                        .userId(userId)
                        .designationFrom(designationFrom)
                        .designationTo(designationTo)
                        .date(date)
                        .build();

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

    /*
     * ============================================================
     * UPDATE PROMOTION
     * ============================================================
     */

    private void updatePromotion(HttpServletRequest request) {

        int promotionId =
                Integer.parseInt(
                        request.getParameter(
                                "promotionId"
                        )
                );

        int userId =
                Integer.parseInt(
                        request.getParameter(
                                "userId"
                        )
                );

        String designationFrom =
                request.getParameter(
                        "designationFrom"
                );

        String designationTo =
                request.getParameter(
                        "designationTo"
                );

        String dateValue =
                request.getParameter(
                        "date"
                );

        /*
         * Convert String date into LocalDateTime.
         */
        LocalDateTime date =
                parseDate(dateValue);

        Promotion promotion =
                Promotion.builder()
                        .promotionId(promotionId)
                        .userId(userId)
                        .designationFrom(designationFrom)
                        .designationTo(designationTo)
                        .date(date)
                        .build();

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

    /*
     * ============================================================
     * DELETE PROMOTION
     * ============================================================
     */

    private void deletePromotion(HttpServletRequest request) {

        int promotionId =
                Integer.parseInt(
                        request.getParameter(
                                "promotionId"
                        )
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

    /*
     * ============================================================
     * PARSE DATE
     * ============================================================
     *
     * JSP sends:
     *
     *     24-09-2026
     *
     * Main format:
     *
     *     dd-MM-yyyy
     *
     * We also support:
     *
     *     24/09/2026
     *
     * for backward compatibility.
     *
     * Finally convert LocalDate into LocalDateTime
     * at midnight.
     */

    private LocalDateTime parseDate(String value) {

        if (value == null
                || value.trim().isEmpty()) {

            throw new DateTimeParseException(
                    "Promotion date is required",
                    value == null ? "" : value,
                    0
            );
        }

        String dateValue =
                value.trim();

        LocalDate date;

        try {

            /*
             * First try:
             *
             * dd-MM-yyyy
             *
             * Example:
             * 24-09-2026
             */

            date =
                    LocalDate.parse(
                            dateValue,
                            DATE_FORMATTER
                    );

        } catch (DateTimeParseException e) {

            /*
             * If that fails, try:
             *
             * dd/MM/yyyy
             *
             * Example:
             * 24/09/2026
             */

            date =
                    LocalDate.parse(
                            dateValue,
                            OLD_DATE_FORMATTER
                    );
        }

        /*
         * Convert:
         *
         * LocalDate
         *
         * into:
         *
         * LocalDateTime
         *
         * Time = 00:00:00
         */

        return LocalDateTime.of(
                date,
                LocalTime.MIDNIGHT
        );
    }
}

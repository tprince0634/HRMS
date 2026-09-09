package org.example.controller.event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.interfaces.ResignationDAO;
import org.example.model.Resignation;
import org.example.service.ResignationServiceImpl;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;

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

        Resignation resignation =
                Resignation.builder()
                        .userId(userId)
                        .departmentId(departmentId)
                        .noticeDate(noticeDate)
                        .resignDate(resignDate)
                        .reason(reason)
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

        Resignation resignation =
                Resignation.builder()
                        .resignationId(resignationId)
                        .userId(userId)
                        .departmentId(departmentId)
                        .noticeDate(noticeDate)
                        .resignDate(resignDate)
                        .reason(reason)
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
}
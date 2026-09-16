package org.example.controller.attendance;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import  org.example.dao.AttendanceDaoImpl.AttendanceResultWrapper;
import org.example.model.Attendance;
import org.example.model.User;
import org.example.service.AttendanceService;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/employee/attendance")
public class AttendanceServlet extends HttpServlet {

    private final AttendanceService service = new AttendanceService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession(false);
            if (!isValidSession(session)) {
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                return;
            }

            Integer userIdObj = (Integer) session.getAttribute("userId");
            int userId = (userIdObj != null) ? userIdObj : 0;

            User loggedInUser = (User) session.getAttribute("user");

            LocalDateTime dateOfJoining = (loggedInUser != null ? loggedInUser.getDateOfJoining() : null);

               String dateRange =    request.getParameter("dateRange");
               String startDate = request.getParameter("startDate");
               String endDate = request.getParameter("endDate");
               String status = request.getParameter("status");
               String sort = request.getParameter("sort");

               int page = (request.getParameter("rowsPerPage") != null && !request.getParameter("page").isEmpty()) ?
                       Integer.parseInt(request.getParameter("page") ) : 1;

            int  limit = (request.getParameter("rowsPerPage") != null && !request.getParameter("rowsPerPage").isEmpty()) ?
                    Integer.parseInt(request.getParameter("rowsPerPage") ) : 10 ;

            int offset = (page -1)*limit;


            try {
                AttendanceResultWrapper resultWrapper = service.validatedAttendanceHistory(userId, status, dateRange, startDate, endDate, sort, limit, offset, dateOfJoining);

                request.setAttribute("attendanceList", resultWrapper.historyList());
                request.setAttribute("totalRecords", resultWrapper.totalRecords());
                request.setAttribute("currentPage", page);
                request.setAttribute("rowsPerPage", limit);
            }
            catch (IllegalArgumentException e )
            {
                request.setAttribute("errorMessage", e.getMessage());

                request.setAttribute("attendanceList", new java.util.ArrayList<Attendance>());
                request.setAttribute("totalRecords", 0);
                request.setAttribute("currentPage", 1);
                request.setAttribute("rowsPerPage", limit);
            }

            request.setAttribute("selectedDateRange", dateRange);
            request.setAttribute("selectedStartDate", startDate);
            request.setAttribute("selectedEndDate", endDate);
            request.setAttribute("selectedStatus", status);
            request.setAttribute("selectedSort", sort);

            Attendance todayRecord = service.getTodayStatus(userId);
            request.setAttribute("attendance", todayRecord);
            request.getRequestDispatcher("/views/employee/attendance.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error rendering attendance dashboard", e);
        }
    }
    private boolean isValidSession(HttpSession session) {
        return session != null && session.getAttribute("userId") != null;
    }


    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession(false);

            if (!isValidSession(session)) {
                response.sendRedirect(
                        request.getContextPath() + "/login.jsp"
                );
                return;
            }

            // Get userId from session
            Object userIdObj = session.getAttribute("userId");

            int userId;

            if (userIdObj instanceof Integer) {
                userId = (Integer) userIdObj;

            } else if (userIdObj instanceof Long) {
                userId = ((Long) userIdObj).intValue();

            } else {
                userId = Integer.parseInt(
                        userIdObj.toString()
                );
            }

            // Get action from JSP
            String action = request.getParameter("action");

            System.out.println("Action received: " + action);
            System.out.println("User ID: " + userId);

            // Convert JSP action to Service action
            String serviceAction;

            switch (action) {

                case "CHECK_IN": serviceAction = "checkin";
                break;

                case "LUNCH_IN": serviceAction = "lunchin";
                    break;

                case "LUNCH_OUT": serviceAction = "lunchout";
                    break;

                case "CHECK_OUT": serviceAction = "checkout";
                    break;

                default:
                    response.sendError(
                            HttpServletResponse.SC_BAD_REQUEST,
                            "Invalid attendance action"
                    );
                    return;
            }
            String message =
                    service.processAttendanceAction(
                            serviceAction,
                            userId
                    );

            System.out.println("Attendance result: " + message);

            // Redirect back to attendance page
            response.sendRedirect(
                    request.getContextPath()
                            + "/employee/attendance"
            );

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Error processing attendance action",
                    e
            );
        }
    }




}
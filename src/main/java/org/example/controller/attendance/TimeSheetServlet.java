package org.example.controller.attendance;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.dao.TimeSheetDaoImpl;
import org.example.model.TimeSheet;
import org.example.model.User;
import org.example.service.TimeSheetService;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;

@WebServlet("/AddTimesheet")
public class TimeSheetServlet extends HttpServlet {

    private final TimeSheetService timesheetService = new TimeSheetService();

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            try {
                HttpSession session = request.getSession(false);
                if (session == null || session.getAttribute("userId") == null) {
                    response.sendRedirect(request.getContextPath() + "/login.jsp");
                    return;
                }


                String roleName = (String) session.getAttribute("roleName");
                Integer filterUserId = null;

                  if (roleName != null && "EMPLOYEE".equalsIgnoreCase(roleName.trim())) {
                    filterUserId = Integer.parseInt(session.getAttribute("userId").toString());
                }

                String projectIdStr = request.getParameter("projectId");
                String dateRange = request.getParameter("dateRange");
                String searchQuery = request.getParameter("search");


                int page = (request.getParameter("page") != null && !request.getParameter("page").isEmpty()) ?
                        Integer.parseInt(request.getParameter("page")) : 1;
                int limit = (request.getParameter("rowsPerPage") != null && !request.getParameter("rowsPerPage").isEmpty()) ?
                        Integer.parseInt(request.getParameter("rowsPerPage")) : 10;

                // Call Service Layer Engine to pull matched rows and counts in a single window execution matrix
                TimeSheetDaoImpl.TimesheetResultWrapper result = timesheetService.fetchTimesheetDashboardGrid(
                        filterUserId, projectIdStr, dateRange, searchQuery, page, limit
                );

                // Bind attributes back up to request scopes for your JSP table scriptlets to read
                request.setAttribute("timesheetList", result.getTimesheetList());
                request.setAttribute("totalRecords", result.getTotalRecords());
                request.setAttribute("currentPage", page);
                request.setAttribute("rowsPerPage", limit);

                // Retain parameter selection states so inputs do not blink/reset on filter reloads
                request.setAttribute("selectedProjectId", projectIdStr);
                request.setAttribute("selectedDateRange", dateRange);
                request.setAttribute("searchQuery", searchQuery);

                // Forward execution straight to your presentation view container file location
                request.getRequestDispatcher("/views/employee/timesheet.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                throw new ServletException("Error rendering timesheet grid system dashboards within GET execution pipelines.", e);
            }
        }

        /**
         * 2. POST METHOD: Processes modal pop-up window form submissions to save a new record.
         */
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {

            try {
                HttpSession session = request.getSession(false);
                if (session == null || session.getAttribute("userId") == null) {
                    response.sendRedirect(request.getContextPath() + "/login.jsp");
                    return;
                }

                int userId = Integer.parseInt(session.getAttribute("userId").toString());

                String creatorName = null;
                User loggedInUser = (User) session.getAttribute("user");
                if (loggedInUser != null) {
                    creatorName = loggedInUser.getFirstName() + " " + loggedInUser.getLastName();
                } else if (session.getAttribute("firstName") != null) {
                    creatorName = session.getAttribute("firstName").toString();
                } else {
                    creatorName = "Employee_" + userId;
                }

                // Extract values matching your exact HTML modal names
                int projectId = Integer.parseInt(request.getParameter("projectId"));
                String workDateStr = request.getParameter("workDate");
                int hoursWorked = Integer.parseInt(request.getParameter("hoursWorked"));

                LocalDate parsedLocalDate = LocalDate.parse(workDateStr.trim());
                LocalDateTime timesheetDateTime = parsedLocalDate.atStartOfDay();

                TimeSheet timesheetRecord = TimeSheet.builder()
                        .userId(userId)
                        .date(timesheetDateTime)
                        .workHours(hoursWorked)
                        .status("Pending")
                        .createdBy(creatorName)
                        .projectId(projectId)
                        .build();

                timesheetService.addTimesheet(timesheetRecord);

                // Redirect back via browser refresh to trigger the doGet() display pipeline cleanly
                response.sendRedirect(request.getContextPath() + "/Timesheets");

            } catch (IllegalArgumentException e) {
                request.setAttribute("errorMessage", e.getMessage());
                request.getRequestDispatcher("/views/employee/timesheets.jsp").forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                throw new ServletException("Fatal execution failure encountered while recording target timesheet profiles within POST pipelines.", e);
            }

    }


}

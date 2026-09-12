package org.example.controller.reports;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.AttendanceReport;
import org.example.service.ReportService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/attendance-report")
public class AttendanceReportServlet extends HttpServlet {

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

            List<AttendanceReport> attendanceList =
                    reportService.getAllAttendance();

            request.setAttribute(
                    "attendanceList",
                    attendanceList
            );

            /*
             * Total Working Days
             * ------------------
             * Count records where employee was Present
             */
            long workingDays = attendanceList.stream()
                    .filter(attendance ->
                            attendance.getStatus() != null &&
                                    attendance.getStatus()
                                            .equalsIgnoreCase("Present"))
                    .count();

            /*
             * Leave Taken
             * -----------
             * Count records where status is Leave
             */
            long leaveTaken = attendanceList.stream()
                    .filter(attendance ->
                            attendance.getStatus() != null &&
                                    attendance.getStatus()
                                            .equalsIgnoreCase("Leave"))
                    .count();

            /*
             * Holidays
             * --------
             * Count records where status is Holiday
             */
            long holidays = attendanceList.stream()
                    .filter(attendance ->
                            attendance.getStatus() != null &&
                                    attendance.getStatus()
                                            .equalsIgnoreCase("Holiday"))
                    .count();


            long halfDayCount = attendanceList.stream()
                    .filter(attendance ->
                            attendance.getStatus() != null &&
                                    attendance.getStatus()
                                            .equalsIgnoreCase("Half Day"))
                    .count();

            request.setAttribute("halfDayCount", halfDayCount);

            /*
             * Present / Absent
             * ----------------
             * These values will be used by the graph.
             */
            long presentCount = attendanceList.stream()
                    .filter(attendance ->
                            attendance.getStatus() != null &&
                                    attendance.getStatus()
                                            .equalsIgnoreCase("Present"))
                    .count();

            long absentCount = attendanceList.stream()
                    .filter(attendance ->
                            attendance.getStatus() != null &&
                                    attendance.getStatus()
                                            .equalsIgnoreCase("Absent"))
                    .count();

            request.setAttribute(
                    "workingDays",
                    workingDays
            );

            request.setAttribute(
                    "leaveTaken",
                    leaveTaken
            );

            request.setAttribute(
                    "holidays",
                    holidays
            );

            request.setAttribute(
                    "presentCount",
                    presentCount
            );

            request.setAttribute(
                    "absentCount",
                    absentCount
            );

            request.getRequestDispatcher(
                    "/views/admin/reports/attendance-report.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to load attendance report."
            );

            request.getRequestDispatcher(
                    "/views/admin/reports/attendance-report.jsp"
            ).forward(request, response);
        }
    }
}
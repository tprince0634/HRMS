package org.example.controller.reports;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.LeaveReport;
import org.example.service.ReportService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/leave-report")
public class LeaveReportServlet extends HttpServlet {

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

            // Get all leave requests
            List<LeaveReport> leaveList =
                    reportService.getAllLeaves();

            // Send leave data to JSP
            request.setAttribute(
                    "leaveList",
                    leaveList
            );

            // Total leaves
            long totalLeaves = leaveList.size();

            // Approved leaves
            long approvedLeaves = leaveList.stream()
                    .filter(leave ->
                            leave.getStatus() != null &&
                                    leave.getStatus()
                                            .equalsIgnoreCase("Approved"))
                    .count();

            // Pending leaves
            long pendingLeaves = leaveList.stream()
                    .filter(leave ->
                            leave.getStatus() != null &&
                                    leave.getStatus()
                                            .equalsIgnoreCase("Pending"))
                    .count();

            // Rejected leaves
            long rejectedLeaves = leaveList.stream()
                    .filter(leave ->
                            leave.getStatus() != null &&
                                    leave.getStatus()
                                            .equalsIgnoreCase("Rejected"))
                    .count();

            // Leave type counts
            long paidLeaveCount = leaveList.stream()
                    .filter(leave ->
                            leave.getLeaveType() != null &&
                                    leave.getLeaveType()
                                            .equalsIgnoreCase("Paid Leave"))
                    .count();

            long sickLeaveCount = leaveList.stream()
                    .filter(leave ->
                            leave.getLeaveType() != null &&
                                    leave.getLeaveType()
                                            .equalsIgnoreCase("Sick Leave"))
                    .count();

            long clCount = leaveList.stream()
                    .filter(leave ->
                            leave.getLeaveType() != null &&
                                    leave.getLeaveType()
                                            .equalsIgnoreCase("CL"))
                    .count();

            long mlCount = leaveList.stream()
                    .filter(leave ->
                            leave.getLeaveType() != null &&
                                    leave.getLeaveType()
                                            .equalsIgnoreCase("ML"))
                    .count();

            long unpaidLeaveCount = leaveList.stream()
                    .filter(leave ->
                            leave.getLeaveType() != null &&
                                    leave.getLeaveType()
                                            .equalsIgnoreCase("Unpaid Leave"))
                    .count();

            long testLeaveCount = leaveList.stream()
                    .filter(leave ->
                            leave.getLeaveType() != null &&
                                    leave.getLeaveType()
                                            .equalsIgnoreCase("Test Leave"))
                    .count();

            // Set attributes for JSP
            request.setAttribute(
                    "totalLeaves",
                    totalLeaves
            );

            request.setAttribute(
                    "approvedLeaves",
                    approvedLeaves
            );

            request.setAttribute(
                    "pendingLeaves",
                    pendingLeaves
            );

            request.setAttribute(
                    "rejectedLeaves",
                    rejectedLeaves
            );

            request.setAttribute(
                    "paidLeaveCount",
                    paidLeaveCount
            );

            request.setAttribute(
                    "sickLeaveCount",
                    sickLeaveCount
            );

            request.setAttribute(
                    "clCount",
                    clCount
            );

            request.setAttribute(
                    "mlCount",
                    mlCount
            );

            request.setAttribute(
                    "unpaidLeaveCount",
                    unpaidLeaveCount
            );

            request.setAttribute(
                    "testLeaveCount",
                    testLeaveCount
            );

            // Forward to Leave Report JSP
            request.getRequestDispatcher(
                    "/views/admin/reports/leave-report.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to load leave report."
            );

            request.getRequestDispatcher(
                    "/views/admin/reports/leave-report.jsp"
            ).forward(request, response);
        }
    }
}
package org.example.controller.reports;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.TaskReport;
import org.example.service.ReportService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/admin/task-report")
public class TaskReportServlet extends HttpServlet {

    private final ReportService reportService = new ReportService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get all tasks from database
            List<TaskReport> tasks = reportService.getAllTasks();

            // Total Tasks
            int totalTasks = tasks.size();

            int completedTasks = 0;
            int pendingTasks = 0;
            int inProgressTasks = 0;
            int onHoldTasks = 0;
            int overdueTasks = 0;

            LocalDateTime now = LocalDateTime.now();

            // Calculate task statistics
            for (TaskReport task : tasks) {

                String status = task.getStatus();

                if (status != null) {
                    status = status.trim().toLowerCase();
                } else {
                    status = "";
                }

                // Completed
                if (status.equals("completed")) {
                    completedTasks++;
                }

                // Pending
                else if (status.equals("pending")) {
                    pendingTasks++;
                }

                // In Progress
                else if (status.equals("in progress")
                        || status.equals("inprogress")) {

                    inProgressTasks++;
                }

                // On Hold
                else if (status.equals("on hold")
                        || status.equals("onhold")) {

                    onHoldTasks++;
                }

                // Overdue
                if (task.getDeadline() != null
                        && task.getDeadline().isBefore(now)
                        && !status.equals("completed")) {

                    overdueTasks++;
                }
            }

            // Send data to JSP
            request.setAttribute("tasks", tasks);

            request.setAttribute("totalTasks", totalTasks);
            request.setAttribute("completedTasks", completedTasks);
            request.setAttribute("pendingTasks", pendingTasks);
            request.setAttribute("inProgressTasks", inProgressTasks);
            request.setAttribute("onHoldTasks", onHoldTasks);
            request.setAttribute("overdueTasks", overdueTasks);

            // Open Task Report JSP
            request.getRequestDispatcher(
                    "/views/admin/reports/task-report.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Error while loading Task Report",
                    e
            );
        }
    }
}
package org.example.controller.reports;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.ProjectReport;
import org.example.service.ReportService;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/project-report")
public class ProjectReportServlet extends HttpServlet {

    private ReportService reportService;

    @Override
    public void init() throws ServletException {
        reportService = new ReportService();
    }

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        try {

            List<ProjectReport> projectList =
                    reportService.getAllProjects();

            int totalProjects = projectList.size();

            int activeProjects = 0;
            int inactiveProjects = 0;

            int completedTasks = 0;
            int pendingTasks = 0;
            int inProgressTasks = 0;
            int onHoldTasks = 0;
            int overdueTasks = 0;
            int totalTasks = 0;

            for (ProjectReport project : projectList) {

                // Project status
                if ("Active".equalsIgnoreCase(project.getStatus())) {
                    activeProjects++;
                } else if ("Inactive".equalsIgnoreCase(project.getStatus())) {
                    inactiveProjects++;
                }

                // Task statistics
                totalTasks += project.getTotalTasks();
                completedTasks += project.getCompletedTasks();
                pendingTasks += project.getPendingTasks();
                inProgressTasks += project.getInProgressTasks();
                onHoldTasks += project.getOnHoldTasks();
                overdueTasks += project.getOverdueTasks();
            }

            // Project list
            request.setAttribute("projectList", projectList);

            // Project cards
            request.setAttribute("totalProjects", totalProjects);
            request.setAttribute("activeProjects", activeProjects);
            request.setAttribute("inactiveProjects", inactiveProjects);

            // Task cards
            request.setAttribute("totalTasks", totalTasks);
            request.setAttribute("completedTasks", completedTasks);
            request.setAttribute("pendingTasks", pendingTasks);
            request.setAttribute("inProgressTasks", inProgressTasks);
            request.setAttribute("onHoldTasks", onHoldTasks);
            request.setAttribute("overdueTasks", overdueTasks);

            // Forward to JSP
            request.getRequestDispatcher(
                    "/views/admin/reports/project-report.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Unable to load project report."
            );

            request.getRequestDispatcher(
                    "/views/admin/reports/project-report.jsp"
            ).forward(request, response);
        }
    }
}
package org.example.service.Admin;

import org.example.dao.AdminDashboardDAOImpl;

import java.util.Map;

public class AdminDashboardService {

    private final AdminDashboardDAOImpl adminDashboardDAO;

    public AdminDashboardService() {
        this.adminDashboardDAO = new AdminDashboardDAOImpl();
    }

    public int getTotalEmployees() {
        return adminDashboardDAO.getTotalEmployees();
    }

    public int getPresentToday() {
        return adminDashboardDAO.getPresentToday();
    }

    public int getOnLeave() {
        return adminDashboardDAO.getOnLeave();
    }

    public int getPendingLeaves() {
        return adminDashboardDAO.getPendingLeaves();
    }

    public int getTotalProjects() {
        return adminDashboardDAO.getTotalProjects();
    }

    public int getTotalClients() {
        return adminDashboardDAO.getTotalClients();
    }
    public int getTotalTasks() {
        return adminDashboardDAO.getTotalTasks();
    }

    public double getTotalEarnings() {
        return adminDashboardDAO.getTotalEarnings();
    }

    public int getNewHires() {
        return adminDashboardDAO.getNewHires();
    }

    public Map<String, Integer> getDepartmentEmployeeCount() {
        return adminDashboardDAO.getDepartmentEmployeeCount();
    }

    public Map<String, Integer> getEmployeeStatusCount() {
        return adminDashboardDAO.getEmployeeStatusCount();
    }


}

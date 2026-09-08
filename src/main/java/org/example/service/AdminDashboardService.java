package org.example.service;

import org.example.dao.AdminDashboardDAOImpl;

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

}

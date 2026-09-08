package org.example.interfaces;

import java.util.Map;

public interface AdminDashboardDAO {
        int getTotalEmployees();
        int getPresentToday();
        int getOnLeave();
        int getPendingLeaves();
        int getTotalProjects();
        int getTotalClients();
    int getTotalTasks();
    double getTotalEarnings();
    int getNewHires();
    Map<String, Integer> getDepartmentEmployeeCount();
    Map<String, Integer> getEmployeeStatusCount();
}



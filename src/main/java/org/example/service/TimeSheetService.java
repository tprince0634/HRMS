package org.example.service;



import org.example.dao.TimeSheetDaoImpl;
import org.example.dao.TimeSheetDaoImpl.TimesheetResultWrapper;
import org.example.model.TimeSheet;

import java.time.LocalDateTime;

public class TimeSheetService {

    private final TimeSheetDaoImpl timesheetDao = new TimeSheetDaoImpl();

    public void addTimesheet(TimeSheet timesheet) throws Exception {

        if (timesheet.getWorkHours() <= 0 || timesheet.getWorkHours() > 24) {
            throw new IllegalArgumentException("Logged daily work hours must range cleanly between 1 and 24 hours.");
        }

        if (timesheet.getDate().isAfter(LocalDateTime.now())) {
            throw new IllegalArgumentException("Timesheet execution dates cannot be logged for future production milestones.");
        }
        timesheetDao.insertTimesheet(timesheet);
    }

    public TimesheetResultWrapper fetchTimesheetDashboardGrid(
            Integer userId, String projectIdStr, String dateRange, String searchQuery, int page, int rowsPerPage) throws Exception {

        int limit = (rowsPerPage > 0) ? rowsPerPage : 10;
        int offset = (page > 1) ? (page - 1) * limit : 0;

        int projectId = 0;
        if (projectIdStr != null && !projectIdStr.trim().isEmpty()) {
            projectId = Integer.parseInt(projectIdStr.trim());
        }

        return timesheetDao.getTimesheetsCustom(userId, projectId, dateRange, searchQuery, limit, offset);
    }


}

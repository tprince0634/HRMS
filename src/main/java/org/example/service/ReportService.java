package org.example.service;

import org.example.dao.ReportDAOImpl;
import org.example.interfaces.ReportDao;
import org.example.model.AttendanceReport;
import org.example.model.EmployeeReport;
import org.example.model.LeaveReport;

import java.util.List;

public class ReportService {

    private final ReportDao reportDao;

    public ReportService() {
        this.reportDao = new ReportDAOImpl();
    }

    public List<EmployeeReport> getAllEmployees() {
        return reportDao.getAllEmployees();
    }

    public List<AttendanceReport> getAllAttendance() {
        return reportDao.getAllAttendance();
    }

    public List<LeaveReport> getAllLeaves() {
        return reportDao.getAllLeaves();
    }
}
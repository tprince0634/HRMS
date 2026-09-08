package org.example.interfaces;

import org.example.model.*;

import java.util.List;

public interface ReportDao {

    List<EmployeeReport> getAllEmployees();

    List<AttendanceReport> getAllAttendance();

    List<LeaveReport> getAllLeaves();

    List<PayslipReport> getAllPayslips();

    List<ProjectReport> getAllProjects();

    List<TaskReport> getAllTasks();
}

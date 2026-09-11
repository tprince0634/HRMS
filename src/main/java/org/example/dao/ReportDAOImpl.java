package org.example.dao;

import org.example.interfaces.ReportDao;
import org.example.model.AttendanceReport;
import org.example.model.EmployeeReport;
import org.example.model.LeaveReport;
import org.example.model.PayslipReport;
import org.example.model.ProjectReport;
import org.example.model.TaskReport;
import org.example.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReportDAOImpl implements ReportDao {

    @Override
    public List<EmployeeReport> getAllEmployees() {

        List<EmployeeReport> employees = new ArrayList<>();

        try (
                Connection connection = DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall("{CALL get_all_employees()}");

                ResultSet rs = statement.executeQuery()
        ) {

            while (rs.next()) {

                EmployeeReport employee = new EmployeeReport();

                employee.setEmployeeId(
                        rs.getInt("UserId")
                );

                employee.setFirstName(
                        rs.getString("FirstName")
                );

                employee.setLastName(
                        rs.getString("LastName")
                );

                employee.setEmail(
                        rs.getString("Email")
                );

                employee.setPhoneNumber(
                        rs.getString("PhoneNumber")
                );

                employee.setRoleId(
                        rs.getInt("RoleId")
                );

                employee.setRole(
                        rs.getString("RoleName")
                );

                int departmentId =
                        rs.getInt("DepartmentId");

                if (!rs.wasNull()) {
                    employee.setDepartmentId(departmentId);
                }

                employee.setDepartment(
                        rs.getString("DepartmentName")
                );

                int designationId =
                        rs.getInt("DesignationtId");

                if (!rs.wasNull()) {
                    employee.setDesignationId(designationId);
                }

                employee.setDesignation(
                        rs.getString("DesignationName")
                );

                Timestamp joiningDate =
                        rs.getTimestamp("DateOfJoining");

                if (joiningDate != null) {

                    employee.setDateOfJoining(
                            joiningDate.toLocalDateTime()
                    );
                }

                employee.setStatus(
                        rs.getString("Status")
                );

                employees.add(employee);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return employees;
    }


    @Override
    public List<AttendanceReport> getAllAttendance() {

        List<AttendanceReport> attendanceList = new ArrayList<>();

        try (
                Connection connection = DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall("{CALL get_all_attendance()}");

                ResultSet rs = statement.executeQuery()
        ) {

            while (rs.next()) {

                AttendanceReport attendance = new AttendanceReport();

                attendance.setAttendanceId(
                        rs.getInt("AttendanceId")
                );

                attendance.setUserId(
                        rs.getInt("UserId")
                );

                attendance.setFirstName(
                        rs.getString("FirstName")
                );

                attendance.setLastName(
                        rs.getString("LastName")
                );

                attendance.setEmail(
                        rs.getString("Email")
                );

                if (rs.getDate("Date") != null) {
                    attendance.setDate(
                            rs.getDate("Date").toLocalDate()
                    );
                }

                if (rs.getTime("CheckIn") != null) {
                    attendance.setCheckIn(
                            rs.getTime("CheckIn").toLocalTime()
                    );
                }

                if (rs.getTime("CheckOut") != null) {
                    attendance.setCheckOut(
                            rs.getTime("CheckOut").toLocalTime()
                    );
                }

                if (rs.getTime("LunchIn") != null) {
                    attendance.setLunchIn(
                            rs.getTime("LunchIn").toLocalTime()
                    );
                }

                if (rs.getTime("LunchOut") != null) {
                    attendance.setLunchOut(
                            rs.getTime("LunchOut").toLocalTime()
                    );
                }

                attendance.setWorkingHours(
                        rs.getString("WorkingHours")
                );

                attendance.setProductionHours(
                        rs.getString("ProductionHours")
                );

                attendance.setOvertimeHours(
                        rs.getString("OvertimeHours")
                );

                attendance.setBreakHours(
                        rs.getString("BreakHours")
                );

                attendance.setLate(
                        rs.getString("Late")
                );

                attendance.setStatus(
                        rs.getString("Status")
                );

                attendanceList.add(attendance);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return attendanceList;
    }

    @Override
    public List<LeaveReport> getAllLeaves() {

        List<LeaveReport> leaveList = new ArrayList<>();

        try (
                Connection connection = DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall("{CALL get_all_leave_requests()}");

                ResultSet rs = statement.executeQuery()
        ) {

            while (rs.next()) {

                LeaveReport leave = new LeaveReport();

                leave.setLeaveRequestId(
                        rs.getInt("LeaveRequestId")
                );

                leave.setUserId(
                        rs.getInt("UserId")
                );

                leave.setFirstName(
                        rs.getString("FirstName")
                );

                leave.setLastName(
                        rs.getString("LastName")
                );

                leave.setEmail(
                        rs.getString("Email")
                );

                leave.setLeaveTypeId(
                        rs.getInt("LeaveTypeId")
                );

                leave.setLeaveType(
                        rs.getString("LeaveType")
                );

                Timestamp startDate =
                        rs.getTimestamp("StartDate");

                if (startDate != null) {
                    leave.setStartDate(
                            startDate.toLocalDateTime()
                    );
                }

                Timestamp endDate =
                        rs.getTimestamp("EndDate");

                if (endDate != null) {
                    leave.setEndDate(
                            endDate.toLocalDateTime()
                    );
                }

                leave.setNumberOfDays(
                        rs.getInt("NumberOfDays")
                );

                leave.setReason(
                        rs.getString("Reason")
                );

                leave.setApprovedBy(
                        rs.getString("ApprovedBy")
                );

                leave.setStatus(
                        rs.getString("Status")
                );

                leave.setStatusHistory(
                        rs.getString("StatusHistory")
                );

                leaveList.add(leave);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return leaveList;
    }


    @Override
    public List<PayslipReport> getAllPayslips() {

        List<PayslipReport> payslipList = new ArrayList<>();

        String sql = "{CALL get_all_payslips()}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement statement = connection.prepareCall(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                PayslipReport payslip = PayslipReport.builder()
                        .payslipId(resultSet.getInt("PayslipId"))
                        .employeeId(resultSet.getInt("EmployeeId"))
                        .employeeName(resultSet.getString("EmployeeName"))
                        .department(resultSet.getString("Department"))
                        .designation(resultSet.getString("Designation"))
                        .month(resultSet.getString("Month"))
                        .year(resultSet.getInt("Year"))
                        .totalSalary(resultSet.getDouble("TotalSalary"))
                        .earnings(resultSet.getDouble("Earnings"))
                        .deductions(resultSet.getDouble("Deductions"))
                        .netPay(resultSet.getDouble("NetPay"))
                        .payslipPath(resultSet.getString("PayslipPath"))
                        .generatedOn(
                                resultSet.getTimestamp("GeneratedOn") != null
                                        ? resultSet.getTimestamp("GeneratedOn").toString()
                                        : null
                        )
                        .build();

                payslipList.add(payslip);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return payslipList;
    }


    @Override
    public List<ProjectReport> getAllProjects() {

        List<ProjectReport> projectList = new ArrayList<>();

        String sql = "{CALL get_all_projects()}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement statement = connection.prepareCall(sql);
                ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                ProjectReport project = ProjectReport.builder()

                        .projectId(
                                resultSet.getInt("ProjectId")
                        )

                        .projectName(
                                resultSet.getString("ProjectName")
                        )

                        .clientName(
                                resultSet.getString("ClientName")
                        )

                        .description(
                                resultSet.getString("Description")
                        )

                        .startDate(
                                resultSet.getTimestamp("StartDate") != null
                                        ? resultSet.getTimestamp("StartDate").toLocalDateTime()
                                        : null
                        )

                        .endDate(
                                resultSet.getTimestamp("EndDate") != null
                                        ? resultSet.getTimestamp("EndDate").toLocalDateTime()
                                        : null
                        )

                        .priority(
                                resultSet.getString("Priority")
                        )

                        .projectValue(
                                resultSet.getDouble("ProjectValue")
                        )

                        .priceType(
                                resultSet.getString("PriceType")
                        )

                        .filePath(
                                resultSet.getString("FilePath")
                        )

                        .logoPath(
                                resultSet.getString("LogoPath")
                        )

                        .status(
                                resultSet.getString("Status")
                        )

                        .managerName(
                                resultSet.getString("ManagerName")
                        )

                        .totalTasks(
                                resultSet.getInt("TotalTasks")
                        )

                        .completedTasks(
                                resultSet.getInt("CompletedTasks")
                        )

                        .pendingTasks(
                                resultSet.getInt("PendingTasks")
                        )

                        .inProgressTasks(
                                resultSet.getInt("InProgressTasks")
                        )

                        .onHoldTasks(
                                resultSet.getInt("OnHoldTasks")
                        )

                        .overdueTasks(
                                resultSet.getInt("OverdueTasks")
                        )

                        .build();

                projectList.add(project);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return projectList;
    }


    @Override
    public List<TaskReport> getAllTasks() {

        List<TaskReport> taskList = new ArrayList<>();

        try (
                Connection connection = DBConnection.getConnection();

                CallableStatement callableStatement =
                        connection.prepareCall("{CALL get_all_tasks()}");

                ResultSet resultSet =
                        callableStatement.executeQuery()
        ) {

            while (resultSet.next()) {

                TaskReport taskReport = TaskReport.builder()
                        .taskId(resultSet.getInt("TaskId"))
                        .projectId(resultSet.getInt("ProjectId"))
                        .title(resultSet.getString("Title"))
                        .description(resultSet.getString("Description"))
                        .status(resultSet.getString("Status"))
                        .priority(resultSet.getString("Priority"))
                        .filePath(resultSet.getString("FilePath"))
                        .deadline(
                                resultSet.getTimestamp("Deadline") != null
                                        ? resultSet.getTimestamp("Deadline").toLocalDateTime()
                                        : null
                        )
                        .projectName(resultSet.getString("ProjectName"))
                        .build();

                taskList.add(taskReport);
            }

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "Error while fetching all tasks",
                    e
            );
        }

        return taskList;
    }
}
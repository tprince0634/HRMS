package org.example.dao;

import org.example.interfaces.ReportDao;
import org.example.model.AttendanceReport;
import org.example.model.EmployeeReport;
import org.example.model.LeaveReport;
import org.example.model.PayslipReport;
import org.example.model.ProjectReport;
import org.example.model.TaskReport;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Timestamp;
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


    // ---------------------------------------------------------
    // Temporary methods
    // We will implement these one by one after Employee Report.
    // ---------------------------------------------------------

    @Override
    public List<AttendanceReport> getAllAttendance() {

        return new ArrayList<>();
    }


    @Override
    public List<LeaveReport> getAllLeaves() {

        return new ArrayList<>();
    }


    @Override
    public List<PayslipReport> getAllPayslips() {

        return new ArrayList<>();
    }


    @Override
    public List<ProjectReport> getAllProjects() {

        return new ArrayList<>();
    }


    @Override
    public List<TaskReport> getAllTasks() {

        return new ArrayList<>();
    }
}
package org.example.dao;

import org.example.interfaces.UserDao;
import org.example.model.User;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class UserDAOImpl  implements UserDao {
    public User login(String email, String password) {

        User user = null;
        String sql = "{CALL sp_login_user(?, ?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setString(1, email);
            statement.setString(2, password);

            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("UserId"));
                user.setFirstName(rs.getString("FirstName"));
                user.setLastName(rs.getString("LastName"));
                user.setEmail(rs.getString("Email"));
                user.setRoleId(rs.getInt("RoleId"));
                user.setRoleName(rs.getString("RoleName"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }


    // ============================================================
// GET ALL EMPLOYEES
// ============================================================

    public List<Map<String, Object>> getAllEmployees() throws SQLException {

        List<Map<String, Object>> employees = new ArrayList<>();

        String sql = "{CALL get_all_employees()}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement statement = connection.prepareCall(sql);
                ResultSet rs = statement.executeQuery()
        ) {

            while (rs.next()) {

                Map<String, Object> employee = new HashMap<>();

                employee.put("userId", rs.getInt("UserId"));

                employee.put("firstName", rs.getString("FirstName"));
                employee.put("lastName", rs.getString("LastName"));

                employee.put("email", rs.getString("Email"));
                employee.put("phoneNumber", rs.getString("PhoneNumber"));

                employee.put("dateOfJoining", rs.getTimestamp("DateOfJoining"));
                employee.put("dateOfBirth", rs.getTimestamp("DateOfBirth"));

                employee.put("gender", rs.getString("Gender"));
                employee.put("address", rs.getString("Address"));
                employee.put("aboutEmployee", rs.getString("AboutEmployee"));

                employee.put("profilePicture",
                        rs.getString("ProfilePicture"));

                employee.put("reportingManager",
                        rs.getString("ReportingManager"));

                employee.put("status",
                        rs.getString("Status"));

                employee.put("departmentId",
                        rs.getObject("DepartmentId"));

                employee.put("departmentName",
                        rs.getString("DepartmentName"));

                employee.put("designationId",
                        rs.getObject("DesignationId"));

                employee.put("designationName",
                        rs.getString("DesignationName"));

                employee.put("roleId",
                        rs.getObject("RoleId"));

                employee.put("roleName",
                        rs.getString("RoleName"));

                employees.add(employee);
            }
        }
        return employees;
    }


    // ============================================================
// ADD EMPLOYEE
// ============================================================

    // ============================================================
// ADD EMPLOYEE
// ============================================================

    @Override
    public boolean addEmployee(
            String firstName,
            String lastName,
            String email,
            String passwordHash,
            String phoneNumber,
            int roleId,
            Integer departmentId,
            Integer designationId,
            String dateOfJoining,
            String dateOfBirth,
            String gender,
            String address,
            String aboutEmployee,
            String profilePicture,
            String reportingManager,
            String status,
            String createdBy
    ) throws SQLException {

        String sql = "{CALL add_employee(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setString(1, firstName);
            statement.setString(2, lastName);
            statement.setString(3, email);
            statement.setString(4, passwordHash);
            statement.setString(5, phoneNumber);

            statement.setInt(6, roleId);

            if (departmentId != null) {
                statement.setInt(7, departmentId);
            } else {
                statement.setNull(7, java.sql.Types.INTEGER);
            }

            if (designationId != null) {
                statement.setInt(8, designationId);
            } else {
                statement.setNull(8, java.sql.Types.INTEGER);
            }

            statement.setString(9, dateOfJoining);
            statement.setString(10, dateOfBirth);

            statement.setString(11, gender);
            statement.setString(12, address);
            statement.setString(13, aboutEmployee);
            statement.setString(14, profilePicture);
            statement.setString(15, reportingManager);
            statement.setString(16, status);
            statement.setString(17, createdBy);

            statement.execute();
            return true;
        }
    }


    // ============================================================
// GET ALL ROLES
// ============================================================

    @Override
    public List<Map<String, Object>> getAllRoles() throws SQLException {

        List<Map<String, Object>> roles = new ArrayList<>();

        String sql = "{CALL sp_get_all_roles()}";

        try (
                Connection con = DBConnection.getConnection();
                CallableStatement statement = con.prepareCall(sql);
                ResultSet rs = statement.executeQuery()
        ) {

            while (rs.next()) {

                Map<String, Object> role = new HashMap<>();

                role.put("RoleId", rs.getInt("RoleId"));
                role.put("RoleName", rs.getString("RoleName"));

                roles.add(role);
            }
        }

        return roles;
    }


    // ============================================================
// GET ALL DEPARTMENTS
// ============================================================

    @Override
    public List<Map<String, Object>> getAllDepartments() throws SQLException {

        List<Map<String, Object>> departments = new ArrayList<>();

        String sql = "{CALL sp_get_all_departments()}";

        try (
                Connection con = DBConnection.getConnection();
                CallableStatement statement = con.prepareCall(sql);
                ResultSet rs = statement.executeQuery()
        ) {

            while (rs.next()) {

                Map<String, Object> department = new HashMap<>();

                department.put(
                        "DepartmentId",
                        rs.getInt("DepartmentId")
                );

                department.put(
                        "Name",
                        rs.getString("Name")
                );

                departments.add(department);
            }
        }

        return departments;
    }



// ============================================================
// GET ALL DESIGNATIONS
// ============================================================


    @Override
    public List<Map<String, Object>> getAllDesignations() throws SQLException {

        List<Map<String, Object>> designations = new ArrayList<>();

        String sql = "{CALL sp_get_all_designations()}";

        try (
                Connection con = DBConnection.getConnection();
                CallableStatement statement = con.prepareCall(sql);
                ResultSet rs = statement.executeQuery()
        ) {

            while (rs.next()) {

                Map<String, Object> designation = new HashMap<>();

                designation.put(
                        "DesignationId",
                        rs.getInt("DesignationId")
                );

                designation.put(
                        "Name",
                        rs.getString("Name")
                );

                designations.add(designation);
            }
        }

        return designations;
    }



    // ============================================================
// GET ALL MANAGERS
// ============================================================

    @Override
    public List<Map<String, Object>> getAllManagers() throws SQLException {

        List<Map<String, Object>> managers = new ArrayList<>();

        String sql = "{CALL get_all_managers()}";

        try (
                Connection con = DBConnection.getConnection();
                CallableStatement statement = con.prepareCall(sql);
                ResultSet rs = statement.executeQuery()
        ) {

            while (rs.next()) {

                Map<String, Object> manager = new HashMap<>();

                manager.put(
                        "UserId",
                        rs.getInt("UserId")
                );

                manager.put(
                        "FirstName",
                        rs.getString("FirstName")
                );

                manager.put(
                        "LastName",
                        rs.getString("LastName")
                );

                managers.add(manager);
            }
        }

        return managers;
    }

}

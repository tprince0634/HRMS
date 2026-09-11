package org.example.interfaces;

import org.example.model.User;

import java.util.List;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface UserDao {
    User login(String email, String password);

    List<User> getAllUsers();

    public List<Map<String, Object>> getAllEmployees() throws SQLException;

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
    ) throws SQLException;

    List<Map<String, Object>> getAllRoles() throws SQLException;

    List<Map<String, Object>> getAllDepartments() throws SQLException;

    List<Map<String, Object>> getAllDesignations() throws SQLException;

    List<Map<String, Object>> getAllManagers() throws SQLException;
}

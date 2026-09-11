package org.example.service;

import org.example.dao.UserDAOImpl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class UserServiceImpl {

    private UserDAOImpl userDAO;

    // Constructor
    public UserServiceImpl() {
        this.userDAO = new UserDAOImpl();
    }

    // ============================================================
    // GET ALL EMPLOYEES
    // ============================================================

    public List<Map<String, Object>> getAllEmployees() {

        try {
            return userDAO.getAllEmployees();

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "Unable to fetch employees", e
            );
        }
    }

    // ============================================================
    // ADD EMPLOYEE
    // ============================================================

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
    ) {

        try {

            return userDAO.addEmployee(
                    firstName,
                    lastName,
                    email,
                    passwordHash,
                    phoneNumber,
                    roleId,
                    departmentId,
                    designationId,
                    dateOfJoining,
                    dateOfBirth,
                    gender,
                    address,
                    aboutEmployee,
                    profilePicture,
                    reportingManager,
                    status,
                    createdBy
            );

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "Unable to add employee", e
            );
        }
    }

    public List<Map<String, Object>> getAllRoles() {

        try {
            return userDAO.getAllRoles();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Unable to fetch roles", e);
        }
    }


    public List<Map<String, Object>> getAllDepartments() {

        try {
            return userDAO.getAllDepartments();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Unable to fetch departments", e);
        }
    }


    public List<Map<String, Object>> getAllDesignations() {

        try {
            return userDAO.getAllDesignations();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Unable to fetch designations", e);
        }
    }


    public List<Map<String, Object>> getAllManagers() {

        try {
            return userDAO.getAllManagers();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Unable to fetch managers", e);
        }
    }

}
package org.example.service;

import org.example.dao.UserDAOImpl;
import org.example.model.User;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class UserServiceImpl {

    private UserDAOImpl userDAO;

    // ============================================================
    // CONSTRUCTOR
    // ============================================================

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
                    "Unable to fetch employees",
                    e
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
            String password,
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

        // Hash the plain-text password before storing it
        String passwordHash = BCrypt.hashpw(
                password,
                BCrypt.gensalt(12)
        );

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
                    "Unable to add employee",
                    e
            );
        }
    }

    // ============================================================
    // GET ALL ROLES
    // ============================================================

    public List<Map<String, Object>> getAllRoles() {

        try {

            return userDAO.getAllRoles();

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "Unable to fetch roles",
                    e
            );
        }
    }

    // ============================================================
    // GET ALL DEPARTMENTS
    // Used for Department Management
    // Fetches Active + Inactive
    // ============================================================

    public List<Map<String, Object>> getAllDepartments() {

        try {

            return userDAO.getAllDepartments();

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "Unable to fetch departments",
                    e
            );
        }
    }

    // ============================================================
    // GET ACTIVE DEPARTMENTS
    // Used for Employee Add/Edit dropdown
    // Fetches ONLY Active departments
    // ============================================================

    public List<Map<String, Object>> getAllActiveDepartments() throws SQLException {
        return userDAO.getAllActiveDepartments();
    }

    // ============================================================
    // GET ALL DESIGNATIONS
    // ============================================================

    public List<Map<String, Object>> getAllDesignations() {

        try {

            return userDAO.getAllDesignations();

        } catch (SQLException e) {

            e.printStackTrace();

            throw new RuntimeException(
                    "Unable to fetch designations",
                    e
            );
        }
    }

    // ============================================================
    // GET ALL MANAGERS
    // ============================================================

    public List<Map<String, Object>> getAllManagers() {
        return userDAO.getAllManagers();

    }


    public void updateEmployee(int userId, String firstName, String lastName, String email, String phoneNumber, String status) {
        userDAO.updateEmployee(userId, firstName, lastName, email, phoneNumber, status);
    }

    public User getEmployeeById(int userId) {
        return userDAO.getEmployeeById(userId);
    }
}
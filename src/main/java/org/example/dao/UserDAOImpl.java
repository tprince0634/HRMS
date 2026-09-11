package org.example.dao;

import org.example.interfaces.UserDao;
import org.example.model.User;
import org.example.util.DBConnection;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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

    @Override
    public List<User> getAllUsers() {

        String sql = "CALL get_all_users()";

        List<User> users = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql);
             ResultSet rs = callableStatement.executeQuery()) {

            while (rs.next()) {
                users.add(map(rs));
            }

            return users;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    private User map(ResultSet rs) throws SQLException {

        return User.builder()
                .userId(rs.getInt("UserId"))
                .firstName(rs.getString("FirstName"))
                .lastName(rs.getString("LastName"))
                .email(rs.getString("Email"))
                .passwordHash(rs.getString("PasswordHash"))
                .phoneNumber(rs.getString("PhoneNumber"))
                .roleId(rs.getInt("RoleId"))
                .departmentId(getInteger(rs, "DepartmentId"))
                .designationtId(getInteger(rs, "DesignationtId"))
                .dateOfJoining(getLocalDateTime(rs, "DateOfJoining"))
                .dateOfBirth(getLocalDateTime(rs, "DateOfBirth"))
                .gender(rs.getString("Gender"))
                .address(rs.getString("Address"))
                .aboutEmployee(rs.getString("AboutEmployee"))
                .profilePicture(rs.getString("ProfilePicture"))
                .roleId1(getInteger(rs, "RoleId1"))
                .reportingManager(rs.getString("ReportingManager"))
                .createdAt(getLocalDateTime(rs, "CreatedAt"))
                .createdBy(rs.getString("CreatedBy"))
                .modifiedBy(rs.getString("ModifiedBy"))
                .modifiedAt(getLocalDateTime(rs, "ModifiedAt"))
                .status(rs.getString("Status"))
                .build();
    }


    // =========================================================
    // INTEGER HELPER
    // =========================================================

    private Integer getInteger(
            ResultSet rs,
            String columnName
    ) throws SQLException {

        int value = rs.getInt(columnName);

        if (rs.wasNull()) {
            return null;
        }

        return value;
    }


    // =========================================================
    // LOCALDATETIME HELPER
    // =========================================================

    private LocalDateTime getLocalDateTime(
            ResultSet rs,
            String columnName
    ) throws SQLException {

        Timestamp timestamp = rs.getTimestamp(columnName);

        if (timestamp == null) {
            return null;
        }

        return timestamp.toLocalDateTime();
    }
}


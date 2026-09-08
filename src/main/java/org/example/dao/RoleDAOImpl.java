package org.example.dao;

import org.example.interfaces.RoleDAO;
import org.example.model.Role;
import org.example.util.DBConnection;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class RoleDAOImpl implements RoleDAO {

    public List<Role> getAllRoles() {
        List<Role> roles = new ArrayList<>();
        String sql = """
                SELECT
                    RoleId,
                    RoleName,
                    Status,
                    CreatedAt,
                    CreatedBy,
                    ModifiedBy,
                    ModifiedAt
                FROM `role`
                ORDER BY RoleId ASC
                """;
        try (
                Connection connection = DBConnection. getConnection();
                PreparedStatement statement = connection.prepareStatement(sql);
                ResultSet rs = statement.executeQuery()
        ) {

            while (rs.next()) {
                Role role = new Role();
                role.setRoleId(rs.getInt("RoleId"));
                role.setRoleName(rs.getString("RoleName"));
                role.setStatus(rs.getString("Status"));
                Timestamp createdAt =
                        rs.getTimestamp("CreatedAt");
                Timestamp modifiedAt =
                        rs.getTimestamp("ModifiedAt");

                role.setCreatedAt(
                        createdAt != null
                                ? createdAt.toLocalDateTime()
                                : null
                );


                role.setCreatedBy(
                        rs.getString("CreatedBy")
                );

                role.setModifiedBy(
                        rs.getString("ModifiedBy")
                );

                role.setModifiedAt(
                        modifiedAt != null
                                ? modifiedAt.toLocalDateTime()
                                : null
                );

                roles.add(role);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roles;
    }


    // =========================
    // ADD ROLE
    // =========================

    public boolean addRole(String roleName,
                           String status,
                           String createdBy) {

        String sql = """
                INSERT INTO `role`
                (
                    RoleName,
                    Status,
                    CreatedAt,
                    CreatedBy
                )
                VALUES (?, ?, NOW(), ?)
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {

            statement.setString(1, roleName);
            statement.setString(2, status);
            statement.setString(3, createdBy);

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    // =========================
    // UPDATE ROLE
    // =========================

    public boolean updateRole(int roleId,
                              String roleName,
                              String status,
                              String modifiedBy) {

        String sql = """
                UPDATE `role`
                SET
                    RoleName = ?,
                    Status = ?,
                    ModifiedBy = ?,
                    ModifiedAt = NOW()
                WHERE RoleId = ?
                """;

        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setString(1, roleName);
            statement.setString(2, status);
            statement.setString(3, modifiedBy);
            statement.setInt(4, roleId);

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteRole(int roleId) {
        String sql =
                "DELETE FROM `role` WHERE RoleId = ?";
        try (
                Connection connection = DBConnection.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)
        ) {
            statement.setInt(1, roleId);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

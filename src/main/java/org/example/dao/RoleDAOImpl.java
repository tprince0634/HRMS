package org.example.dao;
import org.example.interfaces.RoleDAO;
import org.example.model.Role;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class RoleDAOImpl implements RoleDAO {

    // =========================================================
    // GET ALL ROLES
    // =========================================================

    @Override
    public List<Role> getAllRoles() {

        List<Role> roles = new ArrayList<>();

        String sql = "{CALL sp_get_all_roles()}";

        try (
                Connection connection =
                        DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            boolean hasResultSet = statement.execute();

            if (hasResultSet) {

                try (ResultSet rs = statement.getResultSet()) {

                    while (rs.next()) {

                        Role role = new Role();

                        role.setRoleId(
                                rs.getInt("RoleId")
                        );

                        role.setRoleName(
                                rs.getString("RoleName")
                        );

                        role.setStatus(
                                rs.getString("Status")
                        );

                        role.setCreatedBy(
                                rs.getString("CreatedBy")
                        );

                        role.setModifiedBy(
                                rs.getString("ModifiedBy")
                        );


                        // =========================
                        // CREATED AT
                        // =========================

                        Timestamp createdAt =
                                rs.getTimestamp("CreatedAt");

                        if (createdAt != null) {

                            role.setCreatedAt(
                                    createdAt.toLocalDateTime()
                            );
                        }


                        // =========================
                        // MODIFIED AT
                        // =========================

                        Timestamp modifiedAt =
                                rs.getTimestamp("ModifiedAt");

                        if (modifiedAt != null) {

                            role.setModifiedAt(
                                    modifiedAt.toLocalDateTime()
                            );
                        }

                        roles.add(role);
                    }
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return roles;
    }


    // =========================================================
    // ADD ROLE
    // =========================================================

    @Override
    public boolean addRole(
            String roleName,
            String status,
            String createdBy
    ) {

        String sql = "{CALL sp_add_role(?, ?, ?)}";

        try (
                Connection connection =
                        DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setString(1, roleName);

            statement.setString(2, status);

            statement.setString(3, createdBy);

            statement.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // =========================================================
    // UPDATE ROLE
    // =========================================================

    @Override
    public boolean updateRole(
            int roleId,
            String roleName,
            String status,
            String modifiedBy
    ) {

        String sql = "{CALL sp_update_role(?, ?, ?, ?)}";

        try (
                Connection connection =
                        DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setInt(1, roleId);

            statement.setString(2, roleName);

            statement.setString(3, status);

            statement.setString(4, modifiedBy);

            statement.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // =========================================================
    // DELETE ROLE
    // =========================================================

    @Override
    public boolean deleteRole(
            int roleId
    ) {

        String sql = "{CALL sp_delete_role(?)}";

        try (
                Connection connection =
                        DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setInt(1, roleId);

            statement.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }
}
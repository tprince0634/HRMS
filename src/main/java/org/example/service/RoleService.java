package org.example.service;

import org.example.dao.RoleDAOImpl;
import org.example.model.Role;

import java.sql.SQLException;
import java.util.List;

public class RoleService {

    private final RoleDAOImpl roleDAO;

    public RoleService() {
        roleDAO = new RoleDAOImpl();
    }

    // =========================================================
    // GET ALL ROLES WITH STATUS
    // =========================================================

    public List<Role> getAllRolesWithStatus() throws SQLException {
        return roleDAO.getAllRolesWithStatus();
    }

    // =========================================================
    // ADD ROLE
    // =========================================================

    public boolean addRole(
            String roleName,
            String status,
            String createdBy
    ) {

        return roleDAO.addRole(
                roleName,
                status,
                createdBy
        );
    }

    // =========================================================
    // UPDATE ROLE
    // =========================================================

    public boolean updateRole(
            int roleId,
            String roleName,
            String status,
            String modifiedBy
    ) {

        return roleDAO.updateRole(
                roleId,
                roleName,
                status,
                modifiedBy
        );
    }

    // =========================================================
    // DELETE ROLE
    // =========================================================

    public boolean deleteRole(int roleId) {

        return roleDAO.deleteRole(roleId);
    }
}
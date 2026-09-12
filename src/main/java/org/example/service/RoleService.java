package org.example.service;

import org.example.dao.RoleDAOImpl;
import org.example.model.Role;

import java.util.List;

public class RoleService {
    private final RoleDAOImpl roleDAO;

    public RoleService() {
       this.roleDAO  = new RoleDAOImpl();
    }

    public List<Role> getAllRoles() {
        return roleDAO.getAllRoles();
    }

    public boolean addRole(String roleName,
                           String status,
                           String createdBy) {

        return roleDAO.addRole(
                roleName,
                status,
                createdBy
        );
    }

    public boolean updateRole(int roleId,
                              String roleName,
                              String status,
                              String modifiedBy) {

        return roleDAO.updateRole(
                roleId,
                roleName,
                status,
                modifiedBy
        );
    }

    public boolean deleteRole(int roleId) {
        return roleDAO.deleteRole(roleId);
    }
}

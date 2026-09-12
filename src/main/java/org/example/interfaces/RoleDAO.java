package org.example.interfaces;

import org.example.model.Role;

import java.util.List;

public interface RoleDAO {
    public List<Role> getAllRoles();

    public boolean addRole(String roleName, String status, String createdBy);
    public boolean updateRole(int roleId, String roleName, String status, String modifiedBy);
    boolean deleteRole(int roleId);
}

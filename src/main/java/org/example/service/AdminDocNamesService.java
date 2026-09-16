package org.example.service;

import org.example.dao.AdminDocNamesDAOImpl;
import org.example.interfaces.AdminDocNamesDAO;
import org.example.model.AdminDocNames;

import java.util.List;

public class AdminDocNamesService {

    private final AdminDocNamesDAO adminDocNamesDAO;

    public AdminDocNamesService() {
        this.adminDocNamesDAO = new AdminDocNamesDAOImpl();
    }

    public AdminDocNames createAdminDocNames(AdminDocNames adminDocNames) {
        return adminDocNamesDAO.createAdminDocNames(adminDocNames);
    }

    public AdminDocNames updateAdminDocNames(int id, AdminDocNames adminDocNames) {
        return adminDocNamesDAO.updateAdminDocNames(id, adminDocNames);
    }

    public AdminDocNames findAdminDocNamesById(int id) {
        return adminDocNamesDAO.findAdminDocNamesById(id);
    }

    public List<AdminDocNames> findAllAdminDocNames() {
        return adminDocNamesDAO.findAllAdminDocNames();
    }

    public List<AdminDocNames> findAdminDocNamesByName(String name) {
        return adminDocNamesDAO.findAdminDocNamesByName(name);
    }

    public void deleteAdminDocNamesById(int id) {
        adminDocNamesDAO.deleteAdminDocNamesById(id);
    }
}
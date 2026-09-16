package org.example.interfaces;

import org.example.model.AdminDocNames;

import java.util.List;

public interface AdminDocNamesDAO {
    AdminDocNames createAdminDocNames(AdminDocNames adminDocNames);
    AdminDocNames updateAdminDocNames(int id ,AdminDocNames adminDocNames);
    AdminDocNames findAdminDocNamesById(int id);
    List<AdminDocNames> findAllAdminDocNames();
    List<AdminDocNames> findAdminDocNamesByName(String name);
    void deleteAdminDocNamesById(int id);

}

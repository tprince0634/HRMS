package org.example.dao;

import org.example.interfaces.AdminDocNamesDAO;
import org.example.model.AdminDocNames;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDocNamesDAOImpl implements AdminDocNamesDAO {

    // =========================================================
    // CREATE ADMIN DOCUMENT NAME
    // =========================================================

    @Override
    public AdminDocNames createAdminDocNames(AdminDocNames adminDocNames) {

        String sql = "{CALL sp_add_admin_doc_name(?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setString(1, adminDocNames.getDocName());

            int rows = cs.executeUpdate();

            if (rows > 0) {
                return adminDocNames;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    // =========================================================
    // UPDATE ADMIN DOCUMENT NAME
    // =========================================================

    @Override
    public AdminDocNames updateAdminDocNames(int id, AdminDocNames adminDocNames) {

        String sql = "{CALL sp_update_admin_doc_name(?, ?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, id);
            cs.setString(2, adminDocNames.getDocName());

            int rows = cs.executeUpdate();

            if (rows > 0) {
                adminDocNames.setId(id);
                return adminDocNames;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    // =========================================================
    // FIND ADMIN DOCUMENT NAME BY ID
    // =========================================================

    @Override
    public AdminDocNames findAdminDocNamesById(int id) {

        String sql = "{CALL sp_get_admin_doc_name_by_id(?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, id);

            try (ResultSet rs = cs.executeQuery()) {

                if (rs.next()) {
                    return map(rs);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    // =========================================================
    // FIND ALL ADMIN DOCUMENT NAMES
    // =========================================================

    @Override
    public List<AdminDocNames> findAllAdminDocNames() {

        String sql = "{CALL sp_get_all_admin_doc_names()}";

        List<AdminDocNames> adminDocNamesList = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                adminDocNamesList.add(map(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return adminDocNamesList;
    }


    // =========================================================
    // FIND ADMIN DOCUMENT NAMES BY NAME
    // =========================================================

    @Override
    public List<AdminDocNames> findAdminDocNamesByName(String name) {

        String sql = "{CALL sp_find_admin_doc_names_by_name(?)}";

        List<AdminDocNames> adminDocNamesList = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setString(1, name);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {
                    adminDocNamesList.add(map(rs));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return adminDocNamesList;
    }


    // =========================================================
    // DELETE ADMIN DOCUMENT NAME
    // =========================================================

    @Override
    public void deleteAdminDocNamesById(int id) {

        String sql = "{CALL sp_delete_admin_doc_name(?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, id);

            cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // =========================================================
    // MAP RESULTSET TO ADMIN DOCUMENT NAME
    // =========================================================

    private AdminDocNames map(ResultSet rs) throws SQLException {

        return AdminDocNames.builder()
                .id(rs.getInt("Id"))
                .docName(rs.getString("DocName"))
                .build();
    }
}
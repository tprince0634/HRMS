package org.example.dao;

import org.example.interfaces.AdminDocumentDao;
import org.example.model.AdminDocument;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AdminDocumentDaoImpl implements AdminDocumentDao {

    // =========================================================
    // ADD ADMIN DOCUMENT
    // =========================================================

    @Override
    public AdminDocument addAdminDocument(AdminDocument adminDocument) {

        String sql = "{CALL sp_add_admin_document(?, ?, ?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setString(1, adminDocument.getEmail());
            cs.setString(2, adminDocument.getDocName());
            cs.setString(3, adminDocument.getDocFile());

            int rows = cs.executeUpdate();

            if (rows > 0) {
                return adminDocument;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    // =========================================================
    // GET ADMIN DOCUMENT BY ID
    // =========================================================

    @Override
    public AdminDocument getAdminDocumentById(int adminDocId) {

        String sql = "{CALL sp_get_admin_document_by_id(?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, adminDocId);

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
    // GET ALL ADMIN DOCUMENTS
    // =========================================================

    @Override
    public List<AdminDocument> getAllAdminDocuments() {

        String sql = "{CALL sp_get_all_admin_documents()}";

        List<AdminDocument> adminDocumentList = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                adminDocumentList.add(map(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return adminDocumentList;
    }


    // =========================================================
    // GET ADMIN DOCUMENTS BY EMAIL
    // =========================================================

    @Override
    public List<AdminDocument> getAdminDocumentsByEmail(String email) {

        String sql = "{CALL sp_get_admin_documents_by_email(?)}";

        List<AdminDocument> adminDocumentList = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setString(1, email);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {
                    adminDocumentList.add(map(rs));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return adminDocumentList;
    }


    // =========================================================
    // DELETE ADMIN DOCUMENT
    // =========================================================

    @Override
    public boolean deleteAdminDocument(int adminDocId) {

        String sql = "{CALL sp_delete_admin_document(?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, adminDocId);

            return cs.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }


    // =========================================================
    // MAP RESULTSET TO ADMIN DOCUMENT
    // =========================================================

    private AdminDocument map(ResultSet rs) throws SQLException {

        return AdminDocument.builder()
                .adminDocId(rs.getInt("AdminDocId"))
                .email(rs.getString("Email"))
                .docName(rs.getString("DocName"))
                .docFile(rs.getString("DocFile"))
                .build();
    }
}
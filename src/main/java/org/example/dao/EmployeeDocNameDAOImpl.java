package org.example.dao;

import org.example.interfaces.EmployeeDocNameDAO;
import org.example.model.EmployeeDocNames;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDocNameDAOImpl implements EmployeeDocNameDAO {

    // =========================================================
    // CREATE EMPLOYEE DOCUMENT NAME
    // =========================================================

    @Override
    public EmployeeDocNames createEmployeeDocName(EmployeeDocNames employeeDocNames) {

        String sql = "{CALL sp_add_employee_doc_name(?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setString(1, employeeDocNames.getDocName());

            int rows = cs.executeUpdate();

            if (rows > 0) {
                return employeeDocNames;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    // =========================================================
    // UPDATE EMPLOYEE DOCUMENT NAME
    // =========================================================

    @Override
    public EmployeeDocNames updateEmployeeDocName(
            int id,
            EmployeeDocNames employeeDocNames) {

        String sql = "{CALL sp_update_employee_doc_name(?, ?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, id);
            cs.setString(2, employeeDocNames.getDocName());

            int rows = cs.executeUpdate();

            if (rows > 0) {
                employeeDocNames.setId(id);
                return employeeDocNames;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    // =========================================================
    // FIND EMPLOYEE DOCUMENT NAME BY ID
    // =========================================================

    @Override
    public EmployeeDocNames findEmployeeDocNameById(int id) {

        String sql = "{CALL sp_get_employee_doc_name_by_id(?)}";

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
    // DELETE EMPLOYEE DOCUMENT NAME
    // =========================================================

    @Override
    public void deleteEmployeeDocName(int id) {

        String sql = "{CALL sp_delete_employee_doc_name(?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql)) {

            cs.setInt(1, id);

            cs.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // =========================================================
    // FIND ALL EMPLOYEE DOCUMENT NAMES
    // =========================================================

    @Override
    public List<EmployeeDocNames> findAllEmployeeDocNames() {

        String sql = "{CALL sp_get_all_employee_doc_names()}";

        List<EmployeeDocNames> employeeDocNamesList = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement cs = connection.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                employeeDocNamesList.add(map(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employeeDocNamesList;
    }


    // =========================================================
    // MAP RESULTSET TO EMPLOYEE DOCUMENT NAME
    // =========================================================

    private EmployeeDocNames map(ResultSet rs) throws SQLException {

        return EmployeeDocNames.builder()
                .id(rs.getInt("Id"))
                .docName(rs.getString("DocName"))
                .build();
    }
}
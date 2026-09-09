package org.example.dao;

import org.example.interfaces.DesignationDAO;
import org.example.model.Designation;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class DesignationDAOImpl implements DesignationDAO {

    // =========================================================
    // GET ALL DESIGNATIONS
    // =========================================================

    @Override
    public List<Designation> getAllDesignations() {

        List<Designation> designations = new ArrayList<>();

        String sql = "{CALL sp_get_all_designations()}";

        try (
                Connection connection = DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            boolean hasResultSet = statement.execute();

            if (hasResultSet) {

                try (ResultSet resultSet = statement.getResultSet()) {

                    while (resultSet.next()) {

                        Designation designation = new Designation();

                        designation.setDesignationId(
                                resultSet.getInt("DesignationId")
                        );

                        designation.setDepartmentId(
                                resultSet.getInt("DepartmentId")
                        );

                        designation.setName(
                                resultSet.getString("Name")
                        );

                        designation.setNoOfEmployee(
                                resultSet.getInt("NoOfEmployee")
                        );

                        designation.setStatus(
                                resultSet.getString("status")
                        );

                        designation.setCreatedBy(
                                resultSet.getString("CreatedBy")
                        );

                        designation.setModifiedBy(
                                resultSet.getString("ModifiedBy")
                        );

                        Timestamp createdAt =
                                resultSet.getTimestamp("CreatedAt");

                        if (createdAt != null) {

                            designation.setCreatedAt(
                                    createdAt.toLocalDateTime()
                            );
                        }

                        Timestamp modifiedAt =
                                resultSet.getTimestamp("ModifiedAt");

                        if (modifiedAt != null) {

                            designation.setModifiedAt(
                                    modifiedAt.toLocalDateTime()
                            );
                        }

                        designations.add(designation);
                    }
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return designations;
    }


    // =========================================================
    // ADD DESIGNATION
    // =========================================================

    @Override
    public boolean addDesignation(
            int departmentId,
            String name,
            String status,
            String createdBy
    ) {

        String sql = "{CALL sp_add_designation(?, ?, ?, ?)}";

        try (
                Connection connection =
                        DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setInt(1, departmentId);

            statement.setString(2, name);

            statement.setString(3, status);

            statement.setString(4, createdBy);

            statement.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // =========================================================
    // UPDATE DESIGNATION
    // =========================================================

    @Override
    public boolean updateDesignation(
            int designationId,
            int departmentId,
            String name,
            String status,
            String modifiedBy
    ) {

        String sql = "{CALL sp_update_designation(?, ?, ?, ?, ?)}";

        try (
                Connection connection =
                        DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setInt(1, designationId);

            statement.setInt(2, departmentId);

            statement.setString(3, name);

            statement.setString(4, status);

            statement.setString(5, modifiedBy);

            statement.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // =========================================================
    // DELETE DESIGNATION
    // =========================================================

    @Override
    public boolean deleteDesignation(
            int designationId
    ) {

        String sql = "{CALL sp_delete_designation(?)}";

        try (
                Connection connection =
                        DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setInt(1, designationId);

            statement.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }
}
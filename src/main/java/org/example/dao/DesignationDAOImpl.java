package org.example.dao;

import org.example.interfaces.DesignationDAO;
import org.example.model.Designation;
import org.example.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

        String sql = """
                SELECT
                    DesignationId,
                    DepartmentId,
                    Name,
                    NoOfEmployee,
                    status,
                    CreatedAt,
                    CreatedBy,
                    ModifiedBy,
                    ModifiedAt
                FROM designations
                ORDER BY DesignationId DESC
                """;

        try (
                Connection connection = DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql);

                ResultSet resultSet =
                        statement.executeQuery()
        ) {

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

        String sql = """
                INSERT INTO designations
                (
                    DepartmentId,
                    Name,
                    NoOfEmployee,
                    status,
                    CreatedAt,
                    CreatedBy
                )
                VALUES (?, ?, 0, ?, NOW(), ?)
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, departmentId);

            statement.setString(2, name);

            statement.setString(3, status);

            statement.setString(4, createdBy);

            return statement.executeUpdate() > 0;

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

        String sql = """
                UPDATE designations
                SET
                    DepartmentId = ?,
                    Name = ?,
                    status = ?,
                    ModifiedBy = ?,
                    ModifiedAt = NOW()
                WHERE DesignationId = ?
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, departmentId);

            statement.setString(2, name);

            statement.setString(3, status);

            statement.setString(4, modifiedBy);

            statement.setInt(5, designationId);

            return statement.executeUpdate() > 0;

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

        String sql = """
                DELETE FROM designations
                WHERE DesignationId = ?
                """;

        try (
                Connection connection =
                        DBConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            statement.setInt(1, designationId);

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }
}
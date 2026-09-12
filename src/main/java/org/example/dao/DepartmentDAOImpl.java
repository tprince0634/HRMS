package org.example.dao;

import org.example.interfaces.DepartmentDAO;
import org.example.model.Department;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDAOImpl implements DepartmentDAO {

    // =====================================================
    // GET ALL DEPARTMENTS
    // =====================================================

    @Override
    public List<Department> getAllDepartments() {

        List<Department> departments = new ArrayList<>();

        String sql = "{CALL sp_get_all_departments()}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            boolean hasResultSet = statement.execute();

            if (hasResultSet) {

                try (ResultSet resultSet = statement.getResultSet()) {

                    while (resultSet.next()) {

                        Department department = new Department();

                        department.setDepartmentId(
                                resultSet.getInt("DepartmentId")
                        );

                        department.setName(
                                resultSet.getString("Name")
                        );

                        department.setNoOfEmployee(
                                resultSet.getInt("NoOfEmployee")
                        );

                        department.setStatus(
                                resultSet.getString("status")
                        );

                        department.setCreatedBy(
                                resultSet.getString("CreatedBy")
                        );

                        department.setModifiedBy(
                                resultSet.getString("ModifiedBy")
                        );


                        Timestamp createdAt =
                                resultSet.getTimestamp("CreatedAt");

                        if (createdAt != null) {

                            department.setCreatedAt(
                                    createdAt.toLocalDateTime()
                            );
                        }


                        Timestamp modifiedAt =
                                resultSet.getTimestamp("ModifiedAt");

                        if (modifiedAt != null) {

                            department.setModifiedAt(
                                    modifiedAt.toLocalDateTime()
                            );
                        }


                        departments.add(department);
                    }
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return departments;
    }


    // =====================================================
    // ADD DEPARTMENT
    // =====================================================

    @Override
    public boolean addDepartment(
            String name,
            String status,
            String createdBy
    ) {

        String sql =
                "{CALL sp_add_department(?, ?, ?)}";

        try (
                Connection connection =
                        DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setString(1, name);

            statement.setString(2, status);

            statement.setString(3, createdBy);


            int result = statement.executeUpdate();

            return result > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // =====================================================
    // UPDATE DEPARTMENT
    // =====================================================

    @Override
    public boolean updateDepartment(
            int departmentId,
            String name,
            String status,
            String modifiedBy
    ) {

        String sql =
                "{CALL sp_update_department(?, ?, ?, ?)}";

        try (
                Connection connection =
                        DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setInt(1, departmentId);

            statement.setString(2, name);

            statement.setString(3, status);

            statement.setString(4, modifiedBy);


            int result = statement.executeUpdate();

            return result > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // =====================================================
    // DELETE DEPARTMENT
    // =====================================================

    @Override
    public boolean deleteDepartment(
            int departmentId
    ) {

        String sql =
                "{CALL sp_delete_department(?)}";

        try (
                Connection connection =
                        DBConnection.getConnection();

                CallableStatement statement =
                        connection.prepareCall(sql)
        ) {

            statement.setInt(1, departmentId);


            int result = statement.executeUpdate();

            return result > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }
}
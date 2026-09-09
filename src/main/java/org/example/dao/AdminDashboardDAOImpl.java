package org.example.dao;

import org.example.interfaces.AdminDashboardDAO;
import org.example.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

public class AdminDashboardDAOImpl implements AdminDashboardDAO {

    @Override
    public int getTotalEmployees() {
        String sql = """
            SELECT COUNT(*)
            FROM `User`
            WHERE RoleId IN (8, 10)
              AND Status = 'Active'
            """;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int getPresentToday() {

        String sql = """
            SELECT COUNT(*)
            FROM Attendance
            WHERE DATE(CheckIn) = CURDATE()
              AND Status = 'Present'
            """;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    // =========================================================
    // EMPLOYEES ON LEAVE TODAY
    // =========================================================

    @Override
    public int getOnLeave() {
        String sql = """
            SELECT COUNT(DISTINCT UserId)
            FROM LeaveRequests
            WHERE CURDATE() BETWEEN DATE(StartDate) AND DATE(EndDate)
              AND Status = 'Approved'
            """;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    // =========================================================
    // PENDING LEAVE REQUESTS
    // =========================================================
    @Override
    public int getPendingLeaves() {
        String sql = """
                SELECT COUNT(*)
                FROM LeaveRequests
                WHERE Status = 'Pending'
                """;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }



    @Override
    public int getTotalProjects() {

        String sql = """
            SELECT COUNT(*)
            FROM AllProjects
            """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int getTotalClients() {

        String sql = """
            SELECT COUNT(DISTINCT ClientName)
            FROM AllProjects
            WHERE ClientName IS NOT NULL
              AND ClientName <> ''
            """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    @Override
    public int getTotalTasks() {

        String sql = """
            SELECT COUNT(*)
            FROM Task
            """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    @Override
    public double getTotalEarnings() {

        String sql = """
            SELECT COALESCE(SUM(EarningAmount), 0)
            FROM EmployeeEarnings
            """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getDouble(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0.0;
    }


    // =========================================================
// NEW HIRES - LAST 30 DAYS
// =========================================================
    @Override
    public int getNewHires() {

        String sql = """
            SELECT COUNT(*)
            FROM User
            WHERE DateOfJoining >= DATE_SUB(
                CURDATE(),
                INTERVAL 30 DAY
            )
            AND Status = 'Active'
            """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return 0;
    }


    @Override
    public Map<String, Integer> getDepartmentEmployeeCount() {

        Map<String, Integer> departmentMap =
                new LinkedHashMap<>();
        String sql = """
            SELECT
                d.Name AS DepartmentName,
                COUNT(u.UserId) AS EmployeeCount
            FROM Departments d
            LEFT JOIN User u
                ON d.DepartmentId = u.DepartmentId
                AND u.Status = 'Active'
            GROUP BY
                d.DepartmentId,
                d.Name
            ORDER BY
                d.Name
            """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            while (resultSet.next()) {

                departmentMap.put(
                        resultSet.getString("DepartmentName"),
                        resultSet.getInt("EmployeeCount")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return departmentMap;
    }


    @Override
    public Map<String, Integer> getEmployeeStatusCount() {

        Map<String, Integer> statusMap =
                new LinkedHashMap<>();

        String sql = """
            SELECT
                Status,
                COUNT(*) AS EmployeeCount
            FROM User
            WHERE RoleId IN (8, 10)
            GROUP BY Status
            ORDER BY Status
            """;

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql);
             ResultSet resultSet =
                     statement.executeQuery()) {

            while (resultSet.next()) {

                statusMap.put(
                        resultSet.getString("Status"),
                        resultSet.getInt("EmployeeCount")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return statusMap;
    }


}
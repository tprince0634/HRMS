package org.example.dao;

import org.example.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDashboardDAOImpl {

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
}
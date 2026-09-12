package org.example.dao;

import org.example.interfaces.ResignationDAO;
import org.example.model.Resignation;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ResignationDAOImpl implements ResignationDAO {

    @Override
    public boolean addResignation(Resignation resignation) {

        String sql = "{CALL sp_add_resignation(?, ?, ?, ?, ?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, resignation.getUserId());

            cs.setInt(2, resignation.getDepartmentId());

            cs.setTimestamp(
                    3,
                    Timestamp.valueOf(resignation.getNoticeDate())
            );

            cs.setTimestamp(
                    4,
                    Timestamp.valueOf(resignation.getResignDate())
            );

            cs.setString(5, resignation.getReason());

            cs.execute();
            return true;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }


    @Override
    public Resignation getResignationById(int resignationId) {

        String sql = "{CALL sp_get_resignation_by_id(?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, resignationId);

            ResultSet rs = cs.executeQuery();

            if (rs.next()) {

                Resignation resignation = new Resignation();

                resignation.setResignationId(
                        rs.getInt("ResignationId")
                );

                resignation.setUserId(
                        rs.getInt("UserID")
                );

                resignation.setDepartmentId(
                        rs.getInt("DepartmentId")
                );

                resignation.setNoticeDate(
                        rs.getTimestamp("NoticeDate")
                                .toLocalDateTime()
                );

                resignation.setResignDate(
                        rs.getTimestamp("ResignDate")
                                .toLocalDateTime()
                );

                resignation.setReason(
                        rs.getString("Reason")
                );

                return resignation;
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }


    @Override
    public List<Resignation> getAllResignations() {

        List<Resignation> resignations = new ArrayList<>();

        String sql = "{CALL sp_get_all_resignations()}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql);
                ResultSet rs = cs.executeQuery()
        ) {

            while (rs.next()) {

                Resignation resignation = new Resignation();

                resignation.setResignationId(
                        rs.getInt("ResignationId")
                );

                resignation.setUserId(
                        rs.getInt("UserID")
                );

                resignation.setDepartmentId(
                        rs.getInt("DepartmentId")
                );

                resignation.setNoticeDate(
                        rs.getTimestamp("NoticeDate")
                                .toLocalDateTime()
                );

                resignation.setResignDate(
                        rs.getTimestamp("ResignDate")
                                .toLocalDateTime()
                );

                resignation.setReason(
                        rs.getString("Reason")
                );

                resignations.add(resignation);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return resignations;
    }


    @Override
    public boolean updateResignation(Resignation resignation) {

        String sql = "{CALL sp_update_resignation(?, ?, ?, ?, ?, ?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(
                    1,
                    resignation.getResignationId()
            );

            cs.setInt(
                    2,
                    resignation.getUserId()
            );

            cs.setInt(
                    3,
                    resignation.getDepartmentId()
            );

            cs.setTimestamp(
                    4,
                    Timestamp.valueOf(resignation.getNoticeDate())
            );

            cs.setTimestamp(
                    5,
                    Timestamp.valueOf(resignation.getResignDate())
            );

            cs.setString(
                    6,
                    resignation.getReason()
            );

            cs.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }


    @Override
    public boolean deleteResignation(int resignationId) {

        String sql = "{CALL sp_delete_resignation(?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, resignationId);

            cs.execute();

            return true;

        } catch (SQLException e) {

            e.printStackTrace();
            return false;
        }
    }
}
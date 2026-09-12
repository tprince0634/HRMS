package org.example.dao;

import org.example.interfaces.TerminationDAO;
import org.example.model.Termination;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class TerminationDAOImpl implements TerminationDAO {

    @Override
    public boolean addTermination(Termination termination) {

        String sql = "{CALL sp_add_termination(?, ?, ?, ?, ?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, termination.getUserId());
            cs.setString(2, termination.getTerminationType());
            cs.setTimestamp(3, Timestamp.valueOf(termination.getNoticeDate()));
            cs.setTimestamp(4, Timestamp.valueOf(termination.getResignDate()));
            cs.setString(5, termination.getReason());

            cs.execute();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public Termination getTerminationById(int terminationId) {

        String sql = "{CALL sp_get_termination_by_id(?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, terminationId);

            ResultSet rs = cs.executeQuery();

            if (rs.next()) {

                Termination termination = new Termination();

                termination.setTerminationId(
                        rs.getInt("TerminationId")
                );

                termination.setUserId(
                        rs.getInt("UserID")
                );

                termination.setTerminationType(
                        rs.getString("TerminationType")
                );

                termination.setNoticeDate(
                        rs.getTimestamp("NoticeDate")
                                .toLocalDateTime()
                );

                termination.setResignDate(
                        rs.getTimestamp("ResignDate")
                                .toLocalDateTime()
                );

                termination.setReason(
                        rs.getString("Reason")
                );

                return termination;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    @Override
    public List<Termination> getAllTerminations() {

        List<Termination> terminations = new ArrayList<>();

        String sql = "{CALL sp_get_all_terminations()}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql);
                ResultSet rs = cs.executeQuery()
        ) {

            while (rs.next()) {

                Termination termination = new Termination();

                termination.setTerminationId(
                        rs.getInt("TerminationId")
                );

                termination.setUserId(
                        rs.getInt("UserID")
                );

                termination.setTerminationType(
                        rs.getString("TerminationType")
                );

                termination.setNoticeDate(
                        rs.getTimestamp("NoticeDate")
                                .toLocalDateTime()
                );

                termination.setResignDate(
                        rs.getTimestamp("ResignDate")
                                .toLocalDateTime()
                );

                termination.setReason(
                        rs.getString("Reason")
                );

                terminations.add(termination);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return terminations;
    }


    @Override
    public boolean updateTermination(Termination termination) {

        String sql = "{CALL sp_update_termination(?, ?, ?, ?, ?, ?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, termination.getTerminationId());
            cs.setInt(2, termination.getUserId());
            cs.setString(3, termination.getTerminationType());
            cs.setTimestamp(4, Timestamp.valueOf(termination.getNoticeDate()));
            cs.setTimestamp(5, Timestamp.valueOf(termination.getResignDate()));
            cs.setString(6, termination.getReason());

            cs.execute();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public boolean deleteTermination(int terminationId) {

        String sql = "{CALL sp_delete_termination(?)}";

        try (
                Connection connection = DBConnection.getConnection();
                CallableStatement cs = connection.prepareCall(sql)
        ) {

            cs.setInt(1, terminationId);

            cs.execute();

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
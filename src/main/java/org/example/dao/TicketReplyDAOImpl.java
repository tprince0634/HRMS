package org.example.dao;

import org.example.interfaces.TicketReplyDAO;
import org.example.model.TicketReply;
import org.example.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketReplyDAOImpl implements TicketReplyDAO {

    @Override
    public boolean addTicketReply(TicketReply ticketReply) {

        String sql = "{CALL sp_add_ticket_reply(?,?,?,?)}";

        try (
                Connection con = DBConnection.getConnection();
                CallableStatement cs = con.prepareCall(sql)
        ) {

            cs.setInt(1, ticketReply.getTicketId());
            cs.setString(2, ticketReply.getReplyMessage());
            cs.setString(3, ticketReply.getRepliedBy());
            cs.setTimestamp(
                    4,
                    Timestamp.valueOf(ticketReply.getRepliedAt())
            );

            return cs.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public TicketReply getTicketReplyById(int replyId) {

        String sql = "{CALL sp_get_ticket_reply_by_id(?)}";

        try (
                Connection con = DBConnection.getConnection();
                CallableStatement cs = con.prepareCall(sql)
        ) {

            cs.setInt(1, replyId);

            try (ResultSet rs = cs.executeQuery()) {

                if (rs.next()) {
                    return mapReply(rs);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<TicketReply> getAllTicketReplies() {

        List<TicketReply> replies = new ArrayList<>();

        String sql = "{CALL sp_get_all_ticket_replies()}";

        try (
                Connection con = DBConnection.getConnection();
                CallableStatement cs = con.prepareCall(sql);
                ResultSet rs = cs.executeQuery()
        ) {

            while (rs.next()) {
                replies.add(mapReply(rs));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return replies;
    }

    @Override
    public List<TicketReply> getRepliesByTicketId(int ticketId) {

        List<TicketReply> replies = new ArrayList<>();

        String sql = "{CALL sp_get_replies_by_ticket_id(?)}";

        try (
                Connection con = DBConnection.getConnection();
                CallableStatement cs = con.prepareCall(sql)
        ) {

            cs.setInt(1, ticketId);

            try (ResultSet rs = cs.executeQuery()) {

                while (rs.next()) {
                    replies.add(mapReply(rs));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return replies;
    }

    @Override
    public boolean updateTicketReply(TicketReply ticketReply) {

        String sql = "{CALL sp_update_ticket_reply(?,?,?,?,?)}";

        try (
                Connection con = DBConnection.getConnection();
                CallableStatement cs = con.prepareCall(sql)
        ) {

            cs.setInt(1, ticketReply.getReplyId());
            cs.setInt(2, ticketReply.getTicketId());
            cs.setString(3, ticketReply.getReplyMessage());
            cs.setString(4, ticketReply.getRepliedBy());
            cs.setTimestamp(
                    5,
                    Timestamp.valueOf(ticketReply.getRepliedAt())
            );

            return cs.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteTicketReply(int replyId) {

        String sql = "{CALL sp_delete_ticket_reply(?)}";

        try (
                Connection con = DBConnection.getConnection();
                CallableStatement cs = con.prepareCall(sql)
        ) {

            cs.setInt(1, replyId);

            return cs.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    private TicketReply mapReply(ResultSet rs) throws SQLException {

        return TicketReply.builder()
                .replyId(rs.getInt("ReplyId"))
                .ticketId(rs.getInt("TicketId"))
                .replyMessage(rs.getString("ReplyMessage"))
                .repliedBy(rs.getString("RepliedBy"))
                .repliedAt(
                        rs.getTimestamp("RepliedAt").toLocalDateTime()
                )
                .build();
    }
}

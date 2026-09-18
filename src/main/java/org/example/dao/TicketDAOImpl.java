package org.example.dao;

import org.example.interfaces.TicketDAO;
import org.example.model.Ticket;
import org.example.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TicketDAOImpl implements TicketDAO {

    @Override
    public boolean addTicket(Ticket ticket) {
        String sql =
                "INSERT INTO Tickets " +
                        "(TicketTitle, EventCategory, Subject, RaisedBy, AssignedBy, AssignedTo, " +
                        "TicketDescription, Priority, Status, Visibility, CreatedAt) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, nullToEmpty(ticket.getTicketTitle()));
            ps.setString(2, nullToEmpty(ticket.getEventCategory()));
            ps.setString(3, nullToEmpty(ticket.getSubject()));
            setNullableInt(ps, 4, ticket.getRaisedBy());
            setNullableInt(ps, 5, ticket.getAssignedBy());
            setNullableInt(ps, 6, ticket.getAssignedTo());
            ps.setString(7, nullToEmpty(ticket.getTicketDescription()));
            ps.setString(8, nullToEmpty(ticket.getPriority()));
            ps.setString(9, nullToEmpty(ticket.getStatus()));
            ps.setString(10, nullToEmpty(ticket.getVisibility()));
            ps.setTimestamp(11, ticket.getCreatedAt() == null
                    ? new Timestamp(System.currentTimeMillis())
                    : Timestamp.valueOf(ticket.getCreatedAt()));

            int affected = ps.executeUpdate();

            if (affected > 0) {
                try (ResultSet keys = ps.getGeneratedKeys()) {
                    if (keys.next()) {
                        ticket.setTicketId(keys.getInt(1));
                        ticket.setTicketNo("TKT-" + ticket.getTicketId());
                    }
                }
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Ticket getTicketById(int ticketId) {
        String sql =
                "SELECT TicketId, TicketTitle, EventCategory, Subject, RaisedBy, " +
                        "AssignedBy, AssignedTo, TicketDescription, Priority, Status, " +
                        "Visibility, CreatedAt FROM Tickets WHERE TicketId = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, ticketId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return mapTicket(rs);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Ticket> getAllTickets() {
        List<Ticket> tickets = new ArrayList<>();

        String sql =
                "SELECT TicketId, TicketTitle, EventCategory, Subject, RaisedBy, " +
                        "AssignedBy, AssignedTo, TicketDescription, Priority, Status, " +
                        "Visibility, CreatedAt FROM Tickets ORDER BY TicketId DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                tickets.add(mapTicket(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tickets;
    }

    @Override
    public boolean updateTicket(Ticket ticket) {
        String sql =
                "UPDATE Tickets SET TicketTitle=?, EventCategory=?, Subject=?, RaisedBy=?, " +
                        "AssignedBy=?, AssignedTo=?, TicketDescription=?, Priority=?, Status=?, " +
                        "Visibility=? WHERE TicketId=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, nullToEmpty(ticket.getTicketTitle()));
            ps.setString(2, nullToEmpty(ticket.getEventCategory()));
            ps.setString(3, nullToEmpty(ticket.getSubject()));
            setNullableInt(ps, 4, ticket.getRaisedBy());
            setNullableInt(ps, 5, ticket.getAssignedBy());
            setNullableInt(ps, 6, ticket.getAssignedTo());
            ps.setString(7, nullToEmpty(ticket.getTicketDescription()));
            ps.setString(8, nullToEmpty(ticket.getPriority()));
            ps.setString(9, nullToEmpty(ticket.getStatus()));
            ps.setString(10, nullToEmpty(ticket.getVisibility()));
            ps.setInt(11, ticket.getTicketId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteTicket(int ticketId) {
        String sql = "DELETE FROM Tickets WHERE TicketId = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, ticketId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Map<String, Object>> getTicketEmployees() throws SQLException {
        List<Map<String, Object>> employees = new ArrayList<>();

        String sql =
                "SELECT u.UserId, u.FirstName, u.LastName " +
                        "FROM User u " +
                        "INNER JOIN Role r ON r.RoleId = u.RoleId " +
                        "WHERE LOWER(r.RoleName) = 'employee' " +
                        "AND (u.Status IS NULL OR LOWER(u.Status) = 'active') " +
                        "ORDER BY u.FirstName, u.LastName";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Map<String, Object> employee = new HashMap<>();
                employee.put("userId", rs.getInt("UserId"));
                employee.put("firstName", rs.getString("FirstName"));
                employee.put("lastName", rs.getString("LastName"));
                employees.add(employee);
            }
        }
        return employees;
    }

    private Ticket mapTicket(ResultSet rs) throws SQLException {
        Integer raisedBy = nullableInt(rs, "RaisedBy");
        Integer assignedBy = nullableInt(rs, "AssignedBy");
        Integer assignedTo = nullableInt(rs, "AssignedTo");

        Timestamp created = rs.getTimestamp("CreatedAt");

        return Ticket.builder()
                .ticketId(rs.getInt("TicketId"))
                .ticketNo("TKT-" + rs.getInt("TicketId"))
                .ticketTitle(rs.getString("TicketTitle"))
                .eventCategory(rs.getString("EventCategory"))
                .subject(rs.getString("Subject"))
                .raisedBy(raisedBy)
                .assignedBy(assignedBy)
                .assignedTo(assignedTo)
                .ticketDescription(rs.getString("TicketDescription"))
                .priority(rs.getString("Priority"))
                .status(rs.getString("Status"))
                .visibility(rs.getString("Visibility"))
                .createdAt(created == null ? null : created.toLocalDateTime())
                .build();
    }

    private Integer nullableInt(ResultSet rs, String column) throws SQLException {
        int value = rs.getInt(column);
        return rs.wasNull() ? null : value;
    }

    private void setNullableInt(PreparedStatement ps, int index, Integer value) throws SQLException {
        if (value == null) {
            ps.setNull(index, Types.INTEGER);
        } else {
            ps.setInt(index, value);
        }
    }

    private String nullToEmpty(String value) {
        return value == null ? "" : value.trim();
    }
}

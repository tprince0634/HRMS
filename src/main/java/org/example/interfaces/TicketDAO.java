package org.example.interfaces;

import org.example.model.Ticket;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface TicketDAO {

    boolean addTicket(Ticket ticket);

    Ticket getTicketById(int ticketId);

    List<Ticket> getAllTickets();

    boolean updateTicket(Ticket ticket);

    boolean deleteTicket(int ticketId);

    List<Map<String, Object>> getTicketEmployees() throws SQLException;
}

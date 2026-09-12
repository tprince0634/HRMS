package org.example.interfaces;

import org.example.model.Ticket;

import java.util.List;

public interface TicketDAO {

    boolean addTicket(Ticket ticket);

    Ticket getTicketById(int ticketId);

    List<Ticket> getAllTickets();

    boolean updateTicket(Ticket ticket);

    boolean deleteTicket(int ticketId);
}

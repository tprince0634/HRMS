package org.interfaces;

import org.model.Ticket;

import java.util.List;

public interface ITicketDAO {

    boolean addTicket(Ticket ticket);

    Ticket getTicketById(int ticketId);

    List<Ticket> getAllTickets();

    boolean updateTicket(Ticket ticket);

    boolean deleteTicket(int ticketId);
}

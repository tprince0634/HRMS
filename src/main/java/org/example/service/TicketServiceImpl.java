package org.example.service;

import org.example.dao.TicketDAOImpl;
import org.example.interfaces.TicketDAO;
import org.example.model.Ticket;

import java.util.List;

public class TicketServiceImpl {

    private final TicketDAO ticketDAO;

    public TicketServiceImpl() {
        this.ticketDAO = new TicketDAOImpl();
    }

    public TicketServiceImpl(TicketDAO ticketDAO) {
        this.ticketDAO = ticketDAO;
    }

    public boolean addTicket(Ticket ticket) {
        if (ticket == null) {
            throw new IllegalArgumentException("Ticket is required.");
        }
        return ticketDAO.addTicket(ticket);
    }

    public Ticket getTicketById(int ticketId) {
        if (ticketId <= 0) {
            throw new IllegalArgumentException("Invalid ticket ID.");
        }
        return ticketDAO.getTicketById(ticketId);
    }

    public List<Ticket> getAllTickets() {
        return ticketDAO.getAllTickets();
    }

    public boolean updateTicket(Ticket ticket) {
        if (ticket == null || ticket.getTicketId() <= 0) {
            throw new IllegalArgumentException("Invalid ticket.");
        }
        return ticketDAO.updateTicket(ticket);
    }

    public boolean deleteTicket(int ticketId) {
        if (ticketId <= 0) {
            throw new IllegalArgumentException("Invalid ticket ID.");
        }
        return ticketDAO.deleteTicket(ticketId);
    }
}

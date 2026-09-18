
package org.example.service;

import org.example.dao.TicketReplyDAOImpl;
import org.example.model.TicketReply;

import java.util.List;

public class TicketReplyServiceImpl {

    private final TicketReplyDAOImpl ticketReplyDAO;

    public TicketReplyServiceImpl() {
        this.ticketReplyDAO = new TicketReplyDAOImpl();
    }

    public boolean addTicketReply(TicketReply ticketReply) {
        return ticketReplyDAO.addTicketReply(ticketReply);
    }

    public TicketReply getTicketReplyById(int replyId) {
        return ticketReplyDAO.getTicketReplyById(replyId);
    }

    public List<TicketReply> getAllTicketReplies() {
        return ticketReplyDAO.getAllTicketReplies();
    }

    public List<TicketReply> getRepliesByTicketId(int ticketId) {
        return ticketReplyDAO.getRepliesByTicketId(ticketId);
    }

    public boolean updateTicketReply(TicketReply ticketReply) {
        return ticketReplyDAO.updateTicketReply(ticketReply);
    }

    public boolean deleteTicketReply(int replyId) {
        return ticketReplyDAO.deleteTicketReply(replyId);
    }
}


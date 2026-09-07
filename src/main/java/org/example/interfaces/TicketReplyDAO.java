package org.example.interfaces;

import org.example.model.TicketReply;

import java.util.List;

public interface TicketReplyDAO {

    boolean addTicketReply(TicketReply ticketReply);

    TicketReply getTicketReplyById(int replyId);

    List<TicketReply> getAllTicketReplies();

    List<TicketReply> getRepliesByTicketId(int ticketId);

    boolean updateTicketReply(TicketReply ticketReply);

    boolean deleteTicketReply(int replyId);
}

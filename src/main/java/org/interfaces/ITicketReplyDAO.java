package org.interfaces;

import org.model.TicketReply;

import java.util.List;

public interface ITicketReplyDAO {

    boolean addTicketReply(TicketReply ticketReply);

    TicketReply getTicketReplyById(int replyId);

    List<TicketReply> getAllTicketReplies();

    List<TicketReply> getRepliesByTicketId(int ticketId);

    boolean updateTicketReply(TicketReply ticketReply);

    boolean deleteTicketReply(int replyId);
}

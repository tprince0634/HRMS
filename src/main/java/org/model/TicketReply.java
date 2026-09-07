package org.model;

import java.time.LocalDateTime;

public class TicketReply {

    private int replyId;
    private int ticketId;
    private String replyMessage;
    private String repliedBy;
    private LocalDateTime repliedAt;

    // No-argument constructor
    public TicketReply() {
    }

    // Parameterized constructor
    public TicketReply(int replyId, int ticketId, String replyMessage,
                       String repliedBy, LocalDateTime repliedAt) {

        this.replyId = replyId;
        this.ticketId = ticketId;
        this.replyMessage = replyMessage;
        this.repliedBy = repliedBy;
        this.repliedAt = repliedAt;
    }

    // Getters and Setters

    public int getReplyId() {
        return replyId;
    }

    public void setReplyId(int replyId) {
        this.replyId = replyId;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public String getReplyMessage() {
        return replyMessage;
    }

    public void setReplyMessage(String replyMessage) {
        this.replyMessage = replyMessage;
    }

    public String getRepliedBy() {
        return repliedBy;
    }

    public void setRepliedBy(String repliedBy) {
        this.repliedBy = repliedBy;
    }

    public LocalDateTime getRepliedAt() {
        return repliedAt;
    }

    public void setRepliedAt(LocalDateTime repliedAt) {
        this.repliedAt = repliedAt;
    }
}


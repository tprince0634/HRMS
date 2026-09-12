package org.example.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TicketReply {

    private int replyId;
    private int ticketId;
    private String replyMessage;
    private String repliedBy;
    private LocalDateTime repliedAt;
}

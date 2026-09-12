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
public class Ticket {

    private int ticketId;
    private String ticketTitle;
    private String eventCategory;
    private String subject;
    private int assignedBy;
    private int assignedTo;
    private String ticketDescription;
    private String priority;
    private String status;
    private String visibility;
    private LocalDateTime createdAt;

}

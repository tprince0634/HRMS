package org.example.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Ticket {

    private int ticketId;
    private String ticketNo;
    private String ticketTitle;
    private String eventCategory;
    private String subject;
    private Integer raisedBy;
    private Integer assignedBy;
    private Integer assignedTo;
    private String ticketDescription;
    private String priority;
    private String status;
    private String visibility;
    private LocalDateTime createdAt;
}

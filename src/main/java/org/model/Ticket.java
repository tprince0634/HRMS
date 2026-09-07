package org.model;

import java.time.LocalDateTime;

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

    // No-argument constructor
    public Ticket() {
    }

    // Parameterized constructor
    public Ticket(int ticketId, String ticketTitle, String eventCategory,
                  String subject, int assignedBy, int assignedTo,
                  String ticketDescription, String priority,
                  String status, String visibility,
                  LocalDateTime createdAt) {

        this.ticketId = ticketId;
        this.ticketTitle = ticketTitle;
        this.eventCategory = eventCategory;
        this.subject = subject;
        this.assignedBy = assignedBy;
        this.assignedTo = assignedTo;
        this.ticketDescription = ticketDescription;
        this.priority = priority;
        this.status = status;
        this.visibility = visibility;
        this.createdAt = createdAt;
    }

    // Getters and Setters

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public String getTicketTitle() {
        return ticketTitle;
    }

    public void setTicketTitle(String ticketTitle) {
        this.ticketTitle = ticketTitle;
    }

    public String getEventCategory() {
        return eventCategory;
    }

    public void setEventCategory(String eventCategory) {
        this.eventCategory = eventCategory;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getAssignedBy() {
        return assignedBy;
    }

    public void setAssignedBy(int assignedBy) {
        this.assignedBy = assignedBy;
    }

    public int getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(int assignedTo) {
        this.assignedTo = assignedTo;
    }

    public String getTicketDescription() {
        return ticketDescription;
    }

    public void setTicketDescription(String ticketDescription) {
        this.ticketDescription = ticketDescription;
    }

    public String getPriority() {
        return priority;
    }

    public void setPriority(String priority) {
        this.priority = priority;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getVisibility() {
        return visibility;
    }

    public void setVisibility(String visibility) {
        this.visibility = visibility;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}


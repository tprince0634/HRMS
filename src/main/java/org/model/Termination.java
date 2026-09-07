package org.model;


import java.time.LocalDateTime;

public class Termination {

    private int terminationId;
    private int userId;
    private String terminationType;
    private LocalDateTime noticeDate;
    private LocalDateTime resignDate;
    private String reason;

    // Default constructor
    public Termination() {
    }

    // Parameterized constructor
    public Termination(int terminationId, int userId,
                       String terminationType,
                       LocalDateTime noticeDate,
                       LocalDateTime resignDate,
                       String reason) {

        this.terminationId = terminationId;
        this.userId = userId;
        this.terminationType = terminationType;
        this.noticeDate = noticeDate;
        this.resignDate = resignDate;
        this.reason = reason;
    }

    // Getters and Setters

    public int getTerminationId() {
        return terminationId;
    }

    public void setTerminationId(int terminationId) {
        this.terminationId = terminationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getTerminationType() {
        return terminationType;
    }

    public void setTerminationType(String terminationType) {
        this.terminationType = terminationType;
    }

    public LocalDateTime getNoticeDate() {
        return noticeDate;
    }

    public void setNoticeDate(LocalDateTime noticeDate) {
        this.noticeDate = noticeDate;
    }

    public LocalDateTime getResignDate() {
        return resignDate;
    }

    public void setResignDate(LocalDateTime resignDate) {
        this.resignDate = resignDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}

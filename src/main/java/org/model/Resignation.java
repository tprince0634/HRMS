package org.model;

import java.time.LocalDateTime;

public class Resignation {

    private int resignationId;
    private int userId;
    private int departmentId;
    private LocalDateTime noticeDate;
    private LocalDateTime resignDate;
    private String reason;

    // No-argument constructor
    public Resignation() {
    }

    // Parameterized constructor
    public Resignation(int resignationId, int userId, int departmentId,
                       LocalDateTime noticeDate, LocalDateTime resignDate,
                       String reason) {

        this.resignationId = resignationId;
        this.userId = userId;
        this.departmentId = departmentId;
        this.noticeDate = noticeDate;
        this.resignDate = resignDate;
        this.reason = reason;
    }

    // Getters and Setters

    public int getResignationId() {
        return resignationId;
    }

    public void setResignationId(int resignationId) {
        this.resignationId = resignationId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
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



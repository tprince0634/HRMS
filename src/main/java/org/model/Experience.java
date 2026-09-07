package org.model;

import java.time.LocalDateTime;

public class Experience {

    private int experienceId;
    private String designationName;
    private LocalDateTime fromDate;
    private LocalDateTime toDate;
    private int userId;
    private String companyName;

    // No-argument constructor
    public Experience() {
    }

    // Parameterized constructor
    public Experience(int experienceId, String designationName,
                      LocalDateTime fromDate, LocalDateTime toDate,
                      int userId, String companyName) {

        this.experienceId = experienceId;
        this.designationName = designationName;
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.userId = userId;
        this.companyName = companyName;
    }

    // Getters and Setters

    public int getExperienceId() {
        return experienceId;
    }

    public void setExperienceId(int experienceId) {
        this.experienceId = experienceId;
    }

    public String getDesignationName() {
        return designationName;
    }

    public void setDesignationName(String designationName) {
        this.designationName = designationName;
    }

    public LocalDateTime getFromDate() {
        return fromDate;
    }

    public void setFromDate(LocalDateTime fromDate) {
        this.fromDate = fromDate;
    }

    public LocalDateTime getToDate() {
        return toDate;
    }

    public void setToDate(LocalDateTime toDate) {
        this.toDate = toDate;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
}

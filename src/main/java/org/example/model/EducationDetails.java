package org.example.model;

import java.time.LocalDateTime;

public class EducationDetails {
    private int educationDetailsId;
    private String educationType;
    private String universityName;
    private int userId;
    private LocalDateTime startDate;
    private LocalDateTime endDate;


    public EducationDetails() {

    }

    public EducationDetails(int educationDetailsId, String educationType, String universityName, int userId, LocalDateTime startDate, LocalDateTime endDate) {
        this.educationDetailsId = educationDetailsId;
        this.educationType = educationType;
        this.universityName = universityName;
        this.userId = userId;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getEducationDetailsId() {
        return educationDetailsId;
    }

    public void setEducationDetailsId(int educationDetailsId) {
        this.educationDetailsId = educationDetailsId;
    }

    public String getEducationType() {
        return educationType;
    }

    public void setEducationType(String educationType) {
        this.educationType = educationType;
    }

    public String getUniversityName() {
        return universityName;
    }

    public void setUniversityName(String universityName) {
        this.universityName = universityName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDateTime getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDateTime startDate) {
        this.startDate = startDate;
    }

    public LocalDateTime getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDateTime endDate) {
        this.endDate = endDate;
    }
}

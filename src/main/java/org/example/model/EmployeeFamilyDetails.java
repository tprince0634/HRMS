package org.example.model;

import java.time.LocalDateTime;

public class EmployeeFamilyDetails {
    private int familyDetailId;
    private String name;
    private String relation;
    private LocalDateTime dateOfBirth;
    private String phone;
    private int userId;

    public EmployeeFamilyDetails() {
    }

    public EmployeeFamilyDetails(int familyDetailId, String name, String relation, LocalDateTime dateOfBirth, String phone, int userId) {
        this.familyDetailId = familyDetailId;
        this.name = name;
        this.relation = relation;
        this.dateOfBirth = dateOfBirth;
        this.phone = phone;
        this.userId = userId;
    }

    public int getFamilyDetailId() {
        return familyDetailId;
    }

    public void setFamilyDetailId(int familyDetailId) {
        this.familyDetailId = familyDetailId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public LocalDateTime getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDateTime dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}

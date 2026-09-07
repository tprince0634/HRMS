package org.example.model;

import java.time.LocalDateTime;

public class Designation {

    private int designationId;
    private int departmentId;
    private String name;
    private Integer noOfEmployee;
    private String status;
    private LocalDateTime createdAt;
    private String createdBy;
    private String modifiedBy;
    private LocalDateTime modifiedAt;

    public Designation() {
    }

    public Designation(int designationId, int departmentId, String name,
                       Integer noOfEmployee, String status,
                       LocalDateTime createdAt, String createdBy,
                       String modifiedBy, LocalDateTime modifiedAt) {
        this.designationId = designationId;
        this.departmentId = departmentId;
        this.name = name;
        this.noOfEmployee = noOfEmployee;
        this.status = status;
        this.createdAt = createdAt;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.modifiedAt = modifiedAt;
    }

    public int getDesignationId() {
        return designationId;
    }

    public void setDesignationId(int designationId) {
        this.designationId = designationId;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNoOfEmployee() {
        return noOfEmployee;
    }

    public void setNoOfEmployee(Integer noOfEmployee) {
        this.noOfEmployee = noOfEmployee;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public LocalDateTime getModifiedAt() {
        return modifiedAt;
    }

    public void setModifiedAt(LocalDateTime modifiedAt) {
        this.modifiedAt = modifiedAt;
    }
}

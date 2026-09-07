package org.example.model;

import java.time.LocalDateTime;

public class User {
    private int userId;
    private String firstName;
    private String lastName;
    private String email;
    private String passwordHash;
    private String phoneNumber;
    private int roleId;
    private Integer departmentId;
    private Integer designationtId;
    private LocalDateTime dateOfJoining;
    private LocalDateTime dateOfBirth;
    private String gender;
    private String address;
    private String aboutEmployee;
    private String profilePicture;
    private Integer roleId1;
    private String reportingManager;
    private LocalDateTime createdAt;
    private String createdBy;
    private String modifiedBy;
    private LocalDateTime modifiedAt;
    private String status;
    private String roleName;

    public User() {
    }

    public User(int userId, String firstName, String lastName, String email, String passwordHash, String phoneNumber, int roleId, Integer departmentId, Integer designationtId, LocalDateTime dateOfJoining, LocalDateTime dateOfBirth, String gender, String address, String aboutEmployee, String profilePicture, Integer roleId1, String reportingManager, LocalDateTime createdAt, String createdBy, String modifiedBy, LocalDateTime modifiedAt, String status) {
        this.userId = userId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.passwordHash = passwordHash;
        this.phoneNumber = phoneNumber;
        this.roleId = roleId;
        this.departmentId = departmentId;
        this.designationtId = designationtId;
        this.dateOfJoining = dateOfJoining;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.address = address;
        this.aboutEmployee = aboutEmployee;
        this.profilePicture = profilePicture;
        this.roleId1 = roleId1;
        this.reportingManager = reportingManager;
        this.createdAt = createdAt;
        this.createdBy = createdBy;
        this.modifiedBy = modifiedBy;
        this.modifiedAt = modifiedAt;
        this.status = status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswordHash() {
        return passwordHash;
    }

    public void setPasswordHash(String passwordHash) {
        this.passwordHash = passwordHash;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Integer getDesignationtId() {
        return designationtId;
    }

    public void setDesignationtId(Integer designationtId) {
        this.designationtId = designationtId;
    }

    public LocalDateTime getDateOfJoining() {
        return dateOfJoining;
    }

    public void setDateOfJoining(LocalDateTime dateOfJoining) {
        this.dateOfJoining = dateOfJoining;
    }

    public LocalDateTime getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDateTime dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAboutEmployee() {
        return aboutEmployee;
    }

    public void setAboutEmployee(String aboutEmployee) {
        this.aboutEmployee = aboutEmployee;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public Integer getRoleId1() {
        return roleId1;
    }

    public void setRoleId1(Integer roleId1) {
        this.roleId1 = roleId1;
    }

    public String getReportingManager() {
        return reportingManager;
    }

    public void setReportingManager(String reportingManager) {
        this.reportingManager = reportingManager;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}

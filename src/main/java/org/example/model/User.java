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

}

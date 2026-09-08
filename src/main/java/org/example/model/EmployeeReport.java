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
public class EmployeeReport {

    private int employeeId;

    private String firstName;
    private String lastName;

    private String email;
    private String phoneNumber;

    private int roleId;
    private String role;

    private Integer departmentId;
    private String department;

    private Integer designationId;
    private String designation;

    private LocalDateTime dateOfJoining;

    private String status;
}
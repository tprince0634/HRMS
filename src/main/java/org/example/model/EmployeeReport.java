package org.example.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;

@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class EmployeeReport {

    private int employeeId;

    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;

    private String role;
    private String department;
    private String designation;

    private LocalDate dateOfJoining;
    private String status;

}

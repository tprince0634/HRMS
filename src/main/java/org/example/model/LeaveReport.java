package org.example.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LeaveReport {

    private int leaveRequestId;

    private int employeeId;

    private String employeeName;

    private String department;

    private String designation;

    private int leaveTypeId;

    private String leaveType;

    private LocalDate startDate;

    private LocalDate endDate;

    private double numberOfDays;

    private String reason;

    private String approvedBy;

    private String status;

    private String statusHistory;
}
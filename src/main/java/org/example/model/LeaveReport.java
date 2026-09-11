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
public class LeaveReport {

    private int leaveRequestId;

    private int userId;

    private String firstName;
    private String lastName;
    private String email;

    private int leaveTypeId;
    private String leaveType;

    private LocalDateTime startDate;
    private LocalDateTime endDate;

    private int numberOfDays;

    private String reason;
    private String approvedBy;
    private String status;
    private String statusHistory;
}
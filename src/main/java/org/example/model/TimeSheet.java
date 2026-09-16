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
public class TimeSheet {

    private int timesheetId;
    private int userId;
    private LocalDateTime date;
    private int workHours;
    private String status;
    private String createdBy;
    private LocalDateTime createdAt;
    private String approvedBy;
    private LocalDateTime approvedAt;
    private int projectId;
    private String employeeName;
    private String teamName;

}

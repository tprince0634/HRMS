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
public class ProjectReport {

    private int projectId;

    private String projectName;

    private String clientName;

    private String description;

    private LocalDate startDate;

    private LocalDate endDate;

    private String priority;

    private double projectValue;

    private String priceType;

    private String status;

    private String managerName;

    private int totalTasks;

    private int completedTasks;

    private int pendingTasks;

    private int inProgressTasks;

    private int onHoldTasks;

    private int overdueTasks;
}
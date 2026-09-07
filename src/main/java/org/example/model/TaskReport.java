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
public class TaskReport {

    private int taskId;

    private int projectId;

    private String projectName;

    private String title;

    private String description;

    private String status;

    private String priority;

    private LocalDate deadline;

    private String assignedEmployee;

    private boolean overdue;
}
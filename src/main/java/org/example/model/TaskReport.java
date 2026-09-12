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
public class TaskReport {

    private int taskId;
    private int projectId;
    private String title;
    private String description;
    private String status;
    private String priority;
    private String filePath;
    private LocalDateTime deadline;
    private String projectName;
}
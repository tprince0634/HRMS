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
public class Training {
    private int trainingId;
    private int trainerId;
    private int trainingTypeId;
    private int userId;
    private double trainingCost;
    private String description;
    private String status;  // Active InActive
    private LocalDateTime startDate;
    private LocalDateTime endDate;
    private LocalDateTime createdAt;
    private String createdBy;// user name
    private String modifiedBy;// user name
    private LocalDateTime modifiedAt;

}

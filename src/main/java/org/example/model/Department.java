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
public class Department {
    private int departmentId;
    private String name;
    private Integer noOfEmployee;
    private String status;
    private LocalDateTime createdAt;
    private String createdBy;
    private String modifiedBy;
    private LocalDateTime modifiedAt;

}


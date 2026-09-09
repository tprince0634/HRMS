package org.example.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Experience {

    private int experienceId;
    private String designationName;
    private LocalDateTime fromDate;
    private LocalDateTime toDate;
    private int userId;
    private String companyName;
}

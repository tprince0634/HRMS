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
public class EducationDetails {
    private int educationDetailsId;
    private String educationType;
    private String universityName;
    private int userId;
    private LocalDateTime startDate;
    private LocalDateTime endDate;


}

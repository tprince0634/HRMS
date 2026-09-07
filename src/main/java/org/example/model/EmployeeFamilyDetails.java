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

public class EmployeeFamilyDetails {
    private int familyDetailId;
    private String name;
    private String relation;
    private LocalDateTime dateOfBirth;
    private String phone;
    private int userId;

}

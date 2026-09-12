package org.example.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceReport {

    private int attendanceId;

    private int userId;

    private String firstName;
    private String lastName;
    private String email;

    private LocalDate date;

    private LocalTime checkIn;
    private LocalTime checkOut;

    private LocalTime lunchIn;
    private LocalTime lunchOut;

    private String workingHours;
    private String productionHours;
    private String overtimeHours;
    private String breakHours;

    private String late;

    private String status;
}
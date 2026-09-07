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

    private int employeeId;

    private String employeeName;

    private String department;

    private String designation;

    private LocalDate date;

    private LocalTime checkIn;

    private LocalTime checkOut;

    private LocalTime lunchIn;

    private LocalTime lunchOut;

    private double workingHours;

    private double productionHours;

    private double overtimeHours;

    private double breakHours;

    private boolean late;

    private String status;
}
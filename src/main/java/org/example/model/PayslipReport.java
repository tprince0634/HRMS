package org.example.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PayslipReport {

    private int payslipId;

    private int employeeId;

    private String employeeName;

    private String department;

    private String designation;

    private String month;

    private int year;

    private double totalSalary;

    private double earnings;

    private double deductions;

    private double netPay;

    private String payslipPath;

    private String generatedOn;
}
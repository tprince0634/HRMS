package org.example.model;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class EmployeeBankDetails {
    private int bankDetailId;
    private String bankName;
    private String accountNumber;
    private String ifscCode;
    private String branchName;
    private int userId;

}

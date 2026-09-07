package org.example.model;

public class EmployeeBankDetails {
    private int bankDetailId;
    private String bankName;
    private String accountNumber;
    private String ifscCode;
    private String branchName;
    private int userId;

    public EmployeeBankDetails() {
    }

    public int getBankDetailId() {
        return bankDetailId;
    }

    public void setBankDetailId(int bankDetailId) {
        this.bankDetailId = bankDetailId;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getIfscCode() {
        return ifscCode;
    }

    public void setIfscCode(String ifscCode) {
        this.ifscCode = ifscCode;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}

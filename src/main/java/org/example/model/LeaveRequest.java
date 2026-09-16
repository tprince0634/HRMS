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
public class LeaveRequest {

        private Integer leaveRequestId;
        private Integer userId;
        private Integer leaveTypeId;
        private LocalDateTime startDate;
        private LocalDateTime endDate;
        private Integer numberOfDays;
        private String reason;
        private String approvedBy;
        private String status;
        private String statusHistory;


}

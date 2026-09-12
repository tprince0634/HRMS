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
public class Resignation {

    private int resignationId;
    private int userId;
    private int departmentId;
    private LocalDateTime noticeDate;
    private LocalDateTime resignDate;
    private String reason;
}

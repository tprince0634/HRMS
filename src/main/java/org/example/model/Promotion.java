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
public class Promotion {

    private int promotionId;
    private int userId;
    private String designationFrom;
    private String designationTo;
    private LocalDateTime date;
}

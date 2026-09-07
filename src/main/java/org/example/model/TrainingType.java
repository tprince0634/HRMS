package org.example.model;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TrainingType {

    private int trainingTypeId;
    private String trainingTypeName;
    private String description;
    private String status; //Active InActive

}

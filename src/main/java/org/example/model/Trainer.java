package org.example.model;

import jdk.jfr.DataAmount;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Trainer {
    private int trainerId;
    private String firstName;
    private String lastName;
    private String role;
    private String email;
    private String description;
    private Long phone;
    private String profilePicture; // store path for image file

}

package org.example.interfaces;

import org.example.model.Experience;

import java.util.List;

public interface ExperienceDAO {

    boolean addExperience(Experience experience);

    Experience getExperienceById(int experienceId);

    List<Experience> getAllExperiences();

    boolean updateExperience(Experience experience);

    boolean deleteExperience(int experienceId);
}
package org.example.service;

import org.example.dao.ExperienceDAOImpl;
import org.example.interfaces.ExperienceDAO;
import org.example.model.Experience;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ExperienceServiceImpl {

    private final ExperienceDAO experienceDAO;


    // ============================================================
    // CONSTRUCTOR
    // ============================================================

    public ExperienceServiceImpl() {
        this.experienceDAO = new ExperienceDAOImpl();
    }

    public ExperienceServiceImpl(ExperienceDAO experienceDAO) {
        this.experienceDAO = experienceDAO;
    }


    // ============================================================
    // ADD EXPERIENCE
    // ============================================================

    public boolean addExperience(Experience experience) {

        // -------------------------
        // NULL CHECK
        // -------------------------

        if (experience == null) {
            throw new IllegalArgumentException(
                    "Experience details are required."
            );
        }


        // -------------------------
        // USER VALIDATION
        // -------------------------

        if (experience.getUserId() <= 0) {
            throw new IllegalArgumentException(
                    "Invalid employee."
            );
        }


        // -------------------------
        // COMPANY VALIDATION
        // -------------------------

        String companyName =
                clean(experience.getCompanyName());

        if (companyName.isEmpty()) {
            throw new IllegalArgumentException(
                    "Company name is required."
            );
        }

        // DB column = VARCHAR(100)
        if (companyName.length() > 100) {
            throw new IllegalArgumentException(
                    "Company name cannot exceed 100 characters."
            );
        }


        // -------------------------
        // DESIGNATION VALIDATION
        // -------------------------

        String designation =
                clean(experience.getDesignationName());

        if (designation.isEmpty()) {
            throw new IllegalArgumentException(
                    "Designation is required."
            );
        }

        if (designation.length() > 150) {
            throw new IllegalArgumentException(
                    "Designation cannot exceed 150 characters."
            );
        }


        // -------------------------
        // FROM DATE
        // -------------------------

        LocalDateTime fromDate =
                experience.getFromDate();

        if (fromDate == null) {
            throw new IllegalArgumentException(
                    "From date is required."
            );
        }


        // -------------------------
        // TO DATE
        // -------------------------

        LocalDateTime toDate =
                experience.getToDate();

        if (toDate == null) {
            throw new IllegalArgumentException(
                    "To date is required."
            );
        }

        if (toDate.isBefore(fromDate)) {
            throw new IllegalArgumentException(
                    "To date cannot be before From date."
            );
        }


        // -------------------------
        // FUTURE DATE VALIDATION
        // -------------------------

        if (fromDate.isAfter(LocalDateTime.now())) {
            throw new IllegalArgumentException(
                    "From date cannot be in the future."
            );
        }


        // -------------------------
        // CLEAN DATA
        // -------------------------

        experience.setCompanyName(companyName);

        experience.setDesignationName(designation);


        // -------------------------
        // OVERLAP CHECK
        // -------------------------

        if (hasOverlappingExperience(
                experience.getUserId(),
                fromDate,
                toDate,
                0
        )) {

            throw new IllegalArgumentException(
                    "This employee already has an experience record for this period."
            );
        }


        // -------------------------
        // SAVE
        // -------------------------

        return experienceDAO.addExperience(
                experience
        );
    }


    // ============================================================
    // GET ALL EXPERIENCES
    // ============================================================

    public List<Experience> getAllExperiences() {

        return experienceDAO.getAllExperiences();
    }


    // ============================================================
    // GET EXPERIENCE BY ID
    // ============================================================

    public Experience getExperienceById(
            int experienceId) {

        if (experienceId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid experience ID."
            );
        }

        Experience experience =
                experienceDAO.getExperienceById(
                        experienceId
                );

        if (experience == null) {
            throw new IllegalArgumentException(
                    "Experience record not found."
            );
        }

        return experience;
    }


    // ============================================================
    // GET EXPERIENCE BY USER ID
    // ============================================================

    public List<Experience> getExperiencesByUserId(
            int userId) {

        if (userId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid employee ID."
            );
        }

        List<Experience> allExperiences =
                experienceDAO.getAllExperiences();

        List<Experience> userExperiences =
                new ArrayList<>();

        for (Experience experience : allExperiences) {

            if (experience.getUserId() == userId) {

                userExperiences.add(experience);
            }
        }

        return userExperiences;
    }


    // ============================================================
    // UPDATE EXPERIENCE
    // ============================================================

    public boolean updateExperience(
            Experience experience) {

        // -------------------------
        // NULL CHECK
        // -------------------------

        if (experience == null) {
            throw new IllegalArgumentException(
                    "Experience details are required."
            );
        }


        // -------------------------
        // EXPERIENCE ID
        // -------------------------

        if (experience.getExperienceId() <= 0) {
            throw new IllegalArgumentException(
                    "Invalid experience ID."
            );
        }


        // -------------------------
        // CHECK EXISTING RECORD
        // -------------------------

        Experience existing =
                experienceDAO.getExperienceById(
                        experience.getExperienceId()
                );

        if (existing == null) {
            throw new IllegalArgumentException(
                    "Experience record not found."
            );
        }


        // -------------------------
        // USER VALIDATION
        // -------------------------

        if (experience.getUserId() <= 0) {
            throw new IllegalArgumentException(
                    "Invalid employee."
            );
        }


        // -------------------------
        // COMPANY VALIDATION
        // -------------------------

        String companyName =
                clean(experience.getCompanyName());

        if (companyName.isEmpty()) {
            throw new IllegalArgumentException(
                    "Company name is required."
            );
        }

        // DB = VARCHAR(100)
        if (companyName.length() > 100) {
            throw new IllegalArgumentException(
                    "Company name cannot exceed 100 characters."
            );
        }


        // -------------------------
        // DESIGNATION VALIDATION
        // -------------------------

        String designation =
                clean(experience.getDesignationName());

        if (designation.isEmpty()) {
            throw new IllegalArgumentException(
                    "Designation is required."
            );
        }

        if (designation.length() > 150) {
            throw new IllegalArgumentException(
                    "Designation cannot exceed 150 characters."
            );
        }


        // -------------------------
        // FROM DATE
        // -------------------------

        LocalDateTime fromDate =
                experience.getFromDate();

        if (fromDate == null) {
            throw new IllegalArgumentException(
                    "From date is required."
            );
        }


        // -------------------------
        // TO DATE
        // -------------------------

        LocalDateTime toDate =
                experience.getToDate();

        if (toDate == null) {
            throw new IllegalArgumentException(
                    "To date is required."
            );
        }

        if (toDate.isBefore(fromDate)) {
            throw new IllegalArgumentException(
                    "To date cannot be before From date."
            );
        }


        // -------------------------
        // FUTURE DATE
        // -------------------------

        if (fromDate.isAfter(LocalDateTime.now())) {
            throw new IllegalArgumentException(
                    "From date cannot be in the future."
            );
        }


        // -------------------------
        // CLEAN DATA
        // -------------------------

        experience.setCompanyName(companyName);

        experience.setDesignationName(designation);


        // -------------------------
        // OVERLAP CHECK
        // -------------------------

        if (hasOverlappingExperience(
                experience.getUserId(),
                fromDate,
                toDate,
                experience.getExperienceId()
        )) {

            throw new IllegalArgumentException(
                    "This employee already has another experience record for this period."
            );
        }


        // -------------------------
        // UPDATE
        // -------------------------

        return experienceDAO.updateExperience(
                experience
        );
    }


    // ============================================================
    // DELETE EXPERIENCE
    // ============================================================

    public boolean deleteExperience(
            int experienceId) {

        if (experienceId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid experience ID."
            );
        }


        // -------------------------
        // CHECK EXISTENCE
        // -------------------------

        Experience existing =
                experienceDAO.getExperienceById(
                        experienceId
                );

        if (existing == null) {
            throw new IllegalArgumentException(
                    "Experience record not found."
            );
        }


        // -------------------------
        // DELETE
        // -------------------------

        return experienceDAO.deleteExperience(
                experienceId
        );
    }


    // ============================================================
    // OVERLAP BUSINESS LOGIC
    // ============================================================
    //
    // DAO मध्ये hasOverlappingExperience() नाही.
    // म्हणून getAllExperiences() वापरून Service layer मध्ये
    // overlap check केला आहे.
    //
    // Existing:
    //      FromDate <= New ToDate
    //      AND
    //      ToDate >= New FromDate
    //
    // ============================================================

    private boolean hasOverlappingExperience(
            int userId,
            LocalDateTime newFromDate,
            LocalDateTime newToDate,
            int excludeExperienceId) {

        List<Experience> experiences =
                experienceDAO.getAllExperiences();

        for (Experience existing : experiences) {

            // Different employee
            if (existing.getUserId() != userId) {
                continue;
            }

            // Ignore same record during UPDATE
            if (existing.getExperienceId()
                    == excludeExperienceId) {

                continue;
            }

            LocalDateTime existingFrom =
                    existing.getFromDate();

            LocalDateTime existingTo =
                    existing.getToDate();

            if (existingFrom == null ||
                    existingTo == null) {

                continue;
            }


            // ====================================================
            // OVERLAP CONDITION
            // ====================================================

            boolean overlap =
                    !existingFrom.isAfter(newToDate)
                            &&
                            !existingTo.isBefore(newFromDate);


            if (overlap) {
                return true;
            }
        }

        return false;
    }


    // ============================================================
    // CLEAN STRING
    // ============================================================

    private String clean(String value) {

        if (value == null) {
            return "";
        }

        return value.trim();
    }
}
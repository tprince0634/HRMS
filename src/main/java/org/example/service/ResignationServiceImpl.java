package org.example.service;


import org.example.dao.ResignationDAOImpl;
import org.example.interfaces.ResignationDAO;
import org.example.model.Resignation;

import java.time.LocalDateTime;
import java.util.List;

public class ResignationServiceImpl implements ResignationDAO {

    private final ResignationDAO resignationDAO;

    public ResignationServiceImpl() {
        this.resignationDAO = new ResignationDAOImpl();
    }

    @Override
    public boolean addResignation(Resignation resignation) {

        // 1. Null check
        if (resignation == null) {
            throw new IllegalArgumentException("Resignation cannot be null");
        }

        // 2. User validation
        if (resignation.getUserId() <= 0) {
            throw new IllegalArgumentException("Invalid user ID");
        }

        // 3. Department validation
        if (resignation.getDepartmentId() <= 0) {
            throw new IllegalArgumentException("Invalid department ID");
        }

        // 4. Notice date validation
        if (resignation.getNoticeDate() == null) {
            throw new IllegalArgumentException("Notice date is required");
        }

        // 5. Resignation date validation
        if (resignation.getResignDate() == null) {
            throw new IllegalArgumentException("Resignation date is required");
        }

        // 6. Notice date should not be after resignation date
        if (resignation.getNoticeDate()
                .isAfter(resignation.getResignDate())) {

            throw new IllegalArgumentException(
                    "Notice date cannot be after resignation date"
            );
        }

        // 7. Reason validation
        if (resignation.getReason() == null ||
                resignation.getReason().trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Resignation reason is required"
            );
        }

        // 8. Reason length validation
        if (resignation.getReason().trim().length() < 5) {
            throw new IllegalArgumentException(
                    "Resignation reason must contain at least 5 characters"
            );
        }

        // 9. Call DAO only after validation
        return resignationDAO.addResignation(resignation);
    }


    @Override
    public Resignation getResignationById(int resignationId) {

        if (resignationId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid resignation ID"
            );
        }

        Resignation resignation =
                resignationDAO.getResignationById(resignationId);

        if (resignation == null) {
            throw new IllegalArgumentException(
                    "Resignation not found with ID: " + resignationId
            );
        }

        return resignation;
    }


    @Override
    public List<Resignation> getAllResignations() {

        List<Resignation> resignations =
                resignationDAO.getAllResignations();

        return resignations;
    }


    @Override
    public boolean updateResignation(Resignation resignation) {

        // 1. Null check
        if (resignation == null) {
            throw new IllegalArgumentException(
                    "Resignation cannot be null"
            );
        }

        // 2. Resignation ID validation
        if (resignation.getResignationId() <= 0) {
            throw new IllegalArgumentException(
                    "Invalid resignation ID"
            );
        }

        // 3. User validation
        if (resignation.getUserId() <= 0) {
            throw new IllegalArgumentException(
                    "Invalid user ID"
            );
        }

        // 4. Department validation
        if (resignation.getDepartmentId() <= 0) {
            throw new IllegalArgumentException(
                    "Invalid department ID"
            );
        }

        // 5. Notice date validation
        if (resignation.getNoticeDate() == null) {
            throw new IllegalArgumentException(
                    "Notice date is required"
            );
        }

        // 6. Resignation date validation
        if (resignation.getResignDate() == null) {
            throw new IllegalArgumentException(
                    "Resignation date is required"
            );
        }

        // 7. Date business rule
        if (resignation.getNoticeDate()
                .isAfter(resignation.getResignDate())) {

            throw new IllegalArgumentException(
                    "Notice date cannot be after resignation date"
            );
        }

        // 8. Reason validation
        if (resignation.getReason() == null ||
                resignation.getReason().trim().isEmpty()) {

            throw new IllegalArgumentException(
                    "Resignation reason is required"
            );
        }

        if (resignation.getReason().trim().length() < 5) {
            throw new IllegalArgumentException(
                    "Resignation reason must contain at least 5 characters"
            );
        }

        // 9. Check whether resignation exists
        Resignation existing =
                resignationDAO.getResignationById(
                        resignation.getResignationId()
                );

        if (existing == null) {
            throw new IllegalArgumentException(
                    "Cannot update. Resignation not found with ID: "
                            + resignation.getResignationId()
            );
        }

        // 10. Call DAO
        return resignationDAO.updateResignation(resignation);
    }


    @Override
    public boolean deleteResignation(int resignationId) {

        // 1. ID validation
        if (resignationId <= 0) {
            throw new IllegalArgumentException(
                    "Invalid resignation ID"
            );
        }

        // 2. Check whether record exists
        Resignation existing =
                resignationDAO.getResignationById(resignationId);

        if (existing == null) {
            throw new IllegalArgumentException(
                    "Cannot delete. Resignation not found with ID: "
                            + resignationId
            );
        }

        // 3. Delete from database
        return resignationDAO.deleteResignation(resignationId);
    }
}

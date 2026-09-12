package org.example.service;

import org.example.dao.TrainingTypeDaoImpl;
import org.example.interfaces.TrainingTypeDao;
import org.example.model.TrainingType;

import java.util.List;

public class TrainingTypeService {

    private final TrainingTypeDao trainingTypeDao;

    public TrainingTypeService() {
        this.trainingTypeDao = new TrainingTypeDaoImpl();
    }

    // =========================================================
    // ADD TRAINING TYPE
    // =========================================================

    public TrainingType addTrainingType(TrainingType trainingType) {

        if (trainingType == null) {
            throw new IllegalArgumentException(
                    "Training type data cannot be null"
            );
        }

        return trainingTypeDao.addTrainingType(trainingType);
    }

    // =========================================================
    // UPDATE TRAINING TYPE
    // =========================================================

    public TrainingType updateTrainingType(
            int id,
            TrainingType trainingType) {

        if (id <= 0) {
            throw new IllegalArgumentException(
                    "Invalid training type ID"
            );
        }

        if (trainingType == null) {
            throw new IllegalArgumentException(
                    "Training type data cannot be null"
            );
        }

        return trainingTypeDao.updateTrainingType(
                id,
                trainingType
        );
    }

    // =========================================================
    // FIND TRAINING TYPE BY ID
    // =========================================================

    public TrainingType findTrainingTypeById(int id) {

        if (id <= 0) {
            throw new IllegalArgumentException(
                    "Invalid training type ID"
            );
        }

        return trainingTypeDao.findTrainingTypeById(id);
    }

    // =========================================================
    // GET ALL TRAINING TYPES
    // =========================================================

    public List<TrainingType> getAllTrainingTypes() {

        return trainingTypeDao.getAllTrainingTypes();
    }

    // =========================================================
    // FIND TRAINING TYPE BY NAME
    // =========================================================

    public TrainingType findTrainingTypeByName(String name) {

        if (name == null || name.isBlank()) {
            throw new IllegalArgumentException(
                    "Training type name cannot be empty"
            );
        }

        return trainingTypeDao.findTrainingTypeByName(name);
    }

    // =========================================================
    // GET TRAINING TYPES BY NAME
    // =========================================================

    public List<TrainingType> getAllTrainingTypesByName(
            String name) {

        if (name == null || name.isBlank()) {
            throw new IllegalArgumentException(
                    "Training type name cannot be empty"
            );
        }

        return trainingTypeDao.getAllTrainingTypesByName(name);
    }

    // =========================================================
    // GET TRAINING TYPES BY PAGE
    // =========================================================

    public List<TrainingType> getTrainingTypesByPage(
            int page,
            int pageSize,
            String sortDirection) {

        if (page <= 0) {
            throw new IllegalArgumentException(
                    "Invalid page number"
            );
        }

        if (pageSize <= 0) {
            throw new IllegalArgumentException(
                    "Invalid page size"
            );
        }

        return trainingTypeDao.getTrainingTypesByPage(
                page,
                pageSize,
                sortDirection
        );
    }

    // =========================================================
    // GET TRAINING TYPES BY TIME
    // =========================================================

    public List<TrainingType> getTrainingTypesByTime(
            int page,
            int pageSize,
            String period) {

        if (page <= 0) {
            throw new IllegalArgumentException(
                    "Invalid page number"
            );
        }

        if (pageSize <= 0) {
            throw new IllegalArgumentException(
                    "Invalid page size"
            );
        }

        if (period == null || period.isBlank()) {
            throw new IllegalArgumentException(
                    "Period cannot be empty"
            );
        }

        return trainingTypeDao.getTrainingTypesByTime(
                page,
                pageSize,
                period
        );
    }

    // =========================================================
    // CHANGE TRAINING TYPE STATUS
    // =========================================================

    public TrainingType changeTrainingTypeStatus(
            int id,
            String status) {

        if (id <= 0) {
            throw new IllegalArgumentException(
                    "Invalid training type ID"
            );
        }

        if (status == null || status.isBlank()) {
            throw new IllegalArgumentException(
                    "Status cannot be empty"
            );
        }

        return trainingTypeDao.changeTrainingTypeStatus(
                id,
                status
        );
    }

    // =========================================================
    // DELETE TRAINING TYPE
    // =========================================================

    public void deleteTrainingTypeById(int id) {

        if (id <= 0) {
            throw new IllegalArgumentException(
                    "Invalid training type ID"
            );
        }

        trainingTypeDao.deleteTrainingTypeById(id);
    }
}
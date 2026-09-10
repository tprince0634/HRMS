package org.example.service;

import org.example.dao.TrainingDaoImpl;
import org.example.interfaces.TrainingDao;
import org.example.model.Training;

import java.util.List;

public class TrainingService {

    private final TrainingDao trainingDao;

    public TrainingService() {
        this.trainingDao = new TrainingDaoImpl();
    }

    // =========================================================
    // CREATE TRAINING
    // =========================================================

    public Training createTraining(Training training) {

        if (training == null) {
            throw new IllegalArgumentException("Training data cannot be null");
        }

        return trainingDao.createTraining(training);
    }

    // =========================================================
    // GET ALL TRAININGS
    // =========================================================

    public List<Training> getAllTrainings() {

        return trainingDao.getAllTrainings();
    }

    // =========================================================
    // FIND TRAINING BY ID
    // =========================================================

    public Training findTrainingById(int id) {

        if (id <= 0) {
            throw new IllegalArgumentException("Invalid training ID");
        }

        return trainingDao.findTrainingById(id);
    }

    // =========================================================
    // UPDATE TRAINING
    // =========================================================

    public Training updateTraining(int id, Training training) {

        if (id <= 0) {
            throw new IllegalArgumentException("Invalid training ID");
        }

        if (training == null) {
            throw new IllegalArgumentException("Training data cannot be null");
        }

        return trainingDao.updateTraining(id, training);
    }

    // =========================================================
    // DELETE TRAINING
    // =========================================================

    public void deleteTrainingById(int id) {

        if (id <= 0) {
            throw new IllegalArgumentException("Invalid training ID");
        }

        trainingDao.deleteTrainingById(id);
    }

    // =========================================================
    // FIND TRAININGS BY TRAINER ID
    // =========================================================

    public List<Training> findByTrainerId(int trainerId) {

        if (trainerId <= 0) {
            throw new IllegalArgumentException("Invalid trainer ID");
        }

        return trainingDao.findByTrainerId(trainerId);
    }

    // =========================================================
    // GET TRAININGS BY USER ID
    // =========================================================

    public List<Training> getTrainingsByUserId(int userId) {

        if (userId <= 0) {
            throw new IllegalArgumentException("Invalid user ID");
        }

        return trainingDao.getTrainingsByUserId(userId);
    }

    // =========================================================
    // GET TRAININGS BY PAGE
    // =========================================================

    public List<Training> getTrainingsByPage(
            int page,
            int pageSize,
            String sortDirection) {

        if (page <= 0) {
            throw new IllegalArgumentException("Invalid page number");
        }

        if (pageSize <= 0) {
            throw new IllegalArgumentException("Invalid page size");
        }

        return trainingDao.getTrainingsByPage(
                page,
                pageSize,
                sortDirection
        );
    }

    // =========================================================
    // GET TRAININGS BY TIME PERIOD
    // =========================================================

    public List<Training> getTrainingsByTime(
            int page,
            int pageSize,
            String period) {

        if (page <= 0) {
            throw new IllegalArgumentException("Invalid page number");
        }

        if (pageSize <= 0) {
            throw new IllegalArgumentException("Invalid page size");
        }

        if (period == null || period.isBlank()) {
            throw new IllegalArgumentException("Period cannot be empty");
        }

        return trainingDao.getTrainingsByTime(
                page,
                pageSize,
                period
        );
    }

    // =========================================================
    // CHANGE TRAINING STATUS
    // =========================================================

    public Training changeTrainingStatus(
            int id,
            String status) {

        if (id <= 0) {
            throw new IllegalArgumentException("Invalid training ID");
        }

        if (status == null || status.isBlank()) {
            throw new IllegalArgumentException("Status cannot be empty");
        }

        return trainingDao.changeTrainingStatus(id, status);
    }
}
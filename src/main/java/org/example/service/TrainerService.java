package org.example.service;

import org.example.dao.TrainerDaoImpl;
import org.example.interfaces.TrainerDao;
import org.example.model.Trainer;

import java.util.List;

public class TrainerService {

    private final TrainerDao trainerDao;

    public TrainerService() {
        this.trainerDao = new TrainerDaoImpl();
    }

    // =========================================================
    // ADD TRAINER
    // =========================================================

    public Trainer addTrainer(Trainer trainer) {

        if (trainer == null) {
            throw new IllegalArgumentException("Trainer data cannot be null");
        }

        return trainerDao.addTrainer(trainer);
    }

    // =========================================================
    // UPDATE TRAINER
    // =========================================================

    public Trainer updateTrainer(int id, Trainer trainer) {

        if (id <= 0) {
            throw new IllegalArgumentException("Invalid trainer ID");
        }

        if (trainer == null) {
            throw new IllegalArgumentException("Trainer data cannot be null");
        }

        return trainerDao.updateTrainer(id, trainer);
    }

    // =========================================================
    // GET TRAINER BY ID
    // =========================================================

    public Trainer getTrainerById(int trainerId) {

        if (trainerId <= 0) {
            throw new IllegalArgumentException("Invalid trainer ID");
        }

        return trainerDao.getTrainerById(trainerId);
    }

    // =========================================================
    // GET ALL TRAINERS
    // =========================================================

    public List<Trainer> getAllTrainers() {

        return trainerDao.getAllTrainers();
    }

    // =========================================================
    // GET TRAINERS BY PAGE
    // =========================================================

    public List<Trainer> getTrainersByPage(
            int pageNo,
            int pageSize,
            String sortDirection) {

        if (pageNo <= 0) {
            throw new IllegalArgumentException("Invalid page number");
        }

        if (pageSize <= 0) {
            throw new IllegalArgumentException("Invalid page size");
        }

        return trainerDao.getUsersByPage(
                pageNo,
                pageSize,
                sortDirection
        );
    }

    // =========================================================
    // SEARCH TRAINER
    // =========================================================

    public List<Trainer> searchTrainerByNameOrEmail(
            String name,
            String email) {

        return trainerDao.searchTrainerByNameOrEmail(
                name,
                email
        );
    }

    // =========================================================
    // DELETE TRAINER
    // =========================================================

    public void deleteTrainerById(int trainerId) {

        if (trainerId <= 0) {
            throw new IllegalArgumentException("Invalid trainer ID");
        }

        trainerDao.deleteTrainerById(trainerId);
    }
}
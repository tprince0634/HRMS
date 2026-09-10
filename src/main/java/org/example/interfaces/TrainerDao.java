package org.example.interfaces;

import org.example.model.Trainer;

import java.util.List;

public interface TrainerDao {

    Trainer  addTrainer(Trainer trainer);
    Trainer  updateTrainer(int id ,Trainer trainer);
    Trainer getTrainerById(int trainerId);
    List<Trainer> getAllTrainers();
    List<Trainer> getUsersByPage(int pageNo,int pageSize, String sortDirection);
    List<Trainer> searchTrainerByNameOrEmail(String name, String email);
    void deleteTrainerById(int trainerId);
}

package org.example.interfaces;

import org.example.model.Training;

import java.util.List;

public interface TrainingDao {
    Training  createTraining(Training training);
    List<Training> getAllTrainings();
    Training findTrainingById(int id);
    Training updateTraining(int id,Training training);
    void deleteTrainingById(int id);
    List<Training> findByTrainerId(int trainerId);
    List<Training> getTrainingsByUserId(int userId);
    List<Training> getTrainingsByPage(int page, int pageSize,String sortDirection);
    List<Training> getTrainingsByTime(int Page , int PageSize, String period);
    Training changeTrainingStatus(int id, String status);

}

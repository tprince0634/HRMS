package org.example.interfaces;


import org.example.model.TrainingType;

import java.util.List;

public interface TrainingTypeDao {

    TrainingType addTrainingType(TrainingType trainingType);
    TrainingType updateTrainingType(int id,TrainingType trainingType);
    TrainingType findTrainingTypeById(int id);
    List<TrainingType> getAllTrainingTypes();
    TrainingType findTrainingTypeByName(String name);
    List<TrainingType> getAllTrainingTypesByName(String name);
    List<TrainingType> getTrainingTypesByPage(int page, int pageSize, String sortDirection);
    List<TrainingType> getTrainingTypesByTime(int Page , int PageSize, String period);
    TrainingType changeTrainingTypeStatus(int id, String status);
    void deleteTrainingTypeById(int id);
}

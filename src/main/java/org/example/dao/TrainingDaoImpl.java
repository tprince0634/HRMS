package org.example.dao;

import org.example.interfaces.TrainingDao;
import org.example.model.Training;
import org.example.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainingDaoImpl implements TrainingDao {
    @Override
    public Training createTraining(Training training) {
        String sql = "call create_training(?,?,?,?,?,?,?,?,?,?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, training.getTrainerId());
            callableStatement.setInt(2, training.getTrainingTypeId());
            callableStatement.setInt(3, training.getUserId());
            callableStatement.setDouble(4, training.getTrainingCost());
            callableStatement.setString(5, training.getDescription());
            callableStatement.setString(6, training.getStatus());
            callableStatement.setTimestamp(7, Timestamp.valueOf(training.getStartDate()));
            callableStatement.setTimestamp(8, Timestamp.valueOf(training.getEndDate()));
            callableStatement.setTimestamp(9, Timestamp.valueOf(training.getCreatedAt()));
            callableStatement.setString(10, training.getCreatedBy());

            try (ResultSet resultSet = callableStatement.executeQuery()) {
                return resultSet.next() ? map(resultSet) : null;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Training> getAllTrainings() {
        String sql = "call get_all_trainings()";

        List<Training> trainings = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql);
             ResultSet resultSet = callableStatement.executeQuery()) {

            while (resultSet.next()) {
                trainings.add(map(resultSet));
            }

            return trainings;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Training findTrainingById(int id) {
        String sql = "call find_training_by_id(?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, id);

            try (ResultSet resultSet = callableStatement.executeQuery()) {
                return resultSet.next() ? map(resultSet) : null;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Training updateTraining(int id, Training training) {
        String sql = "call update_training(?,?,?,?,?,?,?,?,?,?,?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, id);
            callableStatement.setInt(2, training.getTrainerId());
            callableStatement.setInt(3, training.getTrainingTypeId());
            callableStatement.setInt(4, training.getUserId());
            callableStatement.setDouble(5, training.getTrainingCost());
            callableStatement.setString(6, training.getDescription());
            callableStatement.setString(7, training.getStatus());
            callableStatement.setTimestamp(8, Timestamp.valueOf(training.getStartDate()));
            callableStatement.setTimestamp(9, Timestamp.valueOf(training.getEndDate()));
            callableStatement.setString(10, training.getModifiedBy());
            callableStatement.setTimestamp(11, Timestamp.valueOf(training.getModifiedAt()));

            try (ResultSet resultSet = callableStatement.executeQuery()) {
                return resultSet.next() ? map(resultSet) : null;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteTrainingById(int id) {
        String sql = "call delete_training_by_id(?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, id);

            callableStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Training> findByTrainerId(int trainerId) {
        String sql = "call find_trainings_by_trainer_id(?)";

        List<Training> trainings = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, trainerId);

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                while (resultSet.next()) {
                    trainings.add(map(resultSet));
                }

                return trainings;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Training> getTrainingsByUserId(int userId) {
        String sql = "call get_trainings_by_user_id(?)";
        List<Training> trainings = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, userId);

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                while (resultSet.next()) {
                    trainings.add(map(resultSet));
                }

                return trainings;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Training> getTrainingsByPage(int page, int pageSize, String sortDirection) {
        String sql = "call get_trainings_by_page(?,?,?)";

        List<Training> trainings = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, page);
            callableStatement.setInt(2, pageSize);
            callableStatement.setString(3, sortDirection);

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                while (resultSet.next()) {
                    trainings.add(map(resultSet));
                }

                return trainings;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Training> getTrainingsByTime(int Page, int PageSize, String period) {
        String sql = "call get_trainings_by_time(?,?,?)";

        List<Training> trainings = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, Page);
            callableStatement.setInt(2, PageSize);
            callableStatement.setString(3, period);

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                while (resultSet.next()) {
                    trainings.add(map(resultSet));
                }

                return trainings;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Training changeTrainingStatus(int id, String status) {
        String sql = "call change_training_status(?,?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, id);
            callableStatement.setString(2, status);

            try (ResultSet resultSet = callableStatement.executeQuery()) {
                return resultSet.next() ? map(resultSet) : null;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private Training map(ResultSet rs) throws SQLException {

        return Training.builder()
                .trainingId(rs.getInt("TrainingId"))
                .trainerId(rs.getInt("TrainerId"))
                .trainingTypeId(rs.getInt("TrainingTypeId"))
                .userId(rs.getInt("UserId"))
                .trainingCost(rs.getDouble("TrainingCost"))
                .description(rs.getString("Description"))
                .status(rs.getString("Status"))
                .startDate(
                        rs.getTimestamp("StartDate")
                                .toLocalDateTime()
                )
                .endDate(
                        rs.getTimestamp("EndDate")
                                .toLocalDateTime()
                )
                .createdAt(
                        rs.getTimestamp("CreatedAt") != null                   // use ternary operator to check is it null
                                                                                         // because it can give null pointer exception
                                ? rs.getTimestamp("CreatedAt").toLocalDateTime()
                                : null
                )
                .createdBy(rs.getString("CreatedBy"))
                .modifiedBy(rs.getString("ModifiedBy"))
                .modifiedAt(
                        rs.getTimestamp("ModifiedAt") != null
                                ? rs.getTimestamp("ModifiedAt").toLocalDateTime()
                                : null
                )
                .build();
    }
}

package org.example.dao;

import org.example.interfaces.TrainerDao;
import org.example.model.Trainer;
import org.example.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainerDaoImpl  implements TrainerDao {

    @Override
    public Trainer addTrainer(Trainer trainer) {

        String sql = "CALL add_trainer(?,?,?,?,?,?,?,?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setString(1, trainer.getFirstName());
            callableStatement.setString(2, trainer.getLastName());
            callableStatement.setString(3, trainer.getRole());
            callableStatement.setString(4, trainer.getEmail());
            callableStatement.setString(5, trainer.getDescription());
            callableStatement.setString(6, "Active");

            if (trainer.getPhone() != null) {
                callableStatement.setLong(7, trainer.getPhone());
            } else {
                callableStatement.setNull(7, Types.BIGINT);
            }

            callableStatement.setString(8, trainer.getProfilePicture());

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                if (resultSet.next()) {
                    return map(resultSet);
                }

                return null;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error while adding trainer", e);
        }
    }
    @Override
    public Trainer updateTrainer( int id ,Trainer trainer) {
        String sql = "call update_trainer(?,?,?,?,?,?,?,?,?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, id);
            callableStatement.setString(2, trainer.getFirstName());
            callableStatement.setString(3, trainer.getLastName());
            callableStatement.setString(4, trainer.getRole());
            callableStatement.setString(5, trainer.getEmail());
            callableStatement.setString(6, trainer.getDescription());
            callableStatement.setString(7, trainer.getStatus());
            callableStatement.setLong(8, trainer.getPhone());
            callableStatement.setString(9, trainer.getProfilePicture());

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                return resultSet.next() ? map(resultSet) : null;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Trainer getTrainerById(int trainerId) {
        String sql = "call get_trainer_by_id(?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, trainerId);

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                return resultSet.next() ? map(resultSet) : null;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Trainer> getAllTrainers() {
        String sql = "call get_all_trainers()";

        List<Trainer> trainers = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql);
             ResultSet resultSet = callableStatement.executeQuery()) {

            while (resultSet.next()) {
                trainers.add(map(resultSet));
            }

            return trainers;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    @Override
    public List<Trainer> getUsersByPage(int pageNo, int pageSize, String sortDirection) {
        String sql = "call get_trainers_by_page(?,?,?)";

        List<Trainer> trainers = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, pageNo);
            callableStatement.setInt(2, pageSize);
            callableStatement.setString(3, sortDirection);

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                while (resultSet.next()) {
                    trainers.add(map(resultSet));
                }

                return trainers;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Trainer> searchTrainerByNameOrEmail(String name, String email) {
        String sql = "call search_trainer_by_name_or_email(?,?)";

        List<Trainer> trainers = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setString(1, name);
            callableStatement.setString(2, email);

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                while (resultSet.next()) {
                    trainers.add(map(resultSet));
                }

                return trainers;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteTrainerById(int trainerId) {
        String sql = "call delete_trainer_by_id(?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, trainerId);

            callableStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    public Trainer changeTrainerStatus(int trainerId, String status) {

        String sql = "UPDATE Trainer SET Status = ? WHERE TrainerId = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(sql)) {

            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, trainerId);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected == 0) {
                return null;
            }

            return getTrainerById(trainerId);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private Trainer map(ResultSet rs) throws SQLException {
        return  Trainer.builder()
                .trainerId(rs.getInt("TrainerId"))
                .firstName(rs.getString("FirstName"))
                .lastName(rs.getString("LastName"))
                .role(rs.getString("Role"))
                .email(rs.getString("Email"))
                .description(rs.getString("Description"))
                .status(rs.getString("Status"))
                .phone(rs.getLong("Phone"))
                .profilePicture(rs.getString("ProfilePicture"))
                .build();
    }
}

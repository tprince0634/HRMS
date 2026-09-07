package org.example.dao;

import org.example.interfaces.TrainingTypeDao;
import org.example.model.TrainingType;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TrainingTypeDaoImpl implements TrainingTypeDao {
    @Override
    public TrainingType addTrainingType(TrainingType trainingType) {

        String sql = "call add_training_type(?,?,?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setString(1, trainingType.getTrainingTypeName());
            callableStatement.setString(2, trainingType.getDescription());
            callableStatement.setString(3, trainingType.getStatus());

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                return resultSet.next() ? map(resultSet) : null;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public TrainingType updateTrainingType(int id, TrainingType trainingType) {
        String sql = "call update_training_type(?,?,?,?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, id);
            callableStatement.setString(2, trainingType.getTrainingTypeName());
            callableStatement.setString(3, trainingType.getDescription());
            callableStatement.setString(4, trainingType.getStatus());

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                return resultSet.next() ? map(resultSet) : null;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public TrainingType findTrainingTypeById(int id) {

        String sql = "call find_training_type_by_id(?)";

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
    public List<TrainingType> getAllTrainingTypes() {
        String sql = "call get_all_training_types()";

        List<TrainingType> trainingTypes = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql);
             ResultSet resultSet = callableStatement.executeQuery()) {

            while (resultSet.next()) {

                trainingTypes.add(map(resultSet));
            }

            return trainingTypes;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public TrainingType findTrainingTypeByName(String name) {
        String sql = "call find_training_type_by_name(?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setString(1, name);

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                return resultSet.next() ? map(resultSet) : null;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<TrainingType> getAllTrainingTypesByName(String name) {
        String sql = "call get_all_training_types_by_name(?)";

        List<TrainingType> trainingTypes = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setString(1, name);

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                while (resultSet.next()) {

                    trainingTypes.add(map(resultSet));
                }

                return trainingTypes;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<TrainingType> getTrainingTypesByPage(int page, int pageSize, String sortDirection) {
        String sql = "call get_training_types_by_page(?,?,?)";

        List<TrainingType> trainingTypes = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, page);
            callableStatement.setInt(2, pageSize);
            callableStatement.setString(3, sortDirection);

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                while (resultSet.next()) {

                    trainingTypes.add(map(resultSet));
                }

                return trainingTypes;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<TrainingType> getTrainingTypesByTime(int Page, int PageSize, String period) {
        String sql = "call get_training_types_by_time(?,?,?)";

        List<TrainingType> trainingTypes = new ArrayList<>();

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, Page);
            callableStatement.setInt(2, PageSize);
            callableStatement.setString(3, period);

            try (ResultSet resultSet = callableStatement.executeQuery()) {

                while (resultSet.next()) {

                    trainingTypes.add(map(resultSet));
                }

                return trainingTypes;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public TrainingType changeTrainingTypeStatus(int id, String status) {
        String sql = "call change_training_type_status(?,?)";

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

    @Override
    public void deleteTrainingTypeById(int id) {
        String sql = "call delete_training_type_by_id(?)";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement callableStatement = connection.prepareCall(sql)) {

            callableStatement.setInt(1, id);

            callableStatement.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private TrainingType map(ResultSet rs) throws SQLException {

        return TrainingType.builder()
                .trainingTypeId(rs.getInt("TrainingTypeId"))
                .trainingTypeName(rs.getString("TrainingTypeName"))
                .description(rs.getString("Description"))
                .status(rs.getString("Status"))
                .build();
    }
}

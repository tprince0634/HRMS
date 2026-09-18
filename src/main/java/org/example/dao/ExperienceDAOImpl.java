package org.example.dao;

import org.example.interfaces.ExperienceDAO;
import org.example.model.Experience;
import org.example.util.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ExperienceDAOImpl implements ExperienceDAO {

    // ============================================================
    // ADD EXPERIENCE
    // Procedure:
    // sp_add_experience(
    //     p_designation_name,
    //     p_from_date,
    //     p_to_date,
    //     p_user_id,
    //     p_company_name
    // )
    // ============================================================

    @Override
    public boolean addExperience(Experience experience) {

        String sql = "{CALL sp_add_experience(?, ?, ?, ?, ?)}";

        try (Connection connection = DBConnection.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setString(
                    1,
                    experience.getDesignationName()
            );

            statement.setTimestamp(
                    2,
                    Timestamp.valueOf(
                            experience.getFromDate()
                    )
            );

            statement.setTimestamp(
                    3,
                    Timestamp.valueOf(
                            experience.getToDate()
                    )
            );

            statement.setInt(
                    4,
                    experience.getUserId()
            );

            statement.setString(
                    5,
                    experience.getCompanyName()
            );

            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // ============================================================
    // GET EXPERIENCE BY ID
    // Procedure:
    // sp_get_experience_by_id(p_experience_id)
    // ============================================================

    @Override
    public Experience getExperienceById(
            int experienceId) {

        String sql =
                "{CALL sp_get_experience_by_id(?)}";

        try (Connection connection =
                     DBConnection.getConnection();

             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(
                    1,
                    experienceId
            );

            try (ResultSet resultSet =
                         statement.executeQuery()) {

                if (resultSet.next()) {

                    return mapExperience(resultSet);
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }


    // ============================================================
    // GET ALL EXPERIENCES
    // Procedure:
    // sp_get_all_experiences()
    // ============================================================

    @Override
    public List<Experience> getAllExperiences() {

        List<Experience> experiences =
                new ArrayList<>();

        String sql =
                "{CALL sp_get_all_experiences()}";

        try (Connection connection =
                     DBConnection.getConnection();

             CallableStatement statement =
                     connection.prepareCall(sql);

             ResultSet resultSet =
                     statement.executeQuery()) {

            while (resultSet.next()) {

                experiences.add(
                        mapExperience(resultSet)
                );
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return experiences;
    }


    // ============================================================
    // UPDATE EXPERIENCE
    // Procedure:
    // sp_update_experience(
    //     p_experience_id,
    //     p_designation_name,
    //     p_from_date,
    //     p_to_date,
    //     p_user_id,
    //     p_company_name
    // )
    // ============================================================

    @Override
    public boolean updateExperience(
            Experience experience) {

        String sql =
                "{CALL sp_update_experience(?, ?, ?, ?, ?, ?)}";

        try (Connection connection =
                     DBConnection.getConnection();

             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(
                    1,
                    experience.getExperienceId()
            );

            statement.setString(
                    2,
                    experience.getDesignationName()
            );

            statement.setTimestamp(
                    3,
                    Timestamp.valueOf(
                            experience.getFromDate()
                    )
            );

            statement.setTimestamp(
                    4,
                    Timestamp.valueOf(
                            experience.getToDate()
                    )
            );

            statement.setInt(
                    5,
                    experience.getUserId()
            );

            statement.setString(
                    6,
                    experience.getCompanyName()
            );

            int rowsAffected =
                    statement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // ============================================================
    // DELETE EXPERIENCE
    // Procedure:
    // sp_delete_experience(p_experience_id)
    // ============================================================

    @Override
    public boolean deleteExperience(
            int experienceId) {

        String sql =
                "{CALL sp_delete_experience(?)}";

        try (Connection connection =
                     DBConnection.getConnection();

             CallableStatement statement =
                     connection.prepareCall(sql)) {

            statement.setInt(
                    1,
                    experienceId
            );

            int rowsAffected =
                    statement.executeUpdate();

            return rowsAffected > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // ============================================================
    // RESULT SET -> EXPERIENCE OBJECT
    // ============================================================

    private Experience mapExperience(
            ResultSet resultSet)
            throws SQLException {

        Timestamp fromTimestamp =
                resultSet.getTimestamp("FromDate");

        Timestamp toTimestamp =
                resultSet.getTimestamp("ToDate");

        return Experience.builder()

                .experienceId(
                        resultSet.getInt(
                                "ExperienceId"
                        )
                )

                .designationName(
                        resultSet.getString(
                                "DesignationName"
                        )
                )

                .fromDate(
                        fromTimestamp != null
                                ? fromTimestamp.toLocalDateTime()
                                : null
                )

                .toDate(
                        toTimestamp != null
                                ? toTimestamp.toLocalDateTime()
                                : null
                )

                .userId(
                        resultSet.getInt(
                                "UserId"
                        )
                )

                .companyName(
                        resultSet.getString(
                                "CompanyName"
                        )
                )

                .build();
    }
}
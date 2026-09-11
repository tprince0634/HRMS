package org.example.controller.trainingcontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.Training;
import org.example.model.Trainer;
import org.example.model.TrainingType;
import org.example.model.User;
import org.example.service.TrainerService;
import org.example.service.TrainingService;
import org.example.service.TrainingTypeService;
import org.example.service.UserService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/editTraining")
public class EditTrainingServlet extends HttpServlet {

    private final TrainingService trainingService = new TrainingService();
    private final TrainerService trainerService = new TrainerService();
    private final TrainingTypeService trainingTypeService =
            new TrainingTypeService();
    private final UserService userService = new UserService();

    private static final DateTimeFormatter DATE_TIME_FORMATTER =
            DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");


    // =========================================================
    // GET -> Open Edit Training Page
    // =========================================================

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String idParameter = request.getParameter("id");

            if (idParameter == null || idParameter.isBlank()) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Training ID is required"
                );

                return;
            }

            int trainingId = Integer.parseInt(idParameter);

            if (trainingId <= 0) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid training ID"
                );

                return;
            }


            // Get existing training

            Training training =
                    trainingService.findTrainingById(trainingId);


            if (training == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Training not found"
                );

                return;
            }


            // Load dropdown data

            List<User> users =
                    userService.getAllUsers();

            List<Trainer> trainers =
                    trainerService.getAllTrainers();

            List<TrainingType> trainingTypes =
                    trainingTypeService.getAllTrainingTypes();


            // Send data to JSP

            request.setAttribute("training", training);

            request.setAttribute("users", users);

            request.setAttribute("trainers", trainers);

            request.setAttribute("trainingTypes", trainingTypes);


            request.getRequestDispatcher(
                    "views/admin/editTraining.jsp"
            ).forward(request, response);


        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid training ID"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to load training"
            );
        }
    }


    // =========================================================
    // POST -> Update Training
    // =========================================================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            String trainingIdParameter =
                    request.getParameter("trainingId");

            String userIdParameter =
                    request.getParameter("userId");

            String trainerIdParameter =
                    request.getParameter("trainerId");

            String trainingTypeIdParameter =
                    request.getParameter("trainingTypeId");

            String trainingCostParameter =
                    request.getParameter("trainingCost");

            String description =
                    request.getParameter("description");

            String status =
                    request.getParameter("status");

            String startDateParameter =
                    request.getParameter("startDate");

            String endDateParameter =
                    request.getParameter("endDate");


            // =================================================
            // Validate required parameters
            // =================================================

            if (trainingIdParameter == null ||
                    userIdParameter == null ||
                    trainerIdParameter == null ||
                    trainingTypeIdParameter == null ||
                    trainingCostParameter == null ||
                    startDateParameter == null ||
                    endDateParameter == null) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Required fields are missing"
                );

                return;
            }


            // =================================================
            // Convert values
            // =================================================

            int trainingId =
                    Integer.parseInt(trainingIdParameter);

            int userId =
                    Integer.parseInt(userIdParameter);

            int trainerId =
                    Integer.parseInt(trainerIdParameter);

            int trainingTypeId =
                    Integer.parseInt(trainingTypeIdParameter);

            double trainingCost =
                    Double.parseDouble(trainingCostParameter);


            LocalDateTime startDate =
                    LocalDateTime.parse(
                            startDateParameter,
                            DATE_TIME_FORMATTER
                    );

            LocalDateTime endDate =
                    LocalDateTime.parse(
                            endDateParameter,
                            DATE_TIME_FORMATTER
                    );


            // =================================================
            // Validate dates
            // =================================================

            if (endDate.isBefore(startDate)) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "End date cannot be before start date"
                );

                return;
            }


            // =================================================
            // Default status
            // =================================================

            if (status == null || status.isBlank()) {

                status = "Active";
            }


            // =================================================
            // Build Training object
            // =================================================

            Training training =
                    Training.builder()

                            .trainingId(trainingId)

                            .userId(userId)

                            .trainerId(trainerId)

                            .trainingTypeId(trainingTypeId)

                            .trainingCost(trainingCost)

                            .description(description)

                            .status(status)

                            .startDate(startDate)

                            .endDate(endDate)

                            .modifiedBy("Admin")

                            .modifiedAt(LocalDateTime.now())

                            .build();


            // =================================================
            // Update
            // =================================================

            trainingService.updateTraining(
                    trainingId,
                    training
            );


            // =================================================
            // Redirect
            // =================================================

            response.sendRedirect(
                    request.getContextPath()
                            + "/trainingList"
            );


        } catch (NumberFormatException e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid numeric value"
            );

        } catch (java.time.format.DateTimeParseException e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid date format"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to update training"
            );
        }
    }
}
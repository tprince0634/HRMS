package org.example.controller.trainingcontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.example.model.Trainer;
import org.example.model.Training;
import org.example.model.TrainingType;
import org.example.model.User;

import org.example.service.TrainerService;
import org.example.service.TrainingService;
import org.example.service.TrainingTypeService;
import org.example.service.UserService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/trainingList")
public class TrainingListServlet extends HttpServlet {

    private final TrainingService trainingService =
            new TrainingService();

    private final TrainerService trainerService =
            new TrainerService();

    private final TrainingTypeService trainingTypeService =
            new TrainingTypeService();

    private final UserService userService =
            new UserService();


    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // ---------------------------------------------
            // Get current session
            // ---------------------------------------------

            HttpSession session =
                    request.getSession(false);

            if (session == null) {

                response.sendRedirect(
                        request.getContextPath() + "/login.jsp"
                );

                return;
            }


            // ---------------------------------------------
            // Get logged-in user information
            // ---------------------------------------------

            String role =
                    (String) session.getAttribute("userRole");

            Integer userId =
                    (Integer) session.getAttribute("userId");


            if (role == null || userId == null) {

                response.sendRedirect(
                        request.getContextPath() + "/login.jsp"
                );

                return;
            }


            // ---------------------------------------------
            // Get trainings according to role
            // ---------------------------------------------

            List<Training> trainings;


            if ("Admin".equalsIgnoreCase(role)) {

                // Admin can see ALL trainings

                trainings =
                        trainingService.getAllTrainings();

            } else {

                // Employee can see ONLY his/her trainings

                trainings =
                        trainingService.getTrainingsByUserId(
                                userId
                        );
            }


            // ---------------------------------------------
            // Supporting data
            // ---------------------------------------------

            List<Trainer> trainers =
                    trainerService.getAllTrainers();

            List<TrainingType> trainingTypes =
                    trainingTypeService.getAllTrainingTypes();

            List<User> users =
                    userService.getAllUsers();


            // ---------------------------------------------
            // Trainer ID -> Trainer Name
            // ---------------------------------------------

            Map<Integer, String> trainerNames =
                    new HashMap<>();


            for (Trainer trainer : trainers) {

                String firstName =
                        trainer.getFirstName() == null
                                ? ""
                                : trainer.getFirstName();

                String lastName =
                        trainer.getLastName() == null
                                ? ""
                                : trainer.getLastName();


                String fullName =
                        (firstName + " " + lastName).trim();


                trainerNames.put(
                        trainer.getTrainerId(),
                        fullName
                );
            }


            // ---------------------------------------------
            // User ID -> Employee Name
            // ---------------------------------------------

            Map<Integer, String> userNames =
                    new HashMap<>();


            for (User user : users) {

                String firstName =
                        user.getFirstName() == null
                                ? ""
                                : user.getFirstName();

                String lastName =
                        user.getLastName() == null
                                ? ""
                                : user.getLastName();


                String fullName =
                        (firstName + " " + lastName).trim();


                userNames.put(
                        user.getUserId(),
                        fullName
                );
            }


            // ---------------------------------------------
            // Training Type ID -> Training Type Name
            // ---------------------------------------------

            Map<Integer, String> trainingTypeNames =
                    new HashMap<>();


            for (TrainingType trainingType : trainingTypes) {

                trainingTypeNames.put(
                        trainingType.getTrainingTypeId(),
                        trainingType.getTrainingTypeName()
                );
            }


            // ---------------------------------------------
            // Send data to JSP
            // ---------------------------------------------

            request.setAttribute(
                    "trainings",
                    trainings
            );

            request.setAttribute(
                    "trainerNames",
                    trainerNames
            );

            request.setAttribute(
                    "userNames",
                    userNames
            );

            request.setAttribute(
                    "trainingTypeNames",
                    trainingTypeNames
            );


            // Send role to JSP if needed
            request.setAttribute(
                    "loggedInRole",
                    role
            );


            // ---------------------------------------------
            // Forward to Training List
            // ---------------------------------------------

            request.getRequestDispatcher(
                    "/trainingList.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to load training list"
            );
        }
    }
}
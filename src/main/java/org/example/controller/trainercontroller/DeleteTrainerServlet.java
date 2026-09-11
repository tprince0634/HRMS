package org.example.controller.trainercontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.Trainer;
import org.example.service.TrainerService;
import org.example.util.FileStorageUtil;

import java.io.IOException;

@WebServlet("/deleteTrainer")
public class DeleteTrainerServlet extends HttpServlet {

    private final TrainerService trainerService = new TrainerService();

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String idParameter = request.getParameter("id");

        if (idParameter == null || idParameter.isBlank()) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Trainer ID is required"
            );
            return;
        }

        int trainerId;

        try {
            trainerId = Integer.parseInt(idParameter);
        } catch (NumberFormatException e) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid trainer ID"
            );
            return;
        }

        try {
            // Get trainer first so we know the profile picture path
            Trainer trainer = trainerService.getTrainerById(trainerId);

            if (trainer == null) {
                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Trainer not found"
                );
                return;
            }

            String profilePicture = trainer.getProfilePicture();

            // Delete database record
            trainerService.deleteTrainerById(trainerId);

            // Delete physical profile picture
            if (profilePicture != null && !profilePicture.isBlank()) {

                if (FileStorageUtil.fileExists(profilePicture)) {
                    FileStorageUtil.deleteFile(profilePicture);
                }
            }

            response.sendRedirect(
                    request.getContextPath() + "/trainerList"
            );

        } catch (Exception e) {
            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to delete trainer"
            );
        }
    }
}
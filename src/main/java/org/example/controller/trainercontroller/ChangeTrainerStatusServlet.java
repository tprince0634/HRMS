package org.example.controller.trainercontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.service.TrainerService;

import java.io.IOException;

@WebServlet("/changeTrainerStatus")
public class ChangeTrainerStatusServlet extends HttpServlet {

    private final TrainerService trainerService = new TrainerService();

    @Override
    protected void doGet(HttpServletRequest request,
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
            trainerService.changeTrainerStatus(trainerId);

            response.sendRedirect(
                    request.getContextPath() + "/trainerList"
            );

        } catch (IllegalArgumentException e) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    e.getMessage()
            );
        }
    }
}
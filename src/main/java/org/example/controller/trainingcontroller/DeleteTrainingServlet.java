package org.example.controller.trainingcontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.service.TrainingService;

import java.io.IOException;

@WebServlet("/deleteTraining")
public class DeleteTrainingServlet extends HttpServlet {

    private final TrainingService trainingService =
            new TrainingService();


    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Get training ID from URL
            String idParameter =
                    request.getParameter("id");


            // Validate ID parameter
            if (idParameter == null ||
                    idParameter.isBlank()) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Training ID is required"
                );

                return;
            }


            // Convert ID
            int trainingId =
                    Integer.parseInt(idParameter);


            // Validate ID
            if (trainingId <= 0) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid training ID"
                );

                return;
            }


            // Delete training
            trainingService.deleteTrainingById(
                    trainingId
            );


            // Redirect back to training list
            response.sendRedirect(
                    request.getContextPath()
                            + "/trainingList"
            );


        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid training ID"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to delete training"
            );
        }
    }
}
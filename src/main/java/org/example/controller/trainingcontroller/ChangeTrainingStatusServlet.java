package org.example.controller.trainingcontroller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.Training;
import org.example.service.TrainingService;

import java.io.IOException;

@WebServlet("/changeTrainingStatus")
public class ChangeTrainingStatusServlet extends HttpServlet {

    private final TrainingService trainingService =
            new TrainingService();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws IOException {

        try {

            int id = Integer.parseInt(
                    request.getParameter("id")
            );

            String status =
                    request.getParameter("status");


            if (!"Active".equalsIgnoreCase(status)
                    && !"InActive".equalsIgnoreCase(status)) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid status"
                );

                return;
            }


            Training training =
                    trainingService.changeTrainingStatus(
                            id,
                            status
                    );


            if (training == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Training not found"
                );

                return;
            }


            response.setStatus(
                    HttpServletResponse.SC_OK
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
                    "Unable to change training status"
            );
        }
    }
}
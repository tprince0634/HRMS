package org.example.controller.trainingtypecontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.service.TrainingTypeService;

import java.io.IOException;

@WebServlet("/deleteTrainingType")
public class DeleteTrainingTypeServlet extends HttpServlet {

    private final TrainingTypeService trainingTypeService =
            new TrainingTypeService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String idParameter =
                    request.getParameter("id");

            if (idParameter == null ||
                    idParameter.isBlank()) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Training type ID is required"
                );
                return;
            }

            int id = Integer.parseInt(idParameter);

            if (id <= 0) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid training type ID"
                );
                return;
            }

            trainingTypeService.deleteTrainingTypeById(id);

            response.sendRedirect(
                    request.getContextPath()
                            + "/trainingTypeList"
            );

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid training type ID"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to delete training type"
            );
        }
    }
}
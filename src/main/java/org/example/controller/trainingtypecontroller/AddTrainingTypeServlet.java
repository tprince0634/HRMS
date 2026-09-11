package org.example.controller.trainingtypecontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.TrainingType;
import org.example.service.TrainingTypeService;

import java.io.IOException;

@WebServlet("/addTrainingType")
public class AddTrainingTypeServlet extends HttpServlet {

    private final TrainingTypeService trainingTypeService =
            new TrainingTypeService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher(
                "/views/admin/addTrainingType.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            String trainingTypeName =
                    request.getParameter("trainingTypeName");

            String description =
                    request.getParameter("description");

            String status =
                    request.getParameter("status");

            if (trainingTypeName == null ||
                    trainingTypeName.isBlank()) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Training type name is required"
                );
                return;
            }

            if (description == null ||
                    description.isBlank()) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Description is required"
                );
                return;
            }

            if (status == null || status.isBlank()) {
                status = "Active";
            }

            TrainingType trainingType =
                    TrainingType.builder()
                            .trainingTypeName(trainingTypeName.trim())
                            .description(description.trim())
                            .status(status)
                            .build();

            trainingTypeService.addTrainingType(trainingType);

            response.sendRedirect(
                    request.getContextPath()
                            + "/trainingTypeList"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to add training type"
            );
        }
    }
}
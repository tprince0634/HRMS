package org.example.controller.trainingtypecontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.TrainingType;
import org.example.service.TrainingTypeService;

import java.io.IOException;

@WebServlet("/editTrainingType")
public class EditTrainingTypeServlet extends HttpServlet {

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

            TrainingType trainingType =
                    trainingTypeService.findTrainingTypeById(id);

            if (trainingType == null) {

                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Training type not found"
                );
                return;
            }

            request.setAttribute(
                    "trainingType",
                    trainingType
            );

            request.getRequestDispatcher(
                    "views/admin/editTrainingType.jsp"
            ).forward(request, response);

        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid training type ID"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to load training type"
            );
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            String idParameter =
                    request.getParameter("trainingTypeId");

            String trainingTypeName =
                    request.getParameter("trainingTypeName");

            String description =
                    request.getParameter("description");

            String status =
                    request.getParameter("status");

            if (idParameter == null ||
                    idParameter.isBlank() ||
                    trainingTypeName == null ||
                    trainingTypeName.isBlank() ||
                    description == null ||
                    description.isBlank()) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Required fields are missing"
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

            if (status == null || status.isBlank()) {
                status = "Active";
            }

            TrainingType trainingType =
                    TrainingType.builder()
                            .trainingTypeId(id)
                            .trainingTypeName(
                                    trainingTypeName.trim()
                            )
                            .description(
                                    description.trim()
                            )
                            .status(status)
                            .build();

            trainingTypeService.updateTrainingType(
                    id,
                    trainingType
            );

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
                    "Unable to update training type"
            );
        }
    }
}
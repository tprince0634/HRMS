package org.example.controller.trainingtypecontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.TrainingType;
import org.example.service.TrainingTypeService;

import java.io.IOException;
import java.util.List;

@WebServlet("/trainingTypeList")
public class TrainingTypeListServlet extends HttpServlet {

    private final TrainingTypeService trainingTypeService =
            new TrainingTypeService();

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            List<TrainingType> trainingTypes =
                    trainingTypeService.getAllTrainingTypes();

            request.setAttribute(
                    "trainingTypes",
                    trainingTypes
            );

            request.getRequestDispatcher(
                    "/views/admin/trainingTypeList.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to load training type list"
            );
        }
    }
}
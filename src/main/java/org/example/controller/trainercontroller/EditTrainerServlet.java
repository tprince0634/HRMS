package org.example.controller.trainercontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import org.example.model.Trainer;
import org.example.service.TrainerService;
import org.example.util.FileStorageUtil;

import java.io.IOException;

@WebServlet("/editTrainer")
@MultipartConfig(
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 6 * 1024 * 1024
)
public class EditTrainerServlet extends HttpServlet {

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

        Trainer trainer = trainerService.getTrainerById(trainerId);

        if (trainer == null) {
            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Trainer not found"
            );
            return;
        }

        request.setAttribute("trainer", trainer);

        request.getRequestDispatcher("views/admin/editTrainer.jsp")
                .forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            String idParameter = request.getParameter("trainerId");

            if (idParameter == null || idParameter.isBlank()) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Trainer ID is required"
                );
                return;
            }

            int trainerId = Integer.parseInt(idParameter);


            // Get existing trainer
            Trainer existingTrainer =
                    trainerService.getTrainerById(trainerId);

            if (existingTrainer == null) {
                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Trainer not found"
                );
                return;
            }


            // Form values
            String firstName =
                    request.getParameter("firstName");

            String lastName =
                    request.getParameter("lastName");

            String role =
                    request.getParameter("role");

            String email =
                    request.getParameter("email");

            String description =
                    request.getParameter("description");

            String status =
                    request.getParameter("status");

            String phoneParameter =
                    request.getParameter("phone");


            // Phone
            Long phone = null;

            if (phoneParameter != null &&
                    !phoneParameter.isBlank()) {

                phone = Long.parseLong(phoneParameter);

            }


            /*
             * Existing profile picture is kept by default.
             */
            String profilePicture =
                    existingTrainer.getProfilePicture();


            /*
             * Check whether user selected a new image.
             */
            Part profilePicturePart =
                    request.getPart("profilePicture");


            if (profilePicturePart != null &&
                    profilePicturePart.getSize() > 0) {

                profilePicture =
                        FileStorageUtil.saveFile(
                                profilePicturePart,
                                FileStorageUtil.FOLDER_PROFILE_PICTURES
                        );

            }


            // Build updated trainer
            Trainer trainer = Trainer.builder()

                    .trainerId(trainerId)

                    .firstName(firstName)

                    .lastName(lastName)

                    .role(role)

                    .email(email)

                    .description(description)

                    .status(status)

                    .phone(phone)

                    .profilePicture(profilePicture)

                    .build();


            trainerService.updateTrainer(
                    trainerId,
                    trainer
            );


            /*
             * After successful update,
             * go back to trainer list.
             */
            response.sendRedirect(
                    request.getContextPath()
                            + "/trainerList"
            );


        } catch (NumberFormatException e) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid trainer ID or phone number"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to update trainer"
            );

        }

    }
}
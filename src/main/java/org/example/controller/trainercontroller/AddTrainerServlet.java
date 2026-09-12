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

@WebServlet("/addTrainer")
@MultipartConfig(
        maxFileSize = 5 * 1024 * 1024,
        maxRequestSize = 6 * 1024 * 1024
)
public class AddTrainerServlet extends HttpServlet {

    private final TrainerService trainerService = new TrainerService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("views/admin/addTrainer.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            // ==============================
            // GET FORM DATA
            // ==============================

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String role = request.getParameter("role");
            String email = request.getParameter("email");
            String phoneParameter = request.getParameter("phone");
            String description = request.getParameter("description");

            // ==============================
            // DEBUG
            // ==============================

            System.out.println("========== ADD TRAINER ==========");
            System.out.println("First Name : " + firstName);
            System.out.println("Last Name  : " + lastName);
            System.out.println("Role       : " + role);
            System.out.println("Email      : " + email);
            System.out.println("Phone      : " + phoneParameter);
            System.out.println("Description: " + description);

            // ==============================
            // VALIDATION
            // ==============================

            if (firstName == null || firstName.trim().isEmpty()) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "First name is required"
                );
                return;
            }

            if (lastName == null || lastName.trim().isEmpty()) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Last name is required"
                );
                return;
            }

            if (role == null || role.trim().isEmpty()) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Role is required"
                );
                return;
            }

            if (email == null || email.trim().isEmpty()) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Email is required"
                );
                return;
            }

            if (phoneParameter == null || phoneParameter.trim().isEmpty()) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Phone number is required"
                );
                return;
            }

            // ==============================
            // PHONE
            // ==============================

            Long phone;

            try {
                phone = Long.parseLong(phoneParameter.trim());
            } catch (NumberFormatException e) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid phone number"
                );

                return;
            }

            // ==============================
            // PROFILE PICTURE
            // ==============================

            String profilePicturePath = null;

            Part profilePicturePart =
                    request.getPart("profilePicture");

            if (profilePicturePart != null
                    && profilePicturePart.getSize() > 0) {

                profilePicturePath =
                        FileStorageUtil.saveFile(
                                profilePicturePart,
                                FileStorageUtil.FOLDER_PROFILE_PICTURES
                        );

                System.out.println(
                        "Profile Picture Path: "
                                + profilePicturePath
                );
            }

            // ==============================
            // CREATE TRAINER
            // ==============================

            Trainer trainer = Trainer.builder()
                    .firstName(firstName.trim())
                    .lastName(lastName.trim())
                    .role(role.trim())
                    .email(email.trim())
                    .phone(phone)
                    .description(
                            description == null
                                    ? null
                                    : description.trim()
                    )
                    .status("Active")
                    .profilePicture(profilePicturePath)
                    .build();

            // ==============================
            // SAVE
            // ==============================

            trainerService.addTrainer(trainer);

            System.out.println(
                    "Trainer added successfully"
            );

            // ==============================
            // REDIRECT
            // ==============================

            response.sendRedirect(
                    request.getContextPath()
                            + "/trainerList"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Unable to add trainer"
            );
        }
    }
}
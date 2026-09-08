package org.example.controller.fileuploadcontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.model.FileUploads;
import org.example.model.User;
import org.example.service.FileUploadService;
import org.example.util.FileStorageUtil;

import java.io.IOException;

@WebServlet("/uploadFile")
@MultipartConfig(
        maxFileSize = 10 * 1024 * 1024,
        maxRequestSize = 20 * 1024 * 1024
)
public class FileUploadServlet extends HttpServlet {

    private final FileUploadService fileUploadsService =
            new FileUploadService();


    // OPEN UPLOAD PAGE

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
      String role = (String) session.getAttribute("userRole");
        int  id = (int) session.getAttribute("userId");

       if (role.equalsIgnoreCase("admin")) {
           request.setAttribute("files" , fileUploadsService.getALlFileUploads());
       } else if (role.equalsIgnoreCase("user")) {
           request.setAttribute("files" , fileUploadsService.findByUserId(id));
       }
        request.getRequestDispatcher("/uploadFile.jsp")
                .forward(request, response);

    }

    // =========================================================
    // UPLOAD FILE
    // =========================================================
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Part filePart = request.getPart("file");

            if (filePart == null || filePart.getSize() == 0) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Please select a file"
                );
                return;
            }

            String fileName = filePart.getSubmittedFileName();

            if (fileName == null || fileName.isBlank()) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid file name"
                );
                return;
            }

            // =====================================================
            // CHECK LOGIN
            // =====================================================

            HttpSession session =
                    request.getSession(false);

            if (session == null ||
                    session.getAttribute("userId") == null) {

                response.sendError(
                        HttpServletResponse.SC_UNAUTHORIZED,
                        "User is not logged in"
                );
                return;
            }

            int userId =
                    (Integer) session.getAttribute("userId");

            // =====================================================
            // SAVE FILE TO SERVER
            // =====================================================

            String filePath =
                    FileStorageUtil.saveFile(filePart);

            // =====================================================
            // SAVE FILE INFORMATION TO DATABASE
            // =====================================================

            FileUploads fileUploads =
                    FileUploads.builder()
                            .fileName(fileName)
                            .filePath(filePath)
                            .userId(userId)
                            .build();

            FileUploads savedFile =
                    fileUploadsService.uploadFile(fileUploads);

            if (savedFile == null) {
                request.setAttribute("error", "File upload failed");
                response.sendError(
                        HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Unable to save file information"
                );
                return;
            }
             request.setAttribute("success" , "File uploaded successfully");
            // After upload, go back to upload page
            response.sendRedirect(
                    request.getContextPath() + "/uploadFile"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendError(
                    HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "File upload failed"
            );
        }
    }
}
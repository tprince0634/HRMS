package org.example.controller.fileuploadcontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.example.model.FileUploads;
import org.example.service.FileUploadService;
import org.example.util.FileStorageUtil;

import java.io.IOException;

@WebServlet("/deleteFile")
public class DeleteFileServlet extends HttpServlet {

    private final FileUploadService fileUploadService =
            new FileUploadService();

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(
                    request.getContextPath() + "/login"
            );
            return;
        }

        String idParameter = request.getParameter("id");

        if (idParameter == null || idParameter.isBlank()) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "File ID is required"
            );
            return;
        }

        int id;

        try {
            id = Integer.parseInt(idParameter);
        } catch (NumberFormatException e) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid file ID"
            );
            return;
        }

        // Find file from database
        FileUploads file = fileUploadService.findById(id);

        if (file == null) {
            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "File not found"
            );
            return;
        }

        String filePath = file.getFilePath();

        // Delete physical file
        if (filePath != null && !filePath.isBlank()) {

            if (FileStorageUtil.fileExists(filePath)) {
                FileStorageUtil.deleteFile(filePath);
            }
        }

        // Delete database record
        fileUploadService.deleteById(id);

        // Success message
        session.setAttribute(
                "successMessage",
                "Document deleted successfully."
        );

        // Redirect back to document list
        response.sendRedirect(
                request.getContextPath() + "/documentList"
        );
    }
}
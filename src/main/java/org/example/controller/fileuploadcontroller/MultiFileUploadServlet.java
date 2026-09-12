package org.example.controller.fileuploadcontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.model.FileUploads;
import org.example.service.FileUploadService;
import org.example.util.FileStorageUtil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@WebServlet("/uploadFiles")
@MultipartConfig(
        maxFileSize = 10 * 1024 * 1024,        // 10MB per file
        maxRequestSize = 100 * 1024 * 1024,    // 100MB total request
        fileSizeThreshold = 1024 * 1024
)
public class MultiFileUploadServlet extends HttpServlet {

    private final FileUploadService fileUploadsService =
            new FileUploadService();

    // =========================================================
    // UPLOAD MULTIPLE FILES
    // =========================================================
    // request.getPart("name") only ever returns ONE Part, even
    // when the <input> has the "multiple" attribute — every
    // selected file arrives as its own Part sharing that same
    // field name, so we pull them all out of request.getParts().
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

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
            // COLLECT ONLY THE FILE PARTS NAMED "documentFiles"
            // (request.getParts() also includes any non-file
            // form fields, so we filter by name + skip empties)
            // =====================================================

            Collection<Part> allParts = request.getParts();
            List<Part> fileParts = new ArrayList<>();

            for (Part part : allParts) {
                if ("documentFiles".equals(part.getName())
                        && part.getSize() > 0
                        && part.getSubmittedFileName() != null
                        && !part.getSubmittedFileName().isBlank()) {
                    fileParts.add(part);
                }
            }

            if (fileParts.isEmpty()) {
                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Please select at least one file"
                );
                return;
            }

            // =====================================================
            // SAVE EACH FILE TO SERVER + BUILD RECORD LIST
            // =====================================================

            List<FileUploads> fileUploadsList = new ArrayList<>();

            for (Part filePart : fileParts) {

                String fileName = filePart.getSubmittedFileName();

                String filePath =
                        FileStorageUtil.saveFile(
                                filePart,
                                FileStorageUtil.FOLDER_DOCUMENTS
                        );

                FileUploads fileUploads =
                        FileUploads.builder()
                                .fileName(fileName)
                                .filePath(filePath)
                                .userId(userId)
                                .build();

                fileUploadsList.add(fileUploads);
            }

            // =====================================================
            // SAVE FILE INFORMATION TO DATABASE
            // =====================================================

            List<FileUploads> savedFiles =
                    fileUploadsService.uploadFiles(fileUploadsList);

            if (savedFiles == null || savedFiles.isEmpty()) {
                response.sendError(
                        HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Unable to save file information"
                );
                return;
            }

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
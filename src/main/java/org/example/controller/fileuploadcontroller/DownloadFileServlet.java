package org.example.controller.fileuploadcontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.FileUploads;
import org.example.service.FileUploadService;
import org.example.util.FileStorageUtil;

import java.io.IOException;
import java.io.InputStream;

@WebServlet("/downloadFile")
public class DownloadFileServlet extends HttpServlet {

    private final FileUploadService fileUploadService = new FileUploadService();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

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

        FileUploads file = fileUploadService.findById(id);

        if (file == null) {
            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "File not found"
            );
            return;
        }

        String filePath = file.getFilePath();

        if (filePath == null || filePath.isBlank()) {
            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "File path not found"
            );
            return;
        }

        if (!FileStorageUtil.fileExists(filePath)) {
            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Physical file not found"
            );
            return;
        }

        String contentType =
                FileStorageUtil.getContentType(filePath);

        long fileSize =
                FileStorageUtil.getFileSize(filePath);

        response.setContentType(contentType);
        response.setContentLengthLong(fileSize);

        /*
         * attachment tells the browser to download
         * the file instead of displaying it.
         */
        response.setHeader(
                "Content-Disposition",
                "attachment; filename=\"" + file.getFileName() + "\""
        );

        try (InputStream inputStream =
                     FileStorageUtil.getInputStream(filePath)) {

            inputStream.transferTo(response.getOutputStream());
        }
    }
}
package org.example.controller.fileuploadcontroller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.model.FileUploads;
import org.example.service.FileUploadService;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@WebServlet("/fileAccess")
public class FileAccessServlet extends HttpServlet {

    private final FileUploadService fileUploadService =
            new FileUploadService();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            FileUploads document = fileUploadService.findById(id);

            if (document == null) {
                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "Document not found"
                );
                return;
            }

            int loggedInUserId = (Integer) session.getAttribute("userId");
            String role = String.valueOf(session.getAttribute("userRole"));

            boolean isAdmin = "admin".equalsIgnoreCase(role);
            boolean ownsDocument = document.getUserId() == loggedInUserId;

            if (!isAdmin && !ownsDocument) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }

            Path webRoot = Paths.get(
                    getServletContext().getRealPath("/")
            ).toAbsolutePath().normalize();

            Path storedPath = Paths.get(document.getFilePath());

            Path actualFile = storedPath.isAbsolute()
                    ? storedPath
                    : webRoot.resolve(storedPath).normalize();

            if (!storedPath.isAbsolute() && !actualFile.startsWith(webRoot)) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN);
                return;
            }

            if (!Files.exists(actualFile) || !Files.isRegularFile(actualFile)) {
                response.sendError(
                        HttpServletResponse.SC_NOT_FOUND,
                        "File is missing from server storage"
                );
                return;
            }

            String contentType = Files.probeContentType(actualFile);

            if (contentType == null) {
                contentType = "application/octet-stream";
            }

            boolean download = "true".equalsIgnoreCase(
                    request.getParameter("download")
            );

            response.setContentType(contentType);
            response.setHeader(
                    "Content-Disposition",
                    (download ? "attachment" : "inline")
                            + "; filename=\""
                            + document.getFileName().replace("\"", "")
                            + "\""
            );

            Files.copy(actualFile, response.getOutputStream());

        } catch (NumberFormatException e) {
            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid document ID"
            );
        }
    }
}
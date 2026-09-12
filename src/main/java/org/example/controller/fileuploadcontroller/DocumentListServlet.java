package org.example.controller.fileuploadcontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.service.FileUploadService;

import java.io.IOException;

@WebServlet("/documentList")
public class DocumentListServlet extends HttpServlet {

    private final FileUploadService fileUploadService = new FileUploadService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null
                || session.getAttribute("userRole") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String role = String.valueOf(session.getAttribute("userRole"));
        int userId = (Integer) session.getAttribute("userId");
        boolean isAdmin = "admin".equalsIgnoreCase(role);

        // Admins see every uploaded document; users see only their own.
        request.setAttribute("documentList", isAdmin
                ? fileUploadService.getALlFileUploads()
                : fileUploadService.findByUserId(userId));
        request.setAttribute("isAdmin", isAdmin);

        request.getRequestDispatcher("/documentList.jsp").forward(request, response);
    }
}

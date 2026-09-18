package org.example.controller.admindocumentcontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.AdminDocNames;
import org.example.service.AdminDocNamesService;

import java.io.IOException;

@WebServlet("/AdminDocNames")
public class AdminDocNamesServlet extends HttpServlet {

    private final AdminDocNamesService service = new AdminDocNamesService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            AdminDocNames document = service.findAdminDocNamesById(id);
            request.setAttribute("document", document);
            request.getRequestDispatcher("views/admin/addAdminDocumentName.jsp").forward(request, response);
            return;
        }

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.deleteAdminDocNamesById(id);
            response.sendRedirect(request.getContextPath() + "/AdminDocNames");
            return;
        }

        request.setAttribute("documents", service.findAllAdminDocNames());
        request.getRequestDispatcher("views/admin/adminDocumentNameList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String docName = request.getParameter("docName");

        AdminDocNames document = AdminDocNames.builder()
                .docName(docName)
                .build();

        if (id == null || id.isBlank()) {
            service.createAdminDocNames(document);
        } else {
            service.updateAdminDocNames(Integer.parseInt(id), document);
        }

        response.sendRedirect(request.getContextPath() + "/AdminDocNames");
    }
}
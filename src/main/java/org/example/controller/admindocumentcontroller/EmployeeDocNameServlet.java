package org.example.controller.admindocumentcontroller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.model.EmployeeDocNames;
import org.example.service.EmployeeDocNameService;

import java.io.IOException;

@WebServlet("/EmployeeDocNames")
public class EmployeeDocNameServlet extends HttpServlet {

    private final EmployeeDocNameService service = new EmployeeDocNameService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            EmployeeDocNames document = service.findEmployeeDocNameById(id);
            request.setAttribute("document", document);
            request.getRequestDispatcher("views/employee/addEmployeeDocumentName.jsp")
                    .forward(request, response);
            return;
        }

        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            service.deleteEmployeeDocName(id);
            response.sendRedirect(request.getContextPath() + "/EmployeeDocNames");
            return;
        }

        request.setAttribute("documents", service.findAllEmployeeDocNames());
        request.getRequestDispatcher("views/employee/employeeDocumentNameList.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String id = request.getParameter("id");
        String docName = request.getParameter("docName");

        EmployeeDocNames document = EmployeeDocNames.builder()
                .docName(docName)
                .build();

        if (id == null || id.isBlank()) {
            service.createEmployeeDocName(document);
        } else {
            service.updateEmployeeDocName(Integer.parseInt(id), document);
        }

        response.sendRedirect(request.getContextPath() + "/EmployeeDocNames");
    }
}
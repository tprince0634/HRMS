package org.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.Designation;
import org.example.service.DesignationService;

import java.io.IOException;
import java.util.List;

@WebServlet("/Employee/AddDesignation")
public class DesignationServlet extends HttpServlet {

    private DesignationService designationService;


    @Override
    public void init() {

        designationService = new DesignationService();
    }


    // =========================
    // GET
    // =========================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        List<Designation> designations =
                designationService.getAllDesignations();

        request.setAttribute(
                "designations",
                designations
        );

        request.getRequestDispatcher(
                "/views/admin/designation.jsp"
        ).forward(request, response);
    }


    // =========================
    // POST
    // =========================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");


        // =========================
        // ADD
        // =========================

        if ("add".equals(action)) {

            String name =
                    request.getParameter("name");

            int departmentId =
                    Integer.parseInt(
                            request.getParameter("departmentId")
                    );

            String status =
                    request.getParameter("status");


            designationService.addDesignation(
                    departmentId,
                    name,
                    status,
                    "admin"
            );
        }


        // =========================
        // EDIT
        // =========================

        else if ("edit".equals(action)) {

            int designationId =
                    Integer.parseInt(
                            request.getParameter("designationId")
                    );

            int departmentId =
                    Integer.parseInt(
                            request.getParameter("departmentId")
                    );

            String name =
                    request.getParameter("name");

            String status =
                    request.getParameter("status");


            designationService.updateDesignation(
                    designationId,
                    departmentId,
                    name,
                    status,
                    "admin"
            );
        }


        // =========================
        // DELETE
        // =========================

        else if ("delete".equals(action)) {

            int designationId =
                    Integer.parseInt(
                            request.getParameter("designationId")
                    );

            designationService.deleteDesignation(
                    designationId
            );
        }

        response.sendRedirect(
                request.getContextPath()
                        + "/Employee/AddDesignation"
        );
    }
}
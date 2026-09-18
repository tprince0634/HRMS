package org.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.Department;
import org.example.model.Designation;
import org.example.service.DepartmentService;
import org.example.service.DesignationService;

import java.io.IOException;
import java.util.List;

@WebServlet("/Employee/AddDesignation")
public class DesignationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private DesignationService designationService;
    private DepartmentService departmentService;


    // =====================================================
    // INIT
    // =====================================================

    @Override
    public void init() throws ServletException {

        designationService = new DesignationService();
        departmentService = new DepartmentService();
    }


    // =====================================================
    // GET
    // =====================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        try {

            // -------------------------------------------------
            // 1. FETCH ALL DESIGNATIONS
            // -------------------------------------------------

            List<Designation> designations =
                    designationService.getAllDesignations();


            // -------------------------------------------------
            // 2. FETCH ALL DEPARTMENTS
            // -------------------------------------------------

            List<Department> departments =
                    departmentService.getAllDepartments();


            // -------------------------------------------------
            // 3. SEND DESIGNATIONS TO JSP
            // -------------------------------------------------

            request.setAttribute(
                    "designations",
                    designations
            );


            // -------------------------------------------------
            // 4. SEND DEPARTMENTS TO JSP
            // -------------------------------------------------

            request.setAttribute(
                    "departments",
                    departments
            );


            // -------------------------------------------------
            // 5. FORWARD TO JSP
            // -------------------------------------------------

            request.getRequestDispatcher(
                    "/views/admin/designation.jsp"
            ).forward(
                    request,
                    response
            );

        } catch (Exception e) {

            e.printStackTrace();

            throw new ServletException(
                    "Error while loading Designation page",
                    e
            );
        }
    }


    // =====================================================
    // POST
    // =====================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action =
                request.getParameter("action");


        // =================================================
        // ADD DESIGNATION
        // =================================================

        if ("add".equalsIgnoreCase(action)) {

            String name =
                    request.getParameter("name");

            String departmentIdParam =
                    request.getParameter("departmentId");

            String status =
                    request.getParameter("status");


            if (name == null
                    || name.isBlank()) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Designation name is required"
                );

                return;
            }


            if (departmentIdParam == null
                    || departmentIdParam.isBlank()) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Department is required"
                );

                return;
            }


            int departmentId;

            try {

                departmentId =
                        Integer.parseInt(
                                departmentIdParam
                        );

            } catch (NumberFormatException e) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid department ID"
                );

                return;
            }


            designationService.addDesignation(
                    departmentId,
                    name.trim(),
                    status,
                    "admin"
            );
        }


        // =================================================
        // EDIT DESIGNATION
        // =================================================

        else if ("edit".equalsIgnoreCase(action)) {

            String designationIdParam =
                    request.getParameter("designationId");

            String departmentIdParam =
                    request.getParameter("departmentId");

            String name =
                    request.getParameter("name");

            String status =
                    request.getParameter("status");


            if (designationIdParam == null
                    || designationIdParam.isBlank()
                    || departmentIdParam == null
                    || departmentIdParam.isBlank()) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Designation ID and Department ID are required"
                );

                return;
            }


            int designationId;
            int departmentId;


            try {

                designationId =
                        Integer.parseInt(
                                designationIdParam
                        );

                departmentId =
                        Integer.parseInt(
                                departmentIdParam
                        );

            } catch (NumberFormatException e) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid ID"
                );

                return;
            }


            designationService.updateDesignation(
                    designationId,
                    departmentId,
                    name != null ? name.trim() : "",
                    status,
                    "admin"
            );
        }


        // =================================================
        // DELETE DESIGNATION
        // =================================================

        else if ("delete".equalsIgnoreCase(action)) {

            String designationIdParam =
                    request.getParameter("designationId");


            if (designationIdParam == null
                    || designationIdParam.isBlank()) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Designation ID is required"
                );

                return;
            }


            int designationId;


            try {

                designationId =
                        Integer.parseInt(
                                designationIdParam
                        );

            } catch (NumberFormatException e) {

                response.sendError(
                        HttpServletResponse.SC_BAD_REQUEST,
                        "Invalid designation ID"
                );

                return;
            }


            designationService.deleteDesignation(
                    designationId
            );
        }


        // =================================================
        // INVALID ACTION
        // =================================================

        else {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid action"
            );

            return;
        }


        // =================================================
        // REDIRECT AFTER POST
        // =================================================

        response.sendRedirect(
                request.getContextPath()
                        + "/Employee/AddDesignation"
        );
    }
}
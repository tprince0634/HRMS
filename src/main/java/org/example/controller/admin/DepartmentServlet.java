package org.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.Department;
import org.example.service.DepartmentService;

import java.io.IOException;
import java.util.List;

@WebServlet("/Employee/AddDepartment")
public class DepartmentServlet extends HttpServlet {

    private DepartmentService departmentService;


    // =====================================================
    // INIT
    // =====================================================

    @Override
    public void init() {

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

        List<Department> departments =
                departmentService.getAllDepartments();

        request.setAttribute(
                "departments",
                departments
        );

        request.getRequestDispatcher(
                "/views/admin/department.jsp"
        ).forward(
                request,
                response
        );
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
        // ADD
        // =================================================

        if ("add".equals(action)) {

            String name =
                    request.getParameter("name");

            String status =
                    request.getParameter("status");

            departmentService.addDepartment(
                    name,
                    status,
                    "admin"
            );
        }


        // =================================================
        // EDIT
        // =================================================

        else if ("edit".equals(action)) {

            String id =
                    request.getParameter("departmentId");

            if (id != null && !id.isBlank()) {

                int departmentId =
                        Integer.parseInt(id);

                String name =
                        request.getParameter("name");

                String status =
                        request.getParameter("status");

                departmentService.updateDepartment(
                        departmentId,
                        name,
                        status,
                        "admin"
                );
            }
        }


        // =================================================
        // DELETE
        // =================================================

        else if ("delete".equals(action)) {

            String id =
                    request.getParameter("departmentId");

            if (id != null && !id.isBlank()) {

                int departmentId =
                        Integer.parseInt(id);

                departmentService.deleteDepartment(
                        departmentId
                );
            }
        }


        // =================================================
        // REDIRECT
        // =================================================

        response.sendRedirect(
                request.getContextPath()
                        + "/Employee/AddDepartment"
        );
    }
}
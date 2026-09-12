package org.example.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.model.Role;
import org.example.service.RoleService;

import java.io.IOException;
import java.util.List;

@WebServlet("/Employee/Role")
public class RoleServlet extends HttpServlet {
    private RoleService roleService;

    @Override
    public void init() {
        roleService = new RoleService();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Role> roles = roleService.getAllRoles();
        request.setAttribute("roles", roles);
        request.getRequestDispatcher(
                "/views/admin/role.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("add".equals(action)) {

            String roleName = request.getParameter("roleName");
            String status = request.getParameter("status");

            String username = "admin";

            roleService.addRole(roleName, status, username);

        } else if ("edit".equals(action)) {

            String roleIdString = request.getParameter("roleId");
            String roleName = request.getParameter("roleName");
            String status = request.getParameter("status");

            int roleId = Integer.parseInt(roleIdString);

            roleService.updateRole(
                    roleId,
                    roleName,
                    status,
                    "admin"
            );

        } else if ("delete".equals(action)) {
            String roleIdString = request.getParameter("roleId");
            if (roleIdString != null && !roleIdString.isEmpty()) {
                int roleId = Integer.parseInt(roleIdString);

                roleService.deleteRole(roleId);
            }
        }

        // Back to Role page
        response.sendRedirect(
                request.getContextPath() + "/Employee/Role"
        );
    }
}
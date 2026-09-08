package org.example.service;

import org.example.dao.DepartmentDAOImpl;
import org.example.interfaces.DepartmentDAO;
import org.example.model.Department;

import java.util.List;

public class DepartmentService {
    private final DepartmentDAOImpl departmentDAO;

    public DepartmentService() {

        departmentDAO = new DepartmentDAOImpl();
    }

    // =====================================================
    // GET ALL
    // =====================================================

    public List<Department> getAllDepartments() {

        return departmentDAO.getAllDepartments();
    }


    // =====================================================
    // ADD
    // =====================================================

    public boolean addDepartment(
            String name,
            String status,
            String createdBy
    ) {

        return departmentDAO.addDepartment(
                name,
                status,
                createdBy
        );
    }


    // =====================================================
    // UPDATE
    // =====================================================

    public boolean updateDepartment(
            int departmentId,
            String name,
            String status,
            String modifiedBy
    ) {

        return departmentDAO.updateDepartment(
                departmentId,
                name,
                status,
                modifiedBy
        );
    }


    // =====================================================
    // DELETE
    // =====================================================

    public boolean deleteDepartment(
            int departmentId
    ) {

        return departmentDAO.deleteDepartment(
                departmentId
        );
    }
}
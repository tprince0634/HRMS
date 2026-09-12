package org.example.interfaces;

import org.example.model.Department;

import java.util.List;

public interface DepartmentDAO {

    List<Department> getAllDepartments();

    boolean addDepartment(
            String name,
            String status,
            String createdBy
    );

    boolean updateDepartment(
            int departmentId,
            String name,
            String status,
            String modifiedBy
    );

    boolean deleteDepartment(
            int departmentId
    );
}

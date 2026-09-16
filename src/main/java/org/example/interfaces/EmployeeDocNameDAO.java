package org.example.interfaces;

import org.example.model.EmployeeDocNames;

import java.util.List;

public interface EmployeeDocNameDAO {

    EmployeeDocNames createEmployeeDocName(EmployeeDocNames employeeDocNames);
    EmployeeDocNames updateEmployeeDocName(int id ,EmployeeDocNames employeeDocNames);
    EmployeeDocNames findEmployeeDocNameById(int id);
    void deleteEmployeeDocName(int id);
    List<EmployeeDocNames> findAllEmployeeDocNames();

}

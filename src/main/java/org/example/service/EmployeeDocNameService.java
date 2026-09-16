package org.example.service;

import org.example.dao.EmployeeDocNameDAOImpl;
import org.example.interfaces.EmployeeDocNameDAO;
import org.example.model.EmployeeDocNames;

import java.util.List;

public class EmployeeDocNameService {

    private final EmployeeDocNameDAO employeeDocNameDAO;

    public EmployeeDocNameService() {
        this.employeeDocNameDAO = new EmployeeDocNameDAOImpl();
    }

    public EmployeeDocNames createEmployeeDocName(EmployeeDocNames employeeDocNames) {
        return employeeDocNameDAO.createEmployeeDocName(employeeDocNames);
    }

    public EmployeeDocNames updateEmployeeDocName(int id, EmployeeDocNames employeeDocNames) {
        return employeeDocNameDAO.updateEmployeeDocName(id, employeeDocNames);
    }

    public EmployeeDocNames findEmployeeDocNameById(int id) {
        return employeeDocNameDAO.findEmployeeDocNameById(id);
    }

    public void deleteEmployeeDocName(int id) {
        employeeDocNameDAO.deleteEmployeeDocName(id);
    }

    public List<EmployeeDocNames> findAllEmployeeDocNames() {
        return employeeDocNameDAO.findAllEmployeeDocNames();
    }
}
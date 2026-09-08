package org.example.service;

import org.example.dao.DesignationDAOImpl;
import org.example.interfaces.DesignationDAO;
import org.example.model.Designation;

import java.util.List;

public class DesignationService {

    private final DesignationDAO designationDAO;


    // =========================================================
    // CONSTRUCTOR
    // =========================================================

    public DesignationService() {

        designationDAO = new DesignationDAOImpl();
    }


    // =========================================================
    // GET ALL DESIGNATIONS
    // =========================================================

    public List<Designation> getAllDesignations() {

        return designationDAO.getAllDesignations();
    }


    // =========================================================
    // ADD DESIGNATION
    // =========================================================

    public boolean addDesignation(
            int departmentId,
            String name,
            String status,
            String createdBy
    ) {

        return designationDAO.addDesignation(
                departmentId,
                name,
                status,
                createdBy
        );
    }


    // =========================================================
    // UPDATE DESIGNATION
    // =========================================================

    public boolean updateDesignation(
            int designationId,
            int departmentId,
            String name,
            String status,
            String modifiedBy
    ) {

        return designationDAO.updateDesignation(
                designationId,
                departmentId,
                name,
                status,
                modifiedBy
        );
    }

    // =========================================================
    // DELETE DESIGNATION
    // =========================================================

    public boolean deleteDesignation(
            int designationId
    ) {

        return designationDAO.deleteDesignation(
                designationId
        );
    }
}
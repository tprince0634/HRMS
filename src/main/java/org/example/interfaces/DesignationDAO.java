
package org.example.interfaces;
import org.example.model.Designation;
import java.util.List;

public interface DesignationDAO {

    List<Designation> getAllDesignations();

    boolean addDesignation(
            int departmentId,
            String name,
            String status,
            String createdBy
    );

    boolean updateDesignation(
            int designationId,
            int departmentId,
            String name,
            String status,
            String modifiedBy
    );

    boolean deleteDesignation(
            int designationId
    );
}
package org.interfaces;

import org.model.Resignation;

import java.util.List;

public interface IResignationDAO {

    boolean addResignation(Resignation resignation);

    Resignation getResignationById(int resignationId);

    List<Resignation> getAllResignations();

    boolean updateResignation(Resignation resignation);

    boolean deleteResignation(int resignationId);
}

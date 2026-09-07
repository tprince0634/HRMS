package org.example.interfaces;

import org.example.model.Resignation;

import java.util.List;

public interface ResignationDAO {

    boolean addResignation(Resignation resignation);

    Resignation getResignationById(int resignationId);

    List<Resignation> getAllResignations();

    boolean updateResignation(Resignation resignation);

    boolean deleteResignation(int resignationId);
}


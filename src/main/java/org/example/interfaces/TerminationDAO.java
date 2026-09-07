package org.example.interfaces;

import org.example.model.Termination;

import java.util.List;

public interface TerminationDAO {

    boolean addTermination(Termination termination);

    Termination getTerminationById(int terminationId);

    List<Termination> getAllTerminations();

    boolean updateTermination(Termination termination);

    boolean deleteTermination(int terminationId);
}

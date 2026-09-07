package org.interfaces;

import org.model.Termination;

import java.util.List;

public interface ITerminationDAO {

    boolean addTermination(Termination termination);

    Termination getTerminationById(int terminationId);

    List<Termination> getAllTerminations();

    boolean updateTermination(Termination termination);

    boolean deleteTermination(int terminationId);
}

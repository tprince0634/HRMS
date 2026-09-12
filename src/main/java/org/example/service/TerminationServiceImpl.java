package org.example.service;

import org.example.dao.TerminationDAOImpl;
import org.example.interfaces.TerminationDAO;
import org.example.model.Termination;

import java.time.LocalDateTime;
import java.util.List;

public class TerminationServiceImpl implements TerminationDAO{

    private final TerminationDAO terminationDAO;

    public TerminationServiceImpl() {
        this.terminationDAO = new TerminationDAOImpl();
    }

    // =========================
    // ADD TERMINATION
    // =========================

    public boolean addTermination(Termination termination) {

        // 1. Null check
        if (termination == null) {
            return false;
        }

        // 2. User ID validation
        if (termination.getUserId() <= 0) {
            return false;
        }

        // 3. Termination type validation
        if (termination.getTerminationType() == null
                || termination.getTerminationType().trim().isEmpty()) {
            return false;
        }

        // 4. Notice date validation
        if (termination.getNoticeDate() == null) {
            return false;
        }

        // 5. Resign date validation
        if (termination.getResignDate() == null) {
            return false;
        }

        // 6. Business rule:
        // Resign date should not be before notice date
        if (termination.getResignDate()
                .isBefore(termination.getNoticeDate())) {
            return false;
        }

        // 7. Reason validation
        if (termination.getReason() == null
                || termination.getReason().trim().isEmpty()) {
            return false;
        }

        // 8. Call DAO
        return terminationDAO.addTermination(termination);
    }


    // =========================
    // GET TERMINATION BY ID
    // =========================

    public Termination getTerminationById(int terminationId) {

        if (terminationId <= 0) {
            return null;
        }

        return terminationDAO.getTerminationById(terminationId);
    }


    // =========================
    // GET ALL TERMINATIONS
    // =========================

    public List<Termination> getAllTerminations() {

        return terminationDAO.getAllTerminations();
    }


    // =========================
    // UPDATE TERMINATION
    // =========================

    public boolean updateTermination(Termination termination) {

        // 1. Null check
        if (termination == null) {
            return false;
        }

        // 2. Termination ID validation
        if (termination.getTerminationId() <= 0) {
            return false;
        }

        // 3. Check whether termination exists
        Termination existingTermination =
                terminationDAO.getTerminationById(
                        termination.getTerminationId()
                );

        if (existingTermination == null) {
            return false;
        }

        // 4. User ID validation
        if (termination.getUserId() <= 0) {
            return false;
        }

        // 5. Termination type validation
        if (termination.getTerminationType() == null
                || termination.getTerminationType().trim().isEmpty()) {
            return false;
        }

        // 6. Notice date validation
        if (termination.getNoticeDate() == null) {
            return false;
        }

        // 7. Resign date validation
        if (termination.getResignDate() == null) {
            return false;
        }

        // 8. Business rule
        if (termination.getResignDate()
                .isBefore(termination.getNoticeDate())) {
            return false;
        }

        // 9. Reason validation
        if (termination.getReason() == null
                || termination.getReason().trim().isEmpty()) {
            return false;
        }

        // 10. Call DAO
        return terminationDAO.updateTermination(termination);
    }


    // =========================
    // DELETE TERMINATION
    // =========================

    public boolean deleteTermination(int terminationId) {

        // 1. Validate ID
        if (terminationId <= 0) {
            return false;
        }

        // 2. Check whether termination exists
        Termination existingTermination =
                terminationDAO.getTerminationById(terminationId);

        if (existingTermination == null) {
            return false;
        }

        // 3. Delete
        return terminationDAO.deleteTermination(terminationId);
    }
}
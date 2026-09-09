package org.example.service;

import org.example.dao.EventTypeDAOImpl;
import org.example.interfaces.EventTypeDAO;
import org.example.model.EventType;

import java.util.List;

public class EventTypeServiceImpl implements EventTypeDAO {

    private final EventTypeDAO eventTypeDAO;

    public EventTypeServiceImpl(EventTypeDAO eventTypeDAO) {
        this.eventTypeDAO = new EventTypeDAOImpl();
    }

    @Override
    public boolean addEventType(EventType eventType) {

        // Basic validation
        if (eventType == null) {
            return false;
        }

        if (eventType.getName() == null || eventType.getName().trim().isEmpty()) {
            return false;
        }

        if (eventType.getColor() == null || eventType.getColor().trim().isEmpty()) {
            return false;
        }

        return eventTypeDAO.addEventType(eventType);
    }

    @Override
    public EventType getEventTypeById(int id) {

        if (id <= 0) {
            return null;
        }

        return eventTypeDAO.getEventTypeById(id);
    }

    @Override
    public List<EventType> getAllEventTypes() {

        return eventTypeDAO.getAllEventTypes();
    }

    @Override
    public boolean updateEventType(EventType eventType) {

        if (eventType == null) {
            return false;
        }

        if (eventType.getId() <= 0) {
            return false;
        }

        if (eventType.getName() == null || eventType.getName().trim().isEmpty()) {
            return false;
        }

        if (eventType.getColor() == null || eventType.getColor().trim().isEmpty()) {
            return false;
        }

        return eventTypeDAO.updateEventType(eventType);
    }

    @Override
    public boolean deleteEventType(int id) {

        if (id <= 0) {
            return false;
        }

        return eventTypeDAO.deleteEventType(id);
    }
}

package org.example.interfaces;

import org.example.model.EventType;

import java.util.List;

public interface EventTypeDAO {

    boolean addEventType(EventType eventType);

    EventType getEventTypeById(int id);

    List<EventType> getAllEventTypes();

    boolean updateEventType(EventType eventType);

    boolean deleteEventType(int id);
}

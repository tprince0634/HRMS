package org.interfaces;

import org.model.EventType;

import java.util.List;

public interface IEventTypeDAO {

    boolean addEventType(EventType eventType);

    EventType getEventTypeById(int id);

    List<EventType> getAllEventTypes();

    boolean updateEventType(EventType eventType);

    boolean deleteEventType(int id);
}

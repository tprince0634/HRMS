package org.interfaces;

import org.model.Event;

import java.util.List;

public interface IEventDAO {

    boolean addEvent(Event event);

    Event getEventById(int id);

    List<Event> getAllEvents();

    boolean updateEvent(Event event);

    boolean deleteEvent(int id);
}
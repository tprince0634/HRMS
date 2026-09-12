package org.example.interfaces;

import org.example.model.Event;

import java.util.List;

public interface EventDAO {

    boolean addEvent(Event event);

    Event getEventById(int id);

    List<Event> getAllEvents();

    boolean updateEvent(Event event);

    boolean deleteEvent(int id);
}

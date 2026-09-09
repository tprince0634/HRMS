package org.example.service;


import org.example.exception.BusinessException;
import org.example.interfaces.EventDAO;
import org.example.model.Event;

import java.util.List;

public class EventServiceImpl implements EventDAO{

    private final EventDAO eventDAO;

    public EventServiceImpl(EventDAO eventDAO) {
        this.eventDAO = eventDAO;
    }


    public boolean addEvent(Event event) {

        try {

            // 1. Validate object
            if (event == null) {
                throw new BusinessException("Event cannot be null");
            }

            // 2. Validate title
            if (event.getTitle() == null ||
                    event.getTitle().trim().isEmpty()) {

                throw new BusinessException(
                        "Event title cannot be empty"
                );
            }

            // 3. Validate date
            if (event.getDate() == null ||
                    event.getDate().trim().isEmpty()) {

                throw new BusinessException(
                        "Event date cannot be empty"
                );
            }

            // 4. Validate EventType
            if (event.getEventTypeId() <= 0) {

                throw new BusinessException(
                        "Invalid event type ID"
                );
            }

            // 5. Validate status
            if (event.getStatus() == null ||
                    event.getStatus().trim().isEmpty()) {

                throw new BusinessException(
                        "Event status cannot be empty"
                );
            }

            // 6. Call DAO
            boolean result = eventDAO.addEvent(event);

            if (!result) {
                throw new BusinessException(
                        "Failed to add event"
                );
            }

            return true;

        } catch (BusinessException e) {

            // Business exception
            throw e;

        } catch (Exception e) {

            // Unexpected exception
            throw new BusinessException(
                    "Unexpected error while adding event",
                    e
            );
        }
    }


    public Event getEventById(int id) {

        try {

            // Validation
            if (id <= 0) {
                throw new BusinessException(
                        "Invalid event ID"
                );
            }

            // DAO call
            Event event = eventDAO.getEventById(id);

            // Business rule
            if (event == null) {
                throw new BusinessException(
                        "Event not found with ID: " + id
                );
            }

            return event;

        } catch (BusinessException e) {

            throw e;

        } catch (Exception e) {

            throw new BusinessException(
                    "Error while fetching event",
                    e
            );
        }
    }


    public List<Event> getAllEvents() {

        try {

            List<Event> events = eventDAO.getAllEvents();

            if (events == null) {
                throw new BusinessException(
                        "Unable to fetch events"
                );
            }

            return events;

        } catch (BusinessException e) {

            throw e;

        } catch (Exception e) {

            throw new BusinessException(
                    "Error while fetching all events",
                    e
            );
        }
    }


    public boolean updateEvent(Event event) {

        try {

            // Validate object
            if (event == null) {
                throw new BusinessException(
                        "Event cannot be null"
                );
            }

            // Validate ID
            if (event.getId() <= 0) {
                throw new BusinessException(
                        "Invalid event ID"
                );
            }

            // Validate title
            if (event.getTitle() == null ||
                    event.getTitle().trim().isEmpty()) {

                throw new BusinessException(
                        "Event title cannot be empty"
                );
            }

            // Validate date
            if (event.getDate() == null ||
                    event.getDate().trim().isEmpty()) {

                throw new BusinessException(
                        "Event date cannot be empty"
                );
            }

            // Validate event type
            if (event.getEventTypeId() <= 0) {

                throw new BusinessException(
                        "Invalid event type ID"
                );
            }

            // Validate status
            if (event.getStatus() == null ||
                    event.getStatus().trim().isEmpty()) {

                throw new BusinessException(
                        "Event status cannot be empty"
                );
            }

            // Call DAO
            boolean result = eventDAO.updateEvent(event);

            if (!result) {
                throw new BusinessException(
                        "Failed to update event"
                );
            }

            return true;

        } catch (BusinessException e) {

            throw e;

        } catch (Exception e) {

            throw new BusinessException(
                    "Unexpected error while updating event",
                    e
            );
        }
    }


    public boolean deleteEvent(int id) {

        try {

            // Validate ID
            if (id <= 0) {
                throw new BusinessException(
                        "Invalid event ID"
                );
            }

            // First check whether event exists
            Event event = eventDAO.getEventById(id);

            if (event == null) {
                throw new BusinessException(
                        "Event not found with ID: " + id
                );
            }

            // Delete
            boolean result = eventDAO.deleteEvent(id);

            if (!result) {
                throw new BusinessException(
                        "Failed to delete event"
                );
            }

            return true;

        } catch (BusinessException e) {

            throw e;

        } catch (Exception e) {

            throw new BusinessException(
                    "Unexpected error while deleting event",
                    e
            );
        }
    }
}
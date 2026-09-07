package org.model;

public class Event {

    private int id;
    private String title;
    private String date;
    private int eventTypeId;
    private String status;

    // No-argument constructor
    public Event() {
    }

    // Parameterized constructor
    public Event(int id, String title, String date, int eventTypeId, String status) {
        this.id = id;
        this.title = title;
        this.date = date;
        this.eventTypeId = eventTypeId;
        this.status = status;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getEventTypeId() {
        return eventTypeId;
    }

    public void setEventTypeId(int eventTypeId) {
        this.eventTypeId = eventTypeId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

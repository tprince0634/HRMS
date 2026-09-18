package org.example.controller.event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.dao.EventDAOImpl;
import org.example.dao.EventTypeDAOImpl;
import org.example.exception.BusinessException;
import org.example.interfaces.EventDAO;
import org.example.interfaces.EventTypeDAO;
import org.example.model.Event;
import org.example.model.EventType;
import org.example.service.EventServiceImpl;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/events")
public class EventServlet extends HttpServlet {

    private EventServiceImpl eventService;
    private EventTypeDAO eventTypeDAO;

    @Override
    public void init() throws ServletException {
        EventDAO eventDAO = new EventDAOImpl();
        eventService = new EventServiceImpl(eventDAO);
        eventTypeDAO = new EventTypeDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            // Main calendar
            if (action == null || "calendar".equals(action)) {
                loadPageData(request);
                request.getRequestDispatcher(
                        "/views/admin/event/admin-add-event.jsp"
                ).forward(request, response);
                return;
            }

            // Holiday/event list
            if ("list".equals(action)) {
                loadPageData(request);
                request.getRequestDispatcher(
                        "/views/admin/event/admin-holidays.jsp"
                ).forward(request, response);
                return;
            }

            // Add page / add modal page
            if ("add".equals(action)) {
                loadPageData(request);
                request.getRequestDispatcher(
                        "/views/admin/event/admin-add-event.jsp"
                ).forward(request, response);
                return;
            }

            // Edit event. The important part is 'from'.
            if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Event event = eventService.getEventById(id);

                loadPageData(request);
                request.setAttribute("event", event);

                String from = request.getParameter("from");
                if ("holidays".equalsIgnoreCase(from)) {
                    request.setAttribute("editSource", "holidays");
                    request.getRequestDispatcher(
                            "/views/admin/event/admin-holidays.jsp"
                    ).forward(request, response);
                } else {
                    request.setAttribute("editSource", "events");
                    request.getRequestDispatcher(
                            "/views/admin/event/admin-add-event.jsp"
                    ).forward(request, response);
                }
                return;
            }

            // Delete event
            if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                eventService.deleteEvent(id);

                String from = request.getParameter("from");
                if ("holidays".equalsIgnoreCase(from)) {
                    response.sendRedirect(request.getContextPath()
                            + "/admin/events?action=list");
                } else {
                    response.sendRedirect(request.getContextPath()
                            + "/admin/events");
                }
                return;
            }

            response.sendRedirect(request.getContextPath() + "/admin/events");

        } catch (BusinessException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            loadPageData(request);
            request.getRequestDispatcher(
                    "/views/admin/event/admin-add-event.jsp"
            ).forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid Event ID");
            loadPageData(request);
            request.getRequestDispatcher(
                    "/views/admin/event/admin-add-event.jsp"
            ).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong");
            loadPageData(request);
            request.getRequestDispatcher(
                    "/views/admin/event/admin-add-event.jsp"
            ).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String returnPage = request.getParameter("returnPage");

        try {
            if ("add".equals(action)) {
                Event event = new Event();
                event.setTitle(request.getParameter("title"));
                event.setDate(request.getParameter("date"));
                event.setEventTypeId(Integer.parseInt(
                        request.getParameter("eventTypeId")));
                event.setStatus(request.getParameter("status"));

                eventService.addEvent(event);
                response.sendRedirect(request.getContextPath() + "/admin/events");
                return;
            }

            if ("update".equals(action)) {
                Event event = new Event();
                event.setId(Integer.parseInt(request.getParameter("id")));
                event.setTitle(request.getParameter("title"));
                event.setDate(request.getParameter("date"));
                event.setEventTypeId(Integer.parseInt(
                        request.getParameter("eventTypeId")));
                event.setStatus(request.getParameter("status"));

                eventService.updateEvent(event);

                // Return to the page from which edit was opened.
                if ("holidays".equalsIgnoreCase(returnPage)) {
                    response.sendRedirect(request.getContextPath()
                            + "/admin/events?action=list");
                } else {
                    response.sendRedirect(request.getContextPath()
                            + "/admin/events");
                }
                return;
            }

            response.sendRedirect(request.getContextPath() + "/admin/events");

        } catch (BusinessException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", e.getMessage());
            reloadAfterPostError(request, response, returnPage);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Please enter valid values");
            reloadAfterPostError(request, response, returnPage);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong");
            reloadAfterPostError(request, response, returnPage);
        }
    }

    private void reloadAfterPostError(HttpServletRequest request,
                                      HttpServletResponse response,
                                      String returnPage)
            throws ServletException, IOException {
        loadPageData(request);

        // If update failed, load the edited event again so the edit modal
        // can remain open with the submitted values where possible.
        String idParam = request.getParameter("id");
        if ("update".equals(request.getParameter("action"))
                && idParam != null && !idParam.isBlank()) {
            try {
                request.setAttribute("event",
                        eventService.getEventById(Integer.parseInt(idParam)));
            } catch (Exception ignored) {
                // Keep the original error message.
            }
        }

        if ("holidays".equalsIgnoreCase(returnPage)) {
            request.setAttribute("editSource", "holidays");
            request.getRequestDispatcher(
                    "/views/admin/event/admin-holidays.jsp"
            ).forward(request, response);
        } else {
            request.setAttribute("editSource", "events");
            request.getRequestDispatcher(
                    "/views/admin/event/admin-add-event.jsp"
            ).forward(request, response);
        }
    }

    private void loadPageData(HttpServletRequest request) {
        try {
            List<Event> events = eventService.getAllEvents();
            List<EventType> eventTypes = eventTypeDAO.getAllEventTypes();

            Map<Integer, String> eventTypeColors = new HashMap<>();
            Map<Integer, String> eventTypeNames = new HashMap<>();

            for (EventType type : eventTypes) {
                eventTypeColors.put(type.getId(), type.getColor());
                eventTypeNames.put(type.getId(), type.getName());
            }

            request.setAttribute("events", events);
            request.setAttribute("eventTypes", eventTypes);
            request.setAttribute("eventTypeColors", eventTypeColors);
            request.setAttribute("eventTypeNames", eventTypeNames);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

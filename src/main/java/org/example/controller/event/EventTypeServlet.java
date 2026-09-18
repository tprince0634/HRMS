package org.example.controller.event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.example.dao.EventTypeDAOImpl;
import org.example.interfaces.EventTypeDAO;
import org.example.model.EventType;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/event-types")
public class EventTypeServlet extends HttpServlet {

    private EventTypeDAO eventTypeDAO;

    @Override
    public void init() throws ServletException {
        eventTypeDAO = new EventTypeDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            // LIST / DEFAULT
            if (action == null || "list".equals(action)) {
                loadEventTypes(request);
                forwardMaster(request, response);
                return;
            }

            // EDIT EVENT TYPE
            if ("edit".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                EventType eventType = eventTypeDAO.getEventTypeById(id);

                if (eventType == null) {
                    request.setAttribute("errorMessage", "Event Type not found");
                } else {
                    request.setAttribute("eventType", eventType);
                }

                loadEventTypes(request);
                forwardMaster(request, response);
                return;
            }

            // DELETE EVENT TYPE
            if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                eventTypeDAO.deleteEventType(id);
                response.sendRedirect(request.getContextPath() + "/admin/event-types");
                return;
            }

            response.sendRedirect(request.getContextPath() + "/admin/event-types");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid Event Type ID");
            try {
                loadEventTypes(request);
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
            forwardMaster(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong");
            try {
                loadEventTypes(request);
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
            forwardMaster(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                EventType eventType = new EventType();
                eventType.setName(request.getParameter("name"));
                eventType.setColor(request.getParameter("color"));

                eventTypeDAO.addEventType(eventType);
                response.sendRedirect(request.getContextPath() + "/admin/event-types");
                return;
            }

            if ("update".equals(action)) {
                EventType eventType = new EventType();
                eventType.setId(Integer.parseInt(request.getParameter("id")));
                eventType.setName(request.getParameter("name"));
                eventType.setColor(request.getParameter("color"));

                eventTypeDAO.updateEventType(eventType);
                response.sendRedirect(request.getContextPath() + "/admin/event-types");
                return;
            }

            response.sendRedirect(request.getContextPath() + "/admin/event-types");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid Event Type ID");
            try {
                loadEventTypes(request);
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
            forwardMaster(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong");
            try {
                loadEventTypes(request);
            } catch (Exception ex) {
                throw new RuntimeException(ex);
            }
            forwardMaster(request, response);
        }
    }

    private void loadEventTypes(HttpServletRequest request) throws Exception {
        List<EventType> eventTypes = eventTypeDAO.getAllEventTypes();
        request.setAttribute("eventTypes", eventTypes);
    }

    private void forwardMaster(HttpServletRequest request,
                               HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher(
                "/views/admin/event/admin-addmasterevent.jsp"
        ).forward(request, response);
    }
}

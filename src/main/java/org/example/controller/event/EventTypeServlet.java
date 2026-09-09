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
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {

            // =========================
            // LIST EVENT TYPES
            // =========================

            if (action == null || action.equals("list")) {

                List<EventType> eventTypes =
                        eventTypeDAO.getAllEventTypes();

                request.setAttribute(
                        "eventTypes",
                        eventTypes
                );

                request.getRequestDispatcher(
                        "/views/admin/event/admin-addmasterevent.jsp"
                ).forward(request, response);
            }

            // =========================
            // EDIT EVENT TYPE
            // =========================

            else if ("edit".equals(action)) {

                int id = Integer.parseInt(
                        request.getParameter("id")
                );

                EventType eventType =
                        eventTypeDAO.getEventTypeById(id);

                List<EventType> eventTypes =
                        eventTypeDAO.getAllEventTypes();

                request.setAttribute(
                        "eventType",
                        eventType
                );

                request.setAttribute(
                        "eventTypes",
                        eventTypes
                );

                request.getRequestDispatcher(
                        "/views/admin/event/admin-addmasterevent.jsp"
                ).forward(request, response);
            }

            // =========================
            // DELETE EVENT TYPE
            // =========================

            else if ("delete".equals(action)) {

                int id = Integer.parseInt(
                        request.getParameter("id")
                );

                eventTypeDAO.deleteEventType(id);

                response.sendRedirect(
                        request.getContextPath()
                                + "/admin/event-types"
                );
            }

        } catch (NumberFormatException e) {

            request.setAttribute(
                    "errorMessage",
                    "Invalid Event Type ID"
            );

            request.getRequestDispatcher(
                    "/views/admin/event/admin-addmasterevent.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Something went wrong"
            );

            request.getRequestDispatcher(
                    "/views/admin/event/admin-addmasterevent.jsp"
            ).forward(request, response);
        }
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {

            // =========================
            // ADD EVENT TYPE
            // =========================

            if ("add".equals(action)) {

                EventType eventType = new EventType();

                eventType.setName(
                        request.getParameter("name")
                );

                eventType.setColor(
                        request.getParameter("color")
                );

                eventTypeDAO.addEventType(eventType);

                response.sendRedirect(
                        request.getContextPath()
                                + "/admin/event-types"
                );
            }

            // =========================
            // UPDATE EVENT TYPE
            // =========================

            else if ("update".equals(action)) {

                EventType eventType = new EventType();

                eventType.setId(
                        Integer.parseInt(
                                request.getParameter("id")
                        )
                );

                eventType.setName(
                        request.getParameter("name")
                );

                eventType.setColor(
                        request.getParameter("color")
                );

                eventTypeDAO.updateEventType(eventType);

                response.sendRedirect(
                        request.getContextPath()
                                + "/admin/event-types"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Something went wrong"
            );

            request.getRequestDispatcher(
                    "/views/admin/event/admin-addmasterevent.jsp"
            ).forward(request, response);
        }
    }
}
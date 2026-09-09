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

    // Direct EventType DAO
    private EventTypeDAO eventTypeDAO;


    @Override
    public void init() throws ServletException {

        EventDAO eventDAO = new EventDAOImpl();

        eventService = new EventServiceImpl(eventDAO);

        eventTypeDAO = new EventTypeDAOImpl();
    }


    // =====================================================
    // GET
    // =====================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        try {

            // =================================================
// MAIN EVENT CALENDAR
// =================================================

            if (action == null) {

                List<Event> events =
                        eventService.getAllEvents();

                List<EventType> eventTypes =
                        eventTypeDAO.getAllEventTypes();

                Map<Integer, String> eventTypeColors =
                        new HashMap<>();

                Map<Integer, String> eventTypeNames =
                        new HashMap<>();

                for (EventType type : eventTypes) {

                    eventTypeColors.put(
                            type.getId(),
                            type.getColor()
                    );

                    eventTypeNames.put(
                            type.getId(),
                            type.getName()
                    );
                }

                request.setAttribute(
                        "events",
                        events
                );

                request.setAttribute(
                        "eventTypes",
                        eventTypes
                );

                request.setAttribute(
                        "eventTypeColors",
                        eventTypeColors
                );

                request.setAttribute(
                        "eventTypeNames",
                        eventTypeNames
                );

                request.getRequestDispatcher(
                        "/views/admin/event/admin-add-event.jsp"
                ).forward(request, response);

                return;
            }


// =================================================
// EVENT LIST / HOLIDAYS
// =================================================

            else if ("list".equals(action)) {

                List<Event> events =
                        eventService.getAllEvents();

                List<EventType> eventTypes =
                        eventTypeDAO.getAllEventTypes();

                Map<Integer, String> eventTypeColors =
                        new HashMap<>();

                Map<Integer, String> eventTypeNames =
                        new HashMap<>();

                for (EventType type : eventTypes) {

                    eventTypeColors.put(
                            type.getId(),
                            type.getColor()
                    );

                    eventTypeNames.put(
                            type.getId(),
                            type.getName()
                    );
                }

                request.setAttribute(
                        "events",
                        events
                );

                request.setAttribute(
                        "eventTypes",
                        eventTypes
                );

                request.setAttribute(
                        "eventTypeColors",
                        eventTypeColors
                );

                request.setAttribute(
                        "eventTypeNames",
                        eventTypeNames
                );

                request.getRequestDispatcher(
                        "/views/admin/event/admin-holidays.jsp"
                ).forward(request, response);

                return;
            }


            // =================================================
            // ADD PAGE
            // =================================================

            /*
             * जर /admin/events?action=add manually open केलं
             * तरी Event Types DB मधून fetch होतील.
             */

            else if ("add".equals(action)) {

                List<Event> events =
                        eventService.getAllEvents();


                List<EventType> eventTypes =
                        eventTypeDAO.getAllEventTypes();


                Map<Integer, String> eventTypeColors =
                        new HashMap<>();


                Map<Integer, String> eventTypeNames =
                        new HashMap<>();


                for (EventType type : eventTypes) {

                    eventTypeColors.put(
                            type.getId(),
                            type.getColor()
                    );


                    eventTypeNames.put(
                            type.getId(),
                            type.getName()
                    );
                }


                request.setAttribute(
                        "events",
                        events
                );


                request.setAttribute(
                        "eventTypes",
                        eventTypes
                );


                request.setAttribute(
                        "eventTypeColors",
                        eventTypeColors
                );


                request.setAttribute(
                        "eventTypeNames",
                        eventTypeNames
                );


                request.getRequestDispatcher(
                        "/views/admin/event/admin-add-event.jsp"
                ).forward(request, response);

                return;
            }


            // =================================================
            // EDIT EVENT
            // =================================================

            else if ("edit".equals(action)) {

                int id = Integer.parseInt(
                        request.getParameter("id")
                );


                Event event =
                        eventService.getEventById(id);


                List<Event> events =
                        eventService.getAllEvents();


                List<EventType> eventTypes =
                        eventTypeDAO.getAllEventTypes();


                Map<Integer, String> eventTypeColors =
                        new HashMap<>();


                Map<Integer, String> eventTypeNames =
                        new HashMap<>();


                for (EventType type : eventTypes) {

                    eventTypeColors.put(
                            type.getId(),
                            type.getColor()
                    );


                    eventTypeNames.put(
                            type.getId(),
                            type.getName()
                    );
                }


                request.setAttribute(
                        "event",
                        event
                );


                request.setAttribute(
                        "events",
                        events
                );


                request.setAttribute(
                        "eventTypes",
                        eventTypes
                );


                request.setAttribute(
                        "eventTypeColors",
                        eventTypeColors
                );


                request.setAttribute(
                        "eventTypeNames",
                        eventTypeNames
                );


                request.getRequestDispatcher(
                        "/views/admin/event/admin-add-event.jsp"
                ).forward(request, response);

                return;
            }


            // =================================================
            // DELETE EVENT
            // =================================================

            else if ("delete".equals(action)) {

                int id = Integer.parseInt(
                        request.getParameter("id")
                );


                eventService.deleteEvent(id);


                response.sendRedirect(
                        request.getContextPath()
                                + "/admin/events"
                );

                return;
            }

        }
        catch (BusinessException e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    e.getMessage()
            );


            request.getRequestDispatcher(
                    "/views/admin/event/admin-add-event.jsp"
            ).forward(request, response);
        }
        catch (NumberFormatException e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Invalid Event ID"
            );


            request.getRequestDispatcher(
                    "/views/admin/event/admin-add-event.jsp"
            ).forward(request, response);
        }
        catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Something went wrong"
            );


            request.getRequestDispatcher(
                    "/views/admin/event/admin-add-event.jsp"
            ).forward(request, response);
        }
    }


    // =====================================================
    // POST
    // =====================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action =
                request.getParameter("action");


        try {

            // =================================================
            // ADD EVENT
            // =================================================

            if ("add".equals(action)) {

                Event event = new Event();


                event.setTitle(
                        request.getParameter("title")
                );


                event.setDate(
                        request.getParameter("date")
                );


                event.setEventTypeId(
                        Integer.parseInt(
                                request.getParameter(
                                        "eventTypeId"
                                )
                        )
                );


                event.setStatus(
                        request.getParameter("status")
                );


                // Save event in DB
                eventService.addEvent(event);


                // After adding → calendar
                response.sendRedirect(
                        request.getContextPath()
                                + "/admin/events"
                );

                return;
            }


            // =================================================
            // UPDATE EVENT
            // =================================================

            else if ("update".equals(action)) {

                Event event = new Event();


                event.setId(
                        Integer.parseInt(
                                request.getParameter("id")
                        )
                );


                event.setTitle(
                        request.getParameter("title")
                );


                event.setDate(
                        request.getParameter("date")
                );


                event.setEventTypeId(
                        Integer.parseInt(
                                request.getParameter(
                                        "eventTypeId"
                                )
                        )
                );


                event.setStatus(
                        request.getParameter("status")
                );


                eventService.updateEvent(event);


                response.sendRedirect(
                        request.getContextPath()
                                + "/admin/events"
                );

                return;
            }

        }
        catch (BusinessException e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    e.getMessage()
            );


            // Important:
            // POST error झाल्यास eventTypes पुन्हा fetch करा

            loadPageData(request);


            request.getRequestDispatcher(
                    "/views/admin/event/admin-add-event.jsp"
            ).forward(request, response);
        }
        catch (NumberFormatException e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Please enter valid values"
            );


            loadPageData(request);


            request.getRequestDispatcher(
                    "/views/admin/event/admin-add-event.jsp"
            ).forward(request, response);
        }
        catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "errorMessage",
                    "Something went wrong"
            );


            loadPageData(request);


            request.getRequestDispatcher(
                    "/views/admin/event/admin-add-event.jsp"
            ).forward(request, response);
        }
    }


    // =====================================================
    // LOAD PAGE DATA
    // =====================================================

    private void loadPageData(
            HttpServletRequest request) {

        try {

            List<Event> events =
                    eventService.getAllEvents();


            List<EventType> eventTypes =
                    eventTypeDAO.getAllEventTypes();


            Map<Integer, String> eventTypeColors =
                    new HashMap<>();


            Map<Integer, String> eventTypeNames =
                    new HashMap<>();


            for (EventType type : eventTypes) {

                eventTypeColors.put(
                        type.getId(),
                        type.getColor()
                );


                eventTypeNames.put(
                        type.getId(),
                        type.getName()
                );
            }


            request.setAttribute(
                    "events",
                    events
            );


            request.setAttribute(
                    "eventTypes",
                    eventTypes
            );


            request.setAttribute(
                    "eventTypeColors",
                    eventTypeColors
            );


            request.setAttribute(
                    "eventTypeNames",
                    eventTypeNames
            );

        }
        catch (Exception e) {

            e.printStackTrace();
        }
    }
}
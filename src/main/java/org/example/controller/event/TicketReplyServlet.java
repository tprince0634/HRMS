
package org.example.controller.event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.example.dao.UserDAOImpl;
import org.example.interfaces.UserDao;
import org.example.model.Ticket;
import org.example.model.TicketReply;
import org.example.model.User;
import org.example.service.TicketReplyServiceImpl;
import org.example.service.TicketServiceImpl;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(urlPatterns = {
        "/admin/ticket-replies",
        "/manager/ticket-replies",
        "/employee/ticket-replies"
})
public class TicketReplyServlet extends HttpServlet {

    private TicketReplyServiceImpl replyService;
    private TicketServiceImpl ticketService;
    private UserDAOImpl userDao;


    @Override
    public void init() {

        replyService =
                new TicketReplyServiceImpl();

        ticketService =
                new TicketServiceImpl();

        userDao =
                new UserDAOImpl();
    }


    // =========================================================
    // GET
    // =========================================================

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (!isLoggedIn(session)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return;
        }


        String action =
                request.getParameter("action");


        if (action == null ||
                action.trim().isEmpty()) {

            action = "ticket";
        }


        switch (action) {

            case "ticket":

                showTicketReplies(
                        request,
                        response
                );

                break;


            case "edit":

                showEditReply(
                        request,
                        response
                );

                break;


            case "delete":

                deleteReply(
                        request,
                        response
                );

                break;


            default:

                redirectTicketList(
                        request,
                        response
                );
        }
    }


    // =========================================================
    // POST
    // =========================================================

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session =
                request.getSession(false);


        if (!isLoggedIn(session)) {

            response.sendRedirect(
                    request.getContextPath()
                            + "/login"
            );

            return;
        }


        String action =
                request.getParameter("action");


        if ("add".equals(action)) {

            addReply(
                    request,
                    response
            );

        } else if ("update".equals(action)) {

            updateReply(
                    request,
                    response
            );

        } else if ("delete".equals(action)) {

            deleteReply(
                    request,
                    response
            );

        } else {

            redirectTicketList(
                    request,
                    response
            );
        }
    }


    // =========================================================
    // SHOW REPLIES
    // =========================================================

    private void showTicketReplies(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int ticketId =
                    Integer.parseInt(
                            request.getParameter(
                                    "ticketId"
                            )
                    );


            Ticket ticket =
                    ticketService.getTicketById(
                            ticketId
                    );


            if (ticket == null) {

                redirectTicketList(
                        request,
                        response
                );

                return;
            }


            // Permission check

            if (!canAccessTicket(
                    request,
                    ticket
            )) {

                response.sendError(
                        HttpServletResponse.SC_FORBIDDEN
                );

                return;
            }


            List<TicketReply> replies =
                    replyService.getRepliesByTicketId(
                            ticketId
                    );


            request.setAttribute(
                    "ticket",
                    ticket
            );


            request.setAttribute(
                    "ticketId",
                    ticketId
            );


            request.setAttribute(
                    "replies",
                    replies
            );


            request.getRequestDispatcher(
                    "/views/admin/ticket/admin-ticket-reply.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();

            redirectTicketList(
                    request,
                    response
            );
        }
    }


    // =========================================================
    // ADD REPLY
    // =========================================================

    private void addReply(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int ticketId = 0;


        try {

            HttpSession session =
                    request.getSession(false);


            Integer userId = getSessionUserId(session);


            if (userId == null) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/login"
                );

                return;
            }


            ticketId =
                    Integer.parseInt(
                            request.getParameter(
                                    "ticketId"
                            )
                    );


            Ticket ticket =
                    ticketService.getTicketById(
                            ticketId
                    );


            if (ticket == null) {

                redirectTicketList(
                        request,
                        response
                );

                return;
            }


            // Check ticket access

            if (!canAccessTicket(
                    request,
                    ticket
            )) {

                response.sendError(
                        HttpServletResponse.SC_FORBIDDEN
                );

                return;
            }


            String message =
                    request.getParameter(
                            "replyMessage"
                    );


            if (message == null ||
                    message.trim().isEmpty()) {

                redirectToConversation(
                        request,
                        response,
                        ticketId
                );

                return;
            }


            // =================================================
            // FIND LOGGED-IN USER
            // =================================================

            User user =
                    userDao.findById(
                            userId
                    );


            if (user == null) {

                response.sendRedirect(
                        request.getContextPath()
                                + "/login"
                );

                return;
            }


            String repliedBy =
                    user.getFirstName();


            if (user.getLastName() != null &&
                    !user.getLastName()
                            .trim()
                            .isEmpty()) {

                repliedBy =
                        user.getFirstName()
                                + " "
                                + user.getLastName();
            }


            // =================================================
            // CREATE REPLY
            // =================================================

            TicketReply reply =
                    TicketReply.builder()

                            .ticketId(
                                    ticketId
                            )

                            .replyMessage(
                                    message.trim()
                            )

                            .repliedBy(
                                    repliedBy
                            )

                            .repliedAt(
                                    LocalDateTime.now()
                            )

                            .build();


            replyService.addTicketReply(
                    reply
            );


            redirectToConversation(
                    request,
                    response,
                    ticketId
            );


        } catch (Exception e) {

            e.printStackTrace();

            if (ticketId > 0) {

                redirectToConversation(
                        request,
                        response,
                        ticketId
                );

            } else {

                redirectTicketList(
                        request,
                        response
                );
            }
        }
    }


    // =========================================================
    // EDIT REPLY
    // =========================================================

    private void showEditReply(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession(false);


            String role =
                    (String) session.getAttribute(
                            "userRole"
                    );


            // Admin only

            if (!"Admin".equalsIgnoreCase(role)) {

                response.sendError(
                        HttpServletResponse.SC_FORBIDDEN
                );

                return;
            }


            int replyId =
                    Integer.parseInt(
                            request.getParameter(
                                    "id"
                            )
                    );


            TicketReply reply =
                    replyService.getTicketReplyById(
                            replyId
                    );


            if (reply == null) {

                redirectTicketList(
                        request,
                        response
                );

                return;
            }


            Ticket ticket =
                    ticketService.getTicketById(
                            reply.getTicketId()
                    );


            List<TicketReply> replies =
                    replyService.getRepliesByTicketId(
                            reply.getTicketId()
                    );


            request.setAttribute(
                    "reply",
                    reply
            );


            request.setAttribute(
                    "ticket",
                    ticket
            );


            request.setAttribute(
                    "ticketId",
                    reply.getTicketId()
            );


            request.setAttribute(
                    "replies",
                    replies
            );


            request.getRequestDispatcher(
                    "/views/admin/ticket/admin-ticket-reply.jsp"
            ).forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();

            redirectTicketList(
                    request,
                    response
            );
        }
    }


    // =========================================================
    // UPDATE REPLY
    // =========================================================

    private void updateReply(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int ticketId = 0;


        try {

            HttpSession session =
                    request.getSession(false);


            String role =
                    (String) session.getAttribute(
                            "userRole"
                    );


            // Admin only

            if (!"Admin".equalsIgnoreCase(role)) {

                response.sendError(
                        HttpServletResponse.SC_FORBIDDEN
                );

                return;
            }


            int replyId =
                    Integer.parseInt(
                            request.getParameter(
                                    "replyId"
                            )
                    );


            ticketId =
                    Integer.parseInt(
                            request.getParameter(
                                    "ticketId"
                            )
                    );


            String message =
                    request.getParameter(
                            "replyMessage"
                    );


            if (message == null ||
                    message.trim().isEmpty()) {

                redirectToConversation(
                        request,
                        response,
                        ticketId
                );

                return;
            }


            TicketReply oldReply =
                    replyService.getTicketReplyById(
                            replyId
                    );


            if (oldReply == null) {

                redirectToConversation(
                        request,
                        response,
                        ticketId
                );

                return;
            }


            /*
             * RepliedBy should not come from JSP.
             */

            Integer userId = getSessionUserId(session);


            User user =
                    userDao.findById(
                            userId
                    );


            String repliedBy =
                    user.getFirstName();


            if (user.getLastName() != null &&
                    !user.getLastName()
                            .trim()
                            .isEmpty()) {

                repliedBy =
                        user.getFirstName()
                                + " "
                                + user.getLastName();
            }


            oldReply.setReplyMessage(
                    message.trim()
            );

            oldReply.setRepliedBy(
                    repliedBy
            );

            oldReply.setRepliedAt(
                    LocalDateTime.now()
            );


            replyService.updateTicketReply(
                    oldReply
            );


            redirectToConversation(
                    request,
                    response,
                    ticketId
            );


        } catch (Exception e) {

            e.printStackTrace();

            if (ticketId > 0) {

                redirectToConversation(
                        request,
                        response,
                        ticketId
                );

            } else {

                redirectTicketList(
                        request,
                        response
                );
            }
        }
    }


    // =========================================================
    // DELETE
    // =========================================================

    private void deleteReply(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        int ticketId = 0;


        try {

            HttpSession session =
                    request.getSession(false);


            String role =
                    (String) session.getAttribute(
                            "userRole"
                    );


            // Admin only

            if (!"Admin".equalsIgnoreCase(role)) {

                response.sendError(
                        HttpServletResponse.SC_FORBIDDEN
                );

                return;
            }


            int replyId =
                    Integer.parseInt(
                            request.getParameter(
                                    "id"
                            )
                    );


            String ticketIdParam =
                    request.getParameter(
                            "ticketId"
                    );


            if (ticketIdParam != null &&
                    !ticketIdParam.trim().isEmpty()) {

                ticketId =
                        Integer.parseInt(
                                ticketIdParam
                        );
            }


            replyService.deleteTicketReply(
                    replyId
            );


        } catch (Exception e) {

            e.printStackTrace();
        }


        if (ticketId > 0) {

            redirectToConversation(
                    request,
                    response,
                    ticketId
            );

        } else {

            redirectTicketList(
                    request,
                    response
            );
        }
    }


    // =========================================================
    // ACCESS CHECK
    // =========================================================

    private boolean canAccessTicket(
            HttpServletRequest request,
            Ticket ticket) {

        HttpSession session =
                request.getSession(false);


        Integer userId =
                (Integer) session.getAttribute(
                        "userId"
                );


        String role =
                (String) session.getAttribute(
                        "userRole"
                );


        if (userId == null ||
                role == null) {

            return false;
        }


        // Admin

        if ("Admin".equalsIgnoreCase(role)) {

            return true;
        }


        // Employee

        if ("Employee".equalsIgnoreCase(role)) {

            return same(ticket.getRaisedBy(), userId) ||
                    same(ticket.getAssignedTo(), userId);
        }


        // Manager

        if ("Manager".equalsIgnoreCase(role)) {

            return "Open".equalsIgnoreCase(ticket.getStatus())
                    || "Reopened".equalsIgnoreCase(ticket.getStatus())
                    || same(ticket.getAssignedBy(), userId);
        }


        return false;
    }


    // =========================================================
    // SESSION
    // =========================================================

    private boolean isLoggedIn(
            HttpSession session) {

        return session != null &&
                session.getAttribute(
                        "userId"
                ) != null &&
                session.getAttribute(
                        "userRole"
                ) != null;
    }


    // =========================================================
    // REDIRECT CONVERSATION
    // =========================================================

    private void redirectToConversation(
            HttpServletRequest request,
            HttpServletResponse response,
            int ticketId)
            throws IOException {

        response.sendRedirect(
                getTicketReplyBaseUrl(request)
                        + "?action=ticket"
                        + "&ticketId="
                        + ticketId
        );
    }


    // =========================================================
    // REDIRECT TICKET LIST
    // =========================================================

    private void redirectTicketList(
            HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        response.sendRedirect(
                getTicketBaseUrl(request)
                        + "?action=list"
        );
    }

    private String getTicketBaseUrl(HttpServletRequest request) {
        String uri = request.getRequestURI();

        if (uri.contains("/manager/ticket-replies")) {
            return request.getContextPath() + "/manager/tickets";
        }

        if (uri.contains("/employee/ticket-replies")) {
            return request.getContextPath() + "/employee/tickets";
        }

        return request.getContextPath() + "/admin/tickets";
    }

    private String getTicketReplyBaseUrl(HttpServletRequest request) {
        String uri = request.getRequestURI();

        if (uri.contains("/manager/ticket-replies")) {
            return request.getContextPath() + "/manager/ticket-replies";
        }

        if (uri.contains("/employee/ticket-replies")) {
            return request.getContextPath() + "/employee/ticket-replies";
        }

        return request.getContextPath() + "/admin/ticket-replies";
    }

    private boolean same(Integer a, Integer b) {
        return a != null && b != null && a.equals(b);
    }

    private Integer getSessionUserId(HttpSession session) {
        if (session == null) return null;
        Object value = session.getAttribute("userId");
        if (value instanceof Number) return ((Number) value).intValue();
        if (value == null) return null;
        try {
            return Integer.valueOf(value.toString().trim());
        } catch (NumberFormatException e) {
            return null;
        }
    }
}

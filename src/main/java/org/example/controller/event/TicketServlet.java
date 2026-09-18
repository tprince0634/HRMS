
package org.example.controller.event;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.example.dao.TicketDAOImpl;
import org.example.model.Ticket;
import org.example.model.TicketReply;
import org.example.model.User;
import org.example.service.TicketReplyServiceImpl;
import org.example.service.TicketServiceImpl;
import org.example.dao.UserDAOImpl;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = {
        "/admin/tickets",
        "/manager/tickets",
        "/employee/tickets"
})
public class TicketServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private TicketServiceImpl ticketService;
    private TicketDAOImpl ticketDAO;
    private TicketReplyServiceImpl replyService;
    private UserDAOImpl userDAO;

    @Override
    public void init() throws ServletException {
        ticketDAO = new TicketDAOImpl();
        ticketService = new TicketServiceImpl(ticketDAO);
        replyService = new TicketReplyServiceImpl();
        userDAO = new UserDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (!isLoggedIn(session)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = trim(request.getParameter("action"));
        if (action.isEmpty()) action = "list";

        try {
            switch (action.toLowerCase()) {
                case "add":
                    showAddPage(request, response);
                    break;
                case "view":
                    showViewPage(request, response);
                    break;
                case "edit":
                    showEditPage(request, response);
                    break;
                case "delete":
                    deleteTicket(request, response);
                    break;
                case "list":
                    listTickets(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ticket action.");
            }
        } catch (IllegalArgumentException e) {
            setError(session, e.getMessage());
            redirectList(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            setError(session, "Unable to process ticket request.");
            redirectList(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (!isLoggedIn(session)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = trim(request.getParameter("action"));
        if (action.isEmpty()) {
            redirectList(request, response);
            return;
        }

        try {
            switch (action.toLowerCase()) {
                case "add":
                    addTicket(request, response);
                    break;
                case "update":
                    updateTicket(request, response);
                    break;
                case "delete":
                    deleteTicket(request, response);
                    break;
                case "assign":
                    assignTicket(request, response);
                    break;
                case "status":
                    updateStatus(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ticket action.");
            }
        } catch (IllegalArgumentException e) {
            setError(session, e.getMessage());
            redirectList(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            setError(session, "Unable to process ticket request.");
            redirectList(request, response);
        }
    }

    private void listTickets(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Integer userId = getSessionUserId(session);
        String role = trim((String) session.getAttribute("userRole"));

        List<Ticket> allTickets = ticketService.getAllTickets();
        List<Ticket> visible = new ArrayList<>();

        for (Ticket ticket : allTickets) {
            if (canView(role, userId, ticket)) {
                visible.add(ticket);
            }
        }

        request.setAttribute("tickets", visible);

        if ("Manager".equalsIgnoreCase(role)) {
            loadEmployees(request);
        }

        consumeMessages(request, session);

        request.getRequestDispatcher("/views/admin/ticket/admin-ticket.jsp")
                .forward(request, response);
    }

    private void showAddPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String role = trim((String) request.getSession(false).getAttribute("userRole"));
        if (!"Employee".equalsIgnoreCase(role) && !"Admin".equalsIgnoreCase(role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        request.setAttribute("ticket", null);
        request.setAttribute("editMode", false);
        request.getRequestDispatcher("/views/admin/ticket/admin-ticket.jsp")
                .forward(request, response);
    }

    private void addTicket(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        Integer userId = getSessionUserId(session);
        String role = trim((String) session.getAttribute("userRole"));

        if (userId == null ||
                (!"Employee".equalsIgnoreCase(role) && !"Admin".equalsIgnoreCase(role))) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        String subject = required(request.getParameter("subject"), "Subject is required.");
        String description = required(request.getParameter("ticketDescription"), "Description is required.");
        String priority = trim(request.getParameter("priority"));
        String visibility = trim(request.getParameter("visibility"));

        if (!isPriority(priority)) throw new IllegalArgumentException("Invalid priority.");
        if (visibility.isEmpty()) visibility = "Private";

        Ticket ticket = Ticket.builder()
                .ticketTitle(trim(request.getParameter("ticketTitle")))
                .eventCategory(trim(request.getParameter("eventCategory")))
                .subject(subject)
                .raisedBy(userId)
                .assignedBy(null)
                .assignedTo(null)
                .ticketDescription(description)
                .priority(priority)
                .status("Open")
                .visibility(visibility)
                .createdAt(LocalDateTime.now())
                .build();

        if (ticketService.addTicket(ticket)) {
            setSuccess(session, "Ticket " + ticket.getTicketNo() + " created successfully.");
        } else {
            setError(session, "Unable to create ticket.");
        }
        redirectList(request, response);
    }

    private void showViewPage(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int ticketId = parsePositiveInt(request.getParameter("id"), "Ticket ID is required.");
        response.sendRedirect(getTicketReplyBaseUrl(request) +
                "?action=ticket&ticketId=" + ticketId);
    }

    private void showEditPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        String role = trim((String) session.getAttribute("userRole"));
        if (!"Admin".equalsIgnoreCase(role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        int ticketId = parsePositiveInt(request.getParameter("id"), "Ticket ID is required.");
        Ticket ticket = ticketService.getTicketById(ticketId);
        if (ticket == null) throw new IllegalArgumentException("Ticket not found.");

        request.setAttribute("ticket", ticket);
        request.setAttribute("editMode", true);
        request.getRequestDispatcher("/views/admin/ticket/admin-ticket.jsp")
                .forward(request, response);
    }

    private void updateTicket(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        String role = trim((String) session.getAttribute("userRole"));
        if (!"Admin".equalsIgnoreCase(role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        int ticketId = parsePositiveInt(request.getParameter("ticketId"), "Ticket ID is required.");
        Ticket ticket = ticketService.getTicketById(ticketId);
        if (ticket == null) throw new IllegalArgumentException("Ticket not found.");

        ticket.setTicketTitle(trim(request.getParameter("ticketTitle")));
        ticket.setEventCategory(trim(request.getParameter("eventCategory")));
        ticket.setSubject(required(request.getParameter("subject"), "Subject is required."));
        ticket.setTicketDescription(required(request.getParameter("ticketDescription"), "Description is required."));
        ticket.setPriority(trim(request.getParameter("priority")));
        ticket.setVisibility(trim(request.getParameter("visibility")));

        if (!isPriority(ticket.getPriority())) throw new IllegalArgumentException("Invalid priority.");

        if (ticketService.updateTicket(ticket)) {
            setSuccess(session, "Ticket updated successfully.");
        } else {
            setError(session, "Unable to update ticket.");
        }
        redirectList(request, response);
    }

    private void deleteTicket(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        String role = trim((String) session.getAttribute("userRole"));
        if (!"Admin".equalsIgnoreCase(role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        int ticketId = parsePositiveInt(
                request.getParameter("id") != null ? request.getParameter("id") : request.getParameter("ticketId"),
                "Ticket ID is required.");

        if (ticketService.deleteTicket(ticketId)) {
            setSuccess(session, "Ticket deleted successfully.");
        } else {
            setError(session, "Unable to delete ticket.");
        }
        redirectList(request, response);
    }

    private void assignTicket(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        Integer managerId = getSessionUserId(session);
        String role = trim((String) session.getAttribute("userRole"));

        if (managerId == null || !"Manager".equalsIgnoreCase(role)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        int ticketId = parsePositiveInt(request.getParameter("ticketId"), "Ticket ID is required.");
        int assignedTo = parsePositiveInt(request.getParameter("assignedTo"), "Please select an employee.");

        Ticket ticket = ticketService.getTicketById(ticketId);
        if (ticket == null) throw new IllegalArgumentException("Ticket not found.");

        if (!"Open".equalsIgnoreCase(ticket.getStatus()) &&
                !"Reopened".equalsIgnoreCase(ticket.getStatus())) {
            throw new IllegalArgumentException("Only Open or Reopened tickets can be assigned.");
        }

        if (!isValidEmployee(assignedTo)) {
            throw new IllegalArgumentException("Selected employee is invalid.");
        }

        ticket.setAssignedBy(managerId);
        ticket.setAssignedTo(assignedTo);
        ticket.setStatus("Assigned");

        if (!ticketService.updateTicket(ticket)) {
            throw new IllegalArgumentException("Unable to assign ticket.");
        }

        String comment = trim(request.getParameter("assignmentComment"));
        if (!comment.isEmpty()) {
            saveSystemReply(ticketId, managerId, "Assignment: " + comment);
        }

        setSuccess(session, "Ticket assigned successfully.");
        redirectList(request, response);
    }

    private void updateStatus(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);
        Integer userId = getSessionUserId(session);
        String role = trim((String) session.getAttribute("userRole"));

        if (userId == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int ticketId = parsePositiveInt(request.getParameter("ticketId"), "Ticket ID is required.");
        String newStatus = trim(request.getParameter("status"));
        Ticket ticket = ticketService.getTicketById(ticketId);

        if (ticket == null) throw new IllegalArgumentException("Ticket not found.");

        boolean allowed = false;

        if ("Employee".equalsIgnoreCase(role)) {
            if (same(ticket.getAssignedTo(), userId) &&
                    ("Assigned".equalsIgnoreCase(ticket.getStatus()) ||
                            "Reopened".equalsIgnoreCase(ticket.getStatus())) &&
                    "In Progress".equalsIgnoreCase(newStatus)) {
                allowed = true;
            }

            if (same(ticket.getAssignedTo(), userId) &&
                    "In Progress".equalsIgnoreCase(ticket.getStatus()) &&
                    "Resolved".equalsIgnoreCase(newStatus)) {

                String solution = required(
                        request.getParameter("resolutionComment"),
                        "Please enter the solution before resolving the ticket.");

                saveSystemReply(ticketId, userId, "Solution: " + solution);
                allowed = true;
            }

            if (same(ticket.getRaisedBy(), userId) &&
                    "Resolved".equalsIgnoreCase(ticket.getStatus()) &&
                    "Closed".equalsIgnoreCase(newStatus)) {
                allowed = true;
            }

            if (same(ticket.getRaisedBy(), userId) &&
                    ("Resolved".equalsIgnoreCase(ticket.getStatus()) ||
                            "Closed".equalsIgnoreCase(ticket.getStatus())) &&
                    "Reopened".equalsIgnoreCase(newStatus)) {
                allowed = true;
            }
        }

        if (!allowed && "Admin".equalsIgnoreCase(role)) {
            allowed = isAdminStatusTransition(ticket.getStatus(), newStatus);
        }

        if (!allowed) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN);
            return;
        }

        ticket.setStatus(newStatus);
        if (!ticketService.updateTicket(ticket)) {
            throw new IllegalArgumentException("Unable to update ticket status.");
        }

        setSuccess(session, "Ticket status changed to " + newStatus + ".");
        response.sendRedirect(getTicketReplyBaseUrl(request) +
                "?action=ticket&ticketId=" + ticketId);
    }

    private boolean isAdminStatusTransition(String oldStatus, String newStatus) {
        if (oldStatus == null || newStatus == null) return false;
        if ("Closed".equalsIgnoreCase(oldStatus)) return "Reopened".equalsIgnoreCase(newStatus);
        return "Open".equalsIgnoreCase(newStatus) ||
                "Assigned".equalsIgnoreCase(newStatus) ||
                "In Progress".equalsIgnoreCase(newStatus) ||
                "Resolved".equalsIgnoreCase(newStatus) ||
                "Closed".equalsIgnoreCase(newStatus) ||
                "Reopened".equalsIgnoreCase(newStatus);
    }

    private boolean canView(String role, Integer userId, Ticket ticket) {
        if (userId == null || ticket == null) return false;
        if ("Admin".equalsIgnoreCase(role)) return true;

        if ("Manager".equalsIgnoreCase(role)) {
            return "Open".equalsIgnoreCase(ticket.getStatus()) ||
                    "Reopened".equalsIgnoreCase(ticket.getStatus()) ||
                    same(ticket.getAssignedBy(), userId);
        }

        if ("Employee".equalsIgnoreCase(role)) {
            return same(ticket.getRaisedBy(), userId) ||
                    same(ticket.getAssignedTo(), userId);
        }

        return false;
    }

    private void loadEmployees(HttpServletRequest request) {
        try {
            request.setAttribute("employees", ticketDAO.getTicketEmployees());
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("employees", new ArrayList<Map<String, Object>>());
        }
    }

    private boolean isValidEmployee(int userId) {
        try {
            for (Map<String, Object> employee : ticketDAO.getTicketEmployees()) {
                Object value = employee.get("userId");
                if (value instanceof Number && ((Number) value).intValue() == userId) return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private void saveSystemReply(int ticketId, int userId, String message) {
        try {
            User user = userDAO.findById(userId);
            if (user == null) return;

            String first = trim(user.getFirstName());
            String last = trim(user.getLastName());
            String name = (first + " " + last).trim();
            if (name.isEmpty()) name = "User #" + userId;

            TicketReply reply = TicketReply.builder()
                    .ticketId(ticketId)
                    .replyMessage(message)
                    .repliedBy(name)
                    .repliedAt(LocalDateTime.now())
                    .build();

            replyService.addTicketReply(reply);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void consumeMessages(HttpServletRequest request, HttpSession session) {
        Object success = session.getAttribute("ticketSuccess");
        Object error = session.getAttribute("ticketError");
        if (success != null) { request.setAttribute("successMessage", success); session.removeAttribute("ticketSuccess"); }
        if (error != null) { request.setAttribute("errorMessage", error); session.removeAttribute("ticketError"); }
    }

    private Integer getSessionUserId(HttpSession session) {
        if (session == null) return null;
        Object value = session.getAttribute("userId");
        if (value instanceof Number) return ((Number) value).intValue();
        try { return value == null ? null : Integer.valueOf(value.toString()); }
        catch (NumberFormatException e) { return null; }
    }

    private boolean isLoggedIn(HttpSession session) {
        return session != null && getSessionUserId(session) != null &&
                session.getAttribute("userRole") != null;
    }

    private boolean same(Integer a, Integer b) {
        return a != null && b != null && a.equals(b);
    }

    private int parsePositiveInt(String value, String message) {
        if (value == null || value.trim().isEmpty()) throw new IllegalArgumentException(message);
        try {
            int n = Integer.parseInt(value.trim());
            if (n <= 0) throw new IllegalArgumentException(message);
            return n;
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException(message);
        }
    }

    private String required(String value, String message) {
        String result = trim(value);
        if (result.isEmpty()) throw new IllegalArgumentException(message);
        return result;
    }

    private boolean isPriority(String value) {
        return "Low".equalsIgnoreCase(value) ||
                "Medium".equalsIgnoreCase(value) ||
                "High".equalsIgnoreCase(value);
    }

    private String trim(String value) {
        return value == null ? "" : value.trim();
    }

    private void setSuccess(HttpSession session, String message) {
        session.setAttribute("ticketSuccess", message);
    }

    private void setError(HttpSession session, String message) {
        session.setAttribute("ticketError", message == null ? "Ticket operation failed." : message);
    }

    private void redirectList(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.sendRedirect(getTicketBaseUrl(request) + "?action=list");
    }

    private String getTicketBaseUrl(HttpServletRequest request) {

        String uri = request.getRequestURI();

        if (uri.contains("/manager/tickets")) {
            return request.getContextPath() + "/manager/tickets";
        }

        if (uri.contains("/employee/tickets")) {
            return request.getContextPath() + "/employee/tickets";
        }

        return request.getContextPath() + "/admin/tickets";
    }

    private String getTicketReplyBaseUrl(HttpServletRequest request) {
        String uri = request.getRequestURI();

        if (uri.contains("/manager/tickets")) {
            return request.getContextPath() + "/manager/ticket-replies";
        }

        if (uri.contains("/employee/tickets")) {
            return request.getContextPath() + "/employee/ticket-replies";
        }

        return request.getContextPath() + "/admin/ticket-replies";
    }

}


<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tickets</title>
    <style>
        body{font-family:Arial,sans-serif;background:#f5f6fa;margin:0;padding:30px;color:#111827}
        .container{max-width:1250px;margin:auto}.card{background:#fff;border-radius:10px;padding:25px;margin-bottom:20px;box-shadow:0 2px 10px rgba(0,0,0,.08)}
        .top{display:flex;justify-content:space-between;align-items:center;gap:20px}.grid{display:grid;grid-template-columns:1fr 1fr;gap:18px}.full{grid-column:1/-1}
        label{font-weight:700;display:block;margin-bottom:6px}input,textarea,select{width:100%;box-sizing:border-box;padding:10px;border:1px solid #d1d5db;border-radius:6px;margin-bottom:14px}textarea{min-height:120px}
        table{width:100%;border-collapse:collapse}th,td{padding:12px;border-bottom:1px solid #e5e7eb;text-align:left;vertical-align:top}th{background:#f1f3f5}
        .btn{display:inline-block;border:0;border-radius:6px;padding:9px 15px;text-decoration:none;cursor:pointer;margin:2px;color:#fff}.primary{background:#0d6efd}.success{background:#198754}.warning{background:#ffc107;color:#111}.danger{background:#dc3545}.secondary{background:#6c757d}
        .status{display:inline-block;background:#eee;border-radius:20px;padding:5px 10px}.alert{padding:12px;border-radius:6px;margin-bottom:15px}.ok{background:#d1e7dd;color:#0f5132}.err{background:#f8d7da;color:#842029}.muted{color:#6b7280}.empty{text-align:center;padding:30px;color:#777}
        @media(max-width:800px){.grid{grid-template-columns:1fr}.full{grid-column:auto}.top{align-items:flex-start;flex-direction:column}}
    </style>
</head>
<body>
<div class="container">

    <c:if test="${not empty successMessage}"><div class="alert ok">${successMessage}</div></c:if>
    <c:if test="${not empty errorMessage}"><div class="alert err">${errorMessage}</div></c:if>

    <c:if test="${editMode and not empty ticket}">
        <div class="card">
            <h2>Edit Ticket</h2>
            <form method="post" action="${pageContext.request.contextPath}/admin/tickets">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="ticketId" value="${ticket.ticketId}">
                <div class="grid">
                    <div><label>Ticket Title</label><input name="ticketTitle" value="${ticket.ticketTitle}" maxlength="200"></div>
                    <div><label>Event Category</label><input name="eventCategory" value="${ticket.eventCategory}"></div>
                    <div class="full"><label>Subject</label><input name="subject" value="${ticket.subject}" maxlength="200" required></div>
                    <div class="full"><label>Description</label><textarea name="ticketDescription" required>${ticket.ticketDescription}</textarea></div>
                    <div><label>Priority</label><select name="priority" required>
                        <option value="Low" ${ticket.priority eq 'Low' ? 'selected' : ''}>Low</option>
                        <option value="Medium" ${ticket.priority eq 'Medium' ? 'selected' : ''}>Medium</option>
                        <option value="High" ${ticket.priority eq 'High' ? 'selected' : ''}>High</option>
                    </select></div>
                    <div><label>Visibility</label><select name="visibility">
                        <option value="Private" ${ticket.visibility eq 'Private' ? 'selected' : ''}>Private</option>
                        <option value="Public" ${ticket.visibility eq 'Public' ? 'selected' : ''}>Public</option>
                    </select></div>
                </div>
                <button class="btn success" type="submit">Update Ticket</button>
                <a class="btn secondary" href="${pageContext.request.contextPath}/admin/tickets?action=list">Cancel</a>
            </form>
        </div>
    </c:if>

    <c:if test="${empty ticket and (sessionScope.userRole eq 'Employee' or sessionScope.userRole eq 'Admin')}">
        <div class="card">
            <h2>Raise New Ticket</h2>
            <form method="post" action="${pageContext.request.contextPath}/admin/tickets">
                <input type="hidden" name="action" value="add">
                <div class="grid">
                    <div><label>Ticket Title</label><input name="ticketTitle" maxlength="200" placeholder="Optional"></div>
                    <div><label>Event Category</label><input name="eventCategory" placeholder="Optional"></div>
                    <div class="full"><label>Subject</label><input name="subject" maxlength="200" required></div>
                    <div class="full"><label>Description</label><textarea name="ticketDescription" maxlength="5000" required></textarea></div>
                    <div><label>Priority</label><select name="priority" required><option>Low</option><option selected>Medium</option><option>High</option></select></div>
                    <div><label>Visibility</label><select name="visibility"><option selected>Private</option><option>Public</option></select></div>
                </div>
                <p class="muted">Raised by: <strong>${sessionScope.firstName} ${sessionScope.lastName}</strong></p>
                <button class="btn success" type="submit">Submit Ticket</button>
                <a class="btn secondary" href="${pageContext.request.contextPath}/admin/tickets?action=list">Cancel</a>
            </form>
        </div>
    </c:if>

    <div class="card">
        <div class="top">
            <div><h2>Tickets</h2><div>Logged in as: <strong>${sessionScope.firstName} ${sessionScope.lastName}</strong> (${sessionScope.userRole})</div></div>
            <c:if test="${sessionScope.userRole eq 'Employee' or sessionScope.userRole eq 'Admin'}">
                <a class="btn primary" href="${pageContext.request.contextPath}/admin/tickets?action=add">+ Add Ticket</a>
            </c:if>
        </div>
        <br>

        <c:choose>
            <c:when test="${not empty tickets}">
                <table>
                    <thead><tr><th>Ticket No</th><th>Subject</th><th>Priority</th><th>Status</th><th>Created</th><th>Action</th></tr></thead>
                    <tbody>
                    <c:forEach var="t" items="${tickets}">
                        <tr>
                            <td><strong>${t.ticketNo}</strong></td>
                            <td><strong>${t.subject}</strong><br><span class="muted">${t.ticketTitle}</span></td>
                            <td>${t.priority}</td><td><span class="status">${t.status}</span></td><td>${t.createdAt}</td>
                            <td>
                                <a class="btn primary" href="${pageContext.request.contextPath}/admin/ticket-replies?action=ticket&ticketId=${t.ticketId}">View</a>
                                <c:if test="${sessionScope.userRole eq 'Admin'}">
                                    <a class="btn warning" href="${pageContext.request.contextPath}/admin/tickets?action=edit&id=${t.ticketId}">Edit</a>
                                    <a class="btn danger" href="${pageContext.request.contextPath}/admin/tickets?action=delete&id=${t.ticketId}" onclick="return confirm('Delete this ticket?');">Delete</a>
                                </c:if>

                                <c:if test="${sessionScope.userRole eq 'Manager' and (t.status eq 'Open' or t.status eq 'Reopened')}">
                                    <form method="post" action="${pageContext.request.contextPath}/admin/tickets" style="margin-top:8px;min-width:240px">
                                        <input type="hidden" name="action" value="assign">
                                        <input type="hidden" name="ticketId" value="${t.ticketId}">
                                        <select name="assignedTo" required><option value="">Select Employee</option><c:forEach var="emp" items="${employees}"><option value="${emp['userId']}">${emp['firstName']} ${emp['lastName']}</option></c:forEach></select>
                                        <textarea name="assignmentComment" placeholder="Assignment comment (optional)" style="min-height:60px"></textarea>
                                        <button class="btn success" type="submit">Assign Ticket</button>
                                    </form>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise><div class="empty">No tickets found.</div></c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>

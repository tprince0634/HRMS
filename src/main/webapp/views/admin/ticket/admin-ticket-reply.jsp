<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><title>Ticket Conversation</title>
<style>
body{font-family:Arial,sans-serif;background:#f5f6fa;margin:0;padding:30px;color:#111827}.container{max-width:1000px;margin:auto}.card{background:#fff;border-radius:10px;padding:25px;margin-bottom:20px;box-shadow:0 2px 10px rgba(0,0,0,.08)}.info{display:grid;grid-template-columns:repeat(4,1fr);gap:12px}.box{background:#f8f9fa;padding:12px;border-radius:6px}.reply{border:1px solid #ddd;border-radius:8px;padding:15px;margin-bottom:12px}.user{font-weight:700}.message{white-space:pre-wrap;margin-top:8px}.date{font-size:12px;color:#777;margin-top:8px}.status{padding:5px 10px;border-radius:15px;background:#eee;display:inline-block}.btn{display:inline-block;padding:9px 15px;border:0;border-radius:6px;text-decoration:none;cursor:pointer;margin:2px;color:#fff}.primary{background:#0d6efd}.success{background:#198754}.warning{background:#ffc107;color:#111}.danger{background:#dc3545}.secondary{background:#6c757d}textarea{width:100%;box-sizing:border-box;min-height:130px;padding:10px;border:1px solid #d1d5db;border-radius:6px}label{font-weight:700;display:block;margin:12px 0 6px}.alert{padding:12px;border-radius:6px;margin-bottom:15px}.ok{background:#d1e7dd;color:#0f5132}.err{background:#f8d7da;color:#842029}@media(max-width:800px){.info{grid-template-columns:1fr 1fr}}
</style>
</head>
<body>
<div class="container">
<c:if test="${not empty successMessage}"><div class="alert ok">${successMessage}</div></c:if>
<c:if test="${not empty errorMessage}"><div class="alert err">${errorMessage}</div></c:if>

<div class="card">
<h2>Ticket Conversation</h2>
<p>Ticket No: <strong>${ticket.ticketNo}</strong></p>
<div class="info">
<div class="box"><strong>Subject</strong><br>${ticket.subject}</div>
<div class="box"><strong>Priority</strong><br>${ticket.priority}</div>
<div class="box"><strong>Status</strong><br><span class="status">${ticket.status}</span></div>
<div class="box"><strong>Created</strong><br>${ticket.createdAt}</div>
</div>
<p><strong>Problem Description</strong></p><p style="white-space:pre-wrap">${ticket.ticketDescription}</p>
<p>Raised By User ID: <strong>${ticket.raisedBy}</strong></p>
<p>Assigned To User ID: <strong>${ticket.assignedTo}</strong></p>
</div>

<div class="card">
<h3>Ticket Actions</h3>
<c:if test="${sessionScope.userRole eq 'Employee' and ticket.assignedTo eq sessionScope.userId and (ticket.status eq 'Assigned' or ticket.status eq 'Reopened')}">
<form method="post" action="${pageContext.request.contextPath}/admin/tickets" style="display:inline"><input type="hidden" name="action" value="status"><input type="hidden" name="ticketId" value="${ticket.ticketId}"><input type="hidden" name="status" value="In Progress"><button class="btn primary">Start Work</button></form>
</c:if>

<c:if test="${sessionScope.userRole eq 'Employee' and ticket.assignedTo eq sessionScope.userId and ticket.status eq 'In Progress'}">
<form method="post" action="${pageContext.request.contextPath}/admin/tickets"><input type="hidden" name="action" value="status"><input type="hidden" name="ticketId" value="${ticket.ticketId}"><input type="hidden" name="status" value="Resolved"><label>Solution / Resolution</label><textarea name="resolutionComment" maxlength="500" required placeholder="Enter solution provided to the employee"></textarea><button class="btn success">Mark as Resolved</button></form>
</c:if>

<c:if test="${sessionScope.userRole eq 'Employee' and ticket.raisedBy eq sessionScope.userId and ticket.status eq 'Resolved'}">
<form method="post" action="${pageContext.request.contextPath}/admin/tickets" style="display:inline"><input type="hidden" name="action" value="status"><input type="hidden" name="ticketId" value="${ticket.ticketId}"><input type="hidden" name="status" value="Closed"><button class="btn success">Close Ticket</button></form>
<form method="post" action="${pageContext.request.contextPath}/admin/tickets" style="display:inline"><input type="hidden" name="action" value="status"><input type="hidden" name="ticketId" value="${ticket.ticketId}"><input type="hidden" name="status" value="Reopened"><button class="btn warning">Reopen</button></form>
</c:if>

<c:if test="${sessionScope.userRole eq 'Employee' and ticket.raisedBy eq sessionScope.userId and ticket.status eq 'Closed'}">
<form method="post" action="${pageContext.request.contextPath}/admin/tickets"><input type="hidden" name="action" value="status"><input type="hidden" name="ticketId" value="${ticket.ticketId}"><input type="hidden" name="status" value="Reopened"><button class="btn warning">Reopen Ticket</button></form>
</c:if>

<c:if test="${sessionScope.userRole eq 'Admin'}"><span>Admin can manage this ticket.</span></c:if>
</div>

<div class="card"><h3>Comments / Conversation</h3>
<c:choose><c:when test="${not empty replies}"><c:forEach var="reply" items="${replies}"><div class="reply"><div class="user">${reply.repliedBy}</div><div class="message">${reply.replyMessage}</div><div class="date">${reply.repliedAt}</div><c:if test="${sessionScope.userRole eq 'Admin'}"><div style="margin-top:8px"><a class="btn warning" href="${pageContext.request.contextPath}/admin/ticket-replies?action=edit&id=${reply.replyId}">Edit</a><a class="btn danger" href="${pageContext.request.contextPath}/admin/ticket-replies?action=delete&id=${reply.replyId}" onclick="return confirm('Delete this comment?');">Delete</a></div></c:if></div></c:forEach></c:when><c:otherwise><p>No comments yet.</p></c:otherwise></c:choose>
</div>

<c:if test="${not empty editReply}">
<div class="card"><h3>Edit Comment</h3><form method="post" action="${pageContext.request.contextPath}/admin/ticket-replies"><input type="hidden" name="action" value="update"><input type="hidden" name="replyId" value="${editReply.replyId}"><input type="hidden" name="ticketId" value="${editReply.ticketId}"><label>Comment</label><textarea name="replyMessage" maxlength="500" required>${editReply.replyMessage}</textarea><button class="btn success">Update Comment</button><a class="btn secondary" href="${pageContext.request.contextPath}/admin/ticket-replies?action=ticket&ticketId=${editReply.ticketId}">Cancel</a></form></div>
</c:if>

<c:if test="${empty editReply}">
<div class="card"><h3>Add Comment</h3><p>Replying as: <strong>${sessionScope.firstName} ${sessionScope.lastName}</strong></p><form method="post" action="${pageContext.request.contextPath}/admin/ticket-replies"><input type="hidden" name="action" value="add"><input type="hidden" name="ticketId" value="${ticket.ticketId}"><label>Comment / Message</label><textarea name="replyMessage" maxlength="500" required></textarea><button class="btn primary">Add Comment</button></form></div>
</c:if>

<a class="btn secondary" href="${pageContext.request.contextPath}/admin/tickets?action=list">Back to Tickets</a>
</div>
</body>
</html>

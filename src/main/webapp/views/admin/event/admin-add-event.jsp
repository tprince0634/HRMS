<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Events - Pulse360</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <!-- Tabler Icons -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

    <!-- FullCalendar -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.css">
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>

    <style>
        :root {
            --event-primary: #ff641f;
            --event-primary-dark: #e95718;
            --event-text: #1f2937;
            --event-muted: #6b7280;
            --event-border: #e5e7eb;
            --event-bg: #f7f8fa;
            --event-card: #ffffff;
            --event-shadow: 0 8px 25px rgba(15, 23, 42, 0.07);
        }

        .events-page {
            min-height: calc(100vh - 60px);
            padding: 28px 30px 40px;
            background: var(--event-bg);
        }

        .events-page *,
        .events-page *::before,
        .events-page *::after {
            box-sizing: border-box;
        }

        /* PAGE HEADER */
        .events-header {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            gap: 20px;
            margin-bottom: 24px;
        }

        .events-heading {
            margin: 0;
            color: var(--event-text);
            font-size: 28px;
            font-weight: 700;
            letter-spacing: -0.4px;
        }

        .events-breadcrumb {
            margin-top: 7px;
            color: var(--event-muted);
            font-size: 13px;
        }

        .events-breadcrumb span {
            color: #9ca3af;
            margin: 0 6px;
        }

        .top-add-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            min-height: 44px;
            padding: 0 18px;
            border: 0;
            border-radius: 8px;
            background: var(--event-primary);
            color: #fff;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            box-shadow: 0 5px 14px rgba(255, 100, 31, 0.20);
            transition: .2s ease;
        }

        .top-add-btn:hover {
            background: var(--event-primary-dark);
            transform: translateY(-1px);
            color: #fff;
        }

        /* SUMMARY CARDS */
        .event-stats {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 16px;
            margin-bottom: 22px;
        }

        .stat-card {
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            gap: 14px;
            min-height: 92px;
            padding: 18px 20px;
            background: var(--event-card);
            border: 1px solid rgba(229, 231, 235, .9);
            border-radius: 12px;
            box-shadow: var(--event-shadow);
        }

        .stat-card::after {
            content: "";
            position: absolute;
            right: -24px;
            bottom: -32px;
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: rgba(255, 100, 31, .06);
        }

        .stat-icon {
            width: 48px;
            height: 48px;
            flex: 0 0 48px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 11px;
            background: #fff2eb;
            color: var(--event-primary);
            font-size: 19px;
        }

        .stat-label {
            margin-bottom: 4px;
            color: var(--event-muted);
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: .45px;
        }

        .stat-value {
            color: var(--event-text);
            font-size: 23px;
            font-weight: 700;
            line-height: 1.1;
        }

        /* MAIN GRID */
        .events-grid {
            display: grid;
            grid-template-columns: minmax(0, 1fr) 340px;
            gap: 20px;
            align-items: start;
        }

        .calendar-card,
        .side-card {
            background: var(--event-card);
            border: 1px solid rgba(229, 231, 235, .9);
            border-radius: 12px;
            box-shadow: var(--event-shadow);
        }

        .calendar-card {
            padding: 20px;
            min-width: 0;
        }

        .calendar-card-header,
        .side-card-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            margin-bottom: 15px;
        }

        .section-title {
            margin: 0;
            color: var(--event-text);
            font-size: 16px;
            font-weight: 700;
        }

        .section-subtitle {
            margin: 4px 0 0;
            color: #9ca3af;
            font-size: 12px;
        }

        .calendar-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 10px;
            border-radius: 20px;
            background: #f3f4f6;
            color: #6b7280;
            font-size: 11px;
            font-weight: 600;
        }

        #calendar {
            width: 100%;
            min-height: 620px;
        }

        /* FULLCALENDAR */
        .events-page .fc {
            font-family: Arial, Helvetica, sans-serif;
        }

        .events-page .fc .fc-toolbar {
            margin-bottom: 18px;
        }

        .events-page .fc .fc-toolbar-title {
            color: var(--event-text);
            font-size: 21px;
            font-weight: 700;
        }

        .events-page .fc .fc-button {
            min-height: 34px;
            padding: 5px 11px;
            border: 1px solid #e5e7eb;
            border-radius: 7px;
            background: #fff;
            color: #4b5563;
            font-size: 12px;
            font-weight: 600;
            box-shadow: none;
        }

        .events-page .fc .fc-button:hover,
        .events-page .fc .fc-button:focus {
            background: #f8fafc;
            color: var(--event-primary);
            border-color: #ffd7c5;
            box-shadow: none;
        }

        .events-page .fc .fc-button-primary:not(:disabled).fc-button-active {
            background: var(--event-primary);
            border-color: var(--event-primary);
            color: #fff;
        }

        .events-page .fc .fc-daygrid-day-number {
            color: #6b7280;
            font-size: 12px;
            text-decoration: none;
        }

        .events-page .fc .fc-col-header-cell-cushion {
            padding: 10px 4px;
            color: #6b7280;
            font-size: 11px;
            font-weight: 700;
            text-decoration: none;
            text-transform: uppercase;
        }

        .events-page .fc .fc-daygrid-day.fc-day-today {
            background: #fff8f4;
        }

        .events-page .fc .fc-daygrid-day.fc-day-today .fc-daygrid-day-number {
            color: var(--event-primary);
            font-weight: 700;
        }

        .events-page .fc-theme-standard td,
        .events-page .fc-theme-standard th {
            border-color: #eef0f3;
        }

        .events-page .fc-event {
            margin: 2px 4px;
            padding: 3px 5px;
            border: 0;
            border-radius: 5px;
            cursor: pointer;
            font-size: 11px;
            font-weight: 600;
        }

        /* RIGHT SIDE */
        .events-sidebar {
            min-width: 0;
        }

        .quick-add-card {
            padding: 18px;
            margin-bottom: 16px;
            background: linear-gradient(135deg, #fff7f2, #ffffff);
            border: 1px solid #ffe1d2;
            border-radius: 12px;
            box-shadow: var(--event-shadow);
        }

        .quick-add-title {
            margin: 0 0 6px;
            color: var(--event-text);
            font-size: 15px;
            font-weight: 700;
        }

        .quick-add-text {
            margin: 0 0 15px;
            color: var(--event-muted);
            font-size: 12px;
            line-height: 1.5;
        }

        .quick-add-btn {
            width: 100%;
            min-height: 42px;
            border: 0;
            border-radius: 8px;
            background: var(--event-primary);
            color: #fff;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: .2s ease;
        }

        .quick-add-btn:hover {
            background: var(--event-primary-dark);
        }

        .side-card {
            padding: 18px;
        }

        .event-count {
            min-width: 28px;
            height: 25px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 0 8px;
            border-radius: 20px;
            background: #f3f4f6;
            color: #6b7280;
            font-size: 11px;
            font-weight: 700;
        }

        .event-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .event-card {
            position: relative;
            padding: 13px 13px 13px 15px;
            background: #fff;
            border: 1px solid #edf0f2;
            border-left: 4px solid #ff641f;
            border-radius: 9px;
            transition: .2s ease;
        }

        .event-card:hover {
            transform: translateY(-1px);
            box-shadow: 0 5px 16px rgba(15, 23, 42, .07);
        }

        .event-card-title {
            margin: 0 0 7px;
            padding-right: 5px;
            color: #1f2937;
            font-size: 13px;
            font-weight: 700;
            line-height: 1.35;
        }

        .event-meta {
            display: flex;
            align-items: center;
            gap: 7px;
            margin-top: 5px;
            color: #6b7280;
            font-size: 11px;
        }

        .event-meta i {
            width: 13px;
            color: var(--event-primary);
            text-align: center;
        }

        .status-pill {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            margin-top: 9px;
            padding: 4px 8px;
            border-radius: 20px;
            background: #ecfdf3;
            color: #15803d;
            font-size: 10px;
            font-weight: 700;
        }

        .status-pill.inactive {
            background: #f3f4f6;
            color: #6b7280;
        }

        .empty-state {
            padding: 30px 15px;
            text-align: center;
            border: 1px dashed #dfe3e8;
            border-radius: 9px;
            background: #fafbfc;
        }

        .empty-state-icon {
            width: 46px;
            height: 46px;
            margin: 0 auto 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: #fff2eb;
            color: var(--event-primary);
            font-size: 17px;
        }

        .empty-state-title {
            margin: 0 0 4px;
            color: #374151;
            font-size: 13px;
            font-weight: 700;
        }

        .empty-state-text {
            margin: 0;
            color: #9ca3af;
            font-size: 11px;
        }

        /* ERROR */
        .error-message {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 18px;
            padding: 12px 14px;
            border: 1px solid #fecaca;
            border-radius: 8px;
            background: #fff1f2;
            color: #b91c1c;
            font-size: 13px;
        }

        /* MODAL */
        .event-modal {
            display: none;
            position: fixed;
            z-index: 99999;
            inset: 0;
            padding: 25px 15px;
            overflow-y: auto;
            background: rgba(15, 23, 42, .52);
            backdrop-filter: blur(3px);
        }

        .event-modal.show {
            display: block;
        }

        .event-modal-content {
            width: 500px;
            max-width: 100%;
            margin: 35px auto;
            overflow: hidden;
            background: #fff;
            border-radius: 14px;
            box-shadow: 0 25px 70px rgba(15, 23, 42, .22);
            animation: modalIn .18s ease-out;
        }

        @keyframes modalIn {
            from {
                opacity: 0;
                transform: translateY(-8px) scale(.99);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .event-modal-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 19px 22px;
            border-bottom: 1px solid #edf0f2;
            background: #fff;
        }

        .modal-heading-wrap {
            display: flex;
            align-items: center;
            gap: 11px;
        }

        .modal-icon {
            width: 38px;
            height: 38px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 9px;
            background: #fff2eb;
            color: var(--event-primary);
        }

        .modal-heading {
            margin: 0;
            color: #1f2937;
            font-size: 17px;
            font-weight: 700;
        }

        .modal-subheading {
            margin: 2px 0 0;
            color: #9ca3af;
            font-size: 11px;
        }

        .modal-close {
            width: 32px;
            height: 32px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: 0;
            border-radius: 7px;
            background: #f3f4f6;
            color: #6b7280;
            font-size: 17px;
            cursor: pointer;
        }

        .modal-close:hover {
            background: #fee2e2;
            color: #b91c1c;
        }

        .event-form {
            padding: 22px;
        }

        .form-group {
            margin-bottom: 17px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            color: #374151;
            font-size: 12px;
            font-weight: 700;
        }

        .required-mark {
            color: #ef4444;
        }

        .form-control {
            width: 100%;
            height: 43px;
            padding: 8px 12px;
            border: 1px solid #dfe3e8;
            border-radius: 8px;
            outline: none;
            background: #fff;
            color: #374151;
            font-size: 13px;
            transition: .15s ease;
        }

        .form-control:hover {
            border-color: #cbd5e1;
        }

        .form-control:focus {
            border-color: var(--event-primary);
            box-shadow: 0 0 0 3px rgba(255, 100, 31, .10);
        }

        .modal-actions {
            display: flex;
            justify-content: flex-end;
            gap: 9px;
            margin-top: 22px;
            padding-top: 17px;
            border-top: 1px solid #edf0f2;
        }

        .btn-submit,
        .btn-cancel {
            min-height: 40px;
            padding: 0 17px;
            border-radius: 7px;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            transition: .2s ease;
        }

        .btn-submit {
            border: 1px solid var(--event-primary);
            background: var(--event-primary);
            color: #fff;
        }

        .btn-submit:hover {
            background: var(--event-primary-dark);
            border-color: var(--event-primary-dark);
        }

        .btn-cancel {
            border: 1px solid #e5e7eb;
            background: #fff;
            color: #6b7280;
        }

        .btn-cancel:hover {
            background: #f9fafb;
            color: #374151;
        }

        /* RESPONSIVE */
        @media (max-width: 1200px) {
            .events-grid {
                grid-template-columns: minmax(0, 1fr) 300px;
            }
        }

        @media (max-width: 1000px) {
            .event-stats {
                grid-template-columns: 1fr;
            }

            .events-grid {
                grid-template-columns: 1fr;
            }

            .events-sidebar {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 16px;
            }

            .quick-add-card,
            .side-card {
                margin-bottom: 0;
            }
        }

        @media (max-width: 700px) {
            .events-page {
                padding: 20px 15px 30px;
            }

            .events-header {
                align-items: flex-start;
                flex-direction: column;
            }

            .top-add-btn {
                width: 100%;
            }

            .events-sidebar {
                display: block;
            }

            .quick-add-card {
                margin-bottom: 16px;
            }

            .calendar-card {
                padding: 12px;
            }

            .events-page .fc .fc-toolbar {
                flex-direction: column;
                gap: 10px;
            }

            .events-page .fc .fc-toolbar-chunk {
                display: flex;
                justify-content: center;
            }

            #calendar {
                min-height: 520px;
            }
        }
    </style>
</head>

<body>

<!-- ADMIN HEADER -->
<%@ include file="../adminHeader.jsp" %>

<!-- ADMIN SIDEBAR -->
<%@ include file="../adminSidebar.jsp" %>

<div class="page-wrapper">
    <div class="events-page">

        <!-- PAGE HEADER -->
        <div class="events-header">
            <div>
                <h1 class="events-heading">Events</h1>
                <div class="events-breadcrumb">
                    Home <span>/</span> Event <span>/</span> Events
                </div>
            </div>

            <button type="button"
                    class="top-add-btn"
                    onclick="openEventModal()">
                <i class="fa-solid fa-plus"></i>
                Add New Event
            </button>
        </div>

        <!-- ERROR -->
        <c:if test="${not empty errorMessage}">
            <div class="error-message">
                <i class="fa-solid fa-circle-exclamation"></i>
                <span><c:out value="${errorMessage}"/></span>
            </div>
        </c:if>

        <!-- SUMMARY -->
        <div class="event-stats">
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fa-regular fa-calendar-days"></i>
                </div>
                <div>
                    <div class="stat-label">Total Events</div>
                    <div class="stat-value">${empty events ? 0 : events.size()}</div>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fa-solid fa-circle-check"></i>
                </div>
                <div>
                    <div class="stat-label">Active Events</div>
                    <div class="stat-value" id="activeEventCount">0</div>
                </div>
            </div>

            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fa-solid fa-layer-group"></i>
                </div>
                <div>
                    <div class="stat-label">Event Types</div>
                    <div class="stat-value">${empty eventTypes ? 0 : eventTypes.size()}</div>
                </div>
            </div>
        </div>

        <!-- MAIN CONTENT -->
        <div class="events-grid">

            <!-- CALENDAR -->
            <section class="calendar-card">
                <div class="calendar-card-header">
                    <div>
                        <h2 class="section-title">Event Calendar</h2>
                        <p class="section-subtitle">View all active events by date</p>
                    </div>

                    <span class="calendar-badge">
                        <i class="fa-regular fa-calendar"></i>
                        Calendar View
                    </span>
                </div>

                <div id="calendar"></div>
            </section>

            <!-- SIDEBAR -->
            <aside class="events-sidebar">

                <div class="quick-add-card">
                    <h3 class="quick-add-title">Create an Event</h3>
                    <p class="quick-add-text">
                        Add birthdays, meetings, holidays and other important company events.
                    </p>

                    <button type="button"
                            class="quick-add-btn"
                            onclick="openEventModal()">
                        <i class="fa-solid fa-plus"></i>
                        &nbsp; Create Event
                    </button>
                </div>

                <div class="side-card">
                    <div class="side-card-header">
                        <div>
                            <h2 class="section-title">Upcoming &amp; Recent</h2>
                            <p class="section-subtitle">Your event overview</p>
                        </div>

                        <span class="event-count">
                            ${empty events ? 0 : events.size()}
                        </span>
                    </div>

                    <div class="event-list">
                        <c:choose>
                            <c:when test="${not empty events}">
                                <c:forEach var="event" items="${events}">

                                    <div class="event-card"
                                         style="border-left-color: ${empty eventTypeColors[event.eventTypeId] ? '#ff641f' : eventTypeColors[event.eventTypeId]};">

                                        <div class="event-card-title">
                                            <c:out value="${event.title}"/>
                                        </div>

                                        <div class="event-meta">
                                            <i class="fa-regular fa-calendar"></i>
                                            <span><c:out value="${event.date}"/></span>
                                        </div>

                                        <div class="event-meta">
                                            <i class="fa-solid fa-tag"></i>
                                            <span>
                                                <c:out value="${eventTypeNames[event.eventTypeId]}"/>
                                            </span>
                                        </div>

                                        <c:choose>
                                            <c:when test="${event.status eq 'Active'}">
                                                <span class="status-pill">
                                                    <i class="fa-solid fa-circle"></i>
                                                    Active
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status-pill inactive">
                                                    <i class="fa-solid fa-circle"></i>
                                                    <c:out value="${event.status}"/>
                                                </span>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>

                                </c:forEach>
                            </c:when>

                            <c:otherwise>
                                <div class="empty-state">
                                    <div class="empty-state-icon">
                                        <i class="fa-regular fa-calendar-xmark"></i>
                                    </div>
                                    <h3 class="empty-state-title">No Events Found</h3>
                                    <p class="empty-state-text">
                                        Start by creating your first event.
                                    </p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </aside>

        </div>
    </div>
</div>

<!-- EVENT DATA -->
<div id="eventData" style="display:none;">
    <c:forEach var="event" items="${events}">
        <div class="calendar-event"
             data-id="<c:out value='${event.id}'/>"
             data-title="<c:out value='${event.title}'/>"
             data-date="<c:out value='${event.date}'/>"
             data-color="<c:out value='${eventTypeColors[event.eventTypeId]}'/>"
             data-status="<c:out value='${event.status}'/>">
        </div>
    </c:forEach>
</div>

<!-- ADD EVENT MODAL -->
<div id="addEventModal" class="event-modal" aria-hidden="true">

    <div class="event-modal-content">

        <div class="event-modal-header">
            <div class="modal-heading-wrap">
                <div class="modal-icon">
                    <i class="fa-regular fa-calendar-plus"></i>
                </div>

                <div>
                    <h2 class="modal-heading">Add New Event</h2>
                    <p class="modal-subheading">Create a new event for your organization</p>
                </div>
            </div>

            <button type="button"
                    class="modal-close"
                    onclick="closeEventModal()"
                    aria-label="Close">
                <i class="fa-solid fa-xmark"></i>
            </button>
        </div>

        <form method="post"
              action="${pageContext.request.contextPath}/admin/events"
              class="event-form">

            <input type="hidden" name="action" value="add">

            <div class="form-group">
                <label for="eventTitle">
                    Event Title <span class="required-mark">*</span>
                </label>

                <input type="text"
                       id="eventTitle"
                       name="title"
                       class="form-control"
                       placeholder="Enter event title"
                       maxlength="150"
                       required>
            </div>

            <div class="form-group">
                <label for="eventDate">
                    Event Date <span class="required-mark">*</span>
                </label>

                <input type="date"
                       id="eventDate"
                       name="date"
                       class="form-control"
                       required>
            </div>

            <div class="form-group">
                <label for="eventTypeId">
                    Event Type <span class="required-mark">*</span>
                </label>

                <select id="eventTypeId"
                        name="eventTypeId"
                        class="form-control"
                        required>

                    <option value="">Select Event Type</option>

                    <c:forEach var="type" items="${eventTypes}">
                        <option value="${type.id}">
                            <c:out value="${type.name}"/>
                        </option>
                    </c:forEach>

                </select>
            </div>

            <div class="form-group">
                <label for="eventStatus">Status</label>

                <select id="eventStatus"
                        name="status"
                        class="form-control">

                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>

                </select>
            </div>

            <div class="modal-actions">
                <button type="button"
                        class="btn-cancel"
                        onclick="closeEventModal()">
                    Cancel
                </button>

                <button type="submit"
                        class="btn-submit">
                    <i class="fa-solid fa-check"></i>
                    &nbsp; Add Event
                </button>
            </div>

        </form>
    </div>
</div>

<script>
    function openEventModal() {
        const modal = document.getElementById("addEventModal");

        if (!modal) {
            return;
        }

        modal.classList.add("show");
        modal.setAttribute("aria-hidden", "false");

        const title = document.getElementById("eventTitle");
        if (title) {
            setTimeout(function () {
                title.focus();
            }, 100);
        }
    }

    function closeEventModal() {
        const modal = document.getElementById("addEventModal");

        if (!modal) {
            return;
        }

        modal.classList.remove("show");
        modal.setAttribute("aria-hidden", "true");
    }

    /* Close modal when clicking the overlay */
    document.addEventListener("click", function (event) {
        const modal = document.getElementById("addEventModal");

        if (modal && event.target === modal) {
            closeEventModal();
        }
    });

    /* Close modal with ESC */
    document.addEventListener("keydown", function (event) {
        if (event.key === "Escape") {
            closeEventModal();
        }
    });

    document.addEventListener("DOMContentLoaded", function () {

        /* ACTIVE EVENT COUNT */
        const eventElements = document.querySelectorAll(
            "#eventData .calendar-event"
        );

        let activeCount = 0;

        eventElements.forEach(function (element) {
            const status = (element.dataset.status || "").toLowerCase();

            if (status === "active") {
                activeCount++;
            }
        });

        const activeCounter = document.getElementById("activeEventCount");

        if (activeCounter) {
            activeCounter.textContent = activeCount;
        }

        /* FULL CALENDAR */
        const calendarElement = document.getElementById("calendar");

        if (!calendarElement || typeof FullCalendar === "undefined") {
            return;
        }

        const calendar = new FullCalendar.Calendar(calendarElement, {
            initialView: "dayGridMonth",

            headerToolbar: {
                left: "prev,next today",
                center: "title",
                right: "dayGridMonth,timeGridWeek,timeGridDay"
            },

            height: "auto",
            eventDisplay: "block",

            events: function (fetchInfo, successCallback, failureCallback) {

                const calendarEvents = [];

                eventElements.forEach(function (element) {

                    const status = element.dataset.status || "";

                    /* Only active events are shown on calendar */
                    if (status.toLowerCase() !== "active") {
                        return;
                    }

                    const color =
                        element.dataset.color || "#ff641f";

                    calendarEvents.push({
                        id: element.dataset.id,
                        title: element.dataset.title,
                        start: element.dataset.date,
                        backgroundColor: color,
                        borderColor: color,
                        textColor: "#ffffff"
                    });
                });

                successCallback(calendarEvents);
            }
        });

        calendar.render();
    });
</script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

</body>
</html>

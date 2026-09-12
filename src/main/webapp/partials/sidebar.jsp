<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    /*
     * Determine the current page name for active sidebar menu highlighting.
     * Works when the JSP is reached directly or through a Servlet forward.
     */
    String currentPage = request.getServletPath();

    if (currentPage == null || currentPage.isEmpty()) {
        currentPage = request.getRequestURI();
    }

    int queryIndex = currentPage.indexOf('?');
    if (queryIndex >= 0) {
        currentPage = currentPage.substring(0, queryIndex);
    }

    int lastSlash = currentPage.lastIndexOf('/');
    if (lastSlash >= 0) {
        currentPage = currentPage.substring(lastSlash + 1);
    }

    if (currentPage.endsWith(".jsp")) {
        currentPage = currentPage.substring(0, currentPage.length() - 4);
    }

    request.setAttribute("currentPage", currentPage);
%>

<!-- Sidebar -->
<div class="sidebar" id="sidebar">
    <!-- Logo -->
    <div class="sidebar-logo">
        <a href="${pageContext.request.contextPath}/admin-dashboard" class="logo logo-normal">
            <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="Logo">
        </a>
        <a href="${pageContext.request.contextPath}/admin-dashboard" class="logo-small">
            <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg" alt="Logo">
        </a>
        <a href="${pageContext.request.contextPath}/admin-dashboard" class="dark-logo">
            <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="Logo">
        </a>
    </div>
    <!-- /Logo -->
    <div class="modern-profile p-3 pb-0">
        <div class="text-center rounded bg-light p-3 mb-4 user-profile">
            <div class="avatar avatar-lg online mb-3">
                <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg" alt="Img" class="img-fluid rounded-circle">
            </div>
            <h6 class="fs-12 fw-normal mb-1">Adrian Herman</h6>
            <p class="fs-10">System Admin</p>
        </div>
        <div class="sidebar-nav mb-3">
            <ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded nav-justified bg-transparent" role="tablist">
                <li class="nav-item"><a class="nav-link active border-0" href="#">Menu</a></li>
                <li class="nav-item"><a class="nav-link border-0" href="${pageContext.request.contextPath}/chat">Chats</a></li>
                <li class="nav-item"><a class="nav-link border-0" href="${pageContext.request.contextPath}/email">Inbox</a></li>
            </ul>
        </div>
    </div>
    <div class="sidebar-header p-3 pb-0 pt-2">
        <div class="text-center rounded bg-light p-2 mb-4 sidebar-profile d-flex align-items-center">
            <div class="avatar avatar-md onlin">
                <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg" alt="Img" class="img-fluid rounded-circle">
            </div>
            <div class="text-start sidebar-profile-info ms-2">
                <h6 class="fs-12 fw-normal mb-1">Adrian Herman</h6>
                <p class="fs-10">System Admin</p>
            </div>
        </div>
        <div class="input-group input-group-flat d-inline-flex mb-4">
                <span class="input-icon-addon">
                   <i class="ti ti-search"></i>
                </span>
            <input type="text" class="form-control" placeholder="Search in HRMS">
            <span class="input-group-text">
                   <kbd>CTRL + / </kbd>
                </span>
        </div>
        <div class="d-flex align-items-center justify-content-between menu-item mb-3">
            <div class="me-3">
                <a href="${pageContext.request.contextPath}/calendar" class="btn btn-menubar">
                    <i class="ti ti-layout-grid-remove"></i>
                </a>
            </div>
            <div class="me-3">
                <a href="${pageContext.request.contextPath}/chat" class="btn btn-menubar position-relative">
                    <i class="ti ti-brand-hipchat"></i>
                    <span class="badge bg-info rounded-pill d-flex align-items-center justify-content-center header-badge">5</span>
                </a>
            </div>
            <div class="me-3 notification-item">
                <a href="${pageContext.request.contextPath}/activity" class="btn btn-menubar position-relative me-1">
                    <i class="ti ti-bell"></i>
                    <span class="notification-status-dot"></span>
                </a>
            </div>
            <div class="me-0">
                <a href="${pageContext.request.contextPath}/email" class="btn btn-menubar">
                    <i class="ti ti-message"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="sidebar-inner slimscroll">
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title"><span>MAIN MENU</span></li>
                <li>
                    <ul>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'admin-dashboard' or currentPage eq 'employee-dashboard' or currentPage eq 'deals-dashboard' or currentPage eq 'leads-dashboard' ? 'active subdrop' : ''}">
                                <i class="ti ti-smart-home"></i>
                                <span>Dashboard</span>
                                <span class="badge badge-danger fs-10 fw-medium text-white p-1">Hot</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/admin-dashboard" class="${currentPage eq 'admin-dashboard' ? 'active' : ''}">Admin Dashboard</a></li>
                                <li><a href="${pageContext.request.contextPath}/employee-dashboard" class="${currentPage eq 'employee-dashboard' ? 'active' : ''}">Employee Dashboard</a></li>
                                <li><a href="${pageContext.request.contextPath}/deals-dashboard" class="${currentPage eq 'deals-dashboard' ? 'active' : ''}">Deals Dashboard</a></li>
                                <li><a href="${pageContext.request.contextPath}/leads-dashboard" class="${currentPage eq 'leads-dashboard' ? 'active' : ''}">Leads Dashboard</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'chat' or currentPage eq 'call' or currentPage eq 'voice-call' or currentPage eq 'video-call' or currentPage eq 'outgoing-call' or currentPage eq 'incoming-call' or currentPage eq 'call-history' or currentPage eq 'calendar' or currentPage eq 'email' or currentPage eq 'todo' or currentPage eq 'notes' or currentPage eq 'social-feed' or currentPage eq 'file-manager' or currentPage eq 'kanban-view' or currentPage eq 'invoices' ? 'active subdrop' : ''}">
                                <i class="ti ti-layout-grid-add"></i><span>Applications</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/chat" class="${currentPage eq 'chat' ? 'active' : ''}">Chat</a></li>
                                <li class="submenu submenu-two">
                                    <a href="${pageContext.request.contextPath}/call"  class=" ${currentPage eq 'call' or currentPage eq 'voice-call' or currentPage eq 'video-call' or currentPage eq 'outgoing-call' or currentPage eq 'incoming-call' or currentPage eq 'call-history' ? 'active subdrop' : ''}">Calls<span class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/voice-call" class="${currentPage eq 'voice-call' ? 'active' : ''}">Voice Call</a></li>
                                        <li><a href="${pageContext.request.contextPath}/video-call" class="${currentPage eq 'video-call' ? 'active' : ''}">Video Call</a></li>
                                        <li><a href="${pageContext.request.contextPath}/outgoing-call" class="${currentPage eq 'outgoing-call' ? 'active' : ''}">Outgoing Call</a></li>
                                        <li><a href="${pageContext.request.contextPath}/incoming-call" class="${currentPage eq 'incoming-call' ? 'active' : ''}">Incoming Call</a></li>
                                        <li><a href="${pageContext.request.contextPath}/call-history" class="${currentPage eq 'call-history' ? 'active' : ''}">Call History</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/calendar" class="${currentPage eq 'calendar' ? 'active' : ''}">Calendar</a></li>
                                <li><a href="${pageContext.request.contextPath}/email" class="${currentPage eq 'email' ? 'active' : ''}">Email</a></li>
                                <li><a href="${pageContext.request.contextPath}/todo" class="${currentPage eq 'todo' ? 'active' : ''}">To Do</a></li>
                                <li><a href="${pageContext.request.contextPath}/notes" class="${currentPage eq 'notes' ? 'active' : ''}">Notes</a></li>
                                <li><a href="${pageContext.request.contextPath}/social-feed" class="${currentPage eq 'social-feed' ? 'active' : ''}">Social Feed</a></li>
                                <li><a href="${pageContext.request.contextPath}/file-manager" class="${currentPage eq 'file-manager' ? 'active' : ''}">File Manager</a></li>
                                <li><a href="${pageContext.request.contextPath}/kanban-view" class="${currentPage eq 'kanban-view' ? 'active' : ''}">Kanban</a></li>
                                <li><a href="${pageContext.request.contextPath}/invoices" class="${currentPage eq 'invoices' ? 'active' : ''}">Invoices</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#" class=" ${currentPage eq 'dashboard' or currentPage eq 'companies' or currentPage eq 'subscription' or currentPage eq 'packages' or currentPage eq 'domain' or currentPage eq 'purchase-transaction' ? 'active subdrop' : ''}">
                                <i class="ti ti-user-star"></i><span>Super Admin</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/dashboard" class="${currentPage eq 'dashboard' ? 'active' : ''}">Dashboard</a></li>
                                <li><a href="${pageContext.request.contextPath}/companies" class="${currentPage eq 'companies' ? 'active' : ''}">Companies</a></li>
                                <li><a href="${pageContext.request.contextPath}/subscription" class="${currentPage eq 'subscription' ? 'active' : ''}">Subscriptions</a></li>
                                <li><a href="${pageContext.request.contextPath}/packages" class="${currentPage eq 'packages' ? 'active' : ''}">Packages</a></li>
                                <li><a href="${pageContext.request.contextPath}/domain" class="${currentPage eq 'domain' ? 'active' : ''}">Domain</a></li>
                                <li><a href="${pageContext.request.contextPath}/purchase-transaction" class="${currentPage eq 'purchase-transaction' ? 'active' : ''}">Purchase Transaction</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="menu-title"><span>LAYOUT</span></li>
                <li>
                    <ul>
                        <li class="${currentPage eq 'layout-horizontal' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-horizontal">
                                <i class="ti ti-layout-navbar"></i><span>Horizontal</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-detached' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-detached" >
                                <i class="ti ti-details"></i><span>Detached</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-modern' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-modern" >
                                <i class="ti ti-layout-board-split"></i><span>Modern</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-two-column' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-two-column">
                                <i class="ti ti-columns-2"></i><span>Two Column </span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-hovered' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-hovered" >
                                <i class="ti ti-column-insert-left"></i><span>Hovered</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-box' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-box" >
                                <i class="ti ti-layout-align-middle"></i><span>Boxed</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-horizontal-single' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-horizontal-single" >
                                <i class="ti ti-layout-navbar-inactive"></i><span>Horizontal Single</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-horizontal-overlay' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-horizontal-overlay">
                                <i class="ti ti-layout-collage"></i><span>Horizontal Overlay</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-horizontal-box' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-horizontal-box" >
                                <i class="ti ti-layout-board"></i><span>Horizontal Box</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-horizontal-sidemenu' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-horizontal-sidemenu">
                                <i class="ti ti-table"></i><span>Menu Aside</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-vertical-transparent' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-vertical-transparent" >
                                <i class="ti ti-layout"></i><span>Transparent</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-without-header' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-without-header" >
                                <i class="ti ti-layout-sidebar"></i><span>Without Header</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-rtl' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-rtl" >
                                <i class="ti ti-text-direction-rtl"></i><span>RTL</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'layout-dark' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/layout-dark" >
                                <i class="ti ti-moon"></i><span>Dark</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-title"><span>PROJECTS</span></li>
                <li>
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/clients-grid" class="${currentPage eq 'clients-grid' ? 'active' : ''}">
                                <i class="ti ti-users-group"></i><span>Clients</span>
                            </a>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'projects-grid' or currentPage eq 'tasks' or currentPage eq 'task-board' ? 'active subdrop' : ''}">
                                <i class="ti ti-box"></i><span>Projects</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/projects-grid" class="${currentPage eq 'projects-grid' ? 'active' : ''}">Projects</a></li>
                                <li><a href="${pageContext.request.contextPath}/tasks" class="${currentPage eq 'tasks' ? 'active' : ''}">Tasks</a></li>
                                <li><a href="${pageContext.request.contextPath}/task-board" class="${currentPage eq 'task-board' ? 'active' : ''}">Task Board</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="menu-title"><span>CRM</span></li>
                <li>
                    <ul>
                        <li class="${currentPage eq 'contacts-grid' or currentPage eq 'contacts' or currentPage eq 'contact-details' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/contacts-grid">
                                <i class="ti ti-user-shield"></i><span>Contacts</span>
                            </a>
                        </li>
                        <li  class="${currentPage eq 'companies-grid' or currentPage eq 'companies-crm' or currentPage eq 'company-details' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/companies-grid" class="${currentPage eq 'companies-grid' ? 'active' : ''}">
                                <i class="ti ti-building"></i><span>Companies</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'deals-grid' or currentPage eq 'deals-details' or currentPage eq 'deals' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/deals-grid">
                                <i class="ti ti-heart-handshake"></i><span>Deals</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'leads-grid' or currentPage eq 'leads-details' or currentPage eq 'leads' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/leads-grid">
                                <i class="ti ti-user-check"></i><span>Leads</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'pipeline' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/pipeline">
                                <i class="ti ti-timeline-event-text"></i><span>Pipeline</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'analytics' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/analytics">
                                <i class="ti ti-graph"></i><span>Analytics</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'activity' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/activity">
                                <i class="ti ti-activity"></i><span>Activities</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-title"><span>HRM</span></li>
                <li>
                    <ul>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'employees' or currentPage eq 'employees-grid' or currentPage eq 'employee-details' or currentPage eq 'departments' or currentPage eq 'designations' or currentPage eq 'policy' ? 'active subdrop' : ''}">
                                <i class="ti ti-users"></i><span>Employees</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/employees" class="${currentPage eq 'employees' ? 'active' : ''}">Employee Lists</a></li>
                                <li><a href="${pageContext.request.contextPath}/employees-grid" class="${currentPage eq 'employees-grid' ? 'active' : ''}">Employee Grid</a></li>
                                <li><a href="${pageContext.request.contextPath}/employee-details" class="${currentPage eq 'employee-details' ? 'active' : ''}">Employee Details</a></li>
                                <li><a href="${pageContext.request.contextPath}/departments" class="${currentPage eq 'departments' ? 'active' : ''}">Departments</a></li>
                                <li><a href="${pageContext.request.contextPath}/designations" class="${currentPage eq 'designations' ? 'active' : ''}">Designations</a></li>
                                <li><a href="${pageContext.request.contextPath}/policy" class="${currentPage eq 'policy' ? 'active' : ''}">Policies</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'tickets' or currentPage eq 'ticket-details' ? 'active subdrop' : ''}">
                                <i class="ti ti-ticket"></i><span>Tickets</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/tickets" class="${currentPage eq 'tickets' ? 'active' : ''}">Tickets</a></li>
                                <li><a href="${pageContext.request.contextPath}/ticket-details" class="${currentPage eq 'ticket-details' ? 'active' : ''}">Ticket Details</a></li>
                            </ul>
                        </li>
                        <li class="${currentPage eq 'holidays' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/holidays">
                                <i class="ti ti-calendar-event"></i><span>Holidays</span>
                            </a>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);"class=" ${currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' or currentPage eq 'attendance-admin' or currentPage eq 'attendance-employee' or currentPage eq 'timesheets' or currentPage eq 'schedule-timing' or currentPage eq 'overtime' ? 'active subdrop' : ''}">
                                <i class="ti ti-file-time"></i><span>Attendance</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li class="submenu submenu-two">
                                    <a href="javascript:void(0);" class=" ${currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' ? 'active subdrop' : ''}">Leaves<span class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/leaves" class="${currentPage eq 'leaves' ? 'active' : ''}">Leaves (Admin)</a></li>
                                        <li><a href="${pageContext.request.contextPath}/leaves-employee" class="${currentPage eq 'leaves-employee' ? 'active' : ''}">Leave (Employee)</a></li>
                                        <li><a href="${pageContext.request.contextPath}/leave-settings" class="${currentPage eq 'leave-settings' ? 'active' : ''}">Leave Settings</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/attendance-admin" class="${currentPage eq 'attendance-admin' ? 'active' : ''}">Attendance (Admin)</a></li>
                                <li><a href="${pageContext.request.contextPath}/attendance-employee" class="${currentPage eq 'attendance-employee' ? 'active' : ''}">Attendance (Employee)</a></li>
                                <li><a href="${pageContext.request.contextPath}/timesheets" class="${currentPage eq 'timesheets' ? 'active' : ''}">Timesheets</a></li>
                                <li><a href="${pageContext.request.contextPath}/schedule-timing" class="${currentPage eq 'schedule-timing' ? 'active' : ''}">Shift & Schedule</a></li>
                                <li><a href="${pageContext.request.contextPath}/overtime" class="${currentPage eq 'overtime' ? 'active' : ''}">Overtime</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'performance-indicator' or currentPage eq 'performance-review' or currentPage eq 'performance-appraisal' or currentPage eq 'goal-tracking' or currentPage eq 'goal-type' ? 'active subdrop' : ''}">
                                <i class="ti ti-school"></i><span>Performance</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/performance-indicator" class="${currentPage eq 'performance-indicator' ? 'active' : ''}">Performance Indicator</a></li>
                                <li><a href="${pageContext.request.contextPath}/performance-review" class="${currentPage eq 'performance-review' ? 'active' : ''}">Performance Review</a></li>
                                <li><a href="${pageContext.request.contextPath}/performance-appraisal" class="${currentPage eq 'performance-appraisal' ? 'active' : ''}">Performance Appraisal</a></li>
                                <li><a href="${pageContext.request.contextPath}/goal-tracking" class="${currentPage eq 'goal-tracking' ? 'active' : ''}">Goal List</a></li>
                                <li><a href="${pageContext.request.contextPath}/goal-type" class="${currentPage eq 'goal-type' ? 'active' : ''}">Goal Type</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);"class=" ${currentPage eq 'training' or currentPage eq 'trainers' or currentPage eq 'training-type' ? 'active subdrop' : ''}">
                                <i class="ti ti-edit"></i><span>Training</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/training" class="${currentPage eq 'training' ? 'active' : ''}">Training List</a></li>
                                <li><a href="${pageContext.request.contextPath}/trainers" class="${currentPage eq 'trainers' ? 'active' : ''}">Trainers</a></li>
                                <li><a href="${pageContext.request.contextPath}/training-type" class="${currentPage eq 'training-type' ? 'active' : ''}">Training Type</a></li>
                            </ul>
                        </li>
                        <li class="${currentPage eq 'promotion' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/promotion">
                                <i class="ti ti-speakerphone"></i><span>Promotion</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'resignation' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/resignation">
                                <i class="ti ti-external-link"></i><span>Resignation</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'termination' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/termination"  class="${currentPage eq 'termination' ? 'active' : ''}">
                                <i class="ti ti-circle-x"></i><span>Termination</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-title"><span>RECRUITMENT</span></li>
                <li>
                    <ul>
                        <li class="${currentPage eq 'job-grid' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/job-grid">
                                <i class="ti ti-timeline"></i><span>Jobs</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'candidates-grid' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/candidates-grid">
                                <i class="ti ti-user-shield"></i><span>Candidates</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'refferals' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/refferals" >
                                <i class="ti ti-ux-circle"></i><span>Referrals</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-title"><span>FINANCE & ACCOUNTS</span></li>
                <li>
                    <ul>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'estimates' or currentPage eq 'invoices' or currentPage eq 'payments' or currentPage eq 'expenses' or currentPage eq 'provident-fund' or currentPage eq 'taxes' ? 'active subdrop' : ''}">
                                <i class="ti ti-shopping-cart-dollar"></i><span>Sales</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/estimates" class="${currentPage eq 'estimates' ? 'active' : ''}">Estimates</a></li>
                                <li><a href="${pageContext.request.contextPath}/invoices" class="${currentPage eq 'invoices' ? 'active' : ''}">Invoices</a></li>
                                <li><a href="${pageContext.request.contextPath}/payments" class="${currentPage eq 'payments' ? 'active' : ''}">Payments</a></li>
                                <li><a href="${pageContext.request.contextPath}/expenses" class="${currentPage eq 'expenses' ? 'active' : ''}">Expenses</a></li>
                                <li><a href="${pageContext.request.contextPath}/provident-fund" class="${currentPage eq 'provident-fund' ? 'active' : ''}">Provident Fund</a></li>
                                <li><a href="${pageContext.request.contextPath}/taxes" class="${currentPage eq 'taxes' ? 'active' : ''}">Taxes</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'categories' or currentPage eq 'budgets' or currentPage eq 'budget-expenses' or currentPage eq 'budget-revenues' ? 'active subdrop' : ''}">
                                <i class="ti ti-file-dollar"></i><span>Accounting</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/categories" class="${currentPage eq 'categories' ? 'active' : ''}">Categories</a></li>
                                <li><a href="${pageContext.request.contextPath}/budgets" class="${currentPage eq 'budgets' ? 'active' : ''}">Budgets</a></li>
                                <li><a href="${pageContext.request.contextPath}/budget-expenses" class="${currentPage eq 'budget-expenses' ? 'active' : ''}">Budget Expenses</a></li>
                                <li><a href="${pageContext.request.contextPath}/budget-revenues" class="${currentPage eq 'budget-revenues' ? 'active' : ''}">Budget Revenues</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'employee-salary' or currentPage eq 'payslip' or currentPage eq 'payroll' ? 'active subdrop' : ''}">
                                <i class="ti ti-cash"></i><span>Payroll</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/employee-salary" class="${currentPage eq 'employee-salary' ? 'active' : ''}">Employee Salary</a></li>
                                <li><a href="${pageContext.request.contextPath}/payslip" class="${currentPage eq 'payslip' ? 'active' : ''}">Payslip</a></li>
                                <li><a href="${pageContext.request.contextPath}/payroll" class="${currentPage eq 'payroll' ? 'active' : ''}">Payroll Items</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="menu-title"><span>ADMINISTRATION</span></li>
                <li>
                    <ul>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'assets-list' or currentPage eq 'asset-categories' ? 'active subdrop' : ''}">
                                <i class="ti ti-cash"></i><span>Assets</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/assets-list" class="${currentPage eq 'assets-list' ? 'active' : ''}">Assets</a></li>
                                <li><a href="${pageContext.request.contextPath}/asset-categories" class="${currentPage eq 'asset-categories' ? 'active' : ''}">Asset Categories</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'knowledgebase' or currentPage eq 'activity' ? 'active subdrop' : ''}">
                                <i class="ti ti-headset"></i><span>Help & Supports</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/knowledgebase" class="${currentPage eq 'knowledgebase' ? 'active' : ''}">Knowledge Base</a></li>
                                <li><a href="${pageContext.request.contextPath}/activity" class="${currentPage eq 'activity' ? 'active' : ''}">Activities</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'users' or currentPage eq 'roles-permissions' ? 'active subdrop' : ''}">
                                <i class="ti ti-user-star"></i><span>User Management</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/users" class="${currentPage eq 'users' ? 'active' : ''}">Users</a></li>
                                <li><a href="${pageContext.request.contextPath}/roles-permissions" class="${currentPage eq 'roles-permissions' ? 'active' : ''}">Roles & Permissions</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'expenses-report' or currentPage eq 'invoice-report' or currentPage eq 'payment-report' or currentPage eq 'project-report' or currentPage eq 'task-report' or currentPage eq 'user-report' or currentPage eq 'employee-report' or currentPage eq 'payslip-report' or currentPage eq 'attendance-report' or currentPage eq 'leave-report' or currentPage eq 'daily-report' ? 'active subdrop' : ''}">
                                <i class="ti ti-user-star"></i><span>Reports</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/expenses-report" class="${currentPage eq 'expenses-report' ? 'active' : ''}">Expense Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/invoice-report" class="${currentPage eq 'invoice-report' ? 'active' : ''}">Invoice Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/payment-report" class="${currentPage eq 'payment-report' ? 'active' : ''}">Payment Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/project-report" class="${currentPage eq 'project-report' ? 'active' : ''}">Project Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/task-report" class="${currentPage eq 'task-report' ? 'active' : ''}">Task Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/user-report" class="${currentPage eq 'user-report' ? 'active' : ''}">User Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/employee-report" class="${currentPage eq 'employee-report' ? 'active' : ''}">Employee Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/payslip-report" class="${currentPage eq 'payslip-report' ? 'active' : ''}">Payslip Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/attendance-report" class="${currentPage eq 'attendance-report' ? 'active' : ''}">Attendance Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/leave-report" class="${currentPage eq 'leave-report' ? 'active' : ''}">Leave Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/daily-report" class="${currentPage eq 'daily-report' ? 'active' : ''}">Daily Report</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'profile-settings' or currentPage eq 'security-settings' or currentPage eq 'notification-settings' or currentPage eq 'project-report' or currentPage eq 'connected-apps' or currentPage eq 'bussiness-settings' or currentPage eq 'seo-settings' or currentPage eq 'localization-settings' or currentPage eq 'prefixes' or currentPage eq 'preferences' or currentPage eq 'performance-appraisal' or currentPage eq 'language' or currentPage eq 'authentication-settings' or currentPage eq 'ai-settings' or currentPage eq 'salary-settings' or currentPage eq 'approval-settings' or currentPage eq 'invoice-settings' or currentPage eq 'leave-type' or currentPage eq 'custom-fields' or currentPage eq 'email-settings' or currentPage eq 'email-template' or currentPage eq 'sms-settings' or currentPage eq 'sms-template' or currentPage eq 'otp-settings' or currentPage eq 'gdpr' or currentPage eq 'maintenance-mode' or currentPage eq 'payment-gateways' or currentPage eq 'tax-rates' or currentPage eq 'currencies' or currentPage eq 'custom-css' or currentPage eq 'custom-js' or currentPage eq 'cronjob' or currentPage eq 'storage-settings' or currentPage eq 'ban-ip-address' or currentPage eq 'backup' or currentPage eq 'clear-cache' ? 'active subdrop' : ''}">
                                <i class="ti ti-settings"></i><span>Settings</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li class="submenu submenu-two">
                                    <a href="javascript:void(0);" class="${currentPage eq 'profile-settings' or currentPage eq 'security-settings' or currentPage eq 'notification-settings' or currentPage eq 'connected-apps' ? 'active subdrop' : ''}">General Settings<span class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/profile-settings" class="${currentPage eq 'profile-settings' ? 'active' : ''}">Profile</a></li>
                                        <li><a href="${pageContext.request.contextPath}/security-settings" class="${currentPage eq 'security-settings' ? 'active' : ''}">Security</a></li>
                                        <li><a href="${pageContext.request.contextPath}/notification-settings" class="${currentPage eq 'notification-settings' ? 'active' : ''}">Notifications</a></li>
                                        <li><a href="${pageContext.request.contextPath}/connected-apps" class="${currentPage eq 'connected-apps' ? 'active' : ''}">Connected Apps</a></li>
                                    </ul>
                                </li>
                                <li class="submenu submenu-two">
                                    <a href="javascript:void(0);" class="${currentPage eq 'bussiness-settings' or currentPage eq 'seo-settings' or currentPage eq 'localization-settings' or currentPage eq 'prefixes' or currentPage eq 'preferences' or currentPage eq 'performance-appraisal' or currentPage eq 'language' or currentPage eq 'authentication-settings' or currentPage eq 'ai-settings' ? 'active subdrop' : ''}">Website Settings<span class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/bussiness-settings" class="${currentPage eq 'bussiness-settings' ? 'active' : ''}">Business Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/seo-settings" class="${currentPage eq 'seo-settings' ? 'active' : ''}">SEO Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/localization-settings" class="${currentPage eq 'localization-settings' ? 'active' : ''}">Localization</a></li>
                                        <li><a href="${pageContext.request.contextPath}/prefixes" class="${currentPage eq 'prefixes' ? 'active' : ''}">Prefixes</a></li>
                                        <li><a href="${pageContext.request.contextPath}/preferences" class="${currentPage eq 'preferences' ? 'active' : ''}">Preferences</a></li>
                                        <li><a href="${pageContext.request.contextPath}/performance-appraisal" class="${currentPage eq 'performance-appraisal' ? 'active' : ''}">Appearance</a></li>
                                        <li><a href="${pageContext.request.contextPath}/language" class="${currentPage eq 'language' ? 'active' : ''}">Language</a></li>
                                        <li><a href="${pageContext.request.contextPath}/authentication-settings" class="${currentPage eq 'authentication-settings' ? 'active' : ''}">Authentication</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ai-settings" class="${currentPage eq 'ai-settings' ? 'active' : ''}">AI Settings</a></li>
                                    </ul>
                                </li>
                                <li class="submenu submenu-two">
                                    <a href="javascript:void(0);"class="${currentPage eq 'salary-settings' or currentPage eq 'approval-settings' or currentPage eq 'invoice-settings' or currentPage eq 'leave-type' or currentPage eq 'custom-fields' ? 'active subdrop' : ''}">App Settings<span class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/salary-settings" class="${currentPage eq 'salary-settings' ? 'active' : ''}">Salary Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/approval-settings" class="${currentPage eq 'approval-settings' ? 'active' : ''}">Approval Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/invoice-settings" class="${currentPage eq 'invoice-settings' ? 'active' : ''}">Invoice Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/leave-type" class="${currentPage eq 'leave-type' ? 'active' : ''}">Leave Type</a></li>
                                        <li><a href="${pageContext.request.contextPath}/custom-fields" class="${currentPage eq 'custom-fields' ? 'active' : ''}">Custom Fields</a></li>
                                    </ul>
                                </li>
                                <li class="submenu submenu-two">
                                    <a href="javascript:void(0);" class="${currentPage eq 'email-settings' or currentPage eq 'email-template' or currentPage eq 'sms-settings' or currentPage eq 'sms-template' or currentPage eq 'otp-settings' or currentPage eq 'gdpr' or currentPage eq 'maintenance-mode' ? 'active subdrop' : ''}">System Settings<span class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/email-settings" class="${currentPage eq 'email-settings' ? 'active' : ''}">Email Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/email-template" class="${currentPage eq 'email-template' ? 'active' : ''}">Email Templates</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sms-settings" class="${currentPage eq 'sms-settings' ? 'active' : ''}">SMS Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sms-template" class="${currentPage eq 'sms-template' ? 'active' : ''}">SMS Templates</a></li>
                                        <li><a href="${pageContext.request.contextPath}/otp-settings" class="${currentPage eq 'otp-settings' ? 'active' : ''}">OTP</a></li>
                                        <li><a href="${pageContext.request.contextPath}/gdpr" class="${currentPage eq 'gdpr' ? 'active' : ''}">GDPR Cookies</a></li>
                                        <li><a href="${pageContext.request.contextPath}/maintenance-mode" class="${currentPage eq 'maintenance-mode' ? 'active' : ''}">Maintenance Mode</a></li>
                                    </ul>
                                </li>
                                <li class="submenu submenu-two">
                                    <a href="javascript:void(0);" class="${currentPage eq 'payment-gateways' or currentPage eq 'tax-rates' or currentPage eq 'currencies' ? 'active subdrop' : ''}">Financial Settings<span class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/payment-gateways" class="${currentPage eq 'payment-gateways' ? 'active' : ''}">Payment Gateways</a></li>
                                        <li><a href="${pageContext.request.contextPath}/tax-rates" class="${currentPage eq 'tax-rates' ? 'active' : ''}">Tax Rate</a></li>
                                        <li><a href="${pageContext.request.contextPath}/currencies" class="${currentPage eq 'currencies' ? 'active' : ''}">Currencies</a></li>
                                    </ul>
                                </li>
                                <li class="submenu submenu-two">
                                    <a href="javascript:void(0);"class="${currentPage eq 'custom-css' or currentPage eq 'custom-js' or currentPage eq 'cronjob' or currentPage eq 'storage-settings' or currentPage eq 'ban-ip-address' or currentPage eq 'backup' or currentPage eq 'clear-cache' ? 'active subdrop' : ''}">Other Settings<span class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/custom-css" class="${currentPage eq 'custom-css' ? 'active' : ''}">Custom CSS</a></li>
                                        <li><a href="${pageContext.request.contextPath}/custom-js" class="${currentPage eq 'custom-js' ? 'active' : ''}">Custom JS</a></li>
                                        <li><a href="${pageContext.request.contextPath}/cronjob" class="${currentPage eq 'cronjob' ? 'active' : ''}">Cronjob</a></li>
                                        <li><a href="${pageContext.request.contextPath}/storage-settings" class="${currentPage eq 'storage-settings' ? 'active' : ''}">Storage</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ban-ip-address" class="${currentPage eq 'ban-ip-address' ? 'active' : ''}">Ban IP Address</a></li>
                                        <li><a href="${pageContext.request.contextPath}/backup" class="${currentPage eq 'backup' ? 'active' : ''}">Backup</a></li>
                                        <li><a href="${pageContext.request.contextPath}/clear-cache" class="${currentPage eq 'clear-cache' ? 'active' : ''}">Clear Cache</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="menu-title"><span>CONTENT</span></li>
                <li>
                    <ul>
                        <li class="${currentPage eq 'pages' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/pages">
                                <i class="ti ti-box-multiple"></i><span>Pages</span>
                            </a>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'blogs' or currentPage eq 'blog-categories' or currentPage eq 'blog-comments' or currentPage eq 'blog-tags' ? 'active subdrop' : ''}">
                                <i class="ti ti-brand-blogger"></i><span>Blogs</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/blogs" class="${currentPage eq 'blogs' ? 'active' : ''}">All Blogs</a></li>
                                <li><a href="${pageContext.request.contextPath}/blog-categories" class="${currentPage eq 'blog-categories' ? 'active' : ''}">Categories</a></li>
                                <li><a href="${pageContext.request.contextPath}/blog-comments" class="${currentPage eq 'blog-comments' ? 'active' : ''}">Comments</a></li>
                                <li><a href="${pageContext.request.contextPath}/blog-tags" class="${currentPage eq 'blog-tags' ? 'active' : ''}">Blog Tags</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'countries' or currentPage eq 'states' or currentPage eq 'cities' ? 'active subdrop' : ''}">
                                <i class="ti ti-map-pin-check"></i><span>Locations</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/countries" class="${currentPage eq 'countries' ? 'active' : ''}">Countries</a></li>
                                <li><a href="${pageContext.request.contextPath}/states" class="${currentPage eq 'states' ? 'active' : ''}">States</a></li>
                                <li><a href="${pageContext.request.contextPath}/cities" class="${currentPage eq 'cities' ? 'active' : ''}">Cities</a></li>
                            </ul>
                        </li>
                        <li class="${currentPage eq 'testimonials' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/testimonials" >
                                <i class="ti ti-message-2"></i><span>Testimonials</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'faq' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/faq" class="${currentPage eq 'faq' ? 'active' : ''}">
                                <i class="ti ti-question-mark"></i><span>FAQ’S</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-title"><span>PAGES</span></li>
                <li>
                    <ul>
                        <li class="${currentPage eq 'starter' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/starter" >
                                <i class="ti ti-layout-sidebar"></i><span>Starter</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'profile' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/profile">
                                <i class="ti ti-user-circle"></i><span>Profile</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'gallery' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/gallery" >
                                <i class="ti ti-photo"></i><span>Gallery</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'search-result' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/search-result" >
                                <i class="ti ti-list-search"></i><span>Search Results</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'timeline' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/timeline" >
                                <i class="ti ti-timeline"></i><span>Timeline</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'pricing' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/pricing" >
                                <i class="ti ti-file-dollar"></i><span>Pricing</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'coming-soon' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/coming-soon" >
                                <i class="ti ti-progress-bolt"></i><span>Coming Soon</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'under-maintenance' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/under-maintenance" >
                                <i class="ti ti-alert-octagon"></i><span>Under Maintenance</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'under-construction' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/under-construction" >
                                <i class="ti ti-barrier-block"></i><span>Under Construction</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'api-keys' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/api-keys" >
                                <i class="ti ti-api"></i><span>API Keys</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'privacy-policy' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/privacy-policy" >
                                <i class="ti ti-file-description"></i><span>Privacy Policy</span>
                            </a>
                        </li>
                        <li class="${currentPage eq 'terms-condition' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/terms-condition">
                                <i class="ti ti-file-check"></i><span>Terms & Conditions</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="menu-title"><span>AUTHENTICATION</span></li>
                <li>
                    <ul>
                        <li class="submenu">
                            <a href="javascript:void(0);">
                                <i class="ti ti-login"></i><span>Login</span><span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/login" class="${currentPage eq 'login' ? 'active' : ''}">Cover</a></li>
                                <li><a href="${pageContext.request.contextPath}/login-2" class="${currentPage eq 'login-2' ? 'active' : ''}">Illustration</a></li>
                                <li><a href="${pageContext.request.contextPath}/login-3" class="${currentPage eq 'login-3' ? 'active' : ''}">Basic</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);">
                                <i class="ti ti-forms"></i><span>Register</span><span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/register" class="${currentPage eq 'register' ? 'active' : ''}">Cover</a></li>
                                <li><a href="${pageContext.request.contextPath}/register-2" class="${currentPage eq 'register-2' ? 'active' : ''}">Illustration</a></li>
                                <li><a href="${pageContext.request.contextPath}/register-3" class="${currentPage eq 'register-3' ? 'active' : ''}">Basic</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);">
                                <i class="ti ti-help-triangle"></i><span>Forgot Password</span><span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/forgot-password" class="${currentPage eq 'forgot-password' ? 'active' : ''}">Cover</a></li>
                                <li><a href="${pageContext.request.contextPath}/forgot-password-2" class="${currentPage eq 'forgot-password-2' ? 'active' : ''}">Illustration</a></li>
                                <li><a href="${pageContext.request.contextPath}/forgot-password-3" class="${currentPage eq 'forgot-password-3' ? 'active' : ''}">Basic</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);">
                                <i class="ti ti-restore"></i><span>Reset Password</span><span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/reset-password" class="${currentPage eq 'reset-password' ? 'active' : ''}">Cover</a></li>
                                <li><a href="${pageContext.request.contextPath}/reset-password-2" class="${currentPage eq 'reset-password-2' ? 'active' : ''}">Illustration</a></li>
                                <li><a href="${pageContext.request.contextPath}/reset-password-3" class="${currentPage eq 'reset-password-3' ? 'active' : ''}">Basic</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);">
                                <i class="ti ti-mail-exclamation"></i><span>Email Verification</span><span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/email-verification" class="${currentPage eq 'email-verification' ? 'active' : ''}">Cover</a></li>
                                <li><a href="${pageContext.request.contextPath}/email-verification-2" class="${currentPage eq 'email-verification-2' ? 'active' : ''}">Illustration</a></li>
                                <li><a href="${pageContext.request.contextPath}/email-verification-3" class="${currentPage eq 'email-verification-3' ? 'active' : ''}">Basic</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);">
                                <i class="ti ti-password"></i><span>2 Step Verification</span><span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/two-step-verification" class="${currentPage eq 'two-step-verification' ? 'active' : ''}">Cover</a></li>
                                <li><a href="${pageContext.request.contextPath}/two-step-verification-2" class="${currentPage eq 'two-step-verification-2' ? 'active' : ''}">Illustration</a></li>
                                <li><a href="${pageContext.request.contextPath}/two-step-verification-3" class="${currentPage eq 'two-step-verification-3' ? 'active' : ''}">Basic</a></li>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/lock-screen" class="${currentPage eq 'lock-screen' ? 'active' : ''}"><i class="ti ti-lock-square"></i><span>Lock Screen</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/error-404" class="${currentPage eq 'error-404' ? 'active' : ''}"><i class="ti ti-error-404"></i><span>404 Error</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/error-500" class="${currentPage eq 'error-500' ? 'active' : ''}"><i class="ti ti-server"></i><span>500 Error</span></a></li>
                    </ul>
                </li>
                <li class="menu-title"><span>UI INTERFACE</span></li>
                <li>
                    <ul>
                        <li class="submenu">
                            <a href="javascript:void(0);"
                               class="${currentPage eq 'ui-alerts' or currentPage eq 'ui-accordion' or currentPage eq 'ui-avatar' or currentPage eq 'ui-badges' or currentPage eq 'ui-borders' or currentPage eq 'ui-buttons' or currentPage eq 'ui-buttons-group' or currentPage eq 'ui-breadcrumb' or currentPage eq 'ui-cards' or currentPage eq 'ui-carousel' or currentPage eq 'ui-colors' or currentPage eq 'ui-dropdowns' or currentPage eq 'ui-grid' or currentPage eq 'ui-images' or currentPage eq 'ui-lightbox' or currentPage eq 'ui-media' or currentPage eq 'ui-modals' or currentPage eq 'ui-offcanvas' or currentPage eq 'ui-pagination' or currentPage eq 'ui-popovers' or currentPage eq 'ui-progress' or currentPage eq 'ui-placeholders' or currentPage eq 'ui-spinner' or currentPage eq 'ui-sweetalerts' or currentPage eq 'ui-nav-tabs' or currentPage eq 'ui-toasts' or currentPage eq 'ui-tooltips' or currentPage eq 'ui-typography' or currentPage eq 'ui-video' ? 'subdrop active' : ''}">
                                <i class="ti ti-hierarchy-2"></i>
                                <span>Base UI</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-alerts" class="${currentPage eq 'ui-alerts' ? 'active' : ''}">Alerts</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-accordion" class="${currentPage eq 'ui-accordion' ? 'active' : ''}">Accordion</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-avatar" class="${currentPage eq 'ui-avatar' ? 'active' : ''}">Avatar</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-badges" class="${currentPage eq 'ui-badges' ? 'active' : ''}">Badges</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-borders" class="${currentPage eq 'ui-borders' ? 'active' : ''}">Border</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-buttons" class="${currentPage eq 'ui-buttons' ? 'active' : ''}">Buttons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-buttons-group" class="${currentPage eq 'ui-buttons-group' ? 'active' : ''}">Button Group</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-breadcrumb" class="${currentPage eq 'ui-breadcrumb' ? 'active' : ''}">Breadcrumb</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-cards" class="${currentPage eq 'ui-cards' ? 'active' : ''}">Card</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-carousel" class="${currentPage eq 'ui-carousel' ? 'active' : ''}">Carousel</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-colors" class="${currentPage eq 'ui-colors' ? 'active' : ''}">Colors</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-dropdowns" class="${currentPage eq 'ui-dropdowns' ? 'active' : ''}">Dropdowns</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-grid" class="${currentPage eq 'ui-grid' ? 'active' : ''}">Grid</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-images" class="${currentPage eq 'ui-images' ? 'active' : ''}">Images</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-lightbox" class="${currentPage eq 'ui-lightbox' ? 'active' : ''}">Lightbox</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-media" class="${currentPage eq 'ui-media' ? 'active' : ''}">Media</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-modals" class="${currentPage eq 'ui-modals' ? 'active' : ''}">Modals</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-offcanvas" class="${currentPage eq 'ui-offcanvas' ? 'active' : ''}">Offcanvas</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-pagination" class="${currentPage eq 'ui-pagination' ? 'active' : ''}">Pagination</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-popovers" class="${currentPage eq 'ui-popovers' ? 'active' : ''}">Popovers</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-progress" class="${currentPage eq 'ui-progress' ? 'active' : ''}">Progress</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-placeholders" class="${currentPage eq 'ui-placeholders' ? 'active' : ''}">Placeholders</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-spinner" class="${currentPage eq 'ui-spinner' ? 'active' : ''}">Spinner</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-sweetalerts" class="${currentPage eq 'ui-sweetalerts' ? 'active' : ''}">Sweet Alerts</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-nav-tabs" class="${currentPage eq 'ui-nav-tabs' ? 'active' : ''}">Tabs</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-toasts" class="${currentPage eq 'ui-toasts' ? 'active' : ''}">Toasts</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-tooltips" class="${currentPage eq 'ui-tooltips' ? 'active' : ''}">Tooltips</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-typography" class="${currentPage eq 'ui-typography' ? 'active' : ''}">Typography</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-video" class="${currentPage eq 'ui-video' ? 'active' : ''}">Video</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-sortable" class="${currentPage eq 'ui-sortable' ? 'active' : ''}">Sortable</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-swiperjs" class="${currentPage eq 'ui-swiperjs' ? 'active' : ''}">Swiperjs</a>
                                </li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'ui-ribbon' or currentPage eq 'ui-clipboard' or currentPage eq 'ui-drag-drop' or currentPage eq 'ui-rangeslider' or currentPage eq 'ui-rating' or currentPage eq 'ui-text-editor' or currentPage eq 'ui-counter' or currentPage eq 'ui-scrollbar' or currentPage eq 'ui-stickynote' or currentPage eq 'ui-timeline' ? 'subdrop active' : ''}">
                                <i class="ti ti-hierarchy-3"></i>
                                <span>Advanced UI</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-ribbon" class="${currentPage eq 'ui-ribbon' ? 'active' : ''}">Ribbon</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-clipboard" class="${currentPage eq 'ui-clipboard' ? 'active' : ''}">Clipboard</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-drag-drop" class="${currentPage eq 'ui-drag-drop' ? 'active' : ''}">Drag & Drop</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-rangeslider" class="${currentPage eq 'ui-rangeslider' ? 'active' : ''}">Range Slider</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-rating" class="${currentPage eq 'ui-rating' ? 'active' : ''}">Rating</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-text-editor" class="${currentPage eq 'ui-text-editor' ? 'active' : ''}">Text Editor</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-counter" class="${currentPage eq 'ui-counter' ? 'active' : ''}">Counter</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-scrollbar" class="${currentPage eq 'ui-scrollbar' ? 'active' : ''}">Scrollbar</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-stickynote" class="${currentPage eq 'ui-stickynote' ? 'active' : ''}">Sticky Note</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ui-timeline" class="${currentPage eq 'ui-timeline' ? 'active' : ''}">Timeline</a>
                                </li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);"class="${currentPage eq 'form-basic-inputs' or currentPage eq 'form-checkbox-radios' or currentPage eq 'form-input-groups' or currentPage eq 'form-grid-gutters' or currentPage eq 'form-select' or currentPage eq 'form-mask' or currentPage eq 'form-fileupload' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'form-validation' or currentPage eq 'form-wizard' or currentPage eq 'form-select2' ? 'subdrop active' : ''}">
                                <i class="ti ti-input-search"></i>
                                <span>Forms</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li class="submenu submenu-two">
                                    <a href="javascript:void(0);" class="${currentPage eq 'form-basic-inputs' or currentPage eq 'form-checkbox-radios' or currentPage eq 'form-input-groups' or currentPage eq 'form-grid-gutters' or currentPage eq 'form-select' or currentPage eq 'form-mask' or currentPage eq 'form-fileupload' ? 'subdrop active' : ''}">Form Elements <span class="menu-arrow inside-submenu"></span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-basic-inputs" class="${currentPage eq 'form-basic-inputs' ? 'active' : ''}">Basic Inputs</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-checkbox-radios" class="${currentPage eq 'form-checkbox-radios' ? 'active' : ''}">Checkbox & Radios</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-input-groups" class="${currentPage eq 'form-input-groups' ? 'active' : ''}">Input Groups</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-grid-gutters" class="${currentPage eq 'form-grid-gutters' ? 'active' : ''}">Grid & Gutters</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-select" class="${currentPage eq 'form-select' ? 'active' : ''}">Form Select</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-mask" class="${currentPage eq 'form-mask' ? 'active' : ''}">Input Masks</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-fileupload" class="${currentPage eq 'form-fileupload' ? 'active' : ''}">File Uploads</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="submenu submenu-two">
                                    <a href="javascript:void(0);" class="${currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' ? 'subdrop active' : ''}">Layouts <span class="menu-arrow inside-submenu"></span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-horizontal" class="${currentPage eq 'form-horizontal' ? 'active' : ''}">Horizontal Form</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-vertical" class="${currentPage eq 'form-vertical' ? 'active' : ''}">Vertical Form</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-floating-labels" class="${currentPage eq 'form-floating-labels' ? 'active' : ''}">Floating Labels</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/form-validation" class="${currentPage eq 'form-validation' ? 'active' : ''}">Form Validation</a>
                                </li>

                                <li>
                                    <a href="${pageContext.request.contextPath}/form-select2" class="${currentPage eq 'form-select2' ? 'active' : ''}">Select2</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/form-wizard" class="${currentPage eq 'form-wizard' ? 'active' : ''}">Form Wizard</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/form-pickers" class="${currentPage eq 'form-pickers' ? 'active' : ''}">Form Picker</a>
                                </li>

                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'tables-basic' or currentPage eq 'data-tables' ? 'subdrop active' : ''}">
                                <i class="ti ti-table-plus"></i>
                                <span>Tables</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath}/tables-basic" class="${currentPage eq 'tables-basic' ? 'active' : ''}">Basic Tables </a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/data-tables" class="${currentPage eq 'data-tables' ? 'active' : ''}">Data Table </a>
                                </li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'chart-apex' or currentPage eq 'chart-js' or currentPage eq 'chart-morris' or currentPage eq 'chart-flot' or currentPage eq 'chart-peity' or currentPage eq 'chart-c3' ? 'subdrop active' : ''}">
                                <i class="ti ti-chart-line"></i>
                                <span>Charts</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath}/chart-apex" class="${currentPage eq 'chart-apex' ? 'active' : ''}">Apex Charts</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/chart-c3" class="${currentPage eq 'chart-c3' ? 'active' : ''}">Chart C3</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/chart-js" class="${currentPage eq 'chart-js' ? 'active' : ''}">Chart Js</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/chart-morris" class="${currentPage eq 'chart-morris' ? 'active' : ''}">Morris Charts</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/chart-flot" class="${currentPage eq 'chart-flot' ? 'active' : ''}">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/chart-peity" class="${currentPage eq 'chart-peity' ? 'active' : ''}">Peity Charts</a>
                                </li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'icon-fontawesome' or currentPage eq 'icon-feather' or currentPage eq 'icon-ionic' or currentPage eq 'icon-material' or currentPage eq 'icon-pe7' or currentPage eq 'icon-simpleline' or currentPage eq 'icon-themify' or currentPage eq 'icon-weather' or currentPage eq 'icon-typicon' or currentPage eq 'icon-flag' ? 'subdrop active' : ''}">
                                <i class="ti ti-icons"></i>
                                <span>Icons</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-fontawesome" class="${currentPage eq 'icon-fontawesome' ? 'active' : ''}">Fontawesome Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-tabler" class="${currentPage eq 'icon-tabler' ? 'active' : ''}">Tabler Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-bootstrap" class="${currentPage eq 'icon-bootstrap' ? 'active' : ''}">Bootstrap Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-remix" class="${currentPage eq 'icon-remix' ? 'active' : ''}">Remix Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-feather" class="${currentPage eq 'icon-feather' ? 'active' : ''}">Feather Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-ionic" class="${currentPage eq 'icon-ionic' ? 'active' : ''}">Ionic Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-material" class="${currentPage eq 'icon-material' ? 'active' : ''}">Material Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-pe7" class="${currentPage eq 'icon-pe7' ? 'active' : ''}">Pe7 Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-simpleline" class="${currentPage eq 'icon-simpleline' ? 'active' : ''}">Simpleline Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-themify" class="${currentPage eq 'icon-themify' ? 'active' : ''}">Themify Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-weather" class="${currentPage eq 'icon-weather' ? 'active' : ''}">Weather Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-typicon" class="${currentPage eq 'icon-typicon' ? 'active' : ''}">Typicon Icons</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/icon-flag" class="${currentPage eq 'icon-flag' ? 'active' : ''}">Flag Icons</a>
                                </li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'maps-vector' or currentPage eq 'maps-leaflet' ? 'subdrop active' : ''}">
                                <i class="ti ti-table-plus"></i>
                                <span>Maps</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath}/maps-vector" class="${currentPage eq 'maps-vector' ? 'active' : ''}">Vector</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/maps-leaflet" class="${currentPage eq 'maps-leaflet' ? 'active' : ''}">Leaflet</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="menu-title"><span>Extras</span></li>
                <li>
                    <ul>
                        <li>
                            <a href="javascript:void(0);"><i class="ti ti-file-text"></i><span>Documentation</span></a>
                        </li>
                        <li>
                            <a href="javascript:void(0);"><i class="ti ti-exchange"></i><span>Changelog</span><span class="badge bg-pink badge-xs text-white fs-10 ms-s">v4.0.2</span></a>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);"><i class="ti ti-menu-2"></i><span>Multi Level</span><span class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="javascript:void(0);">Multilevel 1</a></li>
                                <li class="submenu submenu-two">
                                    <a href="javascript:void(0);">Multilevel 2<span class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                        <li><a href="javascript:void(0);">Multilevel 2.1</a></li>
                                        <li class="submenu submenu-two submenu-three">
                                            <a href="javascript:void(0);">Multilevel 2.2<span class="menu-arrow inside-submenu inside-submenu-two"></span></a>
                                            <ul>
                                                <li><a href="javascript:void(0);">Multilevel 2.2.1</a></li>
                                                <li><a href="javascript:void(0);">Multilevel 2.2.2</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="javascript:void(0);">Multilevel 3</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- /Sidebar -->

<!-- Horizontal Menu -->
<div class="sidebar sidebar-horizontal" id="horizontal-menu">
    <div class="sidebar-menu">
        <div class="main-menu">
            <ul class="nav-menu">
                <li class="menu-title">
                    <span>Main</span>
                </li>
                <li class="submenu">
                    <a href="#" class=" ${currentPage eq 'admin-dashboard' or currentPage eq 'employee-dashboard' or currentPage eq 'deals-dashboard' or currentPage eq 'leads-dashboard' ? 'active subdrop' : ''}">
                        <i class="ti ti-smart-home"></i><span>Dashboard</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/admin-dashboard" class="${currentPage eq 'admin-dashboard' ? 'active' : ''}">Admin Dashboard</a></li>
                        <li><a href="${pageContext.request.contextPath}/employee-dashboard" class="${currentPage eq 'employee-dashboard' ? 'active' : ''}">Employee Dashboard</a></li>
                        <li><a href="${pageContext.request.contextPath}/deals-dashboard" class="${currentPage eq 'deals-dashboard' ? 'active' : ''}">Deals Dashboard</a></li>
                        <li><a href="${pageContext.request.contextPath}/leads-dashboard" class="${currentPage eq 'leads-dashboard' ? 'active' : ''}">Leads Dashboard</a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#" class=" ${currentPage eq 'dashboard' or currentPage eq 'companies' or currentPage eq 'subscription' or currentPage eq 'packages' or currentPage eq 'domain' or currentPage eq 'purchase-transaction' ? 'active subdrop' : ''}">
                        <i class="ti ti-user-star"></i><span>Super Admin</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/dashboard" class="${currentPage eq 'dashboard' ? 'active' : ''}">Dashboard</a></li>
                        <li><a href="${pageContext.request.contextPath}/companies" class="${currentPage eq 'companies' ? 'active' : ''}">Companies</a></li>
                        <li><a href="${pageContext.request.contextPath}/subscription" class="${currentPage eq 'subscription' ? 'active' : ''}">Subscriptions</a></li>
                        <li><a href="${pageContext.request.contextPath}/packages" class="${currentPage eq 'packages' ? 'active' : ''}">Packages</a></li>
                        <li><a href="${pageContext.request.contextPath}/domain" class="${currentPage eq 'domain' ? 'active' : ''}">Domain</a></li>
                        <li><a href="${pageContext.request.contextPath}/purchase-transaction" class="${currentPage eq 'purchase-transaction' ? 'active' : ''}">Purchase Transaction</a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#" class=" ${currentPage eq 'chat' or currentPage eq 'call' or currentPage eq 'voice-call' or currentPage eq 'video-call' or currentPage eq 'outgoing-call' or currentPage eq 'incoming-call' or currentPage eq 'call-history' or currentPage eq 'calendar' or currentPage eq 'email' or currentPage eq 'todo' or currentPage eq 'notes' or currentPage eq 'social-feed' or currentPage eq 'file-manager' or currentPage eq 'kanban-view' or currentPage eq 'invoices' ? 'active subdrop' : ''}">
                        <i class="ti ti-layout-grid-add"></i><span>Applications</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/chat" class="${currentPage eq 'chat' ? 'active' : ''}">Chat</a></li>
                        <li class="submenu submenu-two">
                            <a href="${pageContext.request.contextPath}/call" class=" ${currentPage eq 'call' or currentPage eq 'voice-call' or currentPage eq 'video-call' or currentPage eq 'outgoing-call' or currentPage eq 'incoming-call' or currentPage eq 'call-history' ? 'active subdrop' : ''}">Calls<span class="menu-arrow inside-submenu"></span></a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/voice-call" class="${currentPage eq 'voice-call' ? 'active' : ''}">Voice Call</a></li>
                                <li><a href="${pageContext.request.contextPath}/video-call" class="${currentPage eq 'video-call' ? 'active' : ''}">Video Call</a></li>
                                <li><a href="${pageContext.request.contextPath}/outgoing-call" class="${currentPage eq 'outgoing-call' ? 'active' : ''}">Outgoing Call</a></li>
                                <li><a href="${pageContext.request.contextPath}/incoming-call" class="${currentPage eq 'incoming-call' ? 'active' : ''}">Incoming Call</a></li>
                                <li><a href="${pageContext.request.contextPath}/call-history" class="${currentPage eq 'call-history' ? 'active' : ''}">Call History</a></li>
                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/calendar" class="${currentPage eq 'calendar' ? 'active' : ''}">Calendar</a></li>
                        <li><a href="${pageContext.request.contextPath}/email" class="${currentPage eq 'email' ? 'active' : ''}">Email</a></li>
                        <li><a href="${pageContext.request.contextPath}/todo" class="${currentPage eq 'todo' ? 'active' : ''}">To Do</a></li>
                        <li><a href="${pageContext.request.contextPath}/notes" class="${currentPage eq 'notes' ? 'active' : ''}">Notes</a></li>
                        <li><a href="${pageContext.request.contextPath}/file-manager" class="${currentPage eq 'file-manager' ? 'active' : ''}">File Manager</a></li>
                        <li><a href="${pageContext.request.contextPath}/kanban-view" class="${currentPage eq 'kanban-view' ? 'active' : ''}">Kanban</a></li>
                        <li><a href="${pageContext.request.contextPath}/invoices" class="${currentPage eq 'invoices' ? 'active' : ''}">Invoices</a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#"  class=" ${currentPage eq 'layout-horizontal' or currentPage eq 'layout-detached' or currentPage eq 'layout-modern' or currentPage eq 'layout-two-column' or currentPage eq 'layout-hovered' or currentPage eq 'layout-horizontal-single' or currentPage eq 'layout-horizontal-overlay' or currentPage eq 'layout-horizontal-box' or currentPage eq 'layout-horizontal-sidemenu' or currentPage eq 'layout-vertical-transparent' or currentPage eq 'layout-without-header' or currentPage eq 'layout-vertical-transparent' or currentPage eq 'layout-rtl' or currentPage eq 'layout-dark' ? 'active subdrop' : ''}">
                        <i class="ti ti-layout-board-split"></i><span>Layouts</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/ layout-horizontal" class="${currentPage eq 'layout-horizontal' ? 'active' : ''}">
                                <span>Horizontal</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/ layout-detached" class="${currentPage eq 'layout-detached' ? 'active' : ''}">
                                <span>Detached</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-modern" class="${currentPage eq 'layout-modern' ? 'active' : ''}">
                                <span>Modern</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-two-column" class="${currentPage eq 'layout-two-column' ? 'active' : ''}">
                                <span>Two Column </span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-hovered" class="${currentPage eq 'layout-hovered' ? 'active' : ''}">
                                <span>Hovered</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-box" class="${currentPage eq 'layout-box' ? 'active' : ''}">
                                <span>Boxed</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-horizontal-single" class="${currentPage eq 'layout-horizontal-single' ? 'active' : ''}">
                                <span>Horizontal Single</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-horizontal-overlay" class="${currentPage eq 'layout-horizontal-overlay' ? 'active' : ''}">
                                <span>Horizontal Overlay</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-horizontal-box" class="${currentPage eq 'layout-horizontal-box' ? 'active' : ''}">
                                <span>Horizontal Box</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-horizontal-sidemenu" class="${currentPage eq 'layout-horizontal-sidemenu' ? 'active' : ''}">
                                <span>Menu Aside</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-vertical-transparent" class="${currentPage eq 'layout-vertical-transparent' ? 'active' : ''}">
                                <span>Transparent</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-without-header" class="${currentPage eq 'layout-without-header' ? 'active' : ''}">
                                <span>Without Header</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-rtl" class="${currentPage eq 'layout-rtl' ? 'active' : ''}">
                                <span>RTL</span>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/layout-dark" class="${currentPage eq 'layout-dark' ? 'active' : ''}">
                                <span>Dark</span>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#">
                        <i class="ti ti-user-star"></i><span>Projects</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li class="${currentPage eq 'clients-grid' or currentPage eq 'clients' ? 'active' : ''}">
                            <a href="${pageContext.request.contextPath}/clients-grid" ><span>Clients</span>
                            </a>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);"class=" ${currentPage eq 'projects-grid' or currentPage eq 'tasks' or currentPage eq 'task-board' ? 'active subdrop' : ''}"><span>Projects</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/projects-grid" class="${currentPage eq 'projects-grid' ? 'active' : ''}">Projects</a></li>
                                <li><a href="${pageContext.request.contextPath}/tasks" class="${currentPage eq 'tasks' ? 'active' : ''}">Tasks</a></li>
                                <li><a href="${pageContext.request.contextPath}/task-board" class="${currentPage eq 'task-board' ? 'active' : ''}">Task Board</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="${pageContext.request.contextPath}/call">Crm<span class="menu-arrow"></span></a>
                            <ul>
                                <li class="${currentPage eq 'contacts-grid' or currentPage eq 'contacts' or currentPage eq 'contact-details' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/contacts-grid"><span>Contacts</span></a></li>
                                <li class="${currentPage eq 'companies-grid' or currentPage eq 'companies-crm' or currentPage eq 'company-details' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/companies-grid"><span>Companies</span></a></li>
                                <li class="${currentPage eq 'deals-grid' or currentPage eq 'deals-details' or currentPage eq 'deals' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/deals-grid"><span>Deals</span></a></li>
                                <li class="${currentPage eq 'leads-grid' or currentPage eq 'leads-details' or currentPage eq 'leads' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/leads-grid"><span>Leads</span></a></li>
                                <li class="${currentPage eq 'pipeline' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/pipeline"><span>Pipeline</span></a></li>
                                <li class="${currentPage eq 'analytics' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/analytics"><span>Analytics</span></a></li>
                                <li class="${currentPage eq 'activity' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/activity" ><span>Activities</span></a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'employees' or currentPage eq 'employees-grid' or currentPage eq 'employee-details' or currentPage eq 'departments' or currentPage eq 'designations' or currentPage eq 'policy' ? 'active subdrop' : ''}"><span>Employees</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/employees" class="${currentPage eq 'employees' ? 'active' : ''}">Employee Lists</a></li>
                                <li><a href="${pageContext.request.contextPath}/employees-grid" class="${currentPage eq 'employees-grid' ? 'active' : ''}">Employee Grid</a></li>
                                <li><a href="${pageContext.request.contextPath}/employee-details" class="${currentPage eq 'employee-details' ? 'active' : ''}">Employee Details</a></li>
                                <li><a href="${pageContext.request.contextPath}/departments" class="${currentPage eq 'departments' ? 'active' : ''}">Departments</a></li>
                                <li><a href="${pageContext.request.contextPath}/designations" class="${currentPage eq 'designations' ? 'active' : ''}">Designations</a></li>
                                <li><a href="${pageContext.request.contextPath}/policy" class="${currentPage eq 'policy' ? 'active' : ''}">Policies</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'tickets' or currentPage eq 'ticket-details' ? 'active subdrop' : ''}"><span>Tickets</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/tickets" class="${currentPage eq 'tickets' ? 'active' : ''}">Tickets</a></li>
                                <li><a href="${pageContext.request.contextPath}/ticket-details" class="${currentPage eq 'ticket-details' ? 'active' : ''}">Ticket Details</a></li>
                            </ul>
                        </li>
                        <li class="${currentPage eq 'holidays' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/holidays"><span>Holidays</span></a></li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' or currentPage eq 'attendance-admin' or currentPage eq 'attendance-employee' or currentPage eq 'timesheets' or currentPage eq 'schedule-timing' or currentPage eq 'overtime' ? 'active subdrop' : ''}"><span>Attendance</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li class="submenu">
                                    <a href="javascript:void(0);" class=" ${currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' ? 'active subdrop' : ''}">Leaves<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/leaves" class="${currentPage eq 'leaves' ? 'active' : ''}">Leaves (Admin)</a></li>
                                        <li><a href="${pageContext.request.contextPath}/leaves-employee" class="${currentPage eq 'leaves-employee' ? 'active' : ''}">Leave (Employee)</a></li>
                                        <li><a href="${pageContext.request.contextPath}/leave-settings" class="${currentPage eq 'leave-settings' ? 'active' : ''}">Leave Settings</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/attendance-admin" class="${currentPage eq 'attendance-admin' ? 'active' : ''}">Attendance (Admin)</a></li>
                                <li><a href="${pageContext.request.contextPath}/attendance-employee" class="${currentPage eq 'attendance-employee' ? 'active' : ''}">Attendance (Employee)</a></li>
                                <li><a href="${pageContext.request.contextPath}/timesheets" class="${currentPage eq 'timesheets' ? 'active' : ''}">Timesheets</a></li>
                                <li><a href="${pageContext.request.contextPath}/schedule-timing" class="${currentPage eq 'schedule-timing' ? 'active' : ''}">Shift & Schedule</a></li>
                                <li><a href="${pageContext.request.contextPath}/overtime" class="${currentPage eq 'overtime' ? 'active' : ''}">Overtime</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'performance-indicator' or currentPage eq 'performance-review' or currentPage eq 'performance-appraisal' or currentPage eq 'goal-tracking' or currentPage eq 'goal-type' ? 'active subdrop' : ''}"><span>Performance</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/performance-indicator" class="${currentPage eq 'performance-indicator' ? 'active' : ''}">Performance Indicator</a></li>
                                <li><a href="${pageContext.request.contextPath}/performance-review" class="${currentPage eq 'performance-review' ? 'active' : ''}">Performance Review</a></li>
                                <li><a href="${pageContext.request.contextPath}/performance-appraisal" class="${currentPage eq 'performance-appraisal' ? 'active' : ''}">Performance Appraisal</a></li>
                                <li><a href="${pageContext.request.contextPath}/goal-tracking" class="${currentPage eq 'goal-tracking' ? 'active' : ''}">Goal List</a></li>
                                <li><a href="${pageContext.request.contextPath}/goal-type" class="${currentPage eq 'goal-type' ? 'active' : ''}">Goal Type</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class=" ${currentPage eq 'training' or currentPage eq 'trainers' or currentPage eq 'training-type' ? 'active subdrop' : ''}"><span>Training</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/training" class="${currentPage eq 'training' ? 'active' : ''}">Training List</a></li>
                                <li><a href="${pageContext.request.contextPath}/trainers" class="${currentPage eq 'trainers' ? 'active' : ''}">Trainers</a></li>
                                <li><a href="${pageContext.request.contextPath}/training-type" class="${currentPage eq 'training-type' ? 'active' : ''}">Training Type</a></li>
                            </ul>
                        </li>
                        <li class="${currentPage eq 'promotion' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/promotion"><span>Promotion</span></a></li>
                        <li class="${currentPage eq 'resignation' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/resignation"><span>Resignation</span></a></li>
                        <li class="${currentPage eq 'termination' ? 'active' : ''}"><a href="${pageContext.request.contextPath}/termination"><span>Termination</span></a></li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#">
                        <i class="ti ti-user-star"></i><span>Administration</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li class="submenu">
                            <a href="javascript:void(0);"class=" ${currentPage eq 'estimates' or currentPage eq 'invoices' or currentPage eq 'payments' or currentPage eq 'expenses' or currentPage eq 'provident-fund' or currentPage eq 'taxes' ? 'active subdrop' : ''}"><span>Sales</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/estimates" class="${currentPage eq 'estimates' ? 'active' : ''}">Estimates</a></li>
                                <li><a href="${pageContext.request.contextPath}/invoices" class="${currentPage eq 'invoices' ? 'active' : ''}">Invoices</a></li>
                                <li><a href="${pageContext.request.contextPath}/payments" class="${currentPage eq 'payments' ? 'active' : ''}">Payments</a></li>
                                <li><a href="${pageContext.request.contextPath}/expenses" class="${currentPage eq 'expenses' ? 'active' : ''}">Expenses</a></li>
                                <li><a href="${pageContext.request.contextPath}/provident-fund" class="${currentPage eq 'provident-fund' ? 'active' : ''}">Provident Fund</a></li>
                                <li><a href="${pageContext.request.contextPath}/taxes" class="${currentPage eq 'taxes' ? 'active' : ''}">Taxes</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);"class=" ${currentPage eq 'categories' or currentPage eq 'budgets' or currentPage eq 'budget-expenses' or currentPage eq 'budget-revenues' ? 'active subdrop' : ''}"><span>Accounting</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/categories" class="${currentPage eq 'categories' ? 'active' : ''}">Categories</a></li>
                                <li><a href="${pageContext.request.contextPath}/budgets" class="${currentPage eq 'budgets' ? 'active' : ''}">Budgets</a></li>
                                <li><a href="${pageContext.request.contextPath}/budget-expenses" class="${currentPage eq 'budget-expenses' ? 'active' : ''}">Budget Expenses</a></li>
                                <li><a href="${pageContext.request.contextPath}/budget-revenues" class="${currentPage eq 'budget-revenues' ? 'active' : ''}">Budget Revenues</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);"class="${currentPage eq 'employee-salary' or currentPage eq 'payslip' or currentPage eq 'payroll' ? 'active subdrop' : ''}"><span>Payroll</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/employee-salary" class="${currentPage eq 'employee-salary' ? 'active' : ''}">Employee Salary</a></li>
                                <li><a href="${pageContext.request.contextPath}/payslip" class="${currentPage eq 'payslip' ? 'active' : ''}">Payslip</a></li>
                                <li><a href="${pageContext.request.contextPath}/payroll" class="${currentPage eq 'payroll' ? 'active' : ''}">Payroll Items</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);"class="${currentPage eq 'assets-list' or currentPage eq 'asset-categories' ? 'active subdrop' : ''}"><span>Assets</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/assets-list" class="${currentPage eq 'assets-list' ? 'active' : ''}">Assets</a></li>
                                <li><a href="${pageContext.request.contextPath}/asset-categories" class="${currentPage eq 'asset-categories' ? 'active' : ''}">Asset Categories</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);"class="${currentPage eq 'knowledgebase' or currentPage eq 'activity' ? 'active subdrop' : ''}"><span>Help & Supports</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/knowledgebase" class="${currentPage eq 'knowledgebase' ? 'active' : ''}">Knowledge Base</a></li>
                                <li><a href="${pageContext.request.contextPath}/activity" class="${currentPage eq 'activity' ? 'active' : ''}">Activities</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'users' or currentPage eq 'roles-permissions' ? 'active subdrop' : ''}"><span>User Management</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/users" class="${currentPage eq 'users' ? 'active' : ''}">Users</a></li>
                                <li><a href="${pageContext.request.contextPath}/roles-permissions" class="${currentPage eq 'roles-permissions' ? 'active' : ''}">Roles & Permissions</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);" class="${currentPage eq 'expenses-report' or currentPage eq 'invoice-report' or currentPage eq 'payment-report' or currentPage eq 'project-report' or currentPage eq 'task-report' or currentPage eq 'user-report' or currentPage eq 'employee-report' or currentPage eq 'payslip-report' or currentPage eq 'attendance-report' or currentPage eq 'leave-report' or currentPage eq 'daily-report' ? 'active subdrop' : ''}"><span>Reports</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/expenses-report" class="${currentPage eq 'expenses-report' ? 'active' : ''}">Expense Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/invoice-report" class="${currentPage eq 'invoice-report' ? 'active' : ''}">Invoice Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/payment-report" class="${currentPage eq 'payment-report' ? 'active' : ''}">Payment Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/project-report" class="${currentPage eq 'project-report' ? 'active' : ''}">Project Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/task-report" class="${currentPage eq 'task-report' ? 'active' : ''}">Task Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/user-report" class="${currentPage eq 'user-report' ? 'active' : ''}">User Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/employee-report" class="${currentPage eq 'employee-report' ? 'active' : ''}">Employee Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/payslip-report" class="${currentPage eq 'payslip-report' ? 'active' : ''}">Payslip Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/attendance-report" class="${currentPage eq 'attendance-report' ? 'active' : ''}">Attendance Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/leave-report" class="${currentPage eq 'leave-report' ? 'active' : ''}">Leave Report</a></li>
                                <li><a href="${pageContext.request.contextPath}/daily-report" class="${currentPage eq 'daily-report' ? 'active' : ''}">Daily Report</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);"class="${currentPage eq 'profile-settings' or currentPage eq 'security-settings' or currentPage eq 'notification-settings' or currentPage eq 'project-report' or currentPage eq 'connected-apps' or currentPage eq 'bussiness-settings' or currentPage eq 'seo-settings' or currentPage eq 'localization-settings' or currentPage eq 'prefixes' or currentPage eq 'preferences' or currentPage eq 'performance-appraisal' or currentPage eq 'language' or currentPage eq 'authentication-settings' or currentPage eq 'ai-settings' or currentPage eq 'salary-settings' or currentPage eq 'approval-settings' or currentPage eq 'invoice-settings' or currentPage eq 'leave-type' or currentPage eq 'custom-fields' or currentPage eq 'email-settings' or currentPage eq 'email-template' or currentPage eq 'sms-settings' or currentPage eq 'sms-template' or currentPage eq 'otp-settings' or currentPage eq 'gdpr' or currentPage eq 'maintenance-mode' or currentPage eq 'payment-gateways' or currentPage eq 'tax-rates' or currentPage eq 'currencies' or currentPage eq 'custom-css' or currentPage eq 'custom-js' or currentPage eq 'cronjob' or currentPage eq 'storage-settings' or currentPage eq 'ban-ip-address' or currentPage eq 'backup' or currentPage eq 'clear-cache' ? 'active subdrop' : ''}"><span>Settings</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'profile-settings' or currentPage eq 'security-settings' or currentPage eq 'notification-settings' or currentPage eq 'connected-apps' ? 'active subdrop' : ''}">General Settings<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/profile-settings" class="${currentPage eq 'profile-settings' ? 'active' : ''}">Profile</a></li>
                                        <li><a href="${pageContext.request.contextPath}/security-settings" class="${currentPage eq 'security-settings' ? 'active' : ''}">Security</a></li>
                                        <li><a href="${pageContext.request.contextPath}/notification-settings" class="${currentPage eq 'notification-settings' ? 'active' : ''}">Notifications</a></li>
                                        <li><a href="${pageContext.request.contextPath}/connected-apps" class="${currentPage eq 'connected-apps' ? 'active' : ''}">Connected Apps</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'bussiness-settings' or currentPage eq 'seo-settings' or currentPage eq 'localization-settings' or currentPage eq 'prefixes' or currentPage eq 'preferences' or currentPage eq 'performance-appraisal' or currentPage eq 'language' or currentPage eq 'authentication-settings' or currentPage eq 'ai-settings' ? 'active subdrop' : ''}">Website Settings<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/bussiness-settings" class="${currentPage eq 'bussiness-settings' ? 'active' : ''}">Business Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/seo-settings" class="${currentPage eq 'seo-settings' ? 'active' : ''}">SEO Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/localization-settings"class="${currentPage eq 'localization-settings' ? 'active' : ''}">Localization</a></li>
                                        <li><a href="${pageContext.request.contextPath}/prefixes"class="${currentPage eq 'prefixes' ? 'active' : ''}">Prefixes</a></li>
                                        <li><a href="${pageContext.request.contextPath}/preferences"class="${currentPage eq 'preferences' ? 'active' : ''}">Preferences</a></li>
                                        <li><a href="${pageContext.request.contextPath}/performance-appraisal"class="${currentPage eq 'performance-appraisal' ? 'active' : ''}">Appearance</a></li>
                                        <li><a href="${pageContext.request.contextPath}/language"class="${currentPage eq 'language' ? 'active' : ''}">Language</a></li>
                                        <li><a href="${pageContext.request.contextPath}/authentication-settings"class="${currentPage eq 'authentication-settings' ? 'active' : ''}">Authentication</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ai-settings"class="${currentPage eq 'ai-settings' ? 'active' : ''}">AI Settings</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'salary-settings' or currentPage eq 'approval-settings' or currentPage eq 'invoice-settings' or currentPage eq 'leave-type' or currentPage eq 'custom-fields' ? 'active subdrop' : ''}">App Settings<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/salary-settings"class="${currentPage eq 'salary-settings' ? 'active' : ''}">Salary Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/approval-settings"class="${currentPage eq 'approval-settings' ? 'active' : ''}">Approval Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/invoice-settings"class="${currentPage eq 'invoice-settings' ? 'active' : ''}">Invoice Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/leave-type"class="${currentPage eq 'leave-type' ? 'active' : ''}">Leave Type</a></li>
                                        <li><a href="${pageContext.request.contextPath}/custom-fields"class="${currentPage eq 'custom-fields' ? 'active' : ''}">Custom Fields</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'email-settings' or currentPage eq 'email-template' or currentPage eq 'sms-settings' or currentPage eq 'sms-template' or currentPage eq 'otp-settings' or currentPage eq 'gdpr' or currentPage eq 'maintenance-mode' ? 'active subdrop' : ''}">System Settings<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/email-settings"class="${currentPage eq 'email-settings' ? 'active' : ''}">Email Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/email-template"class="${currentPage eq 'email-template' ? 'active' : ''}">Email Templates</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sms-settings"class="${currentPage eq 'sms-settings' ? 'active' : ''}">SMS Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sms-template"class="${currentPage eq 'sms-template' ? 'active' : ''}">SMS Templates</a></li>
                                        <li><a href="${pageContext.request.contextPath}/otp-settings"class="${currentPage eq 'otp-settings' ? 'active' : ''}">OTP</a></li>
                                        <li><a href="${pageContext.request.contextPath}/gdpr"class="${currentPage eq 'gdpr' ? 'active' : ''}">GDPR Cookies</a></li>
                                        <li><a href="${pageContext.request.contextPath}/maintenance-mode"class="${currentPage eq 'maintenance-mode' ? 'active' : ''}">Maintenance Mode</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'payment-gateways' or currentPage eq 'tax-rates' or currentPage eq 'currencies' ? 'active subdrop' : ''}">Financial Settings<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/payment-gateways"class="${currentPage eq 'payment-gateways' ? 'active' : ''}">Payment Gateways</a></li>
                                        <li><a href="${pageContext.request.contextPath}/tax-rates"class="${currentPage eq 'tax-rates' ? 'active' : ''}">Tax Rate</a></li>
                                        <li><a href="${pageContext.request.contextPath}/currencies"class="${currentPage eq 'currencies' ? 'active' : ''}">Currencies</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'custom-css' or currentPage eq 'custom-js' or currentPage eq 'cronjob' or currentPage eq 'storage-settings' or currentPage eq 'ban-ip-address' or currentPage eq 'backup' or currentPage eq 'clear-cache' ? 'active subdrop' : ''}">Other Settings<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/custom-css"class="${currentPage eq 'custom-css' ? 'active' : ''}">Custom CSS</a></li>
                                        <li><a href="${pageContext.request.contextPath}/custom-js"class="${currentPage eq 'custom-js' ? 'active' : ''}">Custom JS</a></li>
                                        <li><a href="${pageContext.request.contextPath}/cronjob"class="${currentPage eq 'cronjob' ? 'active' : ''}">Cronjob</a></li>
                                        <li><a href="${pageContext.request.contextPath}/storage-settings"class="${currentPage eq 'storage-settings' ? 'active' : ''}">Storage</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ban-ip-address"class="${currentPage eq 'ban-ip-address' ? 'active' : ''}">Ban IP Address</a></li>
                                        <li><a href="${pageContext.request.contextPath}/backup"class="${currentPage eq 'backup' ? 'active' : ''}">Backup</a></li>
                                        <li><a href="${pageContext.request.contextPath}/clear-cache"class="${currentPage eq 'clear-cache' ? 'active' : ''}">Clear Cache</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="submenu">
                    <a href="#"class="${currentPage eq 'starter' or currentPage eq 'profile' or currentPage eq 'gallery' or currentPage eq 'search-result' or currentPage eq 'timeline' or currentPage eq 'pricing' or currentPage eq 'coming-soon' or currentPage eq 'under-maintenance' or currentPage eq 'under-construction' or currentPage eq 'api-keys' or currentPage eq 'privacy-policy' or currentPage eq 'terms-condition' ? 'active subdrop' : ''}">
                        <i class="ti ti-page-break"></i><span>Pages</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/starter"class="${currentPage eq 'starter' ? 'active' : ''}"><span>Starter</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/profile"class="${currentPage eq 'profile' ? 'active' : ''}"><span>Profile</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/gallery"class="${currentPage eq 'gallery' ? 'active' : ''}"><span>Gallery</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/search-result"class="${currentPage eq 'search-result' ? 'active' : ''}"><span>Search Results</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/timeline"class="${currentPage eq 'timeline' ? 'active' : ''}"><span>Timeline</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/pricing"class="${currentPage eq 'pricing' ? 'active' : ''}"><span>Pricing</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/coming-soon"class="${currentPage eq 'coming-soon' ? 'active' : ''}"><span>Coming Soon</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/under-maintenance"class="${currentPage eq 'under-maintenance' ? 'active' : ''}"><span>Under Maintenance</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/under-construction"class="${currentPage eq 'under-construction' ? 'active' : ''}"><span>Under Construction</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/api-keys"class="${currentPage eq 'api-keys' ? 'active' : ''}"><span>API Keys</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/privacy-policy"class="${currentPage eq 'privacy-policy' ? 'active' : ''}"><span>Privacy Policy</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/terms-condition"class="${currentPage eq 'terms-condition' ? 'active' : ''}"><span>Terms & Conditions</span></a></li>
                        <li class="submenu">
                            <a href="#"><span>Content</span> <span class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/pages"class="${currentPage eq 'pages' ? 'active' : ''}">Pages</a></li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'blogs' or currentPage eq 'blog-categories' or currentPage eq 'blog-comments' or currentPage eq 'blog-tags' ? 'active subdrop' : ''}">Blogs<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/blogs"class="${currentPage eq 'blogs' ? 'active' : ''}">All Blogs</a></li>
                                        <li><a href="${pageContext.request.contextPath}/blog-categories"class="${currentPage eq 'blog-categories' ? 'active' : ''}">Categories</a></li>
                                        <li><a href="${pageContext.request.contextPath}/blog-comments"class="${currentPage eq 'blog-comments' ? 'active' : ''}">Comments</a></li>
                                        <li><a href="${pageContext.request.contextPath}/blog-tags"class="${currentPage eq 'blog-tags' ? 'active' : ''}">Tags</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'countries' or currentPage eq 'states' or currentPage eq 'cities' ? 'active subdrop' : ''}">Locations<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/countries"class="${currentPage eq 'countries' ? 'active' : ''}">Countries</a></li>
                                        <li><a href="${pageContext.request.contextPath}/states"class="${currentPage eq 'states' ? 'active' : ''}">States</a></li>
                                        <li><a href="${pageContext.request.contextPath}/cities"class="${currentPage eq 'cities' ? 'active' : ''}">Cities</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/testimonials"class="${currentPage eq 'testimonials' ? 'active' : ''}">Testimonials</a></li>
                                <li><a href="${pageContext.request.contextPath}/faq"class="${currentPage eq 'faq' ? 'active' : ''}">FAQ’S</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#">
                                <span>Authentication</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li class="submenu">
                                    <a href="javascript:void(0);" class="">Login<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/login"class="${currentPage eq 'login' ? 'active' : ''}">Cover</a></li>
                                        <li><a href="${pageContext.request.contextPath}/login-2"class="${currentPage eq 'login-2' ? 'active' : ''}">Illustration</a></li>
                                        <li><a href="${pageContext.request.contextPath}/login-3"class="${currentPage eq 'login-3' ? 'active' : ''}">Basic</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);" class="">Register<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/register"class="${currentPage eq 'register' ? 'active' : ''}">Cover</a></li>
                                        <li><a href="${pageContext.request.contextPath}/register-2"class="${currentPage eq 'register-2' ? 'active' : ''}">Illustration</a></li>
                                        <li><a href="${pageContext.request.contextPath}/register-3"class="${currentPage eq 'register-3' ? 'active' : ''}">Basic</a></li>
                                    </ul>
                                </li>
                                <li class="submenu"><a href="javascript:void(0);">Forgot Password<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/forgot-password"class="${currentPage eq 'forgot-password' ? 'active' : ''}">Cover</a></li>
                                        <li><a href="${pageContext.request.contextPath}/forgot-password-2"class="${currentPage eq 'forgot-password-2' ? 'active' : ''}">Illustration</a></li>
                                        <li><a href="${pageContext.request.contextPath}/forgot-password-3"class="${currentPage eq 'forgot-password-3' ? 'active' : ''}">Basic</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);">Reset Password<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/reset-password"class="${currentPage eq 'reset-password' ? 'active' : ''}">Cover</a></li>
                                        <li><a href="${pageContext.request.contextPath}/reset-password-2"class="${currentPage eq 'reset-password-2' ? 'active' : ''}">Illustration</a></li>
                                        <li><a href="${pageContext.request.contextPath}/reset-password-3"class="${currentPage eq 'reset-password-3' ? 'active' : ''}">Basic</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);">Email Verification<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/email-verification"class="${currentPage eq 'email-verification' ? 'active' : ''}">Cover</a></li>
                                        <li><a href="${pageContext.request.contextPath}/email-verification-2"class="${currentPage eq 'email-verification-2' ? 'active' : ''}">Illustration</a></li>
                                        <li><a href="${pageContext.request.contextPath}/email-verification-3"class="${currentPage eq 'email-verification-3' ? 'active' : ''}">Basic</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);">2 Step Verification<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/two-step-verification"class="${currentPage eq 'two-step-verification' ? 'active' : ''}">Cover</a></li>
                                        <li><a href="${pageContext.request.contextPath}/two-step-verification-2"class="${currentPage eq 'two-step-verification-2' ? 'active' : ''}">Illustration</a></li>
                                        <li><a href="${pageContext.request.contextPath}/two-step-verification-3"class="${currentPage eq 'two-step-verification-3' ? 'active' : ''}">Basic</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/lock-screen" class="${currentPage eq 'lock-screen' ? 'active' : ''}">Lock Screen</a></li>
                                <li><a href="${pageContext.request.contextPath}/error-404" class="${currentPage eq 'error-404' ? 'active' : ''}">404 Error</a></li>
                                <li><a href="${pageContext.request.contextPath}/error-500" class="${currentPage eq 'error-500' ? 'active' : ''}">500 Error</a></li>
                            </ul>
                        </li>
                        <li class="submenu">
                            <a href="#">
                                <span>UI Interface</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li class="submenu">
                                    <a href="javascript:void(0);"  class="${currentPage eq 'ui-alerts' or currentPage eq 'ui-accordion' or currentPage eq 'ui-avatar' or currentPage eq 'ui-badges' or currentPage eq 'ui-borders' or currentPage eq 'ui-buttons' or currentPage eq 'ui-buttons-group' or currentPage eq 'ui-breadcrumb' or currentPage eq 'ui-cards' or currentPage eq 'ui-carousel' or currentPage eq 'ui-colors' or currentPage eq 'ui-dropdowns' or currentPage eq 'ui-grid' or currentPage eq 'ui-images' or currentPage eq 'ui-lightbox' or currentPage eq 'ui-media' or currentPage eq 'ui-modals' or currentPage eq 'ui-offcanvas' or currentPage eq 'ui-pagination' or currentPage eq 'ui-popovers' or currentPage eq 'ui-progress' or currentPage eq 'ui-placeholders' or currentPage eq 'ui-spinner' or currentPage eq 'ui-sweetalerts' or currentPage eq 'ui-nav-tabs' or currentPage eq 'ui-toasts' or currentPage eq 'ui-tooltips' or currentPage eq 'ui-typography' or currentPage eq 'ui-video' ? 'subdrop active' : ''}">
                                        <i class="ti ti-hierarchy-2"></i>
                                        <span>Base UI</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-alerts" class="${currentPage eq 'ui-alerts' ? 'active' : ''}">Alerts</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-accordion" class="${currentPage eq 'ui-accordion' ? 'active' : ''}">Accordion</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-avatar" class="${currentPage eq 'ui-avatar' ? 'active' : ''}">Avatar</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-badges" class="${currentPage eq 'ui-badges' ? 'active' : ''}">Badges</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-borders" class="${currentPage eq 'ui-borders' ? 'active' : ''}">Border</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-buttons" class="${currentPage eq 'ui-buttons' ? 'active' : ''}">Buttons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-buttons-group" class="${currentPage eq 'ui-buttons-group' ? 'active' : ''}">Button Group</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-breadcrumb" class="${currentPage eq 'ui-breadcrumb' ? 'active' : ''}">Breadcrumb</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-cards" class="${currentPage eq 'ui-cards' ? 'active' : ''}">Card</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-carousel" class="${currentPage eq 'ui-carousel' ? 'active' : ''}">Carousel</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-colors" class="${currentPage eq 'ui-colors' ? 'active' : ''}">Colors</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-dropdowns" class="${currentPage eq 'ui-dropdowns' ? 'active' : ''}">Dropdowns</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-grid" class="${currentPage eq 'ui-grid' ? 'active' : ''}">Grid</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-images" class="${currentPage eq 'ui-images' ? 'active' : ''}">Images</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-lightbox" class="${currentPage eq 'ui-lightbox' ? 'active' : ''}">Lightbox</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-media" class="${currentPage eq 'ui-media' ? 'active' : ''}">Media</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-modals" class="${currentPage eq 'ui-modals' ? 'active' : ''}">Modals</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-offcanvas" class="${currentPage eq 'ui-offcanvas' ? 'active' : ''}">Offcanvas</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-pagination" class="${currentPage eq 'ui-pagination' ? 'active' : ''}">Pagination</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-popovers" class="${currentPage eq 'ui-popovers' ? 'active' : ''}">Popovers</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-progress" class="${currentPage eq 'ui-progress' ? 'active' : ''}">Progress</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-placeholders" class="${currentPage eq 'ui-placeholders' ? 'active' : ''}">Placeholders</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-spinner" class="${currentPage eq 'ui-spinner' ? 'active' : ''}">Spinner</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-sweetalerts" class="${currentPage eq 'ui-sweetalerts' ? 'active' : ''}">Sweet Alerts</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-nav-tabs" class="${currentPage eq 'ui-nav-tabs' ? 'active' : ''}">Tabs</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-toasts" class="${currentPage eq 'ui-toasts' ? 'active' : ''}">Toasts</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-tooltips" class="${currentPage eq 'ui-tooltips' ? 'active' : ''}">Tooltips</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-typography" class="${currentPage eq 'ui-typography' ? 'active' : ''}">Typography</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-video" class="${currentPage eq 'ui-video' ? 'active' : ''}">Video</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-sortable" class="${currentPage eq 'ui-sortable' ? 'active' : ''}">Sortable</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-swiperjs" class="${currentPage eq 'ui-swiperjs' ? 'active' : ''}">Swiperjs</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'ui-ribbon' or currentPage eq 'ui-clipboard' or currentPage eq 'ui-drag-drop' or currentPage eq 'ui-rangeslider' or currentPage eq 'ui-rating' or currentPage eq 'ui-text-editor' or currentPage eq 'ui-counter' or currentPage eq 'ui-scrollbar' or currentPage eq 'ui-stickynote' or currentPage eq 'ui-timeline' ? 'subdrop active' : ''}">
                                        <i class="ti ti-hierarchy-3"></i>
                                        <span>Advanced UI</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-ribbon" class="${currentPage eq 'ui-ribbon' ? 'active' : ''}">Ribbon</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-clipboard" class="${currentPage eq 'ui-clipboard' ? 'active' : ''}">Clipboard</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-drag-drop" class="${currentPage eq 'ui-drag-drop' ? 'active' : ''}">Drag & Drop</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-rangeslider" class="${currentPage eq 'ui-rangeslider' ? 'active' : ''}">Range Slider</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-rating" class="${currentPage eq 'ui-rating' ? 'active' : ''}">Rating</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-text-editor" class="${currentPage eq 'ui-text-editor' ? 'active' : ''}">Text Editor</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-counter" class="${currentPage eq 'ui-counter' ? 'active' : ''}">Counter</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-scrollbar" class="${currentPage eq 'ui-scrollbar' ? 'active' : ''}">Scrollbar</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-stickynote" class="${currentPage eq 'ui-stickynote' ? 'active' : ''}">Sticky Note</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/ui-timeline" class="${currentPage eq 'ui-timeline' ? 'active' : ''}">Timeline</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'form-basic-inputs' or currentPage eq 'form-checkbox-radios' or currentPage eq 'form-input-groups' or currentPage eq 'form-grid-gutters' or currentPage eq 'form-select' or currentPage eq 'form-mask' or currentPage eq 'form-fileupload' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'form-validation' or currentPage eq 'form-wizard' or currentPage eq 'form-select2' ? 'subdrop active' : ''}">
                                        <i class="ti ti-input-search"></i>
                                        <span>Forms</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li class="submenu submenu-two">
                                            <a href="javascript:void(0);"class="${currentPage eq 'form-basic-inputs' or currentPage eq 'form-checkbox-radios' or currentPage eq 'form-input-groups' or currentPage eq 'form-grid-gutters' or currentPage eq 'form-select' or currentPage eq 'form-mask' or currentPage eq 'form-fileupload' ? 'subdrop active' : ''}">Form Elements <span class="menu-arrow inside-submenu"></span>
                                            </a>
                                            <ul>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/form-basic-inputs"class="${currentPage eq 'form-basic-inputs' ? 'active' : ''}">Basic Inputs</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/form-checkbox-radios"class="${currentPage eq 'form-checkbox-radios' ? 'active' : ''}">Checkbox & Radios</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/form-input-groups"class="${currentPage eq 'form-input-groups' ? 'active' : ''}">Input Groups</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/form-grid-gutters"class="${currentPage eq 'form-grid-gutters' ? 'active' : ''}">Grid & Gutters</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/form-select"class="${currentPage eq 'form-select' ? 'active' : ''}">Form Select</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/form-mask"class="${currentPage eq 'form-mask' ? 'active' : ''}">Input Masks</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/form-fileupload"class="${currentPage eq 'form-fileupload' ? 'active' : ''}">File Uploads</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="submenu submenu-two">
                                            <a href="javascript:void(0);"class="${currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' ? 'subdrop active' : ''}">Layouts <span class="menu-arrow inside-submenu"></span>
                                            </a>
                                            <ul>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/form-horizontal"class="${currentPage eq 'form-horizontal' ? 'active' : ''}">Horizontal Form</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/form-vertical"class="${currentPage eq 'form-vertical' ? 'active' : ''}">Vertical Form</a>
                                                </li>
                                                <li>
                                                    <a href="${pageContext.request.contextPath}/form-floating-labels"class="${currentPage eq 'form-floating-labels' ? 'active' : ''}">Floating Labels</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-validation"class="${currentPage eq 'form-validation' ? 'active' : ''}">Form Validation</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-select2"class="${currentPage eq 'form-select2' ? 'active' : ''}">Select2</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-wizard"class="${currentPage eq 'form-wizard' ? 'active' : ''}">Form Wizard</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/form-pickers"class="${currentPage eq 'form-pickers' ? 'active' : ''}">Form Pickers</a>
                                        </li>

                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'tables-basic' or currentPage eq 'data-tables' ? 'subdrop active' : ''}">
                                        <i class="ti ti-table-plus"></i>
                                        <span>Tables</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/tables-basic" class="${currentPage eq 'tables-basic' ? 'active' : ''}">Basic Tables </a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/data-tables" class="${currentPage eq 'data-tables' ? 'active' : ''}">Data Table </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);" class="${currentPage eq 'chart-apex' or currentPage eq 'chart-js' or currentPage eq 'chart-morris' or currentPage eq 'chart-flot' or currentPage eq 'chart-peity' or currentPage eq 'chart-c3' ? 'subdrop active' : ''}">
                                        <i class="ti ti-chart-line"></i>
                                        <span>Charts</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/chart-apex" class="${currentPage eq 'chart-apex' ? 'active' : ''}">Apex Charts</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/chart-c3" class="${currentPage eq 'chart-c3' ? 'active' : ''}">Chart C3</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/chart-js" class="${currentPage eq 'chart-js' ? 'active' : ''}">Chart Js</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/chart-morris" class="${currentPage eq 'chart-morris' ? 'active' : ''}">Morris Charts</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/chart-flot" class="${currentPage eq 'chart-flot' ? 'active' : ''}">Flot Charts</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/chart-peity" class="${currentPage eq 'chart-peity' ? 'active' : ''}">Peity Charts</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'icon-fontawesome' or currentPage eq 'icon-feather' or currentPage eq 'icon-ionic' or currentPage eq 'icon-material' or currentPage eq 'icon-pe7' or currentPage eq 'icon-simpleline' or currentPage eq 'icon-themify' or currentPage eq 'icon-weather' or currentPage eq 'icon-typicon' or currentPage eq 'icon-flag' ? 'subdrop active' : ''}">
                                        <i class="ti ti-icons"></i>
                                        <span>Icons</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-fontawesome" class="${currentPage eq 'icon-fontawesome' ? 'active' : ''}">Fontawesome Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-tabler" class="${currentPage eq 'icon-tabler' ? 'active' : ''}">Tabler Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-bootstrap" class="${currentPage eq 'icon-bootstrap' ? 'active' : ''}">Bootstrap Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-remix" class="${currentPage eq 'icon-remix' ? 'active' : ''}">Remix Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-feather" class="${currentPage eq 'icon-feather' ? 'active' : ''}">Feather Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-ionic" class="${currentPage eq 'icon-ionic' ? 'active' : ''}">Ionic Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-material" class="${currentPage eq 'icon-material' ? 'active' : ''}">Material Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-pe7" class="${currentPage eq 'icon-pe7' ? 'active' : ''}">Pe7 Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-simpleline" class="${currentPage eq 'icon-simpleline' ? 'active' : ''}">Simpleline Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-themify" class="${currentPage eq 'icon-themify' ? 'active' : ''}">Themify Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-weather" class="${currentPage eq 'icon-weather' ? 'active' : ''}">Weather Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-typicon" class="${currentPage eq 'icon-typicon' ? 'active' : ''}">Typicon Icons</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/icon-flag" class="${currentPage eq 'icon-flag' ? 'active' : ''}">Flag Icons</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'maps-vector' or currentPage eq 'maps-leaflet' ? 'subdrop active' : ''}">
                                        <i class="ti ti-table-plus"></i>
                                        <span>Maps</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/maps-vector" class="${currentPage eq 'maps-vector' ? 'active' : ''}">Vector</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/maps-leaflet" class="${currentPage eq 'maps-leaflet' ? 'active' : ''}">Leaflet</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li><a href="#">Documentation</a></li>
                        <li><a href="#">Change Log</a></li>
                        <li class="submenu">
                            <a href="javascript:void(0);"><span>Multi Level</span><span class="menu-arrow"></span></a>
                            <ul>
                                <li><a href="javascript:void(0);">Multilevel 1</a></li>
                                <li class="submenu submenu-two">
                                    <a href="javascript:void(0);">Multilevel 2<span class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                        <li><a href="javascript:void(0);">Multilevel 2.1</a></li>
                                        <li class="submenu submenu-two submenu-three">
                                            <a href="javascript:void(0);">Multilevel 2.2<span class="menu-arrow inside-submenu inside-submenu-two"></span></a>
                                            <ul>
                                                <li><a href="javascript:void(0);">Multilevel 2.2.1</a></li>
                                                <li><a href="javascript:void(0);">Multilevel 2.2.2</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="javascript:void(0);">Multilevel 3</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="d-xl-flex align-items-center d-none">
                <a href="#" class="me-3 avatar avatar-sm">
                    <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-07.jpg" alt="profile" class="rounded-circle">
                </a>
                <a href="#" class="btn btn-icon btn-sm rounded-circle mode-toggle">
                    <i class="ti ti-sun"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<!-- /Horizontal Menu -->

<!-- Two Col Sidebar -->
<div class="two-col-sidebar" id="two-col-sidebar">
    <div class="sidebar sidebar-twocol">
        <div class="twocol-mini">
            <a href="${pageContext.request.contextPath}/admin-dashboard"  class="logo-small ${currentPage eq 'admin-dashboard' ? 'active' : ''}">
                <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg" alt="Logo">
            </a>
            <div class="sidebar-left slimscroll">
                <div class="nav flex-column align-items-center nav-pills" id="sidebar-tabs" role="tablist" aria-orientation="vertical">
                    <a href="#" class="nav-link ${currentPage eq 'admin-dashboard' or currentPage eq 'employee-dashboard' or currentPage eq 'deals-dashboard' or currentPage eq 'leads-dashboard' ? 'active ' : ''} " title="Dashboard" data-bs-toggle="tab" data-bs-target="#dashboard">
                        <i class="ti ti-smart-home"></i>
                    </a>
                    <a href="#" class="nav-link ${currentPage eq 'chat' or currentPage eq 'call' or currentPage eq 'voice-call' or currentPage eq 'video-call' or currentPage eq 'outgoing-call' or currentPage eq 'incoming-call' or currentPage eq 'call-history' or currentPage eq 'calendar' or currentPage eq 'email' or currentPage eq 'todo' or currentPage eq 'notes' or currentPage eq 'social-feed' or currentPage eq 'file-manager' or currentPage eq 'kanban-view' or currentPage eq 'invoices' ? 'active' : ''}" title="Apps" data-bs-toggle="tab" data-bs-target="#application">
                        <i class="ti ti-layout-grid-add"></i>
                    </a>
                    <a href="#" class="nav-link ${currentPage eq 'dashboard' or currentPage eq 'companies' or currentPage eq 'subscription' or currentPage eq 'packages' or currentPage eq 'domain' or currentPage eq 'purchase-transaction' ? 'active' : ''}" title="Super Admin" data-bs-toggle="tab" data-bs-target="#super-admin">
                        <i class="ti ti-user-star"></i>
                    </a>
                    <a href="#" class="nav-link  ${currentPage eq 'layout-horizontal' or currentPage eq 'layout-detached' or currentPage eq 'layout-modern' or currentPage eq 'layout-two-column' or currentPage eq 'layout-hovered' or currentPage eq 'layout-box' or currentPage eq 'layout-horizontal-single' or currentPage eq 'layout-horizontal-overlay' or currentPage eq 'layout-horizontal-box' or currentPage eq 'layout-horizontal-sidemenu' or currentPage eq 'layout-vertical-transparent' or currentPage eq 'layout-without-header' or currentPage eq 'layout-rtl' or currentPage eq 'layout-dark' ? 'active' : ''}" title="Layout" data-bs-toggle="tab" data-bs-target="#layout">
                        <i class="ti ti-layout-board-split"></i>
                    </a>
                    <a href="#" class="nav-link ${currentPage eq 'clients-grid' or currentPage eq 'projects-grid' or currentPage eq 'tasks' or currentPage eq 'task-board' ? 'active ' : ''} " title="Projects" data-bs-toggle="tab" data-bs-target="#projects">
                        <i class="ti ti-users-group"></i>
                    </a>
                    <a href="#" class="nav-link ${currentPage eq 'contacts-grid' or currentPage eq 'companies-grid' or currentPage eq 'deals-grid' or currentPage eq 'leads-grid' or currentPage eq 'pipeline' or currentPage eq 'analytics' or currentPage eq 'activity' ? ' show active ' : ''}" title="Crm" data-bs-toggle="tab" data-bs-target="#crm">
                        <i class="ti ti-user-shield"></i>
                    </a>
                    <a href="#" class="nav-link ${currentPage eq 'employees' or currentPage eq 'employees-grid' or currentPage eq 'employee-details' or currentPage eq 'departments' or currentPage eq 'designations' or currentPage eq 'policy' or currentPage eq 'tickets' or currentPage eq 'ticket-details' or currentPage eq 'holidays' or currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' or currentPage eq 'attendance-admin' or currentPage eq 'attendance-employee' or currentPage eq 'timesheets' or currentPage eq 'schedule-timing' or currentPage eq 'overtime' or currentPage eq 'performance-indicator' or currentPage eq 'performance-review' or currentPage eq 'performance-appraisal' or currentPage eq 'goal-tracking' or currentPage eq 'goal-type' or currentPage eq 'training' or currentPage eq 'trainers' or currentPage eq 'training-type' or currentPage eq 'promotion' or currentPage eq 'resignation' or currentPage eq 'training-type' ? '  active ' : ''}" title="Hrm" data-bs-toggle="tab" data-bs-target="#hrm">
                        <i class="ti ti-user"></i>
                    </a>
                    <a href="#" class="nav-link ${currentPage eq 'estimates' or currentPage eq 'invoices' or currentPage eq 'payments' or currentPage eq 'expenses' or currentPage eq 'provident-fund' or currentPage eq 'taxes' or currentPage eq 'categories' or currentPage eq 'budgets' or currentPage eq 'budget-expenses' or currentPage eq 'budget-revenues' or currentPage eq 'employee-salary' or currentPage eq 'payslip' or currentPage eq 'payroll' ? ' show active ' : ''}" title="Finance" data-bs-toggle="tab" data-bs-target="#finance">
                        <i class="ti ti-shopping-cart-dollar"></i>
                    </a>
                    <a href="#" class="nav-link ${currentPage eq 'assets-list' or currentPage eq 'asset-categories' or currentPage eq 'assets-list' or currentPage eq 'asset-categories' or currentPage eq 'knowledgebase' or currentPage eq 'activity' or currentPage eq 'users' or currentPage eq 'roles-permissions' or currentPage eq 'expenses-report' or currentPage eq 'invoice-report' or currentPage eq 'payment-report' or currentPage eq 'project-report' or currentPage eq 'task-report' or currentPage eq 'user-report' or currentPage eq 'employee-report' or currentPage eq 'payslip-report' or currentPage eq 'attendance-report' or currentPage eq 'leave-report' or currentPage eq 'daily-report' or currentPage eq 'profile-settings' or currentPage eq 'security-settings' or currentPage eq 'notification-settings' or currentPage eq 'connected-apps' or currentPage eq 'bussiness-settings' or currentPage eq 'seo-settings' or currentPage eq 'localization-settings' or currentPage eq 'prefixes' or currentPage eq 'preferences' or currentPage eq 'performance-appraisal' or currentPage eq 'language' or currentPage eq 'authentication-settings' or currentPage eq 'ai-settings' or currentPage eq 'salary-settings' or currentPage eq 'approval-settings' or currentPage eq 'invoice-settings' or currentPage eq 'leave-type' or currentPage eq 'custom-fields' or currentPage eq 'email-settings' or currentPage eq 'email-template' or currentPage eq 'sms-settings' or currentPage eq 'sms-template' or currentPage eq 'otp-settings' or currentPage eq 'gdpr' or currentPage eq 'maintenance-mode' or currentPage eq 'payment-gateways' or currentPage eq 'tax-rates' or currentPage eq 'currencies' or currentPage eq 'custom-css' or currentPage eq 'custom-js' or currentPage eq 'cronjob' or currentPage eq 'storage-settings' or currentPage eq 'ban-ip-address' or currentPage eq 'backup' or currentPage eq 'clear-cache' ? ' active' : ''}" title="Administration" data-bs-toggle="tab" data-bs-target="#administration">
                        <i class="ti ti-cash"></i>
                    </a>
                    <a href="#" class="nav-link  ${currentPage eq 'pages' or currentPage eq 'blogs' or currentPage eq 'blog-categories' or currentPage eq 'blog-comments' or currentPage eq 'blog-tags' or currentPage eq 'countries' or currentPage eq 'states' or currentPage eq 'cities' or currentPage eq 'testimonials' or currentPage eq 'faq' ? 'active' : ''}" title="Content" data-bs-toggle="tab" data-bs-target="#content">
                        <i class="ti ti-license"></i>
                    </a>
                    <a href="#" class="nav-link ${currentPage eq 'starter' or currentPage eq 'profile' or currentPage eq 'gallery' or currentPage eq 'search-result' or currentPage eq 'timeline' or currentPage eq 'pricing' or currentPage eq 'coming-soon' or currentPage eq 'under-maintenance' or currentPage eq 'under-construction' or currentPage eq 'api-keys' or currentPage eq 'privacy-policy' or currentPage eq 'terms-condition' ? 'active' : ''}" title="Pages" data-bs-toggle="tab" data-bs-target="#pages">
                        <i class="ti ti-page-break"></i>
                    </a>
                    <a href="#" class="nav-link ${currentPage eq 'login' or currentPage eq 'login-2' or currentPage eq 'login-3' or currentPage eq 'register' or currentPage eq 'register-2' or currentPage eq 'register-3' or currentPage eq 'forgot-password' or currentPage eq 'forgot-password-2' or currentPage eq 'forgot-password-3' or currentPage eq 'reset-password' or currentPage eq 'reset-password-2' or currentPage eq 'reset-password-3' or currentPage eq 'email-verification' or currentPage eq 'email-verification-2' or currentPage eq 'email-verification-3' or currentPage eq 'two-step-verification' or currentPage eq 'two-step-verification-2' or currentPage eq 'two-step-verification-3' or currentPage eq 'lock-screen' or currentPage eq 'error-404' or currentPage eq 'error-500' ? '  active' : ''}" title="Authentication" data-bs-toggle="tab"
                       data-bs-target="#authentication">
                        <i class="ti ti-lock-check"></i>
                    </a>
                    <a href="#" class="nav-link ${currentPage eq 'ui-alerts' or currentPage eq 'ui-accordion' or currentPage eq 'ui-avatar' or currentPage eq 'ui-badges' or currentPage eq 'ui-borders' or currentPage eq 'ui-buttons' or currentPage eq 'ui-buttons-group' or currentPage eq 'ui-breadcrumb' or currentPage eq 'ui-cards' or currentPage eq 'ui-carousel' or currentPage eq 'ui-colors' or currentPage eq 'ui-dropdowns' or currentPage eq 'ui-grid' or currentPage eq 'ui-images' or currentPage eq 'ui-lightbox' or currentPage eq 'ui-media' or currentPage eq 'ui-modals' or currentPage eq 'ui-offcanvas' or currentPage eq 'ui-pagination' or currentPage eq 'ui-popovers' or currentPage eq 'ui-progress' or currentPage eq 'ui-placeholders' or currentPage eq 'ui-spinner' or currentPage eq 'ui-sweetalerts' or currentPage eq 'ui-nav-tabs' or currentPage eq 'ui-toasts' or currentPage eq 'ui-tooltips' or currentPage eq 'ui-typography' or currentPage eq 'ui-video' or currentPage eq 'ui-ribbon' or currentPage eq 'ui-clipboard' or currentPage eq 'ui-drag-drop' or currentPage eq 'ui-rangeslider' or currentPage eq 'ui-rating' or currentPage eq 'ui-text-editor' or currentPage eq 'ui-counter' or currentPage eq 'ui-scrollbar' or currentPage eq 'ui-stickynote' or currentPage eq 'ui-timeline' or currentPage eq 'form-basic-inputs' or currentPage eq 'form-checkbox-radios' or currentPage eq 'form-input-groups' or currentPage eq 'form-grid-gutters' or currentPage eq 'form-select' or currentPage eq 'form-mask' or currentPage eq 'form-fileupload' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'form-validation' or currentPage eq 'form-wizard' or currentPage eq 'form-select2' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'tables-basic' or currentPage eq 'data-tables' or currentPage eq 'chart-apex' or currentPage eq 'chart-js' or currentPage eq 'chart-morris' or currentPage eq 'chart-flot' or currentPage eq 'chart-peity' or currentPage eq 'chart-c3' or currentPage eq 'icon-fontawesome' or currentPage eq 'icon-feather' or currentPage eq 'icon-ionic' or currentPage eq 'icon-material' or currentPage eq 'icon-pe7' or currentPage eq 'icon-simpleline' or currentPage eq 'icon-themify' or currentPage eq 'icon-weather' or currentPage eq 'icon-typicon' or currentPage eq 'icon-flag' or currentPage eq 'maps-vector' or currentPage eq 'maps-leaflet' ? ' active' : ''} " title="UI Elements" data-bs-toggle="tab"
                       data-bs-target="#ui-elements">
                        <i class="ti ti-ux-circle"></i>
                    </a>
                    <a href="#" class="nav-link" title="Extras" data-bs-toggle="tab" data-bs-target="#extras">
                        <i class="ti ti-vector-triangle"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="sidebar-right">
            <div class="sidebar-logo mb-4">
                <a href="${pageContext.request.contextPath}/admin-dashboard" class="${currentPage eq 'admin-dashboard' ? 'active' : ''}" class="logo logo-normal">
                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="Logo">
                </a>
                <!-- <a href="${pageContext.request.contextPath}/admin-dashboard" class="${currentPage eq 'admin-dashboard' ? 'active' : ''}" class="dark-logo">
                      <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="Logo">
                   </a> -->
            </div>
            <div class="sidebar-scroll">
                <h6 class="mb-3">Welcome to SmartHR</h6>
                <div class="text-center rounded bg-light p-3 mb-4">
                    <div class="avatar avatar-lg online mb-3">
                        <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg" alt="Img" class="img-fluid rounded-circle">
                    </div>
                    <h6 class="fs-12 fw-normal mb-1">Adrian Herman</h6>
                    <p class="fs-10">System Admin</p>
                </div>
                <div class="tab-content" id="v-pills-tabContent">
                    <div class="tab-pane fade  ${currentPage eq 'admin-dashboard' or currentPage eq 'employee-dashboard' or currentPage eq 'deals-dashboard' or currentPage eq 'leads-dashboard' ? 'active show' : ''}" id="dashboard">
                        <ul>
                            <li class="menu-title"><span>MAIN MENU</span></li>
                            <li><a href="${pageContext.request.contextPath}/admin-dashboard" class="${currentPage eq 'admin-dashboard' ? 'active' : ''}">Admin Dashboard</a></li>
                            <li><a href="${pageContext.request.contextPath}/employee-dashboard" class="${currentPage eq 'employee-dashboard' ? 'active' : ''}">Employee Dashboard</a></li>
                            <li><a href="${pageContext.request.contextPath}/deals-dashboard" class="${currentPage eq 'deals-dashboard' ? 'active' : ''}">Deals Dashboard</a></li>
                            <li><a href="${pageContext.request.contextPath}/leads-dashboard" class="${currentPage eq 'leads-dashboard' ? 'active' : ''}">Leads Dashboard</a></li>
                        </ul>
                    </div>
                    <div class="tab-pane fade ${currentPage eq 'chat' or currentPage eq 'call' or currentPage eq 'voice-call' or currentPage eq 'video-call' or currentPage eq 'outgoing-call' or currentPage eq 'incoming-call' or currentPage eq 'call-history' or currentPage eq 'calendar' or currentPage eq 'email' or currentPage eq 'todo' or currentPage eq 'notes' or currentPage eq 'social-feed' or currentPage eq 'file-manager' or currentPage eq 'kanban-view' or currentPage eq 'invoices' ? ' show active ' : ''}" id="application">
                        <ul>
                            <li class="menu-title"><span>APPLICATION</span></li>
                            <li><a href="${pageContext.request.contextPath}/voice-call" class="${currentPage eq 'voice-call' ? 'active' : ''}">Voice Call</a></li>
                            <li><a href="${pageContext.request.contextPath}/video-call" class="${currentPage eq 'video-call' ? 'active' : ''}">Video Call</a></li>
                            <li><a href="${pageContext.request.contextPath}/outgoing-call" class="${currentPage eq 'outgoing-call' ? 'active' : ''}">Outgoing Call</a></li>
                            <li><a href="${pageContext.request.contextPath}/incoming-call" class="${currentPage eq 'incoming-call' ? 'active' : ''}">Incoming Call</a></li>
                            <li><a href="${pageContext.request.contextPath}/call-history" class="${currentPage eq 'call-history' ? 'active' : ''}">Call History</a></li>
                            <li><a href="${pageContext.request.contextPath}/calendar" class="${currentPage eq 'calendar' ? 'active' : ''}">Calendar</a></li>
                            <li><a href="${pageContext.request.contextPath}/email" class="${currentPage eq 'email' ? 'active' : ''}">Email</a></li>
                            <li><a href="${pageContext.request.contextPath}/todo" class="${currentPage eq 'todo' ? 'active' : ''}">To Do</a></li>
                            <li><a href="${pageContext.request.contextPath}/notes" class="${currentPage eq 'notes' ? 'active' : ''}">Notes</a></li>
                            <li><a href="${pageContext.request.contextPath}/file-manager" class="${currentPage eq 'file-manager' ? 'active' : ''}">File Manager</a></li>
                            <li><a href="${pageContext.request.contextPath}/kanban-view" class="${currentPage eq 'kanban-view' ? 'active' : ''}">Kanban</a></li>
                            <li><a href="${pageContext.request.contextPath}/invoices" class="${currentPage eq 'invoices' ? 'active' : ''}">Invoices</a></li>
                        </ul>
                    </div>
                    <div class="tab-pane fade ${currentPage eq 'dashboard' or currentPage eq 'companies' or currentPage eq 'subscription' or currentPage eq 'packages' or currentPage eq 'domain' or currentPage eq 'purchase-transaction' ? ' show active' : ''}" id="super-admin">
                        <ul>
                            <li class="menu-title"><span>SUPER ADMIN</span></li>
                            <li><a href="${pageContext.request.contextPath}/dashboard" class="${currentPage eq 'dashboard' ? 'active' : ''}">Dashboard</a></li>
                            <li><a href="${pageContext.request.contextPath}/companies" class="${currentPage eq 'companies' ? 'active' : ''}">Companies</a></li>
                            <li><a href="${pageContext.request.contextPath}/subscription" class="${currentPage eq 'subscription' ? 'active' : ''}">Subscriptions</a></li>
                            <li><a href="${pageContext.request.contextPath}/packages" class="${currentPage eq 'packages' ? 'active' : ''}">Packages</a></li>
                            <li><a href="${pageContext.request.contextPath}/domain" class="${currentPage eq 'domain' ? 'active' : ''}">Domain</a></li>
                            <li><a href="${pageContext.request.contextPath}/purchase-transaction" class="${currentPage eq 'purchase-transaction' ? 'active' : ''}">Purchase Transaction</a></li>
                        </ul>
                    </div>
                    <div class="tab-pane fade ${currentPage eq 'layout-horizontal' or currentPage eq 'layout-detached' or currentPage eq 'layout-modern' or currentPage eq 'layout-two-column' or currentPage eq 'layout-hovered' or currentPage eq 'layout-box' or currentPage eq 'layout-horizontal-single' or currentPage eq 'layout-horizontal-overlay' or currentPage eq 'layout-horizontal-box' or currentPage eq 'layout-horizontal-sidemenu' or currentPage eq 'layout-vertical-transparent' or currentPage eq 'layout-without-header' or currentPage eq 'layout-rtl' or currentPage eq 'layout-dark' ? ' show active' : ''}" id="layout">
                        <ul>
                            <li class="menu-title"><span>LAYOUT</span></li>
                            <li><a href="${pageContext.request.contextPath}/layout-horizontal" class="${currentPage eq 'layout-horizontal' ? 'active' : ''}"><span>Horizontal</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-detached" class="${currentPage eq 'layout-detached' ? 'active' : ''}"><span>Detached</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-modern" class="${currentPage eq 'layout-modern' ? 'active' : ''}"><span>Modern</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-two-column" class="${currentPage eq 'layout-two-column' ? 'active' : ''}"><span>Two Column </span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-hovered" class="${currentPage eq 'layout-hovered' ? 'active' : ''}"><span>Hovered</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-box" class="${currentPage eq 'layout-box' ? 'active' : ''}"><span>Boxed</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-horizontal-single" class="${currentPage eq 'layout-horizontal-single' ? 'active' : ''}"><span>Horizontal Single</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-horizontal-overlay" class="${currentPage eq 'layout-horizontal-overlay' ? 'active' : ''}"><span>Horizontal Overlay</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-horizontal-box" class="${currentPage eq 'layout-horizontal-box' ? 'active' : ''}"><span>Horizontal Box</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-horizontal-sidemenu" class="${currentPage eq 'layout-horizontal-sidemenu' ? 'active' : ''}"><span>Menu Aside</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-vertical-transparent" class="${currentPage eq 'layout-vertical-transparent' ? 'active' : ''}"><span>Transparent</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-without-header" class="${currentPage eq 'layout-without-header' ? 'active' : ''}"><span>Without Header</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-rtl" class="${currentPage eq 'layout-rtl' ? 'active' : ''}"><span>RTL</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/layout-dark" class="${currentPage eq 'layout-dark' ? 'active' : ''}"><span>Dark</span></a></li>
                        </ul>
                    </div>
                    <div class="tab-pane fade ${currentPage eq 'clients-grid' or currentPage eq 'projects-grid' or currentPage eq 'tasks' or currentPage eq 'task-board' ? 'show active ' : ''} " id="projects">
                        <ul>
                            <li class="menu-title"><span>PROJECTS</span></li>
                            <li><a href="${pageContext.request.contextPath}/clients-grid" class="${currentPage eq 'clients-grid' ? 'active' : ''}">Clients</a></li>
                            <li class="submenu">
                                <a href="javascript:void(0);"><span>Projects</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/projects-grid" class="${currentPage eq 'projects-grid' ? 'active' : ''}">Projects</a></li>
                                    <li><a href="${pageContext.request.contextPath}/tasks" class="${currentPage eq 'tasks' ? 'active' : ''}">Tasks</a></li>
                                    <li><a href="${pageContext.request.contextPath}/task-board" class="${currentPage eq 'task-board' ? 'active' : ''}">Task Board</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane fade ${currentPage eq 'contacts-grid' or currentPage eq 'companies-grid' or currentPage eq 'deals-grid' or currentPage eq 'leads-grid' or currentPage eq 'pipeline' or currentPage eq 'analytics' or currentPage eq 'activity' ? ' show active ' : ''}" id="crm">
                        <ul>
                            <li class="menu-title"><span>CRM</span></li>
                            <li><a href="${pageContext.request.contextPath}/contacts-grid" class="${currentPage eq 'contacts-grid' ? 'active' : ''}"><span>Contacts</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/companies-grid" class="${currentPage eq 'companies-grid' ? 'active' : ''}"><span>Companies</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/deals-grid" class="${currentPage eq 'deals-grid' ? 'active' : ''}"><span>Deals</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/leads-grid" class="${currentPage eq 'leads-grid' ? 'active' : ''}"><span>Leads</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/pipeline" class="${currentPage eq 'pipeline' ? 'active' : ''}"><span>Pipeline</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/analytics" class="${currentPage eq 'analytics' ? 'active' : ''}"><span>Analytics</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/activity" class="${currentPage eq 'activity' ? 'active' : ''}"><span>Activities</span></a></li>
                        </ul>
                    </div>
                    <div class="tab-pane fade ${currentPage eq 'employees' or currentPage eq 'employees-grid' or currentPage eq 'employee-details' or currentPage eq 'departments' or currentPage eq 'designations' or currentPage eq 'policy' or currentPage eq 'tickets' or currentPage eq 'ticket-details' or currentPage eq 'holidays' or currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' or currentPage eq 'attendance-admin' or currentPage eq 'attendance-employee' or currentPage eq 'timesheets' or currentPage eq 'schedule-timing' or currentPage eq 'overtime' or currentPage eq 'performance-indicator' or currentPage eq 'performance-review' or currentPage eq 'performance-appraisal' or currentPage eq 'goal-tracking' or currentPage eq 'goal-type' or currentPage eq 'training' or currentPage eq 'trainers' or currentPage eq 'training-type' or currentPage eq 'promotion' or currentPage eq 'resignation' or currentPage eq 'training-type' ? ' show active ' : ''}" id="hrm">
                        <ul>
                            <li class="menu-title"><span>HRM</span></li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class=" ${currentPage eq 'employees' or currentPage eq 'employees-grid' or currentPage eq 'employee-details' or currentPage eq 'departments' or currentPage eq 'designations' or currentPage eq 'policy' ? 'show active' : ''}"><span>Employees</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/employees" class="${currentPage eq 'employees' ? 'active' : ''}">Employee Lists</a></li>
                                    <li><a href="${pageContext.request.contextPath}/employees-grid" class="${currentPage eq 'employees-grid' ? 'active' : ''}">Employee Grid</a></li>
                                    <li><a href="${pageContext.request.contextPath}/employee-details" class="${currentPage eq 'employee-details' ? 'active' : ''}">Employee Details</a></li>
                                    <li><a href="${pageContext.request.contextPath}/departments" class="${currentPage eq 'departments' ? 'active' : ''}">Departments</a></li>
                                    <li><a href="${pageContext.request.contextPath}/designations" class="${currentPage eq 'designations' ? 'active' : ''}">Designations</a></li>
                                    <li><a href="${pageContext.request.contextPath}/policy" class="${currentPage eq 'policy' ? 'active' : ''}">Policies</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class=" ${currentPage eq 'tickets' or currentPage eq 'ticket-details' ? 'active subdrop' : ''}"><span>Tickets</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/tickets" class="${currentPage eq 'tickets' ? 'active' : ''}">Tickets</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ticket-details" class="${currentPage eq 'ticket-details' ? 'active' : ''}">Ticket Details</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/holidays" class="${currentPage eq 'holidays' ? 'active' : ''}"><span>Holidays</span></a></li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class=" ${currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' or currentPage eq 'attendance-admin' or currentPage eq 'attendance-employee' or currentPage eq 'timesheets' or currentPage eq 'schedule-timing' or currentPage eq 'overtime' ? 'active subdrop' : ''}"><span>Attendance</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li class="submenu submenu-two">
                                        <a href="javascript:void(0);"class=" ${currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' ? 'active subdrop' : ''}">Leaves<span
                                                class="menu-arrow inside-submenu"></span></a>
                                        <ul>
                                            <li><a href="${pageContext.request.contextPath}/leaves" class="${currentPage eq 'leaves' ? 'active' : ''}">Leaves (Admin)</a></li>
                                            <li><a href="${pageContext.request.contextPath}/leaves-employee" class="${currentPage eq 'leaves-employee' ? 'active' : ''}">Leave (Employee)</a></li>
                                            <li><a href="${pageContext.request.contextPath}/leave-settings" class="${currentPage eq 'leave-settings' ? 'active' : ''}">Leave Settings</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/attendance-admin" class="${currentPage eq 'attendance-admin' ? 'active' : ''}">Attendance (Admin)</a></li>
                                    <li><a href="${pageContext.request.contextPath}/attendance-employee" class="${currentPage eq 'attendance-employee' ? 'active' : ''}">Attendance (Employee)</a></li>
                                    <li><a href="${pageContext.request.contextPath}/timesheets" class="${currentPage eq 'timesheets' ? 'active' : ''}">Timesheets</a></li>
                                    <li><a href="${pageContext.request.contextPath}/schedule-timing" class="${currentPage eq 'schedule-timing' ? 'active' : ''}">Shift & Schedule</a></li>
                                    <li><a href="${pageContext.request.contextPath}/overtime" class="${currentPage eq 'overtime' ? 'active' : ''}">Overtime</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class=" ${currentPage eq 'performance-indicator' or currentPage eq 'performance-review' or currentPage eq 'performance-appraisal' or currentPage eq 'goal-tracking' or currentPage eq 'goal-type' ? 'active subdrop' : ''}"><span>Performance</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/performance-indicator" class="${currentPage eq 'performance-indicator' ? 'active' : ''}">Performance Indicator</a></li>
                                    <li><a href="${pageContext.request.contextPath}/performance-review" class="${currentPage eq 'performance-review' ? 'active' : ''}">Performance Review</a></li>
                                    <li><a href="${pageContext.request.contextPath}/performance-appraisal" class="${currentPage eq 'performance-appraisal' ? 'active' : ''}">Performance Appraisal</a></li>
                                    <li><a href="${pageContext.request.contextPath}/goal-tracking" class="${currentPage eq 'goal-tracking' ? 'active' : ''}">Goal List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/goal-type" class="${currentPage eq 'goal-type' ? 'active' : ''}">Goal Type</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class=" ${currentPage eq 'training' or currentPage eq 'trainers' or currentPage eq 'training-type' ? 'active subdrop' : ''}"><span>Training</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/training" class="${currentPage eq 'training' ? 'active' : ''}">Training List</a></li>
                                    <li><a href="${pageContext.request.contextPath}/trainers" class="${currentPage eq 'trainers' ? 'active' : ''}">Trainers</a></li>
                                    <li><a href="${pageContext.request.contextPath}/training-type" class="${currentPage eq 'training-type' ? 'active' : ''}">Training Type</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/promotion" class="${currentPage eq 'promotion' ? 'active' : ''}"><span>Promotion</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/resignation" class="${currentPage eq 'resignation' ? 'active' : ''}"><span>Resignation</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/termination" class="${currentPage eq 'termination' ? 'active' : ''}"><span>Termination</span></a></li>
                        </ul>
                    </div>
                    <div class="tab-pane fade ${currentPage eq 'estimates' or currentPage eq 'invoices' or currentPage eq 'payments' or currentPage eq 'expenses' or currentPage eq 'provident-fund' or currentPage eq 'taxes' or currentPage eq 'categories' or currentPage eq 'budgets' or currentPage eq 'budget-expenses' or currentPage eq 'budget-revenues' or currentPage eq 'employee-salary' or currentPage eq 'payslip' or currentPage eq 'payroll' ? ' show active ' : ''}" id="finance">
                        <ul>
                            <li class="menu-title"><span>FINANCE & ACCOUNTS</span></li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class=" ${currentPage eq 'estimates' or currentPage eq 'invoices' or currentPage eq 'payments' or currentPage eq 'expenses' or currentPage eq 'provident-fund' or currentPage eq 'taxes' ? 'active subdrop' : ''}"><span>Sales</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/estimates" class="${currentPage eq 'estimates' ? 'active' : ''}">Estimates</a></li>
                                    <li><a href="${pageContext.request.contextPath}/invoices" class="${currentPage eq 'invoices' ? 'active' : ''}">Invoices</a></li>
                                    <li><a href="${pageContext.request.contextPath}/payments" class="${currentPage eq 'payments' ? 'active' : ''}">Payments</a></li>
                                    <li><a href="${pageContext.request.contextPath}/expenses" class="${currentPage eq 'expenses' ? 'active' : ''}">Expenses</a></li>
                                    <li><a href="${pageContext.request.contextPath}/provident-fund" class="${currentPage eq 'provident-fund' ? 'active' : ''}">Provident Fund</a></li>
                                    <li><a href="${pageContext.request.contextPath}/taxes" class="${currentPage eq 'taxes' ? 'active' : ''}">Taxes</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class=" ${currentPage eq 'categories' or currentPage eq 'budgets' or currentPage eq 'budget-expenses' or currentPage eq 'budget-revenues' ? 'active subdrop' : ''}"><span>Accounting</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/categories" class="${currentPage eq 'categories' ? 'active' : ''}">Categories</a></li>
                                    <li><a href="${pageContext.request.contextPath}/budgets" class="${currentPage eq 'budgets' ? 'active' : ''}">Budgets</a></li>
                                    <li><a href="${pageContext.request.contextPath}/budget-expenses" class="${currentPage eq 'budget-expenses' ? 'active' : ''}">Budget Expenses</a></li>
                                    <li><a href="${pageContext.request.contextPath}/budget-revenues" class="${currentPage eq 'budget-revenues' ? 'active' : ''}">Budget Revenues</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'employee-salary' or currentPage eq 'payslip' or currentPage eq 'payroll' ? 'active subdrop' : ''}"><span>Payroll</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/employee-salary" class="${currentPage eq 'employee-salary' ? 'active' : ''}">Employee Salary</a></li>
                                    <li><a href="${pageContext.request.contextPath}/payslip" class="${currentPage eq 'payslip' ? 'active' : ''}">Payslip</a></li>
                                    <li><a href="${pageContext.request.contextPath}/payroll" class="${currentPage eq 'payroll' ? 'active' : ''}">Payroll Items</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane fade ${currentPage eq 'assets-list' or currentPage eq 'asset-categories' or currentPage eq 'assets-list' or currentPage eq 'asset-categories' or currentPage eq 'knowledgebase' or currentPage eq 'activity' or currentPage eq 'users' or currentPage eq 'roles-permissions' or currentPage eq 'expenses-report' or currentPage eq 'invoice-report' or currentPage eq 'payment-report' or currentPage eq 'project-report' or currentPage eq 'task-report' or currentPage eq 'user-report' or currentPage eq 'employee-report' or currentPage eq 'payslip-report' or currentPage eq 'attendance-report' or currentPage eq 'leave-report' or currentPage eq 'daily-report' or currentPage eq 'profile-settings' or currentPage eq 'security-settings' or currentPage eq 'notification-settings' or currentPage eq 'connected-apps' or currentPage eq 'bussiness-settings' or currentPage eq 'seo-settings' or currentPage eq 'localization-settings' or currentPage eq 'prefixes' or currentPage eq 'preferences' or currentPage eq 'performance-appraisal' or currentPage eq 'language' or currentPage eq 'authentication-settings' or currentPage eq 'ai-settings' or currentPage eq 'salary-settings' or currentPage eq 'approval-settings' or currentPage eq 'invoice-settings' or currentPage eq 'leave-type' or currentPage eq 'custom-fields' or currentPage eq 'email-settings' or currentPage eq 'email-template' or currentPage eq 'sms-settings' or currentPage eq 'sms-template' or currentPage eq 'otp-settings' or currentPage eq 'gdpr' or currentPage eq 'maintenance-mode' or currentPage eq 'payment-gateways' or currentPage eq 'tax-rates' or currentPage eq 'currencies' or currentPage eq 'custom-css' or currentPage eq 'custom-js' or currentPage eq 'cronjob' or currentPage eq 'storage-settings' or currentPage eq 'ban-ip-address' or currentPage eq 'backup' or currentPage eq 'clear-cache' ? 'show active' : ''}" id="administration">
                        <ul>
                            <li class="menu-title"><span>ADMINISTRATION</span></li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'assets-list' or currentPage eq 'asset-categories' ? 'active subdrop' : ''}"><span>Assets</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/assets-list" class="${currentPage eq 'assets-list' ? 'active' : ''}">Assets</a></li>
                                    <li><a href="${pageContext.request.contextPath}/asset-categories" class="${currentPage eq 'asset-categories' ? 'active' : ''}">Asset Categories</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'knowledgebase' or currentPage eq 'activity' ? 'active subdrop' : ''}"><span>Help & Supports</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/knowledgebase"class="${currentPage eq 'knowledgebase' ? 'active' : ''}">Knowledge Base</a></li>
                                    <li><a href="${pageContext.request.contextPath}/activity" class="${currentPage eq 'activity' ? 'active' : ''}">Activities</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'users' or currentPage eq 'roles-permissions' ? 'active subdrop' : ''}"><span>User Management</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/users" class="${currentPage eq 'users' ? 'active' : ''}">Users</a></li>
                                    <li><a href="${pageContext.request.contextPath}/roles-permissions" class="${currentPage eq 'roles-permissions' ? 'active' : ''}">Roles & Permissions</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'expenses-report' or currentPage eq 'invoice-report' or currentPage eq 'payment-report' or currentPage eq 'project-report' or currentPage eq 'task-report' or currentPage eq 'user-report' or currentPage eq 'employee-report' or currentPage eq 'payslip-report' or currentPage eq 'attendance-report' or currentPage eq 'leave-report' or currentPage eq 'daily-report' ? 'active subdrop' : ''}"><span>Reports</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/expenses-report" class="${currentPage eq 'expenses-report' ? 'active' : ''}">Expense Report</a></li>
                                    <li><a href="${pageContext.request.contextPath}/invoice-report" class="${currentPage eq 'invoice-report' ? 'active' : ''}">Invoice Report</a></li>
                                    <li><a href="${pageContext.request.contextPath}/payment-report" class="${currentPage eq 'payment-report' ? 'active' : ''}">Payment Report</a></li>
                                    <li><a href="${pageContext.request.contextPath}/project-report" class="${currentPage eq 'project-report' ? 'active' : ''}">Project Report</a></li>
                                    <li><a href="${pageContext.request.contextPath}/task-report" class="${currentPage eq 'task-report' ? 'active' : ''}">Task Report</a></li>
                                    <li><a href="${pageContext.request.contextPath}/user-report" class="${currentPage eq 'user-report' ? 'active' : ''}">User Report</a></li>
                                    <li><a href="${pageContext.request.contextPath}/employee-report" class="${currentPage eq 'employee-report' ? 'active' : ''}">Employee Report</a></li>
                                    <li><a href="${pageContext.request.contextPath}/payslip-report" class="${currentPage eq 'payslip-report' ? 'active' : ''}">Payslip Report</a></li>
                                    <li><a href="${pageContext.request.contextPath}/attendance-report" class="${currentPage eq 'attendance-report' ? 'active' : ''}">Attendance Report</a></li>
                                    <li><a href="${pageContext.request.contextPath}/leave-report" class="${currentPage eq 'leave-report' ? 'active' : ''}">Leave Report</a></li>
                                    <li><a href="${pageContext.request.contextPath}/daily-report" class="${currentPage eq 'daily-report' ? 'active' : ''}">Daily Report</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);" class="${currentPage eq 'profile-settings' or currentPage eq 'security-settings' or currentPage eq 'notification-settings' or currentPage eq 'connected-apps' ? 'active subdrop' : ''}">
                                    General Settings
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/profile-settings" class="${currentPage eq 'profile-settings' ? 'active' : ''}">Profile</a></li>
                                    <li><a href="${pageContext.request.contextPath}/security-settings" class="${currentPage eq 'security-settings' ? 'active' : ''}">Security</a></li>
                                    <li><a href="${pageContext.request.contextPath}/notification-settings"class="${currentPage eq 'notification-settings' ? 'active' : ''}">Notifications</a></li>
                                    <li><a href="${pageContext.request.contextPath}/connected-apps"class="${currentPage eq 'connected-apps' ? 'active' : ''}">Connected Apps</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'bussiness-settings' or currentPage eq 'seo-settings' or currentPage eq 'localization-settings' or currentPage eq 'prefixes' or currentPage eq 'preferences' or currentPage eq 'performance-appraisal' or currentPage eq 'language' or currentPage eq 'authentication-settings' or currentPage eq 'ai-settings' ? 'active subdrop' : ''}">
                                    Website Settings
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/bussiness-settings"class="${currentPage eq 'bussiness-settings' ? 'active' : ''}">Business Settings</a></li>
                                    <li><a href="${pageContext.request.contextPath}/seo-settings"class="${currentPage eq 'seo-settings' ? 'active' : ''}">SEO Settings</a></li>
                                    <li><a href="${pageContext.request.contextPath}/localization-settings"class="${currentPage eq 'localization-settings' ? 'active' : ''}">Localization</a></li>
                                    <li><a href="${pageContext.request.contextPath}/prefixes"class="${currentPage eq 'prefixes' ? 'active' : ''}">Prefixes</a></li>
                                    <li><a href="${pageContext.request.contextPath}/preferences"class="${currentPage eq 'preferences' ? 'active' : ''}">Preferences</a></li>
                                    <li><a href="${pageContext.request.contextPath}/performance-appraisal"class="${currentPage eq 'performance-appraisal' ? 'active' : ''}">Appearance</a></li>
                                    <li><a href="${pageContext.request.contextPath}/language"class="${currentPage eq 'language' ? 'active' : ''}">Language</a></li>
                                    <li><a href="${pageContext.request.contextPath}/authentication-settings"class="${currentPage eq 'authentication-settings' ? 'active' : ''}">Authentication</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ai-settings"class="${currentPage eq 'ai-settings' ? 'active' : ''}">AI Settings</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'salary-settings' or currentPage eq 'approval-settings' or currentPage eq 'invoice-settings' or currentPage eq 'leave-type' or currentPage eq 'custom-fields' ? 'active subdrop' : ''}">App Settings<span class="menu-arrow"></span></a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/salary-settings" class="${currentPage eq 'salary-settings' ? 'active' : ''}">Salary Settings</a></li>
                                    <li><a href="${pageContext.request.contextPath}/approval-settings" class="${currentPage eq 'approval-settings' ? 'active' : ''}">Approval Settings</a></li>
                                    <li><a href="${pageContext.request.contextPath}/invoice-settings" class="${currentPage eq 'invoice-settings' ? 'active' : ''}">Invoice Settings</a></li>
                                    <li><a href="${pageContext.request.contextPath}/leave-type" class="${currentPage eq 'leave-type' ? 'active' : ''}">Leave Type</a></li>
                                    <li><a href="${pageContext.request.contextPath}/custom-fields" class="${currentPage eq 'custom-fields' ? 'active' : ''}">Custom Fields</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);" class="${currentPage eq 'email-settings' or currentPage eq 'email-template' or currentPage eq 'sms-settings' or currentPage eq 'sms-template' or currentPage eq 'otp-settings' or currentPage eq 'gdpr' or currentPage eq 'maintenance-mode' ? 'active subdrop' : ''}">
                                    System Settings
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/email-settings" class="${currentPage eq 'email-settings' ? 'active' : ''}">Email Settings</a></li>
                                    <li><a href="${pageContext.request.contextPath}/email-template" class="${currentPage eq 'email-template' ? 'active' : ''}">Email Templates</a></li>
                                    <li><a href="${pageContext.request.contextPath}/sms-settings" class="${currentPage eq 'sms-settings' ? 'active' : ''}">SMS Settings</a></li>
                                    <li><a href="${pageContext.request.contextPath}/sms-template" class="${currentPage eq 'sms-template' ? 'active' : ''}">SMS Templates</a></li>
                                    <li><a href="${pageContext.request.contextPath}/otp-settings" class="${currentPage eq 'otp-settings' ? 'active' : ''}">OTP</a></li>
                                    <li><a href="${pageContext.request.contextPath}/gdpr" class="${currentPage eq 'gdpr' ? 'active' : ''}">GDPR Cookies</a></li>
                                    <li><a href="${pageContext.request.contextPath}/maintenance-mode" class="${currentPage eq 'maintenance-mode' ? 'active' : ''}">Maintenance Mode</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'payment-gateways' or currentPage eq 'tax-rates' or currentPage eq 'currencies' ? 'active subdrop' : ''}">
                                    Financial Settings
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/payment-gateways" class="${currentPage eq 'payment-gateways' ? 'active' : ''}">Payment Gateways</a></li>
                                    <li><a href="${pageContext.request.contextPath}/tax-rates" class="${currentPage eq 'tax-rates' ? 'active' : ''}">Tax Rate</a></li>
                                    <li><a href="${pageContext.request.contextPath}/currencies" class="${currentPage eq 'currencies' ? 'active' : ''}">Currencies</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'custom-css' or currentPage eq 'custom-js' or currentPage eq 'cronjob' or currentPage eq 'storage-settings' or currentPage eq 'ban-ip-address' or currentPage eq 'backup' or currentPage eq 'clear-cache' ? 'active subdrop' : ''}">Other Settings<span class="menu-arrow"></span></a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/custom-css" class="${currentPage eq 'custom-css' ? 'active' : ''}">Custom CSS</a></li>
                                    <li><a href="${pageContext.request.contextPath}/custom-js" class="${currentPage eq 'custom-js' ? 'active' : ''}">Custom JS</a></li>
                                    <li><a href="${pageContext.request.contextPath}/cronjob" class="${currentPage eq 'cronjob' ? 'active' : ''}">Cronjob</a></li>
                                    <li><a href="${pageContext.request.contextPath}/storage-settings" class="${currentPage eq 'storage-settings' ? 'active' : ''}">Storage</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ban-ip-address" class="${currentPage eq 'ban-ip-address' ? 'active' : ''}">Ban IP Address</a></li>
                                    <li><a href="${pageContext.request.contextPath}/backup" class="${currentPage eq 'backup' ? 'active' : ''}">Backup</a></li>
                                    <li><a href="${pageContext.request.contextPath}/clear-cache" class="${currentPage eq 'clear-cache' ? 'active' : ''}">Clear Cache</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane fade ${currentPage eq 'pages' or currentPage eq 'blogs' or currentPage eq 'blog-categories' or currentPage eq 'blog-comments' or currentPage eq 'blog-tags' or currentPage eq 'countries' or currentPage eq 'states' or currentPage eq 'cities' or currentPage eq 'testimonials' or currentPage eq 'faq' ? ' show active' : ''}" id="content">
                        <ul>
                            <li class="menu-title"><span>CONTENT</span></li>
                            <li><a href="${pageContext.request.contextPath}/pages" class="${currentPage eq 'pages' ? 'active' : ''}">Pages</a></li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'blogs' or currentPage eq 'blog-categories' or currentPage eq 'blog-comments' or currentPage eq 'blog-tags' ? 'active subdrop' : ''}">
                                    Blogs
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/blogs" class="${currentPage eq 'blogs' ? 'active' : ''}">All Blogs</a></li>
                                    <li><a href="${pageContext.request.contextPath}/blog-categories" class="${currentPage eq 'blog-categories' ? 'active' : ''}">Categories</a></li>
                                    <li><a href="${pageContext.request.contextPath}/blog-comments" class="${currentPage eq 'blog-comments' ? 'active' : ''}">Comments</a></li>
                                    <li><a href="${pageContext.request.contextPath}/blog-tags" class="${currentPage eq 'blog-tags' ? 'active' : ''}">Blog Tags</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'countries' or currentPage eq 'states' or currentPage eq 'cities' ? 'active subdrop' : ''}">
                                    Locations
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/countries" class="${currentPage eq 'countries' ? 'active' : ''}">Countries</a></li>
                                    <li><a href="${pageContext.request.contextPath}/states" class="${currentPage eq 'states' ? 'active' : ''}">States</a></li>
                                    <li><a href="${pageContext.request.contextPath}/cities" class="${currentPage eq 'cities' ? 'active' : ''}">Cities</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/testimonials" class="${currentPage eq 'testimonials' ? 'active' : ''}">Testimonials</a></li>
                            <li><a href="${pageContext.request.contextPath}/faq" class="${currentPage eq 'faq' ? 'active' : ''}">FAQ’S</a></li>
                        </ul>
                    </div>
                    <div class="tab-pane fade  ${currentPage eq 'starter' or currentPage eq 'profile' or currentPage eq 'gallery' or currentPage eq 'search-result' or currentPage eq 'timeline' or currentPage eq 'pricing' or currentPage eq 'coming-soon' or currentPage eq 'under-maintenance' or currentPage eq 'under-construction' or currentPage eq 'api-keys' or currentPage eq 'privacy-policy' or currentPage eq 'terms-condition' ? ' show active' : ''}" id="pages">
                        <ul>
                            <li class="menu-title"><span>PAGES</span></li>
                            <li><a href="${pageContext.request.contextPath}/starter" class="${currentPage eq 'starter' ? 'active' : ''}"><span>Starter</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/profile" class="${currentPage eq 'profile' ? 'active' : ''}"><span>Profile</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/gallery" class="${currentPage eq 'gallery' ? 'active' : ''}"><span>Gallery</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/search-result" class="${currentPage eq 'search-result' ? 'active' : ''}"><span>Search Results</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/timeline" class="${currentPage eq 'timeline' ? 'active' : ''}"><span>Timeline</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/pricing" class="${currentPage eq 'pricing' ? 'active' : ''}"><span>Pricing</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/coming-soon" class="${currentPage eq 'coming-soon' ? 'active' : ''}"><span>Coming Soon</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/under-maintenance" class="${currentPage eq 'under-maintenance' ? 'active' : ''}"><span>Under Maintenance</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/under-construction" class="${currentPage eq 'under-construction' ? 'active' : ''}"><span>Under Construction</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/api-keys" class="${currentPage eq 'api-keys' ? 'active' : ''}"><span>API Keys</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/privacy-policy" class="${currentPage eq 'privacy-policy' ? 'active' : ''}"><span>Privacy Policy</span></a></li>
                            <li><a href="${pageContext.request.contextPath}/terms-condition" class="${currentPage eq 'terms-condition' ? 'active' : ''}"><span>Terms & Conditions</span></a></li>
                        </ul>
                    </div>
                    <div class="tab-pane fade ${currentPage eq 'login' or currentPage eq 'login-2' or currentPage eq 'login-3' or currentPage eq 'register' or currentPage eq 'register-2' or currentPage eq 'register-3' or currentPage eq 'forgot-password' or currentPage eq 'forgot-password-2' or currentPage eq 'forgot-password-3' or currentPage eq 'reset-password' or currentPage eq 'reset-password-2' or currentPage eq 'reset-password-3' or currentPage eq 'email-verification' or currentPage eq 'email-verification-2' or currentPage eq 'email-verification-3' or currentPage eq 'two-step-verification' or currentPage eq 'two-step-verification-2' or currentPage eq 'two-step-verification-3' or currentPage eq 'lock-screen' or currentPage eq 'error-404' or currentPage eq 'error-500' ? ' show active' : ''}" id="authentication">
                        <ul>
                            <li class="menu-title"><span>AUTHENTICATION</span></li>
                            <li class="submenu">
                                <a href="javascript:void(0);">
                                    Login<span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/login" class="${currentPage eq 'login' ? 'active' : ''}">Cover</a></li>
                                    <li><a href="${pageContext.request.contextPath}/login-2" class="${currentPage eq 'login-2' ? 'active' : ''}">Illustration</a></li>
                                    <li><a href="${pageContext.request.contextPath}/login-3" class="${currentPage eq 'login-3' ? 'active' : ''}">Basic</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);">
                                    Register<span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/register" class="${currentPage eq 'register' ? 'active' : ''}">Cover</a></li>
                                    <li><a href="${pageContext.request.contextPath}/register-2" class="${currentPage eq 'register-2' ? 'active' : ''}">Illustration</a></li>
                                    <li><a href="${pageContext.request.contextPath}/register-3" class="${currentPage eq 'register-3' ? 'active' : ''}">Basic</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);">
                                    Forgot Password<span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/forgot-password" class="${currentPage eq 'forgot-password' ? 'active' : ''}">Cover</a></li>
                                    <li><a href="${pageContext.request.contextPath}/forgot-password-2" class="${currentPage eq 'forgot-password-2' ? 'active' : ''}">Illustration</a></li>
                                    <li><a href="${pageContext.request.contextPath}/forgot-password-3" class="${currentPage eq 'forgot-password-3' ? 'active' : ''}">Basic</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);">
                                    Reset Password<span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/reset-password" class="${currentPage eq 'reset-password' ? 'active' : ''}">Cover</a></li>
                                    <li><a href="${pageContext.request.contextPath}/reset-password-2" class="${currentPage eq 'reset-password-2' ? 'active' : ''}">Illustration</a></li>
                                    <li><a href="${pageContext.request.contextPath}/reset-password-3" class="${currentPage eq 'reset-password-3' ? 'active' : ''}">Basic</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);">
                                    Email Verification<span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/email-verification" class="${currentPage eq 'email-verification' ? 'active' : ''}">Cover</a></li>
                                    <li><a href="${pageContext.request.contextPath}/email-verification-2" class="${currentPage eq 'email-verification-2' ? 'active' : ''}">Illustration</a></li>
                                    <li><a href="${pageContext.request.contextPath}/email-verification-3" class="${currentPage eq 'email-verification-3' ? 'active' : ''}">Basic</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);">
                                    2 Step Verification<span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/two-step-verification" class="${currentPage eq 'two-step-verification' ? 'active' : ''}">Cover</a></li>
                                    <li><a href="${pageContext.request.contextPath}/two-step-verification-2" class="${currentPage eq 'two-step-verification-2' ? 'active' : ''}">Illustration</a></li>
                                    <li><a href="${pageContext.request.contextPath}/two-step-verification-3" class="${currentPage eq 'two-step-verification-3' ? 'active' : ''}">Basic</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/lock-screen" class="${currentPage eq 'lock-screen' ? 'active' : ''}">Lock Screen</a></li>
                            <li><a href="${pageContext.request.contextPath}/error-404" class="${currentPage eq 'error-404' ? 'active' : ''}">404 Error</a></li>
                            <li><a href="${pageContext.request.contextPath}/error-500" class="${currentPage eq 'error-500' ? 'active' : ''}">500 Error</a></li>
                        </ul>
                    </div>
                    <div class="tab-pane fade ${currentPage eq 'ui-alerts' or currentPage eq 'ui-accordion' or currentPage eq 'ui-avatar' or currentPage eq 'ui-badges' or currentPage eq 'ui-borders' or currentPage eq 'ui-buttons' or currentPage eq 'ui-buttons-group' or currentPage eq 'ui-breadcrumb' or currentPage eq 'ui-cards' or currentPage eq 'ui-carousel' or currentPage eq 'ui-colors' or currentPage eq 'ui-dropdowns' or currentPage eq 'ui-grid' or currentPage eq 'ui-images' or currentPage eq 'ui-lightbox' or currentPage eq 'ui-media' or currentPage eq 'ui-modals' or currentPage eq 'ui-offcanvas' or currentPage eq 'ui-pagination' or currentPage eq 'ui-popovers' or currentPage eq 'ui-progress' or currentPage eq 'ui-placeholders' or currentPage eq 'ui-spinner' or currentPage eq 'ui-sweetalerts' or currentPage eq 'ui-nav-tabs' or currentPage eq 'ui-toasts' or currentPage eq 'ui-tooltips' or currentPage eq 'ui-typography' or currentPage eq 'ui-video' or currentPage eq 'ui-ribbon' or currentPage eq 'ui-clipboard' or currentPage eq 'ui-drag-drop' or currentPage eq 'ui-rangeslider' or currentPage eq 'ui-rating' or currentPage eq 'ui-text-editor' or currentPage eq 'ui-counter' or currentPage eq 'ui-scrollbar' or currentPage eq 'ui-stickynote' or currentPage eq 'ui-timeline' or currentPage eq 'form-basic-inputs' or currentPage eq 'form-checkbox-radios' or currentPage eq 'form-input-groups' or currentPage eq 'form-grid-gutters' or currentPage eq 'form-select' or currentPage eq 'form-mask' or currentPage eq 'form-fileupload' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'form-validation' or currentPage eq 'form-wizard' or currentPage eq 'form-select2' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'tables-basic' or currentPage eq 'data-tables' or currentPage eq 'chart-apex' or currentPage eq 'chart-js' or currentPage eq 'chart-morris' or currentPage eq 'chart-flot' or currentPage eq 'chart-peity' or currentPage eq 'chart-c3' or currentPage eq 'icon-fontawesome' or currentPage eq 'icon-feather' or currentPage eq 'icon-ionic' or currentPage eq 'icon-material' or currentPage eq 'icon-pe7' or currentPage eq 'icon-simpleline' or currentPage eq 'icon-themify' or currentPage eq 'icon-weather' or currentPage eq 'icon-typicon' or currentPage eq 'icon-flag' or currentPage eq 'maps-vector' or currentPage eq 'maps-leaflet' ? 'show active' : ''}" id="ui-elements">
                        <ul>
                            <li class="menu-title"><span>UI INTERFACE</span></li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'ui-alerts' or currentPage eq 'ui-accordion' or currentPage eq 'ui-avatar' or currentPage eq 'ui-badges' or currentPage eq 'ui-borders' or currentPage eq 'ui-buttons' or currentPage eq 'ui-buttons-group' or currentPage eq 'ui-breadcrumb' or currentPage eq 'ui-cards' or currentPage eq 'ui-carousel' or currentPage eq 'ui-colors' or currentPage eq 'ui-dropdowns' or currentPage eq 'ui-grid' or currentPage eq 'ui-images' or currentPage eq 'ui-lightbox' or currentPage eq 'ui-media' or currentPage eq 'ui-modals' or currentPage eq 'ui-offcanvas' or currentPage eq 'ui-pagination' or currentPage eq 'ui-popovers' or currentPage eq 'ui-progress' or currentPage eq 'ui-placeholders' or currentPage eq 'ui-spinner' or currentPage eq 'ui-sweetalerts' or currentPage eq 'ui-nav-tabs' or currentPage eq 'ui-toasts' or currentPage eq 'ui-tooltips' or currentPage eq 'ui-typography' or currentPage eq 'ui-video' ? 'subdrop active' : ''}">Base UI<span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/ui-alerts" class="${currentPage eq 'ui-alerts' ? 'active' : ''}">Alerts</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-accordion" class="${currentPage eq 'ui-accordion' ? 'active' : ''}">Accordion</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-avatar" class="${currentPage eq 'ui-avatar' ? 'active' : ''}">Avatar</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-badges" class="${currentPage eq 'ui-badges' ? 'active' : ''}">Badges</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-borders" class="${currentPage eq 'ui-borders' ? 'active' : ''}">Border</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-buttons" class="${currentPage eq 'ui-buttons' ? 'active' : ''}">Buttons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-buttons-group" class="${currentPage eq 'ui-buttons-group' ? 'active' : ''}">Button Group</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-breadcrumb" class="${currentPage eq 'ui-breadcrumb' ? 'active' : ''}">Breadcrumb</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-cards" class="${currentPage eq 'ui-cards' ? 'active' : ''}">Card</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-carousel" class="${currentPage eq 'ui-carousel' ? 'active' : ''}">Carousel</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-colors" class="${currentPage eq 'ui-colors' ? 'active' : ''}">Colors</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-dropdowns" class="${currentPage eq 'ui-dropdowns' ? 'active' : ''}">Dropdowns</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-grid" class="${currentPage eq 'ui-grid' ? 'active' : ''}">Grid</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-images" class="${currentPage eq 'ui-images' ? 'active' : ''}">Images</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-lightbox" class="${currentPage eq 'ui-lightbox' ? 'active' : ''}">Lightbox</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-media" class="${currentPage eq 'ui-media' ? 'active' : ''}">Media</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-modals" class="${currentPage eq 'admin-dashboard' ? 'active' : ''}">Modals</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-offcanvas" class="${currentPage eq 'ui-offcanvas' ? 'active' : ''}">Offcanvas</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-pagination" class="${currentPage eq 'ui-pagination' ? 'active' : ''}">Pagination</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-popovers" class="${currentPage eq 'ui-popovers' ? 'active' : ''}">Popovers</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-progress" class="${currentPage eq 'ui-progress' ? 'active' : ''}">Progress</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-placeholders" class="${currentPage eq 'ui-placeholders' ? 'active' : ''}">Placeholders</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-spinner" class="${currentPage eq 'ui-spinner' ? 'active' : ''}">Spinner</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-sweetalerts" class="${currentPage eq 'ui-sweetalerts' ? 'active' : ''}">Sweet Alerts</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-nav-tabs" class="${currentPage eq 'ui-nav-tabs' ? 'active' : ''}">Tabs</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-toasts" class="${currentPage eq 'ui-toasts' ? 'active' : ''}">Toasts</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-tooltips" class="${currentPage eq 'ui-tooltips' ? 'active' : ''}">Tooltips</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-typography" class="${currentPage eq 'ui-typography' ? 'active' : ''}">Typography</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-video" class="${currentPage eq 'ui-video' ? 'active' : ''}">Video</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-sortable" class="${currentPage eq 'ui-sortable' ? 'active' : ''}">Sortable</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-swiperjs" class="${currentPage eq 'ui-swiperjs' ? 'active' : ''}">Swiperjs</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'ui-ribbon' or currentPage eq 'ui-clipboard' or currentPage eq 'ui-drag-drop' or currentPage eq 'ui-rangeslider' or currentPage eq 'ui-rating' or currentPage eq 'ui-text-editor' or currentPage eq 'ui-counter' or currentPage eq 'ui-scrollbar' or currentPage eq 'ui-stickynote' or currentPage eq 'ui-timeline' ? 'subdrop active' : ''}"> Advanced UI <span class="menu-arrow"></span> </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/ui-ribbon" class="${currentPage eq 'ui-ribbon' ? 'active' : ''}">Ribbon</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-clipboard" class="${currentPage eq 'ui-clipboard' ? 'active' : ''}">Clipboard</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-drag-drop" class="${currentPage eq 'ui-drag-drop' ? 'active' : ''}">Drag & Drop</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-rangeslider" class="${currentPage eq 'ui-rangeslider' ? 'active' : ''}">Range Slider</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-rating" class="${currentPage eq 'ui-rating' ? 'active' : ''}">Rating</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-text-editor" class="${currentPage eq 'ui-text-editor' ? 'active' : ''}">Text Editor</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-counter" class="${currentPage eq 'ui-counter' ? 'active' : ''}">Counter</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-scrollbar" class="${currentPage eq 'ui-scrollbar' ? 'active' : ''}">Scrollbar</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-stickynote" class="${currentPage eq 'ui-stickynote' ? 'active' : ''}">Sticky Note</a></li>
                                    <li><a href="${pageContext.request.contextPath}/ui-timeline" class="${currentPage eq 'ui-timeline' ? 'active' : ''}">Timeline</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"> Forms <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li class="submenu submenu-two">
                                        <a href="javascript:void(0);"class="${currentPage eq 'form-basic-inputs' or currentPage eq 'form-checkbox-radios' or currentPage eq 'form-input-groups' or currentPage eq 'form-grid-gutters' or currentPage eq 'form-select' or currentPage eq 'form-mask' or currentPage eq 'form-fileupload' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'form-validation' or currentPage eq 'form-wizard' or currentPage eq 'form-select2' ? 'subdrop active' : ''}">Form Elements<span class="menu-arrow inside-submenu"></span></a>
                                        <ul>
                                            <li><a href="${pageContext.request.contextPath}/form-basic-inputs" class="${currentPage eq 'form-basic-inputs' ? 'active' : ''}">Basic Inputs</a></li>
                                            <li><a href="${pageContext.request.contextPath}/form-checkbox-radios" class="${currentPage eq 'form-checkbox-radios' ? 'active' : ''}">Checkbox & Radios</a></li>
                                            <li><a href="${pageContext.request.contextPath}/form-input-groups" class="${currentPage eq 'form-input-groups' ? 'active' : ''}">Input Groups</a></li>
                                            <li><a href="${pageContext.request.contextPath}/form-grid-gutters" class="${currentPage eq 'form-grid-gutters' ? 'active' : ''}">Grid & Gutters</a></li>
                                            <li><a href="${pageContext.request.contextPath}/form-select" class="${currentPage eq 'form-select' ? 'active' : ''}">Form Select</a></li>
                                            <li><a href="${pageContext.request.contextPath}/form-mask" class="${currentPage eq 'form-mask' ? 'active' : ''}">Input Masks</a></li>
                                            <li><a href="${pageContext.request.contextPath}/form-fileupload" class="${currentPage eq 'form-fileupload' ? 'active' : ''}">File Uploads</a></li>
                                        </ul>
                                    </li>
                                    <li class="submenu submenu-two">
                                        <a href="javascript:void(0);"class="${currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' ? 'subdrop active' : ''}">Layouts<span class="menu-arrow inside-submenu"></span></a>
                                        <ul>
                                            <li><a href="${pageContext.request.contextPath}/form-horizontal" class="${currentPage eq 'form-horizontal' ? 'active' : ''}">Horizontal Form</a></li>
                                            <li><a href="${pageContext.request.contextPath}/form-vertical" class="${currentPage eq 'form-vertical' ? 'active' : ''}">Vertical Form</a></li>
                                            <li><a href="${pageContext.request.contextPath}/form-floating-labels" class="${currentPage eq 'form-floating-labels' ? 'active' : ''}">Floating Labels</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/form-validation" class="${currentPage eq 'form-validation' ? 'active' : ''}">Form Validation</a></li>
                                    <li><a href="${pageContext.request.contextPath}/form-select2" class="${currentPage eq 'form-select2' ? 'active' : ''}">Select2</a></li>
                                    <li><a href="${pageContext.request.contextPath}/form-wizard" class="${currentPage eq 'form-wizard' ? 'active' : ''}">Form Wizard</a></li>
                                    <li><a href="${pageContext.request.contextPath}/form-pickers" class="${currentPage eq 'form-pickers' ? 'active' : ''}">Form Picker</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'tables-basic' or currentPage eq 'data-tables' ? 'subdrop active' : ''}">Tables <span class="menu-arrow"></span></a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/tables-basic" class="${currentPage eq 'tables-basic' ? 'active' : ''}">Basic Tables </a></li>
                                    <li><a href="${pageContext.request.contextPath}/data-tables" class="${currentPage eq 'data-tables' ? 'active' : ''}">Data Table </a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'chart-apex' or currentPage eq 'chart-js' or currentPage eq 'chart-morris' or currentPage eq 'chart-flot' or currentPage eq 'chart-peity' or currentPage eq 'chart-c3' ? 'subdrop active' : ''}">Charts<span class="menu-arrow"></span> </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/chart-apex" class="${currentPage eq 'chart-apex' ? 'active' : ''}">Apex Charts</a></li>
                                    <li><a href="${pageContext.request.contextPath}/chart-c3" class="${currentPage eq 'chart-c3' ? 'active' : ''}">Chart C3</a></li>
                                    <li><a href="${pageContext.request.contextPath}/chart-js" class="${currentPage eq 'chart-js' ? 'active' : ''}">Chart Js</a></li>
                                    <li><a href="${pageContext.request.contextPath}/chart-morris" class="${currentPage eq 'chart-morris' ? 'active' : ''}">Morris Charts</a></li>
                                    <li><a href="${pageContext.request.contextPath}/chart-flot" class="${currentPage eq 'chart-flot' ? 'active' : ''}">Flot Charts</a></li>
                                    <li><a href="${pageContext.request.contextPath}/chart-peity" class="${currentPage eq 'chart-peity' ? 'active' : ''}">Peity Charts</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);"class="${currentPage eq 'icon-fontawesome' or currentPage eq 'icon-feather' or currentPage eq 'icon-ionic' or currentPage eq 'icon-material' or currentPage eq 'icon-pe7' or currentPage eq 'icon-simpleline' or currentPage eq 'icon-themify' or currentPage eq 'icon-weather' or currentPage eq 'icon-typicon' or currentPage eq 'icon-flag' ? 'subdrop active' : ''}">Icons<span class="menu-arrow"></span> </a>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/icon-fontawesome" class="${currentPage eq 'icon-fontawesome' ? 'active' : ''}">Fontawesome Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-tabler" class="${currentPage eq 'icon-tabler' ? 'active' : ''}">Tabler Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-bootstrap" class="${currentPage eq 'icon-bootstrap' ? 'active' : ''}">Bootstrap Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-remix" class="${currentPage eq 'icon-remix' ? 'active' : ''}">Remix Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-feather" class="${currentPage eq 'icon-feather' ? 'active' : ''}">Feather Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-ionic" class="${currentPage eq 'icon-ionic' ? 'active' : ''}">Ionic Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-material" class="${currentPage eq 'icon-material' ? 'active' : ''}">Material Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-pe7" class="${currentPage eq 'icon-pe7' ? 'active' : ''}">Pe7 Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-simpleline" class="${currentPage eq 'icon-simpleline' ? 'active' : ''}">Simpleline Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-themify" class="${currentPage eq 'icon-themify' ? 'active' : ''}">Themify Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-weather" class="${currentPage eq 'icon-weather' ? 'active' : ''}">Weather Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-typicon" class="${currentPage eq 'icon-typicon' ? 'active' : ''}">Typicon Icons</a></li>
                                    <li><a href="${pageContext.request.contextPath}/icon-flag" class="${currentPage eq 'icon-flag' ? 'active' : ''}">Flag Icons</a></li>

                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="javascript:void(0);">
                                    <i class="ti ti-table-plus"></i>
                                    <span>Maps</span>
                                    <span class="menu-arrow"></span>
                                </a>
                                <ul>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/maps-vector" class="${currentPage eq 'maps-vector' ? 'active' : ''}">Vector</a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/maps-leaflet" class="${currentPage eq 'maps-leaflet' ? 'active' : ''}">Leaflet</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-pane fade" id="extras">
                        <ul>
                            <li class="menu-title"><span>EXTRAS</span></li>
                            <li><a href="#">Documentation</a></li>
                            <li><a href="#">Change Log</a></li>
                            <li class="submenu">
                                <a href="javascript:void(0);"><span>Multi Level</span><span class="menu-arrow"></span></a>
                                <ul>
                                    <li><a href="javascript:void(0);">Multilevel 1</a></li>
                                    <li class="submenu submenu-two">
                                        <a href="javascript:void(0);">Multilevel 2<span class="menu-arrow inside-submenu"></span></a>
                                        <ul>
                                            <li><a href="javascript:void(0);">Multilevel 2.1</a></li>
                                            <li class="submenu submenu-two submenu-three">
                                                <a href="javascript:void(0);">Multilevel 2.2<span class="menu-arrow inside-submenu inside-submenu-two"></span></a>
                                                <ul>
                                                    <li><a href="javascript:void(0);">Multilevel 2.2.1</a></li>
                                                    <li><a href="javascript:void(0);">Multilevel 2.2.2</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li><a href="javascript:void(0);">Multilevel 3</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /Two Col Sidebar -->

<!-- Stacked Sidebar -->
<div class="stacked-sidebar" id="stacked-sidebar">
    <div class="sidebar sidebar-stacked" style="display: flex !important;">
        <div class="stacked-mini">
            <a href="${pageContext.request.contextPath}/admin-dashboard"  class="logo-small">
                <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg" alt="Logo">
            </a>
            <div class="sidebar-left slimscroll">
                <div class="d-flex align-items-center flex-column">
                    <div class="mb-1 notification-item">
                        <a href="#" class="btn btn-menubar position-relative">
                            <i class="ti ti-bell"></i>
                            <span class="notification-status-dot"></span>
                        </a>
                    </div>
                    <div class="mb-1">
                        <a href="#" class="btn btn-menubar btnFullscreen">
                            <i class="ti ti-maximize"></i>
                        </a>
                    </div>
                    <div class="mb-1">
                        <a href="${pageContext.request.contextPath}/calendar" class="btn btn-menubar">
                            <i class="ti ti-layout-grid-remove"></i>
                        </a>
                    </div>
                    <div class="mb-1">
                        <a href="${pageContext.request.contextPath}/chat" class="btn btn-menubar position-relative">
                            <i class="ti ti-brand-hipchat"></i>
                            <span class="badge bg-info rounded-pill d-flex align-items-center justify-content-center header-badge">5</span>
                        </a>
                    </div>
                    <div class="mb-1">
                        <a href="${pageContext.request.contextPath}/email" class="btn btn-menubar">
                            <i class="ti ti-mail"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="sidebar-right d-flex justify-content-between flex-column">
            <div class="sidebar-scroll">
                <h6 class="mb-3">Welcome to SmartHR</h6>
                <div class="sidebar-profile text-center rounded bg-light p-3 mb-4">
                    <div class="avatar avatar-lg online mb-3">
                        <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg" alt="Img" class="img-fluid rounded-circle">
                    </div>
                    <h6 class="fs-12 fw-normal mb-1">Adrian Herman</h6>
                    <p class="fs-10">System Admin</p>
                </div>
                <div class="stack-menu">
                    <div class="nav flex-column align-items-center nav-pills" role="tablist" aria-orientation="vertical">
                        <div class="row g-2">
                            <div class="col-6">
                                <a href="#menu-dashboard" role="tab" class="nav-link ${currentPage eq 'admin-dashboard' or currentPage eq 'employee-dashboard' or currentPage eq 'deals-dashboard' or currentPage eq 'leads-dashboard' ? 'active ' : ''}" title="Dashboard" data-bs-toggle="tab" data-bs-target="#menu-dashboard" aria-selected="true">
                                    <span><i class="ti ti-smart-home"></i></span>
                                    <p>Dashboard</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-application" role="tab" class="nav-link ${currentPage eq 'chat' or currentPage eq 'call' or currentPage eq 'voice-call' or currentPage eq 'video-call' or currentPage eq 'outgoing-call' or currentPage eq 'incoming-call' or currentPage eq 'call-history' or currentPage eq 'calendar' or currentPage eq 'email' or currentPage eq 'todo' or currentPage eq 'notes' or currentPage eq 'social-feed' or currentPage eq 'file-manager' or currentPage eq 'kanban-view' or currentPage eq 'invoices' ? 'active' : ''}" title="Apps" data-bs-toggle="tab" data-bs-target="#menu-application" aria-selected="false">
                                    <span><i class="ti ti-layout-grid-add"></i></span>
                                    <p>Applications</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-superadmin" role="tab" class="nav-link ${currentPage eq 'dashboard' or currentPage eq 'companies' or currentPage eq 'subscription' or currentPage eq 'packages' or currentPage eq 'domain' or currentPage eq 'purchase-transaction' ? 'active' : ''}" title="Apps" data-bs-toggle="tab" data-bs-target="#menu-superadmin" aria-selected="false">
                                    <span><i class="ti ti-user-star"></i></span>
                                    <p>Super Admin</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-layout" role="tab" class="nav-link  ${currentPage eq 'layout-horizontal' or currentPage eq 'layout-detached' or currentPage eq 'layout-modern' or currentPage eq 'layout-two-column' or currentPage eq 'layout-hovered' or currentPage eq 'layout-box' or currentPage eq 'layout-horizontal-single' or currentPage eq 'layout-horizontal-overlay' or currentPage eq 'layout-horizontal-box' or currentPage eq 'layout-horizontal-sidemenu' or currentPage eq 'layout-vertical-transparent' or currentPage eq 'layout-without-header' or currentPage eq 'layout-rtl' or currentPage eq 'layout-dark' ? 'active' : ''}" title="Layout" data-bs-toggle="tab" data-bs-target="#menu-layout" aria-selected="false">
                                    <span><i class="ti ti-layout-board-split"></i></span>
                                    <p>Layouts</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-project" role="tab" class="nav-link ${currentPage eq 'clients-grid' or currentPage eq 'projects-grid' or currentPage eq 'tasks' or currentPage eq 'task-board' ? 'active ' : ''} " title="Projects" data-bs-toggle="tab" data-bs-target="#menu-project" aria-selected="false">
                                    <span><i class="ti ti-folder"></i></span>
                                    <p>Projects</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-crm" role="tab" class="nav-link ${currentPage eq 'contacts-grid' or currentPage eq 'companies-grid' or currentPage eq 'deals-grid' or currentPage eq 'leads-grid' or currentPage eq 'pipeline' or currentPage eq 'analytics' or currentPage eq 'activity' ? ' show active ' : ''}" title="CRM" data-bs-toggle="tab" data-bs-target="#menu-crm" aria-selected="false">
                                    <span><i class="ti ti-user-shield"></i></span>
                                    <p>Crm</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-hrm" role="tab" class="nav-link ${currentPage eq 'employees' or currentPage eq 'employees-grid' or currentPage eq 'employee-details' or currentPage eq 'departments' or currentPage eq 'designations' or currentPage eq 'policy' or currentPage eq 'tickets' or currentPage eq 'ticket-details' or currentPage eq 'holidays' or currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' or currentPage eq 'attendance-admin' or currentPage eq 'attendance-employee' or currentPage eq 'timesheets' or currentPage eq 'schedule-timing' or currentPage eq 'overtime' or currentPage eq 'performance-indicator' or currentPage eq 'performance-review' or currentPage eq 'performance-appraisal' or currentPage eq 'goal-tracking' or currentPage eq 'goal-type' or currentPage eq 'training' or currentPage eq 'trainers' or currentPage eq 'training-type' or currentPage eq 'promotion' or currentPage eq 'resignation' or currentPage eq 'training-type' ? '  active ' : ''}" title="HRM" data-bs-toggle="tab" data-bs-target="#menu-hrm" aria-selected="false">
                                    <span><i class="ti ti-users"></i></span>
                                    <p>Hrm</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-finance" role="tab" class="nav-link ${currentPage eq 'estimates' or currentPage eq 'invoices' or currentPage eq 'payments' or currentPage eq 'expenses' or currentPage eq 'provident-fund' or currentPage eq 'taxes' or currentPage eq 'categories' or currentPage eq 'budgets' or currentPage eq 'budget-expenses' or currentPage eq 'budget-revenues' or currentPage eq 'employee-salary' or currentPage eq 'payslip' or currentPage eq 'payroll' ? ' show active ' : ''}" title="Finance & Accounts" data-bs-toggle="tab" data-bs-target="#menu-finance" aria-selected="false">
                                    <span><i class="ti ti-shopping-cart-dollar"></i></span>
                                    <p>Finance & Accounts</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-administration" role="tab" class="nav-link ${currentPage eq 'assets-list' or currentPage eq 'asset-categories' or currentPage eq 'assets-list' or currentPage eq 'asset-categories' or currentPage eq 'knowledgebase' or currentPage eq 'activity' or currentPage eq 'users' or currentPage eq 'roles-permissions' or currentPage eq 'expenses-report' or currentPage eq 'invoice-report' or currentPage eq 'payment-report' or currentPage eq 'project-report' or currentPage eq 'task-report' or currentPage eq 'user-report' or currentPage eq 'employee-report' or currentPage eq 'payslip-report' or currentPage eq 'attendance-report' or currentPage eq 'leave-report' or currentPage eq 'daily-report' or currentPage eq 'profile-settings' or currentPage eq 'security-settings' or currentPage eq 'notification-settings' or currentPage eq 'connected-apps' or currentPage eq 'bussiness-settings' or currentPage eq 'seo-settings' or currentPage eq 'localization-settings' or currentPage eq 'prefixes' or currentPage eq 'preferences' or currentPage eq 'performance-appraisal' or currentPage eq 'language' or currentPage eq 'authentication-settings' or currentPage eq 'ai-settings' or currentPage eq 'salary-settings' or currentPage eq 'approval-settings' or currentPage eq 'invoice-settings' or currentPage eq 'leave-type' or currentPage eq 'custom-fields' or currentPage eq 'email-settings' or currentPage eq 'email-template' or currentPage eq 'sms-settings' or currentPage eq 'sms-template' or currentPage eq 'otp-settings' or currentPage eq 'gdpr' or currentPage eq 'maintenance-mode' or currentPage eq 'payment-gateways' or currentPage eq 'tax-rates' or currentPage eq 'currencies' or currentPage eq 'custom-css' or currentPage eq 'custom-js' or currentPage eq 'cronjob' or currentPage eq 'storage-settings' or currentPage eq 'ban-ip-address' or currentPage eq 'backup' or currentPage eq 'clear-cache' ? ' active' : ''}" title="Administration" data-bs-toggle="tab" data-bs-target="#menu-administration" aria-selected="false">
                                    <span><i class="ti ti-cash"></i></span>
                                    <p>Administration</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-content" role="tab" class="nav-link  ${currentPage eq 'pages' or currentPage eq 'blogs' or currentPage eq 'blog-categories' or currentPage eq 'blog-comments' or currentPage eq 'blog-tags' or currentPage eq 'countries' or currentPage eq 'states' or currentPage eq 'cities' or currentPage eq 'testimonials' or currentPage eq 'faq' ? 'active' : ''}" title="Content" data-bs-toggle="tab" data-bs-target="#menu-content" aria-selected="false">
                                    <span><i class="ti ti-license"></i></span>
                                    <p>Contents</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-pages" role="tab" class="nav-link ${currentPage eq 'starter' or currentPage eq 'profile' or currentPage eq 'gallery' or currentPage eq 'search-result' or currentPage eq 'timeline' or currentPage eq 'pricing' or currentPage eq 'coming-soon' or currentPage eq 'under-maintenance' or currentPage eq 'under-construction' or currentPage eq 'api-keys' or currentPage eq 'privacy-policy' or currentPage eq 'terms-condition' ? 'active' : ''}" title="Pages"
                                   data-bs-toggle="tab" data-bs-target="#menu-pages" aria-selected="false">
                                    <span><i class="ti ti-page-break"></i></span>
                                    <p>Pages</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-authentication" role="tab" class="nav-link ${currentPage eq 'login' or currentPage eq 'login-2' or currentPage eq 'login-3' or currentPage eq 'register' or currentPage eq 'register-2' or currentPage eq 'register-3' or currentPage eq 'forgot-password' or currentPage eq 'forgot-password-2' or currentPage eq 'forgot-password-3' or currentPage eq 'reset-password' or currentPage eq 'reset-password-2' or currentPage eq 'reset-password-3' or currentPage eq 'email-verification' or currentPage eq 'email-verification-2' or currentPage eq 'email-verification-3' or currentPage eq 'two-step-verification' or currentPage eq 'two-step-verification-2' or currentPage eq 'two-step-verification-3' or currentPage eq 'lock-screen' or currentPage eq 'error-404' or currentPage eq 'error-500' ? '  active' : ''}" title="Authentication" data-bs-toggle="tab" data-bs-target="#menu-authentication" aria-selected="false">
                                    <span><i class="ti ti-lock-check"></i></span>
                                    <p>Authentication</p>
                                </a>
                            </div>
                            <div class="col-6">
                                <a href="#menu-ui-elements" role="tab" class="nav-link ${currentPage eq 'ui-alerts' or currentPage eq 'ui-accordion' or currentPage eq 'ui-avatar' or currentPage eq 'ui-badges' or currentPage eq 'ui-borders' or currentPage eq 'ui-buttons' or currentPage eq 'ui-buttons-group' or currentPage eq 'ui-breadcrumb' or currentPage eq 'ui-cards' or currentPage eq 'ui-carousel' or currentPage eq 'ui-colors' or currentPage eq 'ui-dropdowns' or currentPage eq 'ui-grid' or currentPage eq 'ui-images' or currentPage eq 'ui-lightbox' or currentPage eq 'ui-media' or currentPage eq 'ui-modals' or currentPage eq 'ui-offcanvas' or currentPage eq 'ui-pagination' or currentPage eq 'ui-popovers' or currentPage eq 'ui-progress' or currentPage eq 'ui-placeholders' or currentPage eq 'ui-spinner' or currentPage eq 'ui-sweetalerts' or currentPage eq 'ui-nav-tabs' or currentPage eq 'ui-toasts' or currentPage eq 'ui-tooltips' or currentPage eq 'ui-typography' or currentPage eq 'ui-video' or currentPage eq 'ui-ribbon' or currentPage eq 'ui-clipboard' or currentPage eq 'ui-drag-drop' or currentPage eq 'ui-rangeslider' or currentPage eq 'ui-rating' or currentPage eq 'ui-text-editor' or currentPage eq 'ui-counter' or currentPage eq 'ui-scrollbar' or currentPage eq 'ui-stickynote' or currentPage eq 'ui-timeline' or currentPage eq 'form-basic-inputs' or currentPage eq 'form-checkbox-radios' or currentPage eq 'form-input-groups' or currentPage eq 'form-grid-gutters' or currentPage eq 'form-select' or currentPage eq 'form-mask' or currentPage eq 'form-fileupload' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'form-validation' or currentPage eq 'form-wizard' or currentPage eq 'form-select2' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'tables-basic' or currentPage eq 'data-tables' or currentPage eq 'chart-apex' or currentPage eq 'chart-js' or currentPage eq 'chart-morris' or currentPage eq 'chart-flot' or currentPage eq 'chart-peity' or currentPage eq 'chart-c3' or currentPage eq 'icon-fontawesome' or currentPage eq 'icon-feather' or currentPage eq 'icon-ionic' or currentPage eq 'icon-material' or currentPage eq 'icon-pe7' or currentPage eq 'icon-simpleline' or currentPage eq 'icon-themify' or currentPage eq 'icon-weather' or currentPage eq 'icon-typicon' or currentPage eq 'icon-flag' or currentPage eq 'maps-vector' or currentPage eq 'maps-leaflet' ? ' active' : ''} " title="UI Elements" data-bs-toggle="tab" data-bs-target="#menu-ui-elements" aria-selected="false">
                                    <span><i class="ti ti-ux-circle"></i></span>
                                    <p>Basic UI</p>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade  ${currentPage eq 'admin-dashboard' or currentPage eq 'employee-dashboard' or currentPage eq 'deals-dashboard' or currentPage eq 'leads-dashboard' ? ' show active ' : ''}" id="menu-dashboard">
                            <ul class="stack-submenu">
                                <li><a href="${pageContext.request.contextPath}/admin-dashboard" class="${currentPage eq 'admin-dashboard' ? 'active' : ''}">Admin Dashboard</a></li>
                                <li><a href="${pageContext.request.contextPath}/employee-dashboard" class="${currentPage eq 'employee-dashboard' ? 'active' : ''}">Employee Dashboard</a></li>
                                <li><a href="${pageContext.request.contextPath}/deals-dashboard" class="${currentPage eq 'deals-dashboard' ? 'active' : ''}">Deals Dashboard</a></li>
                                <li><a href="${pageContext.request.contextPath}/leads-dashboard" class="${currentPage eq 'leads-dashboard' ? 'active' : ''}">Leads Dashboard</a></li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'dashboard' or currentPage eq 'companies' or currentPage eq 'subscription' or currentPage eq 'packages' or currentPage eq 'domain' or currentPage eq 'purchase-transaction' ? ' show active' : ''} " id="menu-superadmin">
                            <ul class="stack-submenu">
                                <li><a href="${pageContext.request.contextPath}/dashboard" class="${currentPage eq 'dashboard' ? 'active' : ''}">Dashboard</a></li>
                                <li><a href="${pageContext.request.contextPath}/companies" class="${currentPage eq 'companies' ? 'active' : ''}">Companies</a></li>
                                <li><a href="${pageContext.request.contextPath}/subscription" class="${currentPage eq 'subscription' ? 'active' : ''}">Subscriptions</a></li>
                                <li><a href="${pageContext.request.contextPath}/packages" class="${currentPage eq 'packages' ? 'active' : ''}">Packages</a></li>
                                <li><a href="${pageContext.request.contextPath}/domain" class="${currentPage eq 'domain' ? 'active' : ''}">Domain</a></li>
                                <li><a href="${pageContext.request.contextPath}/purchase-transaction" class="${currentPage eq 'purchase-transaction' ? 'active' : ''}">Purchase Transaction</a></li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'chat' or currentPage eq 'call' or currentPage eq 'voice-call' or currentPage eq 'video-call' or currentPage eq 'outgoing-call' or currentPage eq 'incoming-call' or currentPage eq 'call-history' or currentPage eq 'calendar' or currentPage eq 'email' or currentPage eq 'todo' or currentPage eq 'notes' or currentPage eq 'social-feed' or currentPage eq 'file-manager' or currentPage eq 'kanban-view' or currentPage eq 'invoices' ? ' show active ' : ''}" id="menu-application">
                            <ul class="stack-submenu">
                                <li><a href="${pageContext.request.contextPath}/chat" class="${currentPage eq 'chat' ? 'active' : ''}">Chat</a></li>
                                <li class="submenu submenu-two">
                                    <a href="${pageContext.request.contextPath}/call" class="${currentPage eq 'call' ? 'active' : ''}">Calls<span
                                            class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/voice-call" class="${currentPage eq 'voice-call' ? 'active' : ''}">Voice Call</a></li>
                                        <li><a href="${pageContext.request.contextPath}/video-call" class="${currentPage eq 'video-call' ? 'active' : ''}">Video Call</a></li>
                                        <li><a href="${pageContext.request.contextPath}/outgoing-call" class="${currentPage eq 'outgoing-call' ? 'active' : ''}">Outgoing Call</a></li>
                                        <li><a href="${pageContext.request.contextPath}/incoming-call" class="${currentPage eq 'incoming-call' ? 'active' : ''}">Incoming Call</a></li>
                                        <li><a href="${pageContext.request.contextPath}/call-history" class="${currentPage eq 'call-history' ? 'active' : ''}">Call History</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/calendar" class="${currentPage eq 'calendar' ? 'active' : ''}">Calendar</a></li>
                                <li><a href="${pageContext.request.contextPath}/email" class="${currentPage eq 'email' ? 'active' : ''}">Email</a></li>
                                <li><a href="${pageContext.request.contextPath}/todo" class="${currentPage eq 'todo' ? 'active' : ''}">To Do</a></li>
                                <li><a href="${pageContext.request.contextPath}/notes" class="${currentPage eq 'notes' ? 'active' : ''}">Notes</a></li>
                                <li><a href="${pageContext.request.contextPath}/social-feed" class="${currentPage eq 'social-feed' ? 'active' : ''}">Social Feed</a></li>
                                <li><a href="${pageContext.request.contextPath}/file-manager" class="${currentPage eq 'file-manager' ? 'active' : ''}">File Manager</a></li>
                                <li><a href="${pageContext.request.contextPath}/kanban-view" class="${currentPage eq 'kanban-view' ? 'active' : ''}">Kanban</a></li>
                                <li><a href="${pageContext.request.contextPath}/invoices" class="${currentPage eq 'invoices' ? 'active' : ''}">Invoices</a></li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'layout-horizontal' or currentPage eq 'layout-detached' or currentPage eq 'layout-modern' or currentPage eq 'layout-two-column' or currentPage eq 'layout-hovered' or currentPage eq 'layout-box' or currentPage eq 'layout-horizontal-single' or currentPage eq 'layout-horizontal-overlay' or currentPage eq 'layout-horizontal-box' or currentPage eq 'layout-horizontal-sidemenu' or currentPage eq 'layout-vertical-transparent' or currentPage eq 'layout-without-header' or currentPage eq 'layout-rtl' or currentPage eq 'layout-dark' ? ' show active' : ''}" id="menu-layout">
                            <ul class="stack-submenu">
                                <li><a href="${pageContext.request.contextPath}/layout-horizontal" class="${currentPage eq 'layout-horizontal' ? 'active' : ''}">Horizontal</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-detached" class="${currentPage eq 'layout-detached' ? 'active' : ''}">Detached</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-modern" class="${currentPage eq 'layout-modern' ? 'active' : ''}">Modern</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-two-column" class="${currentPage eq 'layout-two-column' ? 'active' : ''}">Two Column</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-hovered" class="${currentPage eq 'layout-hovered' ? 'active' : ''}">Hovered</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-box" class="${currentPage eq 'layout-box' ? 'active' : ''}">Boxed</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-horizontal-single" class="${currentPage eq 'layout-horizontal-single' ? 'active' : ''}">Horizontal Single</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-horizontal-overlay" class="${currentPage eq 'layout-horizontal-overlay' ? 'active' : ''}">Horizontal Overlay</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-horizontal-box" class="${currentPage eq 'layout-horizontal-box' ? 'active' : ''}">Horizontal Box</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-horizontal-sidemenu" class="${currentPage eq 'layout-horizontal-sidemenu' ? 'active' : ''}">Menu Aside</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-vertical-transparent" class="${currentPage eq 'layout-vertical-transparent' ? 'active' : ''}">Transparent</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-without-header" class="${currentPage eq 'layout-without-header' ? 'active' : ''}">Without Header</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-rtl" class="${currentPage eq 'layout-rtl' ? 'active' : ''}">RTL</a></li>
                                <li><a href="${pageContext.request.contextPath}/layout-dark" class="${currentPage eq 'layout-dark' ? 'active' : ''}">Dark</a></li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'clients-grid' or currentPage eq 'projects-grid' or currentPage eq 'tasks' or currentPage eq 'task-board' ? 'show active ' : ''}" id="menu-project">
                            <ul class="stack-submenu">
                                <li><a href="${pageContext.request.contextPath}/clients-grid" class="${currentPage eq 'clients-grid' ? 'active' : ''}"><span>Clients</span></a></li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class=" ${currentPage eq 'projects-grid' or currentPage eq 'tasks' or currentPage eq 'task-board' ? 'active subdrop' : ''}"><span>Projects</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/projects-grid" class="${currentPage eq 'projects-grid' ? 'active' : ''}">Projects</a></li>
                                        <li><a href="${pageContext.request.contextPath}/tasks" class="${currentPage eq 'tasks' ? 'active' : ''}">Tasks</a></li>
                                        <li><a href="${pageContext.request.contextPath}/task-board" class="${currentPage eq 'task-board' ? 'active' : ''}">Task Board</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'contacts-grid' or currentPage eq 'companies-grid' or currentPage eq 'deals-grid' or currentPage eq 'leads-grid' or currentPage eq 'pipeline' or currentPage eq 'analytics' or currentPage eq 'activity' ? ' show active ' : ''}" id="menu-crm">
                            <ul class="stack-submenu">
                                <li><a href="${pageContext.request.contextPath}/contacts-grid" class="${currentPage eq 'contacts-grid' ? 'active' : ''}"><span>Contacts</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/companies-grid" class="${currentPage eq 'companies-grid' ? 'active' : ''}"><span>Companies</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/deals-grid" class="${currentPage eq 'deals-grid' ? 'active' : ''}"><span>Deals</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/leads-grid" class="${currentPage eq 'leads-grid' ? 'active' : ''}"><span>Leads</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/pipeline" class="${currentPage eq 'pipeline' ? 'active' : ''}"><span>Pipeline</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/analytics" class="${currentPage eq 'analytics' ? 'active' : ''}"><span>Analytics</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/activity" class="${currentPage eq 'activity' ? 'active' : ''}"><span>Activities</span></a></li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'employees' or currentPage eq 'employees-grid' or currentPage eq 'employee-details' or currentPage eq 'departments' or currentPage eq 'designations' or currentPage eq 'policy' or currentPage eq 'tickets' or currentPage eq 'ticket-details' or currentPage eq 'holidays' or currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' or currentPage eq 'attendance-admin' or currentPage eq 'attendance-employee' or currentPage eq 'timesheets' or currentPage eq 'schedule-timing' or currentPage eq 'overtime' or currentPage eq 'performance-indicator' or currentPage eq 'performance-review' or currentPage eq 'performance-appraisal' or currentPage eq 'goal-tracking' or currentPage eq 'goal-type' or currentPage eq 'training' or currentPage eq 'trainers' or currentPage eq 'training-type' or currentPage eq 'promotion' or currentPage eq 'resignation' or currentPage eq 'training-type' ? ' show active ' : ''}" id="menu-hrm">
                            <ul class="stack-submenu">
                                <li class="submenu">
                                    <a href="javascript:void(0);"class=" ${currentPage eq 'employees' or currentPage eq 'employees-grid' or currentPage eq 'employee-details' or currentPage eq 'departments' or currentPage eq 'designations' or currentPage eq 'policy' ? 'active subdrop' : ''}"><span>Employees</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/employees" class="${currentPage eq 'employees' ? 'active' : ''}">Employee Lists</a></li>
                                        <li><a href="${pageContext.request.contextPath}/employees-grid" class="${currentPage eq 'employees-grid' ? 'active' : ''}">Employee Grid</a></li>
                                        <li><a href="${pageContext.request.contextPath}/employee-details" class="${currentPage eq 'employee-details' ? 'active' : ''}">Employee Details</a></li>
                                        <li><a href="${pageContext.request.contextPath}/departments" class="${currentPage eq 'departments' ? 'active' : ''}">Departments</a></li>
                                        <li><a href="${pageContext.request.contextPath}/designations" class="${currentPage eq 'designations' ? 'active' : ''}">Designations</a></li>
                                        <li><a href="${pageContext.request.contextPath}/policy" class="${currentPage eq 'policy' ? 'active' : ''}">Policies</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class=" ${currentPage eq 'tickets' or currentPage eq 'ticket-details' ? 'active subdrop' : ''}"><span>Tickets</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/tickets" class="${currentPage eq 'tickets' ? 'active' : ''}">Tickets</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ticket-details" class="${currentPage eq 'ticket-details' ? 'active' : ''}">Ticket Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/holidays" class="${currentPage eq 'holidays' ? 'active' : ''}"><span>Holidays</span></a></li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class=" ${currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' or currentPage eq 'attendance-admin' or currentPage eq 'attendance-employee' or currentPage eq 'timesheets' or currentPage eq 'schedule-timing' or currentPage eq 'overtime' ? 'active subdrop' : ''}"><span>Attendance</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li class="submenu submenu-two">
                                            <a href="javascript:void(0);"class=" ${currentPage eq 'leaves' or currentPage eq 'leaves-employee' or currentPage eq 'leave-settings' ? 'active subdrop' : ''}">Leaves<span class="menu-arrow inside-submenu"></span></a>
                                            <ul>
                                                <li><a href="${pageContext.request.contextPath}/leaves" class="${currentPage eq 'leaves' ? 'active' : ''}">Leaves (Admin)</a></li>
                                                <li><a href="${pageContext.request.contextPath}/leaves-employee" class="${currentPage eq 'leaves-employee' ? 'active' : ''}">Leave (Employee)</a></li>
                                                <li><a href="${pageContext.request.contextPath}/leave-settings" class="${currentPage eq 'leave-settings' ? 'active' : ''}">Leave Settings</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="${pageContext.request.contextPath}/attendance-admin" class="${currentPage eq 'attendance-admin' ? 'active' : ''}">Attendance (Admin)</a></li>
                                        <li><a href="${pageContext.request.contextPath}/attendance-employee" class="${currentPage eq 'attendance-employee' ? 'active' : ''}">Attendance (Employee)</a></li>
                                        <li><a href="${pageContext.request.contextPath}/timesheets" class="${currentPage eq 'timesheets' ? 'active' : ''}">Timesheets</a></li>
                                        <li><a href="${pageContext.request.contextPath}/schedule-timing" class="${currentPage eq 'schedule-timing' ? 'active' : ''}">Shift & Schedule</a></li>
                                        <li><a href="${pageContext.request.contextPath}/overtime" class="${currentPage eq 'overtime' ? 'active' : ''}">Overtime</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class=" ${currentPage eq 'performance-indicator' or currentPage eq 'performance-review' or currentPage eq 'performance-appraisal' or currentPage eq 'goal-tracking' or currentPage eq 'goal-type' ? 'active subdrop' : ''}"><span>Performance</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/performance-indicator" class="${currentPage eq 'performance-indicator' ? 'active' : ''}">Performance Indicator</a></li>
                                        <li><a href="${pageContext.request.contextPath}/performance-review" class="${currentPage eq 'performance-review' ? 'active' : ''}">Performance Review</a></li>
                                        <li><a href="${pageContext.request.contextPath}/performance-appraisal" class="${currentPage eq 'performance-appraisal' ? 'active' : ''}">Performance Appraisal</a></li>
                                        <li><a href="${pageContext.request.contextPath}/goal-tracking" class="${currentPage eq 'goal-tracking' ? 'active' : ''}">Goal List</a></li>
                                        <li><a href="${pageContext.request.contextPath}/goal-type" class="${currentPage eq 'goal-type' ? 'active' : ''}">Goal Type</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class=" ${currentPage eq 'training' or currentPage eq 'trainers' or currentPage eq 'training-type' ? 'active subdrop' : ''}"><span>Training</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/training" class="${currentPage eq 'training' ? 'active' : ''}">Training List</a></li>
                                        <li><a href="${pageContext.request.contextPath}/trainers" class="${currentPage eq 'trainers' ? 'active' : ''}">Trainers</a></li>
                                        <li><a href="${pageContext.request.contextPath}/training-type" class="${currentPage eq 'training-type' ? 'active' : ''}">Training Type</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/promotion" class="${currentPage eq 'promotion' ? 'active' : ''}"><span>Promotion</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/resignation" class="${currentPage eq 'resignation' ? 'active' : ''}"><span>Resignation</span></a></li>
                                <li><a href="${pageContext.request.contextPath}/termination" class="${currentPage eq 'termination' ? 'active' : ''}"><span>Termination</span></a></li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'estimates' or currentPage eq 'invoices' or currentPage eq 'payments' or currentPage eq 'expenses' or currentPage eq 'provident-fund' or currentPage eq 'taxes' or currentPage eq 'categories' or currentPage eq 'budgets' or currentPage eq 'budget-expenses' or currentPage eq 'budget-revenues' or currentPage eq 'employee-salary' or currentPage eq 'payslip' or currentPage eq 'payroll' ? ' show active ' : ''}" id="menu-finance">
                            <ul class="stack-submenu">
                                <li class="submenu">
                                    <a href="javascript:void(0);"class=" ${currentPage eq 'estimates' or currentPage eq 'invoices' or currentPage eq 'payments' or currentPage eq 'expenses' or currentPage eq 'provident-fund' or currentPage eq 'taxes' ? 'active subdrop' : ''}"><span>Sales</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/estimates" class="${currentPage eq 'estimates' ? 'active' : ''}">Estimates</a></li>
                                        <li><a href="${pageContext.request.contextPath}/invoices" class="${currentPage eq 'invoices' ? 'active' : ''}">Invoices</a></li>
                                        <li><a href="${pageContext.request.contextPath}/payments" class="${currentPage eq 'payments' ? 'active' : ''}">Payments</a></li>
                                        <li><a href="${pageContext.request.contextPath}/expenses" class="${currentPage eq 'expenses' ? 'active' : ''}">Expenses</a></li>
                                        <li><a href="${pageContext.request.contextPath}/provident-fund" class="${currentPage eq 'provident-fund' ? 'active' : ''}">Provident Fund</a></li>
                                        <li><a href="${pageContext.request.contextPath}/taxes" class="${currentPage eq 'taxes' ? 'active' : ''}">Taxes</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class=" ${currentPage eq 'categories' or currentPage eq 'budgets' or currentPage eq 'budget-expenses' or currentPage eq 'budget-revenues' ? 'active subdrop' : ''}"><span>Accounting</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/categories" class="${currentPage eq 'categories' ? 'active' : ''}">Categories</a></li>
                                        <li><a href="${pageContext.request.contextPath}/budgets" class="${currentPage eq 'budgets' ? 'active' : ''}">Budgets</a></li>
                                        <li><a href="${pageContext.request.contextPath}/budget-expenses" class="${currentPage eq 'budget-expenses' ? 'active' : ''}">Budget Expenses</a></li>
                                        <li><a href="${pageContext.request.contextPath}/budget-revenues"class="${currentPage eq 'budget-revenues' ? 'active' : ''}">Budget Revenues</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'employee-salary' or currentPage eq 'payslip' or currentPage eq 'payroll' ? 'active subdrop' : ''}"><span>Payroll</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/employee-salary"class="${currentPage eq 'employee-salary' ? 'active' : ''}">Employee Salary</a></li>
                                        <li><a href="${pageContext.request.contextPath}/payslip"class="${currentPage eq 'payslip' ? 'active' : ''}">Payslip</a></li>
                                        <li><a href="${pageContext.request.contextPath}/payroll"class="${currentPage eq 'payroll' ? 'active' : ''}">Payroll Items</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'assets-list' or currentPage eq 'asset-categories' or currentPage eq 'assets-list' or currentPage eq 'asset-categories' or currentPage eq 'knowledgebase' or currentPage eq 'activity' or currentPage eq 'users' or currentPage eq 'roles-permissions' or currentPage eq 'expenses-report' or currentPage eq 'invoice-report' or currentPage eq 'payment-report' or currentPage eq 'project-report' or currentPage eq 'task-report' or currentPage eq 'user-report' or currentPage eq 'employee-report' or currentPage eq 'payslip-report' or currentPage eq 'attendance-report' or currentPage eq 'leave-report' or currentPage eq 'daily-report' or currentPage eq 'profile-settings' or currentPage eq 'security-settings' or currentPage eq 'notification-settings' or currentPage eq 'connected-apps' or currentPage eq 'bussiness-settings' or currentPage eq 'seo-settings' or currentPage eq 'localization-settings' or currentPage eq 'prefixes' or currentPage eq 'preferences' or currentPage eq 'performance-appraisal' or currentPage eq 'language' or currentPage eq 'authentication-settings' or currentPage eq 'ai-settings' or currentPage eq 'salary-settings' or currentPage eq 'approval-settings' or currentPage eq 'invoice-settings' or currentPage eq 'leave-type' or currentPage eq 'custom-fields' or currentPage eq 'email-settings' or currentPage eq 'email-template' or currentPage eq 'sms-settings' or currentPage eq 'sms-template' or currentPage eq 'otp-settings' or currentPage eq 'gdpr' or currentPage eq 'maintenance-mode' or currentPage eq 'payment-gateways' or currentPage eq 'tax-rates' or currentPage eq 'currencies' or currentPage eq 'custom-css' or currentPage eq 'custom-js' or currentPage eq 'cronjob' or currentPage eq 'storage-settings' or currentPage eq 'ban-ip-address' or currentPage eq 'backup' or currentPage eq 'clear-cache' ? 'show active' : ''}" id="menu-administration">
                            <ul class="stack-submenu">
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'assets-list' or currentPage eq 'asset-categories' ? 'active subdrop' : ''}"><span>Assets</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/assets-list"class="${currentPage eq 'assets-list' ? 'active' : ''}">Assets</a></li>
                                        <li><a href="${pageContext.request.contextPath}/asset-categories"class="${currentPage eq 'asset-categories' ? 'active' : ''}">Asset Categories</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'knowledgebase' or currentPage eq 'activity' ? 'active subdrop' : ''}"><span>Help & Supports</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/knowledgebase"class="${currentPage eq 'knowledgebase' ? 'active' : ''}">Knowledge Base</a></li>
                                        <li><a href="${pageContext.request.contextPath}/activity"class="${currentPage eq 'activity' ? 'active' : ''}">Activities</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'users' or currentPage eq 'roles-permissions' ? 'active subdrop' : ''}"><span>User Management</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/users"class="${currentPage eq 'users' ? 'active' : ''}">Users</a></li>
                                        <li><a href="${pageContext.request.contextPath}/roles-permissions"class="${currentPage eq 'roles-permissions' ? 'active' : ''}">Roles & Permissions</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'expenses-report' or currentPage eq 'invoice-report' or currentPage eq 'payment-report' or currentPage eq 'project-report' or currentPage eq 'task-report' or currentPage eq 'user-report' or currentPage eq 'employee-report' or currentPage eq 'payslip-report' or currentPage eq 'attendance-report' or currentPage eq 'leave-report' or currentPage eq 'daily-report' ? 'active subdrop' : ''}"><span>Reports</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/expenses-report"class="${currentPage eq 'expenses-report' ? 'active' : ''}">Expense Report</a></li>
                                        <li><a href="${pageContext.request.contextPath}/invoice-report"class="${currentPage eq 'invoice-report' ? 'active' : ''}">Invoice Report</a></li>
                                        <li><a href="${pageContext.request.contextPath}/payment-report"class="${currentPage eq 'payment-report' ? 'active' : ''}">Payment Report</a></li>
                                        <li><a href="${pageContext.request.contextPath}/project-report"class="${currentPage eq 'project-report' ? 'active' : ''}">Project Report</a></li>
                                        <li><a href="${pageContext.request.contextPath}/task-report"class="${currentPage eq 'task-report' ? 'active' : ''}">Task Report</a></li>
                                        <li><a href="${pageContext.request.contextPath}/user-report"class="${currentPage eq 'user-report' ? 'active' : ''}">User Report</a></li>
                                        <li><a href="${pageContext.request.contextPath}/employee-report"class="${currentPage eq 'employee-report' ? 'active' : ''}">Employee Report</a></li>
                                        <li><a href="${pageContext.request.contextPath}/payslip-report"class="${currentPage eq 'payslip-report' ? 'active' : ''}">Payslip Report</a></li>
                                        <li><a href="${pageContext.request.contextPath}/attendance-report"class="${currentPage eq 'attendance-report' ? 'active' : ''}">Attendance Report</a></li>
                                        <li><a href="${pageContext.request.contextPath}/leave-report"class="${currentPage eq 'leave-report' ? 'active' : ''}">Leave Report</a></li>
                                        <li><a href="${pageContext.request.contextPath}/daily-report"class="${currentPage eq 'daily-report' ? 'active' : ''}">Daily Report</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'profile-settings' or currentPage eq 'security-settings' or currentPage eq 'notification-settings' or currentPage eq 'connected-apps' ? 'active subdrop' : ''}">
                                        General Settings
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/profile-settings"class="${currentPage eq 'profile-settings' ? 'active' : ''}">Profile</a></li>
                                        <li><a href="${pageContext.request.contextPath}/security-settings"class="${currentPage eq 'security-settings' ? 'active' : ''}">Security</a></li>
                                        <li><a href="${pageContext.request.contextPath}/notification-settings"class="${currentPage eq 'notification-settings' ? 'active' : ''}">Notifications</a></li>
                                        <li><a href="${pageContext.request.contextPath}/connected-apps"class="${currentPage eq 'connected-apps' ? 'active' : ''}">Connected Apps</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'bussiness-settings' or currentPage eq 'seo-settings' or currentPage eq 'localization-settings' or currentPage eq 'prefixes' or currentPage eq 'preferences' or currentPage eq 'performance-appraisal' or currentPage eq 'language' or currentPage eq 'authentication-settings' or currentPage eq 'ai-settings' ? 'active subdrop' : ''}">
                                        Website Settings
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/bussiness-settings"class="${currentPage eq 'bussiness-settings' ? 'active' : ''}">Business Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/seo-settings"class="${currentPage eq 'seo-settings' ? 'active' : ''}">SEO Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/localization-settings"class="${currentPage eq 'localization-settings' ? 'active' : ''}">Localization</a></li>
                                        <li><a href="${pageContext.request.contextPath}/prefixes"class="${currentPage eq 'prefixes' ? 'active' : ''}">Prefixes</a></li>
                                        <li><a href="${pageContext.request.contextPath}/preferences"class="${currentPage eq 'preferences' ? 'active' : ''}">Preferences</a></li>
                                        <li><a href="${pageContext.request.contextPath}/performance-appraisal"class="${currentPage eq 'performance-appraisal' ? 'active' : ''}">Appearance</a></li>
                                        <li><a href="${pageContext.request.contextPath}/language"class="${currentPage eq 'language' ? 'active' : ''}">Language</a></li>
                                        <li><a href="${pageContext.request.contextPath}/authentication-settings"class="${currentPage eq 'authentication-settings' ? 'active' : ''}">Authentication</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ai-settings"class="${currentPage eq 'ai-settings' ? 'active' : ''}">AI Settings</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'salary-settings' or currentPage eq 'approval-settings' or currentPage eq 'invoice-settings' or currentPage eq 'leave-type' or currentPage eq 'custom-fields' ? 'active subdrop' : ''}">App Settings<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/salary-settings"class="${currentPage eq 'salary-settings' ? 'active' : ''}">Salary Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/approval-settings"class="${currentPage eq 'approval-settings' ? 'active' : ''}">Approval Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/invoice-settings"class="${currentPage eq 'invoice-settings' ? 'active' : ''}">Invoice Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/leave-type"class="${currentPage eq 'leave-type' ? 'active' : ''}">Leave Type</a></li>
                                        <li><a href="${pageContext.request.contextPath}/custom-fields"class="${currentPage eq 'custom-fields' ? 'active' : ''}">Custom Fields</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'email-settings' or currentPage eq 'email-template' or currentPage eq 'sms-settings' or currentPage eq 'sms-template' or currentPage eq 'otp-settings' or currentPage eq 'gdpr' or currentPage eq 'maintenance-mode' ? 'active subdrop' : ''}">
                                        System Settings
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/email-settings"class="${currentPage eq 'email-settings' ? 'active' : ''}">Email Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/email-template"class="${currentPage eq 'email-template' ? 'active' : ''}">Email Templates</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sms-settings"class="${currentPage eq 'sms-settings' ? 'active' : ''}">SMS Settings</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sms-template"class="${currentPage eq 'sms-template' ? 'active' : ''}">SMS Templates</a></li>
                                        <li><a href="${pageContext.request.contextPath}/otp-settings"class="${currentPage eq 'otp-settings' ? 'active' : ''}">OTP</a></li>
                                        <li><a href="${pageContext.request.contextPath}/gdpr"class="${currentPage eq 'gdpr' ? 'active' : ''}">GDPR Cookies</a></li>
                                        <li><a href="${pageContext.request.contextPath}/maintenance-mode"class="${currentPage eq 'maintenance-mode' ? 'active' : ''}">Maintenance Mode</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);" class="${currentPage eq 'payment-gateways' or currentPage eq 'tax-rates' or currentPage eq 'currencies' ? 'active subdrop' : ''}">
                                        Financial Settings
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/payment-gateways"class="${currentPage eq 'payment-gateways' ? 'active' : ''}">Payment Gateways</a></li>
                                        <li><a href="${pageContext.request.contextPath}/tax-rates"class="${currentPage eq 'tax-rates' ? 'active' : ''}">Tax Rate</a></li>
                                        <li><a href="${pageContext.request.contextPath}/currencies"class="${currentPage eq 'currencies' ? 'active' : ''}">Currencies</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'custom-css' or currentPage eq 'custom-js' or currentPage eq 'cronjob' or currentPage eq 'storage-settings' or currentPage eq 'ban-ip-address' or currentPage eq 'backup' or currentPage eq 'clear-cache' ? 'active subdrop' : ''}">Other Settings<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/custom-css"class="${currentPage eq 'custom-css' ? 'active' : ''}">Custom CSS</a></li>
                                        <li><a href="${pageContext.request.contextPath}/custom-js"class="${currentPage eq 'custom-js' ? 'active' : ''}">Custom JS</a></li>
                                        <li><a href="${pageContext.request.contextPath}/cronjob"class="${currentPage eq 'cronjob' ? 'active' : ''}">Cronjob</a></li>
                                        <li><a href="${pageContext.request.contextPath}/storage-settings"class="${currentPage eq 'storage-settings' ? 'active' : ''}">Storage</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ban-ip-address"class="${currentPage eq 'ban-ip-address' ? 'active' : ''}">Ban IP Address</a></li>
                                        <li><a href="${pageContext.request.contextPath}/backup"class="${currentPage eq 'backup' ? 'active' : ''}">Backup</a></li>
                                        <li><a href="${pageContext.request.contextPath}/clear-cache"class="${currentPage eq 'clear-cache' ? 'active' : ''}">Clear Cache</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'pages' or currentPage eq 'blogs' or currentPage eq 'blog-categories' or currentPage eq 'blog-comments' or currentPage eq 'blog-tags' or currentPage eq 'countries' or currentPage eq 'states' or currentPage eq 'cities' or currentPage eq 'testimonials' or currentPage eq 'faq' ? ' show active' : ''}" id="menu-content">
                            <ul class="stack-submenu">
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'blogs' or currentPage eq 'blog-categories' or currentPage eq 'blog-comments' or currentPage eq 'blog-tags' ? 'active subdrop' : ''}">Blogs<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/blogs"class="${currentPage eq 'blogs' ? 'active' : ''}">All Blogs</a></li>
                                        <li><a href="${pageContext.request.contextPath}/blog-categories"class="${currentPage eq 'blog-categories' ? 'active' : ''}">Categories</a></li>
                                        <li><a href="${pageContext.request.contextPath}/blog-comments"class="${currentPage eq 'blog-comments' ? 'active' : ''}">Comments</a></li>
                                        <li><a href="${pageContext.request.contextPath}/blog-tags"class="${currentPage eq 'blog-tags' ? 'active' : ''}">Tags</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'countries' or currentPage eq 'states' or currentPage eq 'cities' ? 'active subdrop' : ''}">Locations<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/countries"class="${currentPage eq 'countries' ? 'active' : ''}">Countries</a></li>
                                        <li><a href="${pageContext.request.contextPath}/states"class="${currentPage eq 'states' ? 'active' : ''}">States</a></li>
                                        <li><a href="${pageContext.request.contextPath}/cities"class="${currentPage eq 'cities' ? 'active' : ''}">Cities</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/testimonials"class="${currentPage eq 'testimonials' ? 'active' : ''}">Testimonials</a></li>
                                <li><a href="${pageContext.request.contextPath}/faq"class="${currentPage eq 'faq' ? 'active' : ''}">FAQ’S</a></li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'starter' or currentPage eq 'profile' or currentPage eq 'gallery' or currentPage eq 'search-result' or currentPage eq 'timeline' or currentPage eq 'pricing' or currentPage eq 'coming-soon' or currentPage eq 'under-maintenance' or currentPage eq 'under-construction' or currentPage eq 'api-keys' or currentPage eq 'privacy-policy' or currentPage eq 'terms-condition' ? ' show active' : ''}" id="menu-pages">
                            <ul class="stack-submenu">
                                <li><a href="${pageContext.request.contextPath}/starter"class="${currentPage eq 'starter' ? 'active' : ''}">Starter</a></li>
                                <li><a href="${pageContext.request.contextPath}/profile"class="${currentPage eq 'profile' ? 'active' : ''}">Profile</a></li>
                                <li><a href="${pageContext.request.contextPath}/profile-settings"class="${currentPage eq 'profile-settings' ? 'active' : ''}">Profile Settings</a></li>
                                <li><a href="${pageContext.request.contextPath}/gallery"class="${currentPage eq 'gallery' ? 'active' : ''}">Gallery</a></li>
                                <li><a href="${pageContext.request.contextPath}/search-result"class="${currentPage eq 'search-result' ? 'active' : ''}">Search Results</a></li>
                                <li><a href="${pageContext.request.contextPath}/timeline"class="${currentPage eq 'timeline' ? 'active' : ''}">Timeline</a></li>
                                <li><a href="${pageContext.request.contextPath}/pricing"class="${currentPage eq 'pricing' ? 'active' : ''}">Pricing</a></li>
                                <li><a href="${pageContext.request.contextPath}/coming-soon"class="${currentPage eq 'coming-soon' ? 'active' : ''}">Coming Soon</a></li>
                                <li><a href="${pageContext.request.contextPath}/under-maintenance"class="${currentPage eq 'under-maintenance' ? 'active' : ''}">Under Maintenance</a></li>
                                <li><a href="${pageContext.request.contextPath}/under-construction"class="${currentPage eq 'under-construction' ? 'active' : ''}">Under Construction</a></li>
                                <li><a href="${pageContext.request.contextPath}/api-keys"class="${currentPage eq 'api-keys' ? 'active' : ''}">API Keys</a></li>
                                <li><a href="${pageContext.request.contextPath}/privacy-policy"class="${currentPage eq 'privacy-policy' ? 'active' : ''}">Privacy Policy</a></li>
                                <li><a href="${pageContext.request.contextPath}/terms-condition"class="${currentPage eq 'terms-condition' ? 'active' : ''}">Terms & Conditions</a></li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'login' or currentPage eq 'login-2' or currentPage eq 'login-3' or currentPage eq 'register' or currentPage eq 'register-2' or currentPage eq 'register-3' or currentPage eq 'forgot-password' or currentPage eq 'forgot-password-2' or currentPage eq 'forgot-password-3' or currentPage eq 'reset-password' or currentPage eq 'reset-password-2' or currentPage eq 'reset-password-3' or currentPage eq 'email-verification' or currentPage eq 'email-verification-2' or currentPage eq 'email-verification-3' or currentPage eq 'two-step-verification' or currentPage eq 'two-step-verification-2' or currentPage eq 'two-step-verification-3' or currentPage eq 'lock-screen' or currentPage eq 'error-404' or currentPage eq 'error-500' ? ' show active' : ''}" id="menu-authentication">
                            <ul class="stack-submenu">
                                <li class="submenu">
                                    <a href="javascript:void(0);" class="">Login<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/login"class="${currentPage eq 'login' ? 'active' : ''}">Cover</a></li>
                                        <li><a href="${pageContext.request.contextPath}/login-2"class="${currentPage eq 'login-2' ? 'active' : ''}">Illustration</a></li>
                                        <li><a href="${pageContext.request.contextPath}/login-3"class="${currentPage eq 'login-3' ? 'active' : ''}">Basic</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);" class="">Register<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/register"class="${currentPage eq 'register' ? 'active' : ''}">Cover</a></li>
                                        <li><a href="${pageContext.request.contextPath}/register-2"class="${currentPage eq 'register-2' ? 'active' : ''}">Illustration</a></li>
                                        <li><a href="${pageContext.request.contextPath}/register-3"class="${currentPage eq 'register-3' ? 'active' : ''}">Basic</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);">Reset Password<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/reset-password"class="${currentPage eq 'reset-password' ? 'active' : ''}">Cover</a></li>
                                        <li><a href="${pageContext.request.contextPath}/reset-password-2"class="${currentPage eq 'reset-password-2' ? 'active' : ''}">Illustration</a></li>
                                        <li><a href="${pageContext.request.contextPath}/reset-password-3"class="${currentPage eq 'reset-password-3' ? 'active' : ''}">Basic</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);">Email Verification<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/email-verification"class="${currentPage eq 'email-verification' ? 'active' : ''}">Cover</a></li>
                                        <li><a href="${pageContext.request.contextPath}/email-verification-2"class="${currentPage eq 'email-verification-2' ? 'active' : ''}">Illustration</a></li>
                                        <li><a href="${pageContext.request.contextPath}/email-verification-3"class="${currentPage eq 'email-verification-3' ? 'active' : ''}">Basic</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);">2 Step Verification<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/two-step-verification"class="${currentPage eq 'two-step-verification' ? 'active' : ''}">Cover</a></li>
                                        <li><a href="${pageContext.request.contextPath}/two-step-verification-2"class="${currentPage eq 'two-step-verification-2' ? 'active' : ''}">Illustration</a></li>
                                        <li><a href="${pageContext.request.contextPath}/two-step-verification-3"class="${currentPage eq 'two-step-verification-3' ? 'active' : ''}">Basic</a></li>
                                    </ul>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/lock-screen"class="${currentPage eq 'lock-screen' ? 'active' : ''}">Lock Screen</a></li>
                                <li><a href="${pageContext.request.contextPath}/error-404"class="${currentPage eq 'error-404' ? 'active' : ''}">404 Error</a></li>
                                <li><a href="${pageContext.request.contextPath}/error-500"class="${currentPage eq 'error-500' ? 'active' : ''}">500 Error</a></li>
                            </ul>
                        </div>
                        <div class="tab-pane fade ${currentPage eq 'ui-alerts' or currentPage eq 'ui-accordion' or currentPage eq 'ui-avatar' or currentPage eq 'ui-badges' or currentPage eq 'ui-borders' or currentPage eq 'ui-buttons' or currentPage eq 'ui-buttons-group' or currentPage eq 'ui-breadcrumb' or currentPage eq 'ui-cards' or currentPage eq 'ui-carousel' or currentPage eq 'ui-colors' or currentPage eq 'ui-dropdowns' or currentPage eq 'ui-grid' or currentPage eq 'ui-images' or currentPage eq 'ui-lightbox' or currentPage eq 'ui-media' or currentPage eq 'ui-modals' or currentPage eq 'ui-offcanvas' or currentPage eq 'ui-pagination' or currentPage eq 'ui-popovers' or currentPage eq 'ui-progress' or currentPage eq 'ui-placeholders' or currentPage eq 'ui-spinner' or currentPage eq 'ui-sweetalerts' or currentPage eq 'ui-nav-tabs' or currentPage eq 'ui-toasts' or currentPage eq 'ui-tooltips' or currentPage eq 'ui-typography' or currentPage eq 'ui-video' or currentPage eq 'ui-ribbon' or currentPage eq 'ui-clipboard' or currentPage eq 'ui-drag-drop' or currentPage eq 'ui-rangeslider' or currentPage eq 'ui-rating' or currentPage eq 'ui-text-editor' or currentPage eq 'ui-counter' or currentPage eq 'ui-scrollbar' or currentPage eq 'ui-stickynote' or currentPage eq 'ui-timeline' or currentPage eq 'form-basic-inputs' or currentPage eq 'form-checkbox-radios' or currentPage eq 'form-input-groups' or currentPage eq 'form-grid-gutters' or currentPage eq 'form-select' or currentPage eq 'form-mask' or currentPage eq 'form-fileupload' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'form-validation' or currentPage eq 'form-wizard' or currentPage eq 'form-select2' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'tables-basic' or currentPage eq 'data-tables' or currentPage eq 'chart-apex' or currentPage eq 'chart-js' or currentPage eq 'chart-morris' or currentPage eq 'chart-flot' or currentPage eq 'chart-peity' or currentPage eq 'chart-c3' or currentPage eq 'icon-fontawesome' or currentPage eq 'icon-feather' or currentPage eq 'icon-ionic' or currentPage eq 'icon-material' or currentPage eq 'icon-pe7' or currentPage eq 'icon-simpleline' or currentPage eq 'icon-themify' or currentPage eq 'icon-weather' or currentPage eq 'icon-typicon' or currentPage eq 'icon-flag' or currentPage eq 'maps-vector' or currentPage eq 'maps-leaflet' ? 'show active' : ''}" id="menu-ui-elements">
                            <ul class="stack-submenu">
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'ui-alerts' or currentPage eq 'ui-accordion' or currentPage eq 'ui-avatar' or currentPage eq 'ui-badges' or currentPage eq 'ui-borders' or currentPage eq 'ui-buttons' or currentPage eq 'ui-buttons-group' or currentPage eq 'ui-breadcrumb' or currentPage eq 'ui-cards' or currentPage eq 'ui-carousel' or currentPage eq 'ui-colors' or currentPage eq 'ui-dropdowns' or currentPage eq 'ui-grid' or currentPage eq 'ui-images' or currentPage eq 'ui-lightbox' or currentPage eq 'ui-media' or currentPage eq 'ui-modals' or currentPage eq 'ui-offcanvas' or currentPage eq 'ui-pagination' or currentPage eq 'ui-popovers' or currentPage eq 'ui-progress' or currentPage eq 'ui-placeholders' or currentPage eq 'ui-spinner' or currentPage eq 'ui-sweetalerts' or currentPage eq 'ui-nav-tabs' or currentPage eq 'ui-toasts' or currentPage eq 'ui-tooltips' or currentPage eq 'ui-typography' or currentPage eq 'ui-video' ? 'subdrop active' : ''}">Base UI<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/ui-alerts"class="${currentPage eq 'ui-alerts' ? 'active' : ''}">Alerts</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-accordion"class="${currentPage eq 'ui-accordion' ? 'active' : ''}">Accordion</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-avatar"class="${currentPage eq 'ui-avatar' ? 'active' : ''}">Avatar</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-badges"class="${currentPage eq 'ui-badges' ? 'active' : ''}">Badges</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-borders"class="${currentPage eq 'ui-borders' ? 'active' : ''}">Border</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-buttons"class="${currentPage eq 'ui-buttons' ? 'active' : ''}">Buttons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-buttons-group"class="${currentPage eq 'ui-buttons-group' ? 'active' : ''}">Button Group</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-breadcrumb"class="${currentPage eq 'ui-breadcrumb' ? 'active' : ''}">Breadcrumb</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-cards"class="${currentPage eq 'ui-cards' ? 'active' : ''}">Card</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-carousel"class="${currentPage eq 'ui-carousel' ? 'active' : ''}">Carousel</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-colors"class="${currentPage eq 'ui-colors' ? 'active' : ''}">Colors</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-dropdowns"class="${currentPage eq 'ui-dropdowns' ? 'active' : ''}">Dropdowns</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-grid"class="${currentPage eq 'ui-grid' ? 'active' : ''}">Grid</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-images"class="${currentPage eq 'ui-images' ? 'active' : ''}">Images</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-lightbox"class="${currentPage eq 'lightbox' ? 'active' : ''}">Lightbox</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-media"class="${currentPage eq 'ui-media' ? 'active' : ''}">Media</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-modals"class="${currentPage eq 'ui-modals' ? 'active' : ''}">Modals</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-offcanvas"class="${currentPage eq 'ui-offcanvas' ? 'active' : ''}">Offcanvas</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-pagination"class="${currentPage eq 'ui-pagination' ? 'active' : ''}">Pagination</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-popovers"class="${currentPage eq 'ui-popovers' ? 'active' : ''}">Popovers</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-progress"class="${currentPage eq 'ui-progress' ? 'active' : ''}">Progress</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-placeholders"class="${currentPage eq 'ui-placeholders' ? 'active' : ''}">Placeholders</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-spinner"class="${currentPage eq 'ui-spinner' ? 'active' : ''}">Spinner</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-sweetalerts"class="${currentPage eq 'ui-sweetalerts' ? 'active' : ''}">Sweet Alerts</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-nav-tabs"class="${currentPage eq 'ui-nav-tabs' ? 'active' : ''}">Tabs</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-toasts"class="${currentPage eq 'ui-toasts' ? 'active' : ''}">Toasts</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-tooltips"class="${currentPage eq 'ui-tooltips' ? 'active' : ''}">Tooltips</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-typography"class="${currentPage eq 'ui-typography' ? 'active' : ''}">Typography</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-video"class="${currentPage eq 'ui-video' ? 'active' : ''}">Video</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-sortable"class="${currentPage eq 'ui-sortable' ? 'active' : ''}">Sortable</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-swiperjs"class="${currentPage eq 'ui-swiperjs' ? 'active' : ''}">Swiperjs</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'ui-ribbon' or currentPage eq 'ui-clipboard' or currentPage eq 'ui-drag-drop' or currentPage eq 'ui-rangeslider' or currentPage eq 'ui-rating' or currentPage eq 'ui-text-editor' or currentPage eq 'ui-counter' or currentPage eq 'ui-scrollbar' or currentPage eq 'ui-stickynote' or currentPage eq 'ui-timeline' ? 'subdrop active' : ''}"> Advanced UI<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/ui-ribbon"class="${currentPage eq 'ui-ribbon' ? 'active' : ''}">Ribbon</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-clipboard"class="${currentPage eq 'ui-clipboard' ? 'active' : ''}">Clipboard</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-drag-drop"class="${currentPage eq 'ui-drag-drop' ? 'active' : ''}">Drag & Drop</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-rangeslider"class="${currentPage eq 'ui-rangeslider' ? 'active' : ''}">Range Slider</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-rating"class="${currentPage eq 'ui-rating' ? 'active' : ''}">Rating</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-text-editor"class="${currentPage eq 'ui-text-editor' ? 'active' : ''}">Text Editor</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-counter"class="${currentPage eq 'ui-counter' ? 'active' : ''}">Counter</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-scrollbar"class="${currentPage eq 'ui-scrollbar' ? 'active' : ''}">Scrollbar</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-stickynote"class="${currentPage eq 'ui-stickynote' ? 'active' : ''}">Sticky Note</a></li>
                                        <li><a href="${pageContext.request.contextPath}/ui-timeline"class="${currentPage eq 'ui-timeline' ? 'active' : ''}">Timeline</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'form-basic-inputs' or currentPage eq 'form-checkbox-radios' or currentPage eq 'form-input-groups' or currentPage eq 'form-grid-gutters' or currentPage eq 'form-select' or currentPage eq 'form-mask' or currentPage eq 'form-fileupload' or currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' or currentPage eq 'form-validation' or currentPage eq 'form-wizard' or currentPage eq 'form-select2' ? 'subdrop active' : ''}">Forms<span class="menu-arrow"></span> </a>
                                    <ul>
                                        <li class="submenu submenu-two">
                                            <a href="javascript:void(0);"class="${currentPage eq 'form-basic-inputs' or currentPage eq 'form-checkbox-radios' or currentPage eq 'form-input-groups' or currentPage eq 'form-grid-gutters' or currentPage eq 'form-select' or currentPage eq 'form-mask' or currentPage eq 'form-fileupload' ? 'subdrop active' : ''}">Form Elements<span class="menu-arrow inside-submenu"></span></a>
                                            <ul>
                                                <li><a href="${pageContext.request.contextPath}/form-basic-inputs"class="${currentPage eq 'form-basic-inputs' ? 'active' : ''}">Basic Inputs</a></li>
                                                <li><a href="${pageContext.request.contextPath}/form-checkbox-radios"class="${currentPage eq 'form-checkbox-radios' ? 'active' : ''}">Checkbox & Radios</a> </li>
                                                <li><a href="${pageContext.request.contextPath}/form-input-groups"class="${currentPage eq 'form-input-groups' ? 'active' : ''}">Input Groups</a></li>
                                                <li><a href="${pageContext.request.contextPath}/form-grid-gutters"class="${currentPage eq 'form-grid-gutters' ? 'active' : ''}">Grid & Gutters</a></li>
                                                <li><a href="${pageContext.request.contextPath}/form-select"class="${currentPage eq 'form-select' ? 'active' : ''}">Form Select</a></li>
                                                <li><a href="${pageContext.request.contextPath}/form-mask"class="${currentPage eq 'form-mask' ? 'active' : ''}">Input Masks</a></li>
                                                <li><a href="${pageContext.request.contextPath}/form-fileupload"class="${currentPage eq 'form-fileupload' ? 'active' : ''}">File Uploads</a></li>

                                            </ul>
                                        </li>
                                        <li class="submenu submenu-two">
                                            <a href="javascript:void(0);"class="${currentPage eq 'form-horizontal' or currentPage eq 'form-vertical' or currentPage eq 'form-floating-labels' ? 'subdrop active' : ''}">Layouts<span class="menu-arrow inside-submenu"></span></a>
                                            <ul>
                                                <li><a href="${pageContext.request.contextPath}/form-horizontal"class="${currentPage eq 'form-horizontal' ? 'active' : ''}">Horizontal Form</a></li>
                                                <li><a href="${pageContext.request.contextPath}/form-vertical"class="${currentPage eq 'form-vertical' ? 'active' : ''}">Vertical Form</a></li>
                                                <li><a href="${pageContext.request.contextPath}/form-floating-labels"class="${currentPage eq 'form-floating-labels' ? 'active' : ''}">Floating Labels</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="${pageContext.request.contextPath}/form-validation"class="${currentPage eq 'form-validation' ? 'active' : ''}">Form Validation</a></li>
                                        <li><a href="${pageContext.request.contextPath}/form-select2"class="${currentPage eq 'form-select2' ? 'active' : ''}">Select2</a></li>
                                        <li><a href="${pageContext.request.contextPath}/form-wizard"class="${currentPage eq 'form-wizard' ? 'active' : ''}">Form Wizard</a></li>
                                        <li><a href="${pageContext.request.contextPath}/form-pickers"class="${currentPage eq 'form-pickers' ? 'active' : ''}">Form Picker</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'tables-basic' or currentPage eq 'data-tables' ? 'subdrop active' : ''}">Tables<span class="menu-arrow"></span></a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/tables-basic"class="${currentPage eq 'tables-basic' ? 'active' : ''}">Basic Tables </a></li>
                                        <li><a href="${pageContext.request.contextPath}/data-tables"class="${currentPage eq 'data-tables' ? 'active' : ''}">Data Table </a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'chart-apex' or currentPage eq 'chart-js' or currentPage eq 'chart-morris' or currentPage eq 'chart-flot' or currentPage eq 'chart-peity' or currentPage eq 'chart-c3' ? 'subdrop active' : ''}">Charts<span class="menu-arrow"></span> </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/chart-apex"class="${currentPage eq 'chart-apex' ? 'active' : ''}">Apex Charts</a></li>
                                        <li><a href="${pageContext.request.contextPath}/chart-c3"class="${currentPage eq 'chart-c3' ? 'active' : ''}">Chart C3</a></li>
                                        <li><a href="${pageContext.request.contextPath}/chart-js"class="${currentPage eq 'chart-js' ? 'active' : ''}">Chart Js</a></li>
                                        <li><a href="${pageContext.request.contextPath}/chart-morris"class="${currentPage eq 'chart-morris' ? 'active' : ''}">Morris Charts</a></li>
                                        <li><a href="${pageContext.request.contextPath}/chart-flot"class="${currentPage eq 'chart-flot' ? 'active' : ''}">Flot Charts</a></li>
                                        <li><a href="${pageContext.request.contextPath}/chart-peity"class="${currentPage eq 'chart-peity' ? 'active' : ''}">Peity Charts</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'icon-fontawesome' or currentPage eq 'icon-feather' or currentPage eq 'icon-ionic' or currentPage eq 'icon-material' or currentPage eq 'icon-pe7' or currentPage eq 'icon-simpleline' or currentPage eq 'icon-themify' or currentPage eq 'icon-weather' or currentPage eq 'icon-typicon' or currentPage eq 'icon-flag' ? 'subdrop active' : ''}">Icons<span class="menu-arrow"></span> </a>
                                    <ul>
                                        <li><a href="${pageContext.request.contextPath}/icon-fontawesome"class="${currentPage eq 'icon-fontawesome' ? 'active' : ''}">Fontawesome Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-tabler"class="${currentPage eq 'icon-tabler' ? 'active' : ''}">Tabler Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-bootstrap"class="${currentPage eq 'icon-bootstrap' ? 'active' : ''}">Bootstrap Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-remix"class="${currentPage eq 'icon-remix' ? 'active' : ''}">Remix Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-feather"class="${currentPage eq 'icon-feather' ? 'active' : ''}">Feather Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-ionic"class="${currentPage eq 'icon-ionic' ? 'active' : ''}">Ionic Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-material"class="${currentPage eq 'icon-material' ? 'active' : ''}">Material Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-pe7"class="${currentPage eq 'icon-pe7' ? 'active' : ''}">Pe7 Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-simpleline"class="${currentPage eq 'icon-simpleline' ? 'active' : ''}">Simpleline Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-themify"class="${currentPage eq 'icon-themify' ? 'active' : ''}">Themify Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-weather"class="${currentPage eq 'icon-weather' ? 'active' : ''}">Weather Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-typicon"class="${currentPage eq 'icon-typicon' ? 'active' : ''}">Typicon Icons</a></li>
                                        <li><a href="${pageContext.request.contextPath}/icon-flag"class="${currentPage eq 'icon-flag' ? 'active' : ''}">Flag Icons</a></li>
                                    </ul>
                                </li>
                                <li class="submenu">
                                    <a href="javascript:void(0);"class="${currentPage eq 'maps-vector' or currentPage eq 'maps-leaflet' ? 'subdrop active' : ''}">
                                        <i class="ti ti-table-plus"></i>
                                        <span>Maps</span>
                                        <span class="menu-arrow"></span>
                                    </a>
                                    <ul>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/maps-vector"class="${currentPage eq 'maps-vector' ? 'active' : ''}">Vector</a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/maps-leaflet"class="${currentPage eq 'maps-leaflet' ? 'active' : ''}">Leaflet</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="p-3">
                <a href="javascript:void(0);" class="d-flex align-items-center fs-12 mb-3">Documentation</a>
                <a href="javascript:void(0);" class="d-flex align-items-center fs-12">Change Log<span class="badge bg-pink badge-xs text-white fs-10 ms-2">v4.0.2</span></a>
            </div>
        </div>
    </div>
</div>
<!-- /Stacked Sidebar -->
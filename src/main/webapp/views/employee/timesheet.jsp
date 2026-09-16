
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="HRMS Dashboard">
    <meta name="keywords" content="HRMS, Human Resource Management System, Dashboard">
    <meta name="author" content="HRMS Team">
    <meta name="robots" content="noindex, nofollow">
    <title>HRMS Dashboard</title>

    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>


<div class="main-wrapper">

    <div id="global-loader" style="display: none;">
        <div class="page-loader"></div>
    </div>
    <div class="sidebar" id="sidebar">

        <div class="sidebar-logo">

            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="logo logo-normal">

                <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                     alt="HRMS Logo">

            </a>

            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="logo-small">

                <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg"
                     alt="HRMS Logo">

            </a>

            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="dark-logo">

                <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                     alt="HRMS Logo">

            </a>

        </div>


        <div class="modern-profile p-3 pb-0">

            <div class="text-center rounded bg-light p-3 mb-4 user-profile">

                <div class="avatar avatar-lg online mb-3">

                    <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg"
                         alt="Profile"
                         class="img-fluid rounded-circle">

                </div>

                <h6 class="fs-12 fw-normal mb-1">
                    Admin
                </h6>

                <p class="fs-10 mb-0">
                    Administrator
                </p>

            </div>

        </div>


        <!-- Sidebar Menu -->
        <div class="sidebar-menu">

            <ul>

                <li class="menu-title">
                    <span>MAIN MENU</span>
                </li>


                <!-- Dashboard -->
                <li class="active">

                    <a href="${pageContext.request.contextPath}/admin/dashboard">

                        <i class="ti ti-smart-home"></i>

                        <span>Employee Dashboard</span>

                    </a>

                </li>


                <!-- Employees -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-users"></i>

                        <span>Employees</span>

                    </a>

                </li>


                <!-- Attendance -->
                <li class="submenu">
                    <a href="javascript:void(0);">
                        <i class="ti ti-file-time"></i>
                        <span>Attendance</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>
                        <!-- Employee Attendance Link -->
                        <li>
                            <a href="${pageContext.request.contextPath}/employee/attendance">
                                <span>Attendance (Employee)</span>
                            </a>
                        </li>

                        <!-- Leaves Nested Submenu -->
                        <li class="submenu">
                            <a href="javascript:void(0);">
                                <span>Leaves</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <!-- Apply Leaves -->
                                <li>
                                    <a href="${pageContext.request.contextPath}/employee/leaves">
                                        <span>Apply Leaves</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>


                <!-- Payroll -->
                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-cash"></i>

                        <span>Payroll</span>

                        <span class="menu-arrow"></span>

                    </a>


                    <ul>

                        <!-- Payslips -->
                        <li>

                            <a href="javascript:void(0);">

                                <span>Payslips</span>

                            </a>

                        </li>

                    </ul>

                </li>


                <!-- Calendar -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-calendar-event"></i>

                        <span>Calendar</span>

                    </a>

                </li>


                <!-- Performance -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-chart-line"></i>

                        <span>Performance</span>

                    </a>

                </li>


                <!-- Documents -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-file-text"></i>

                        <span>Documents</span>

                    </a>
                    <ul>

                        <!-- Documents -->
                        <li>

                            <a href="javascript:void(0);">

                                <span>Company Slips</span>

                            </a>

                        </li>
                        <li>

                            <a href="${pageContext.request.contextPath}/documentList">

                                <span>My Documents</span>

                            </a>

                        </li>
                        <li>

                            <a href="${pageContext.request.contextPath}/uploadFile">

                                <span>Upload Documents</span>

                            </a>

                        </li>



                    </ul>
                </li>


                <!-- Help & Support -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-headset"></i>

                        <span>Help &amp; Support</span>

                    </a>

                </li>


                <!-- Tickets -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-ticket"></i>

                        <span>Tickets</span>

                    </a>

                </li>


                <!-- Logout -->
                <li class="mt-2">

                    <a href="javascript:void(0);">

                        <i class="ti ti-logout"></i>

                        <span>Logout</span>

                    </a>

                </li>

            </ul>

        </div>
        <!-- /Sidebar Menu -->

    </div>

    <!-- Main Wrapper -->
    <div class="main-wrapper">

        <!-- Stacked Sidebar -->
        <div class="stacked-sidebar" id="stacked-sidebar">
            <div class="sidebar sidebar-stacked" style="display: flex !important;">
                <div class="stacked-mini">
                    <a href="index.html" class="logo-small">
                        <img src="assets/img/logo-small.svg" alt="Logo">
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
                                <a href="calendar.html" class="btn btn-menubar">
                                    <i class="ti ti-layout-grid-remove"></i>
                                </a>
                            </div>
                            <div class="mb-1">
                                <a href="chat.html" class="btn btn-menubar position-relative">
                                    <i class="ti ti-brand-hipchat"></i>
                                    <span
                                            class="badge bg-info rounded-pill d-flex align-items-center justify-content-center header-badge">5</span>
                                </a>
                            </div>
                            <div class="mb-1">
                                <a href="email.html" class="btn btn-menubar">
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
                                <img src="assets/img/profiles/avatar-02.jpg" alt="Img" class="img-fluid rounded-circle">
                            </div>
                            <h6 class="fs-12 fw-normal mb-1">Adrian Herman</h6>
                            <p class="fs-10">System Admin</p>
                        </div>
                        <div class="stack-menu">
                            <div class="nav flex-column align-items-center nav-pills" role="tablist"
                                 aria-orientation="vertical">
                                <div class="row g-2">
                                    <div class="col-6">
                                        <a href="#menu-dashboard" role="tab" class="nav-link " title="Dashboard"
                                           data-bs-toggle="tab" data-bs-target="#menu-dashboard" aria-selected="true">
                                            <span><i class="ti ti-smart-home"></i></span>
                                            <p>Dashboard</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-application" role="tab" class="nav-link " title="Apps"
                                           data-bs-toggle="tab" data-bs-target="#menu-application"
                                           aria-selected="false">
                                            <span><i class="ti ti-layout-grid-add"></i></span>
                                            <p>Applications</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-superadmin" role="tab" class="nav-link " title="Apps"
                                           data-bs-toggle="tab" data-bs-target="#menu-superadmin"
                                           aria-selected="false">
                                            <span><i class="ti ti-user-star"></i></span>
                                            <p>Super Admin</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-layout" role="tab" class="nav-link " title="Layout"
                                           data-bs-toggle="tab" data-bs-target="#menu-layout" aria-selected="false">
                                            <span><i class="ti ti-layout-board-split"></i></span>
                                            <p>Layouts</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-project" role="tab" class="nav-link " title="Projects"
                                           data-bs-toggle="tab" data-bs-target="#menu-project" aria-selected="false">
                                            <span><i class="ti ti-folder"></i></span>
                                            <p>Projects</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-crm" role="tab" class="nav-link " title="CRM" data-bs-toggle="tab"
                                           data-bs-target="#menu-crm" aria-selected="false">
                                            <span><i class="ti ti-user-shield"></i></span>
                                            <p>Crm</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-hrm" role="tab" class="nav-link active" title="HRM" data-bs-toggle="tab"
                                           data-bs-target="#menu-hrm" aria-selected="false">
                                            <span><i class="ti ti-users"></i></span>
                                            <p>Hrm</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-finance" role="tab" class="nav-link" title="Finance & Accounts"
                                           data-bs-toggle="tab" data-bs-target="#menu-finance" aria-selected="false">
                                            <span><i class="ti ti-shopping-cart-dollar"></i></span>
                                            <p>Finance & Accounts</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-administration" role="tab" class="nav-link"
                                           title="Administration" data-bs-toggle="tab"
                                           data-bs-target="#menu-administration" aria-selected="false">
                                            <span><i class="ti ti-cash"></i></span>
                                            <p>Administration</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-content" role="tab" class="nav-link" title="Content"
                                           data-bs-toggle="tab" data-bs-target="#menu-content" aria-selected="false">
                                            <span><i class="ti ti-license"></i></span>
                                            <p>Contents</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-pages" role="tab" class="nav-link" title="Pages"
                                           data-bs-toggle="tab" data-bs-target="#menu-pages" aria-selected="false">
                                            <span><i class="ti ti-page-break"></i></span>
                                            <p>Pages</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-authentication" role="tab" class="nav-link"
                                           title="Authentication" data-bs-toggle="tab"
                                           data-bs-target="#menu-authentication" aria-selected="false">
                                            <span><i class="ti ti-lock-check"></i></span>
                                            <p>Authentication</p>
                                        </a>
                                    </div>
                                    <div class="col-6">
                                        <a href="#menu-ui-elements" role="tab" class="nav-link" title="UI Elements"
                                           data-bs-toggle="tab" data-bs-target="#menu-ui-elements"
                                           aria-selected="false">
                                            <span><i class="ti ti-ux-circle"></i></span>
                                            <p>Basic UI</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane fade" id="menu-dashboard">
                                    <ul class="stack-submenu">
                                        <li><a href="index.html">Admin Dashboard</a></li>
                                        <li><a href="employee-dashboard.html">Employee Dashboard</a></li>
                                        <li><a href="deals-dashboard.html">Deals Dashboard</a></li>
                                        <li><a href="leads-dashboard.html">Leads Dashboard</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu-superadmin">
                                    <ul class="stack-submenu">
                                        <li><a href="dashboard.html">Dashboard</a></li>
                                        <li><a href="companies.html">Companies</a></li>
                                        <li><a href="subscription.html">Subscriptions</a></li>
                                        <li><a href="packages.html">Packages</a></li>
                                        <li><a href="domain.html">Domain</a></li>
                                        <li><a href="purchase-transaction.html">Purchase Transaction</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu-application">
                                    <ul class="stack-submenu">
                                        <li><a href="chat.html">Chat</a></li>
                                        <li class="submenu submenu-two">
                                            <a href="call.html">Calls<span class="menu-arrow inside-submenu"></span></a>
                                            <ul>
                                                <li><a href="voice-call.html">Voice Call</a></li>
                                                <li><a href="video-call.html">Video Call</a></li>
                                                <li><a href="outgoing-call.html">Outgoing Call</a></li>
                                                <li><a href="incoming-call.html">Incoming Call</a></li>
                                                <li><a href="call-history.html">Call History</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="calendar.html">Calendar</a></li>
                                        <li><a href="email.html">Email</a></li>
                                        <li><a href="todo.html">To Do</a></li>
                                        <li><a href="notes.html">Notes</a></li>
                                        <li><a href="social-feed.html">Social Feed</a></li>
                                        <li><a href="file-manager.html">File Manager</a></li>
                                        <li><a href="kanban-view.html">Kanban</a></li>
                                        <li><a href="invoices.html">Invoices</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu-layout">
                                    <ul class="stack-submenu">
                                        <li><a href="layout-horizontal.html">Horizontal</a></li>
                                        <li><a href="layout-detached.html">Detached</a></li>
                                        <li><a href="layout-modern.html">Modern</a></li>
                                        <li><a href="layout-two-column.html">Two Column</a></li>
                                        <li><a href="layout-hovered.html">Hovered</a></li>
                                        <li><a href="layout-box.html">Boxed</a></li>
                                        <li><a href="layout-horizontal-single.html">Horizontal Single</a></li>
                                        <li><a href="layout-horizontal-overlay.html">Horizontal Overlay</a></li>
                                        <li><a href="layout-horizontal-box.html">Horizontal Box</a></li>
                                        <li><a href="layout-horizontal-sidemenu.html">Menu Aside</a></li>
                                        <li><a href="layout-vertical-transparent.html">Transparent</a></li>
                                        <li><a href="layout-without-header.html">Without Header</a></li>
                                        <li><a href="layout-rtl.html">RTL</a></li>
                                        <li><a href="layout-dark.html">Dark</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu-project">
                                    <ul class="stack-submenu">
                                        <li><a href="clients-grid.html"><span>Clients</span></a></li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Projects</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="projects-grid.html">Projects</a></li>
                                                <li><a href="tasks.html">Tasks</a></li>
                                                <li><a href="task-board.html">Task Board</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu-crm">
                                    <ul class="stack-submenu">
                                        <li><a href="contacts-grid.html"><span>Contacts</span></a></li>
                                        <li><a href="companies-grid.html"><span>Companies</span></a></li>
                                        <li><a href="deals-grid.html"><span>Deals</span></a></li>
                                        <li><a href="leads-grid.html"><span>Leads</span></a></li>
                                        <li><a href="pipeline.html"><span>Pipeline</span></a></li>
                                        <li><a href="analytics.html"><span>Analytics</span></a></li>
                                        <li><a href="activity.html"><span>Activities</span></a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade show active" id="menu-hrm">
                                    <ul class="stack-submenu">
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Employees</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="employees.html">Employee Lists</a></li>
                                                <li><a href="employees-grid.html">Employee Grid</a></li>
                                                <li><a href="employee-details.html">Employee Details</a></li>
                                                <li><a href="departments.html">Departments</a></li>
                                                <li><a href="designations.html">Designations</a></li>
                                                <li><a href="policy.html">Policies</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Tickets</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="tickets.html">Tickets</a></li>
                                                <li><a href="ticket-details.html">Ticket Details</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="holidays.html"><span>Holidays</span></a></li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);" class="active"><span>Attendance</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li class="submenu submenu-two">
                                                    <a href="javascript:void(0);">Leaves<span
                                                            class="menu-arrow inside-submenu"></span></a>
                                                    <ul>
                                                        <li><a href="leaves.html">Leaves (Admin)</a></li>
                                                        <li><a href="leaves-employee.html">Leave (Employee)</a></li>
                                                        <li><a href="leave-settings.html">Leave Settings</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="attendance-admin.html" class="active">Attendance (Admin)</a></li>
                                                <li><a href="attendance-employee.html">Attendance (Employee)</a></li>
                                                <li><a href="timesheets.html">Timesheets</a></li>
                                                <li><a href="schedule-timing.html">Shift & Schedule</a></li>
                                                <li><a href="overtime.html">Overtime</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Performance</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="performance-indicator.html">Performance Indicator</a></li>
                                                <li><a href="performance-review.html">Performance Review</a></li>
                                                <li><a href="performance-appraisal.html">Performance Appraisal</a></li>
                                                <li><a href="goal-tracking.html">Goal List</a></li>
                                                <li><a href="goal-type.html">Goal Type</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Training</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="training.html">Training List</a></li>
                                                <li><a href="trainers.html">Trainers</a></li>
                                                <li><a href="training-type.html">Training Type</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="promotion.html"><span>Promotion</span></a></li>
                                        <li><a href="resignation.html"><span>Resignation</span></a></li>
                                        <li><a href="termination.html"><span>Termination</span></a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu-finance">
                                    <ul class="stack-submenu">
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Sales</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="estimates.html">Estimates</a></li>
                                                <li><a href="invoices.html">Invoices</a></li>
                                                <li><a href="payments.html">Payments</a></li>
                                                <li><a href="expenses.html">Expenses</a></li>
                                                <li><a href="provident-fund.html">Provident Fund</a></li>
                                                <li><a href="taxes.html">Taxes</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Accounting</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="categories.html">Categories</a></li>
                                                <li><a href="budgets.html">Budgets</a></li>
                                                <li><a href="budget-expenses.html">Budget Expenses</a></li>
                                                <li><a href="budget-revenues.html">Budget Revenues</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Payroll</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="employee-salary.html">Employee Salary</a></li>
                                                <li><a href="payslip.html">Payslip</a></li>
                                                <li><a href="payroll.html">Payroll Items</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu-administration">
                                    <ul class="stack-submenu">
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Assets</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="assets.html">Assets</a></li>
                                                <li><a href="asset-categories.html">Asset Categories</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Help & Supports</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="knowledgebase.html">Knowledge Base</a></li>
                                                <li><a href="activity.html">Activities</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>User Management</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="users.html">Users</a></li>
                                                <li><a href="roles-permissions.html">Roles & Permissions</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Reports</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="expenses-report.html">Expense Report</a></li>
                                                <li><a href="invoice-report.html">Invoice Report</a></li>
                                                <li><a href="payment-report.html">Payment Report</a></li>
                                                <li><a href="project-report.html">Project Report</a></li>
                                                <li><a href="task-report.html">Task Report</a></li>
                                                <li><a href="user-report.html">User Report</a></li>
                                                <li><a href="employee-report.html">Employee Report</a></li>
                                                <li><a href="payslip-report.html">Payslip Report</a></li>
                                                <li><a href="attendance-report.html">Attendance Report</a></li>
                                                <li><a href="leave-report.html">Leave Report</a></li>
                                                <li><a href="daily-report.html">Daily Report</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                General Settings
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="profile-settings.html">Profile</a></li>
                                                <li><a href="security-settings.html">Security</a></li>
                                                <li><a href="notification-settings.html">Notifications</a></li>
                                                <li><a href="connected-apps.html">Connected Apps</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                Website Settings
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="bussiness-settings.html">Business Settings</a></li>
                                                <li><a href="seo-settings.html">SEO Settings</a></li>
                                                <li><a href="localization-settings.html">Localization</a></li>
                                                <li><a href="prefixes.html">Prefixes</a></li>
                                                <li><a href="preferences.html">Preferences</a></li>
                                                <li><a href="performance-appraisal.html">Appearance</a></li>
                                                <li><a href="language.html">Language</a></li>
                                                <li><a href="authentication-settings.html">Authentication</a></li>
                                                <li><a href="ai-settings.html">AI Settings</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">App Settings<span
                                                    class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="salary-settings.html">Salary Settings</a></li>
                                                <li><a href="approval-settings.html">Approval Settings</a></li>
                                                <li><a href="invoice-settings.html">Invoice Settings</a></li>
                                                <li><a href="leave-type.html">Leave Type</a></li>
                                                <li><a href="custom-fields.html">Custom Fields</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                System Settings
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="email-settings.html">Email Settings</a></li>
                                                <li><a href="email-template.html">Email Templates</a></li>
                                                <li><a href="sms-settings.html">SMS Settings</a></li>
                                                <li><a href="sms-template.html">SMS Templates</a></li>
                                                <li><a href="otp-settings.html">OTP</a></li>
                                                <li><a href="gdpr.html">GDPR Cookies</a></li>
                                                <li><a href="maintenance-mode.html">Maintenance Mode</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                Financial Settings
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="payment-gateways.html">Payment Gateways</a></li>
                                                <li><a href="tax-rates.html">Tax Rate</a></li>
                                                <li><a href="currencies.html">Currencies</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Other Settings<span
                                                    class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="custom-css.html">Custom CSS</a></li>
                                                <li><a href="custom-js.html">Custom JS</a></li>
                                                <li><a href="cronjob.html">Cronjob</a></li>
                                                <li><a href="storage-settings.html">Storage</a></li>
                                                <li><a href="ban-ip-address.html">Ban IP Address</a></li>
                                                <li><a href="backup.html">Backup</a></li>
                                                <li><a href="clear-cache.html">Clear Cache</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu-content">
                                    <ul class="stack-submenu">
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Blogs<span class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="blogs.html">All Blogs</a></li>
                                                <li><a href="blog-categories.html">Categories</a></li>
                                                <li><a href="blog-comments.html">Comments</a></li>
                                                <li><a href="blog-tags.html">Tags</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Locations<span class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="countries.html">Countries</a></li>
                                                <li><a href="states.html">States</a></li>
                                                <li><a href="cities.html">Cities</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="testimonials.html">Testimonials</a></li>
                                        <li><a href="faq.html">FAQ’S</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu-pages">
                                    <ul class="stack-submenu">
                                        <li><a href="starter.html">Starter</a></li>
                                        <li><a href="profile.html">Profile</a></li>
                                        <li><a href="profile-settings.html">Profile Settings</a></li>
                                        <li><a href="gallery.html">Gallery</a></li>
                                        <li><a href="search-result.html">Search Results</a></li>
                                        <li><a href="timeline.html">Timeline</a></li>
                                        <li><a href="pricing.html">Pricing</a></li>
                                        <li><a href="coming-soon.html">Coming Soon</a></li>
                                        <li><a href="under-maintenance.html">Under Maintenance</a></li>
                                        <li><a href="under-construction.html">Under Construction</a></li>
                                        <li><a href="api-keys.html">API Keys</a></li>
                                        <li><a href="privacy-policy.html">Privacy Policy</a></li>
                                        <li><a href="terms-condition.html">Terms & Conditions</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu-authentication">
                                    <ul class="stack-submenu">
                                        <li class="submenu">
                                            <a href="javascript:void(0);" class="">Login<span
                                                    class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="login.html">Cover</a></li>
                                                <li><a href="login-2.html">Illustration</a></li>
                                                <li><a href="login-3.html">Basic</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);" class="">Register<span
                                                    class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="register.html">Cover</a></li>
                                                <li><a href="register-2.html">Illustration</a></li>
                                                <li><a href="register-3.html">Basic</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Reset Password<span
                                                    class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="reset-password.html">Cover</a></li>
                                                <li><a href="reset-password-2.html">Illustration</a></li>
                                                <li><a href="reset-password-3.html">Basic</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Email Verification<span
                                                    class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="email-verification.html">Cover</a></li>
                                                <li><a href="email-verification-2.html">Illustration</a></li>
                                                <li><a href="email-verification-3.html">Basic</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">2 Step Verification<span
                                                    class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="two-step-verification.html">Cover</a></li>
                                                <li><a href="two-step-verification-2.html">Illustration</a></li>
                                                <li><a href="two-step-verification-3.html">Basic</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="lock-screen.html">Lock Screen</a></li>
                                        <li><a href="error-404.html">404 Error</a></li>
                                        <li><a href="error-500.html">500 Error</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="menu-ui-elements">
                                    <ul class="stack-submenu">
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Base UI<span class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="ui-alerts.html">Alerts</a></li>
                                                <li><a href="ui-accordion.html">Accordion</a></li>
                                                <li><a href="ui-avatar.html">Avatar</a></li>
                                                <li><a href="ui-badges.html">Badges</a></li>
                                                <li><a href="ui-borders.html">Border</a></li>
                                                <li><a href="ui-buttons.html">Buttons</a></li>
                                                <li><a href="ui-buttons-group.html">Button Group</a></li>
                                                <li><a href="ui-breadcrumb.html">Breadcrumb</a></li>
                                                <li><a href="ui-cards.html">Card</a></li>
                                                <li><a href="ui-carousel.html">Carousel</a></li>
                                                <li><a href="ui-colors.html">Colors</a></li>
                                                <li><a href="ui-dropdowns.html">Dropdowns</a></li>
                                                <li><a href="ui-grid.html">Grid</a></li>
                                                <li><a href="ui-images.html">Images</a></li>
                                                <li><a href="ui-lightbox.html">Lightbox</a></li>
                                                <li><a href="ui-media.html">Media</a></li>
                                                <li><a href="ui-modals.html">Modals</a></li>
                                                <li><a href="ui-offcanvas.html">Offcanvas</a></li>
                                                <li><a href="ui-pagination.html">Pagination</a></li>
                                                <li><a href="ui-popovers.html">Popovers</a></li>
                                                <li><a href="ui-progress.html">Progress</a></li>
                                                <li><a href="ui-placeholders.html">Placeholders</a></li>
                                                <li><a href="ui-spinner.html">Spinner</a></li>
                                                <li><a href="ui-sweetalerts.html">Sweet Alerts</a></li>
                                                <li><a href="ui-nav-tabs.html">Tabs</a></li>
                                                <li><a href="ui-toasts.html">Toasts</a></li>
                                                <li><a href="ui-tooltips.html">Tooltips</a></li>
                                                <li><a href="ui-typography.html">Typography</a></li>
                                                <li><a href="ui-video.html">Video</a></li>
                                                <li><a href="ui-sortable.html">Sortable</a></li>
                                                <li><a href="ui-swiperjs.html">Swiperjs</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"> Advanced UI<span
                                                    class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="ui-ribbon.html">Ribbon</a></li>
                                                <li><a href="ui-clipboard.html">Clipboard</a></li>
                                                <li><a href="ui-drag-drop.html">Drag & Drop</a></li>
                                                <li><a href="ui-rangeslider.html">Range Slider</a></li>
                                                <li><a href="ui-rating.html">Rating</a></li>
                                                <li><a href="ui-text-editor.html">Text Editor</a></li>
                                                <li><a href="ui-counter.html">Counter</a></li>
                                                <li><a href="ui-scrollbar.html">Scrollbar</a></li>
                                                <li><a href="ui-stickynote.html">Sticky Note</a></li>
                                                <li><a href="ui-timeline.html">Timeline</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Forms<span class="menu-arrow"></span> </a>
                                            <ul>
                                                <li class="submenu submenu-two">
                                                    <a href="javascript:void(0);">Form Elements<span
                                                            class="menu-arrow inside-submenu"></span></a>
                                                    <ul>
                                                        <li><a href="form-basic-inputs.html">Basic Inputs</a></li>
                                                        <li><a href="form-checkbox-radios.html">Checkbox & Radios</a>
                                                        </li>
                                                        <li><a href="form-input-groups.html">Input Groups</a></li>
                                                        <li><a href="form-grid-gutters.html">Grid & Gutters</a></li>
                                                        <li><a href="form-select.html">Form Select</a></li>
                                                        <li><a href="form-mask.html">Input Masks</a></li>
                                                        <li><a href="form-fileupload.html">File Uploads</a></li>

                                                    </ul>
                                                </li>
                                                <li class="submenu submenu-two">
                                                    <a href="javascript:void(0);">Layouts<span
                                                            class="menu-arrow inside-submenu"></span></a>
                                                    <ul>
                                                        <li><a href="form-horizontal.html">Horizontal Form</a></li>
                                                        <li><a href="form-vertical.html">Vertical Form</a></li>
                                                        <li><a href="form-floating-labels.html">Floating Labels</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="form-validation.html">Form Validation</a></li>
                                                <li><a href="form-select2.html">Select2</a></li>
                                                <li><a href="form-wizard.html">Form Wizard</a></li>
                                                <li><a href="form-pickers.html">Form Picker</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Tables<span class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="tables-basic.html">Basic Tables </a></li>
                                                <li><a href="data-tables.html">Data Table </a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Charts<span class="menu-arrow"></span> </a>
                                            <ul>
                                                <li><a href="chart-apex.html">Apex Charts</a></li>
                                                <li><a href="chart-c3.html">Chart C3</a></li>
                                                <li><a href="chart-js.html">Chart Js</a></li>
                                                <li><a href="chart-morris.html">Morris Charts</a></li>
                                                <li><a href="chart-flot.html">Flot Charts</a></li>
                                                <li><a href="chart-peity.html">Peity Charts</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Icons<span class="menu-arrow"></span> </a>
                                            <ul>
                                                <li><a href="icon-fontawesome.html">Fontawesome Icons</a></li>
                                                <li><a href="icon-tabler.html">Tabler Icons</a></li>
                                                <li><a href="icon-bootstrap.html">Bootstrap Icons</a></li>
                                                <li><a href="icon-remix.html">Remix Icons</a></li>
                                                <li><a href="icon-feather.html">Feather Icons</a></li>
                                                <li><a href="icon-ionic.html">Ionic Icons</a></li>
                                                <li><a href="icon-material.html">Material Icons</a></li>
                                                <li><a href="icon-pe7.html">Pe7 Icons</a></li>
                                                <li><a href="icon-simpleline.html">Simpleline Icons</a></li>
                                                <li><a href="icon-themify.html">Themify Icons</a></li>
                                                <li><a href="icon-weather.html">Weather Icons</a></li>
                                                <li><a href="icon-typicon.html">Typicon Icons</a></li>
                                                <li><a href="icon-flag.html">Flag Icons</a></li>
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
                                                    <a href="maps-vector.html">Vector</a>
                                                </li>
                                                <li>
                                                    <a href="maps-leaflet.html">Leaflet</a>
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
                        <a href="javascript:void(0);" class="d-flex align-items-center fs-12">Change Log<span
                                class="badge bg-pink badge-xs text-white fs-10 ms-2">v4.0.2</span></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Stacked Sidebar -->

        <!-- Page Wrapper -->
        <div class="main-wrapper">


            <!-- Two Col Sidebar -->
            <div class="two-col-sidebar" id="two-col-sidebar">
                <div class="sidebar sidebar-twocol">
                    <div class="twocol-mini">
                        <a href="index.html" class="logo-small">
                            <img src="assets/img/logo-small.svg" alt="Logo">
                        </a>
                        <div class="sidebar-left slimscroll">
                            <div class="nav flex-column align-items-center nav-pills" id="sidebar-tabs" role="tablist"
                                 aria-orientation="vertical">
                                <a href="#" class="nav-link " title="Dashboard" data-bs-toggle="tab"
                                   data-bs-target="#dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                                <a href="#" class="nav-link " title="Apps" data-bs-toggle="tab"
                                   data-bs-target="#application">
                                    <i class="ti ti-layout-grid-add"></i>
                                </a>
                                <a href="#" class="nav-link " title="Super Admin" data-bs-toggle="tab"
                                   data-bs-target="#super-admin">
                                    <i class="ti ti-user-star"></i>
                                </a>
                                <a href="#" class="nav-link " title="Layout" data-bs-toggle="tab"
                                   data-bs-target="#layout">
                                    <i class="ti ti-layout-board-split"></i>
                                </a>
                                <a href="#" class="nav-link " title="Projects" data-bs-toggle="tab"
                                   data-bs-target="#projects">
                                    <i class="ti ti-users-group"></i>
                                </a>
                                <a href="#" class="nav-link " title="Crm" data-bs-toggle="tab" data-bs-target="#crm">
                                    <i class="ti ti-user-shield"></i>
                                </a>
                                <a href="#" class="nav-link active" title="Hrm" data-bs-toggle="tab" data-bs-target="#hrm">
                                    <i class="ti ti-user"></i>
                                </a>
                                <a href="#" class="nav-link" title="Finance" data-bs-toggle="tab" data-bs-target="#finance">
                                    <i class="ti ti-shopping-cart-dollar"></i>
                                </a>
                                <a href="#" class="nav-link" title="Administration" data-bs-toggle="tab"
                                   data-bs-target="#administration">
                                    <i class="ti ti-cash"></i>
                                </a>
                                <a href="#" class="nav-link" title="Content" data-bs-toggle="tab" data-bs-target="#content">
                                    <i class="ti ti-license"></i>
                                </a>
                                <a href="#" class="nav-link" title="Pages" data-bs-toggle="tab" data-bs-target="#pages">
                                    <i class="ti ti-page-break"></i>
                                </a>
                                <a href="#" class="nav-link" title="Authentication" data-bs-toggle="tab"
                                   data-bs-target="#authentication">
                                    <i class="ti ti-lock-check"></i>
                                </a>
                                <a href="#" class="nav-link " title="UI Elements" data-bs-toggle="tab"
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
                            <a href="index.html" class="logo logo-normal">
                                <img src="assets/img/logo.svg" alt="Logo">
                            </a>
                            <a href="index.html" class="dark-logo">
                                <img src="assets/img/logo-white.svg" alt="Logo">
                            </a>
                        </div>
                        <div class="sidebar-scroll">
                            <h6 class="mb-3">Welcome to SmartHR</h6>
                            <div class="text-center rounded bg-light p-3 mb-4">
                                <div class="avatar avatar-lg online mb-3">
                                    <img src="assets/img/profiles/avatar-02.jpg" alt="Img" class="img-fluid rounded-circle">
                                </div>
                                <h6 class="fs-12 fw-normal mb-1">Adrian Herman</h6>
                                <p class="fs-10">System Admin</p>
                            </div>
                            <div class="tab-content" id="v-pills-tabContent">
                                <div class="tab-pane fade" id="dashboard">
                                    <ul>
                                        <li class="menu-title"><span>MAIN MENU</span></li>
                                        <li><a href="index.html">Admin Dashboard</a></li>
                                        <li><a href="employee-dashboard.html">Employee Dashboard</a></li>
                                        <li><a href="deals-dashboard.html">Deals Dashboard</a></li>
                                        <li><a href="leads-dashboard.html">Leads Dashboard</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="application">
                                    <ul>
                                        <li class="menu-title"><span>APPLICATION</span></li>
                                        <li><a href="chat.html">Chat</a></li>
                                        <li><a href="voice-call.html">Voice Call</a></li>
                                        <li><a href="video-call.html">Video Call</a></li>
                                        <li><a href="outgoing-call.html">Outgoing Call</a></li>
                                        <li><a href="incoming-call.html">Incoming Call</a></li>
                                        <li><a href="call-history.html">Call History</a></li>
                                        <li><a href="calendar.html">Calendar</a></li>
                                        <li><a href="email.html">Email</a></li>
                                        <li><a href="todo.html">To Do</a></li>
                                        <li><a href="notes.html">Notes</a></li>
                                        <li><a href="social-feed.html">Social Feed</a></li>
                                        <li><a href="file-manager.html">File Manager</a></li>
                                        <li><a href="kanban-view.html">Kanban</a></li>
                                        <li><a href="invoices.html">Invoices</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="super-admin">
                                    <ul>
                                        <li class="menu-title"><span>SUPER ADMIN</span></li>
                                        <li><a href="dashboard.html">Dashboard</a></li>
                                        <li><a href="companies.html">Companies</a></li>
                                        <li><a href="subscription.html">Subscriptions</a></li>
                                        <li><a href="packages.html">Packages</a></li>
                                        <li><a href="domain.html">Domain</a></li>
                                        <li><a href="purchase-transaction.html">Purchase Transaction</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade " id="layout">
                                    <ul>
                                        <li class="menu-title"><span>LAYOUT</span></li>
                                        <li><a href="layout-horizontal.html"><span>Horizontal</span></a></li>
                                        <li><a href="layout-detached.html"><span>Detached</span></a></li>
                                        <li><a href="layout-modern.html"><span>Modern</span></a></li>
                                        <li><a href="layout-two-column.html"><span>Two Column </span></a></li>
                                        <li><a href="layout-hovered.html"><span>Hovered</span></a></li>
                                        <li><a href="layout-box.html"><span>Boxed</span></a></li>
                                        <li><a href="layout-horizontal-single.html"><span>Horizontal Single</span></a></li>
                                        <li><a href="layout-horizontal-overlay.html"><span>Horizontal Overlay</span></a>
                                        </li>
                                        <li><a href="layout-horizontal-box.html"><span>Horizontal Box</span></a></li>
                                        <li><a href="layout-horizontal-sidemenu.html"><span>Menu Aside</span></a></li>
                                        <li><a href="layout-vertical-transparent.html"><span>Transparent</span></a></li>
                                        <li><a href="layout-without-header.html"><span>Without Header</span></a></li>
                                        <li><a href="layout-rtl.html"><span>RTL</span></a></li>
                                        <li><a href="layout-dark.html"><span>Dark</span></a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="projects">
                                    <ul>
                                        <li class="menu-title"><span>PROJECTS</span></li>
                                        <li><a href="clients-grid.html" >Clients</a></li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Projects</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="projects-grid.html">Projects</a></li>
                                                <li><a href="tasks.html">Tasks</a></li>
                                                <li><a href="task-board.html">Task Board</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="crm">
                                    <ul>
                                        <li class="menu-title"><span>CRM</span></li>
                                        <li><a href="contacts-grid.html"><span>Contacts</span></a></li>
                                        <li><a href="companies-grid.html"><span>Companies</span></a></li>
                                        <li><a href="deals-grid.html"><span>Deals</span></a></li>
                                        <li><a href="leads-grid.html"><span>Leads</span></a></li>
                                        <li><a href="pipeline.html"><span>Pipeline</span></a></li>
                                        <li><a href="analytics.html"><span>Analytics</span></a></li>
                                        <li><a href="activity.html"><span>Activities</span></a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade show active" id="hrm">
                                    <ul>
                                        <li class="menu-title"><span>HRM</span></li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Employees</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="employees.html" >Employee Lists</a></li>
                                                <li><a href="employees-grid.html">Employee Grid</a></li>
                                                <li><a href="employee-details.html">Employee Details</a></li>
                                                <li><a href="departments.html">Departments</a></li>
                                                <li><a href="designations.html">Designations</a></li>
                                                <li><a href="policy.html">Policies</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Tickets</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="tickets.html">Tickets</a></li>
                                                <li><a href="ticket-details.html">Ticket Details</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="holidays.html"><span>Holidays</span></a></li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);" class="active subdrop"><span>Attendance</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li class="submenu submenu-two">
                                                    <a href="javascript:void(0);">Leaves<span
                                                            class="menu-arrow inside-submenu"></span></a>
                                                    <ul>
                                                        <li><a href="leaves.html">Leaves (Admin)</a></li>
                                                        <li><a href="leaves-employee.html">Leave (Employee)</a></li>
                                                        <li><a href="leave-settings.html">Leave Settings</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="attendance-admin.html">Attendance (Admin)</a></li>
                                                <li><a href="attendance-employee.html" class="active">Attendance (Employee)</a></li>
                                                <li><a href="timesheets.html">Timesheets</a></li>
                                                <li><a href="schedule-timing.html">Shift & Schedule</a></li>
                                                <li><a href="overtime.html">Overtime</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Performance</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="performance-indicator.html">Performance Indicator</a></li>
                                                <li><a href="performance-review.html">Performance Review</a></li>
                                                <li><a href="performance-appraisal.html">Performance Appraisal</a></li>
                                                <li><a href="goal-tracking.html">Goal List</a></li>
                                                <li><a href="goal-type.html">Goal Type</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Training</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="training.html">Training List</a></li>
                                                <li><a href="trainers.html">Trainers</a></li>
                                                <li><a href="training-type.html">Training Type</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="promotion.html"><span>Promotion</span></a></li>
                                        <li><a href="resignation.html"><span>Resignation</span></a></li>
                                        <li><a href="termination.html"><span>Termination</span></a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="finance">
                                    <ul>
                                        <li class="menu-title"><span>FINANCE & ACCOUNTS</span></li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Sales</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="estimates.html">Estimates</a></li>
                                                <li><a href="invoices.html">Invoices</a></li>
                                                <li><a href="payments.html">Payments</a></li>
                                                <li><a href="expenses.html">Expenses</a></li>
                                                <li><a href="provident-fund.html">Provident Fund</a></li>
                                                <li><a href="taxes.html">Taxes</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Accounting</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="categories.html">Categories</a></li>
                                                <li><a href="budgets.html">Budgets</a></li>
                                                <li><a href="budget-expenses.html">Budget Expenses</a></li>
                                                <li><a href="budget-revenues.html">Budget Revenues</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Payroll</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="employee-salary.html">Employee Salary</a></li>
                                                <li><a href="payslip.html">Payslip</a></li>
                                                <li><a href="payroll.html">Payroll Items</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="administration">
                                    <ul>
                                        <li class="menu-title"><span>ADMINISTRATION</span></li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Assets</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="assets.html">Assets</a></li>
                                                <li><a href="asset-categories.html">Asset Categories</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Help & Supports</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="knowledgebase.html">Knowledge Base</a></li>
                                                <li><a href="activity.html">Activities</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>User Management</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="users.html">Users</a></li>
                                                <li><a href="roles-permissions.html">Roles & Permissions</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"><span>Reports</span>
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="expenses-report.html">Expense Report</a></li>
                                                <li><a href="invoice-report.html">Invoice Report</a></li>
                                                <li><a href="payment-report.html">Payment Report</a></li>
                                                <li><a href="project-report.html">Project Report</a></li>
                                                <li><a href="task-report.html">Task Report</a></li>
                                                <li><a href="user-report.html">User Report</a></li>
                                                <li><a href="employee-report.html">Employee Report</a></li>
                                                <li><a href="payslip-report.html">Payslip Report</a></li>
                                                <li><a href="attendance-report.html">Attendance Report</a></li>
                                                <li><a href="leave-report.html">Leave Report</a></li>
                                                <li><a href="daily-report.html">Daily Report</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                General Settings
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="profile-settings.html">Profile</a></li>
                                                <li><a href="security-settings.html">Security</a></li>
                                                <li><a href="notification-settings.html">Notifications</a></li>
                                                <li><a href="connected-apps.html">Connected Apps</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                Website Settings
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="bussiness-settings.html">Business Settings</a></li>
                                                <li><a href="seo-settings.html">SEO Settings</a></li>
                                                <li><a href="localization-settings.html">Localization</a></li>
                                                <li><a href="prefixes.html">Prefixes</a></li>
                                                <li><a href="preferences.html">Preferences</a></li>
                                                <li><a href="performance-appraisal.html">Appearance</a></li>
                                                <li><a href="language.html">Language</a></li>
                                                <li><a href="authentication-settings.html">Authentication</a></li>
                                                <li><a href="ai-settings.html">AI Settings</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">App Settings<span class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="salary-settings.html">Salary Settings</a></li>
                                                <li><a href="approval-settings.html">Approval Settings</a></li>
                                                <li><a href="invoice-settings.html">Invoice Settings</a></li>
                                                <li><a href="leave-type.html">Leave Type</a></li>
                                                <li><a href="custom-fields.html">Custom Fields</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                System Settings
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="email-settings.html">Email Settings</a></li>
                                                <li><a href="email-template.html">Email Templates</a></li>
                                                <li><a href="sms-settings.html">SMS Settings</a></li>
                                                <li><a href="sms-template.html">SMS Templates</a></li>
                                                <li><a href="otp-settings.html">OTP</a></li>
                                                <li><a href="gdpr.html">GDPR Cookies</a></li>
                                                <li><a href="maintenance-mode.html">Maintenance Mode</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                Financial Settings
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="payment-gateways.html">Payment Gateways</a></li>
                                                <li><a href="tax-rates.html">Tax Rate</a></li>
                                                <li><a href="currencies.html">Currencies</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Other Settings<span class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="custom-css.html">Custom CSS</a></li>
                                                <li><a href="custom-js.html">Custom JS</a></li>
                                                <li><a href="cronjob.html">Cronjob</a></li>
                                                <li><a href="storage-settings.html">Storage</a></li>
                                                <li><a href="ban-ip-address.html">Ban IP Address</a></li>
                                                <li><a href="backup.html">Backup</a></li>
                                                <li><a href="clear-cache.html">Clear Cache</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="content">
                                    <ul>
                                        <li class="menu-title"><span>CONTENT</span></li>
                                        <li><a href="pages.html">Pages</a></li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                Blogs
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="blogs.html">All Blogs</a></li>
                                                <li><a href="blog-categories.html">Categories</a></li>
                                                <li><a href="blog-comments.html">Comments</a></li>
                                                <li><a href="blog-tags.html">Blog Tags</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                Locations
                                                <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="countries.html">Countries</a></li>
                                                <li><a href="states.html">States</a></li>
                                                <li><a href="cities.html">Cities</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="testimonials.html">Testimonials</a></li>
                                        <li><a href="faq.html">FAQ’S</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="pages">
                                    <ul>
                                        <li class="menu-title"><span>PAGES</span></li>
                                        <li><a href="starter.html"><span>Starter</span></a></li>
                                        <li><a href="profile.html"><span>Profile</span></a></li>
                                        <li><a href="gallery.html"><span>Gallery</span></a></li>
                                        <li><a href="search-result.html"><span>Search Results</span></a></li>
                                        <li><a href="timeline.html"><span>Timeline</span></a></li>
                                        <li><a href="pricing.html"><span>Pricing</span></a></li>
                                        <li><a href="coming-soon.html"><span>Coming Soon</span></a></li>
                                        <li><a href="under-maintenance.html"><span>Under Maintenance</span></a></li>
                                        <li><a href="under-construction.html"><span>Under Construction</span></a></li>
                                        <li><a href="api-keys.html"><span>API Keys</span></a></li>
                                        <li><a href="privacy-policy.html"><span>Privacy Policy</span></a></li>
                                        <li><a href="terms-condition.html"><span>Terms & Conditions</span></a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="authentication">
                                    <ul>
                                        <li class="menu-title"><span>AUTHENTICATION</span></li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                Login<span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="login.html">Cover</a></li>
                                                <li><a href="login-2.html">Illustration</a></li>
                                                <li><a href="login-3.html">Basic</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                Register<span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="register.html">Cover</a></li>
                                                <li><a href="register-2.html">Illustration</a></li>
                                                <li><a href="register-3.html">Basic</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                Forgot Password<span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="forgot-password.html">Cover</a></li>
                                                <li><a href="forgot-password-2.html">Illustration</a></li>
                                                <li><a href="forgot-password-3.html">Basic</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                Reset Password<span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="reset-password.html">Cover</a></li>
                                                <li><a href="reset-password-2.html">Illustration</a></li>
                                                <li><a href="reset-password-3.html">Basic</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                Email Verification<span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="email-verification.html">Cover</a></li>
                                                <li><a href="email-verification-2.html">Illustration</a></li>
                                                <li><a href="email-verification-3.html">Basic</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">
                                                2 Step Verification<span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="two-step-verification.html">Cover</a></li>
                                                <li><a href="two-step-verification-2.html">Illustration</a></li>
                                                <li><a href="two-step-verification-3.html">Basic</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="lock-screen.html">Lock Screen</a></li>
                                        <li><a href="error-404.html">404 Error</a></li>
                                        <li><a href="error-500.html">500 Error</a></li>
                                    </ul>
                                </div>
                                <div class="tab-pane fade" id="ui-elements">
                                    <ul>
                                        <li class="menu-title"><span>UI INTERFACE</span></li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Base UI<span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li><a href="ui-alerts.html">Alerts</a></li>
                                                <li><a href="ui-accordion.html">Accordion</a></li>
                                                <li><a href="ui-avatar.html">Avatar</a></li>
                                                <li><a href="ui-badges.html">Badges</a></li>
                                                <li><a href="ui-borders.html">Border</a></li>
                                                <li><a href="ui-buttons.html">Buttons</a></li>
                                                <li><a href="ui-buttons-group.html">Button Group</a></li>
                                                <li><a href="ui-breadcrumb.html">Breadcrumb</a></li>
                                                <li><a href="ui-cards.html">Card</a></li>
                                                <li><a href="ui-carousel.html">Carousel</a></li>
                                                <li><a href="ui-colors.html">Colors</a></li>
                                                <li><a href="ui-dropdowns.html">Dropdowns</a></li>
                                                <li><a href="ui-grid.html">Grid</a></li>
                                                <li><a href="ui-images.html">Images</a></li>
                                                <li><a href="ui-lightbox.html">Lightbox</a></li>
                                                <li><a href="ui-media.html">Media</a></li>
                                                <li><a href="ui-modals.html">Modals</a></li>
                                                <li><a href="ui-offcanvas.html">Offcanvas</a></li>
                                                <li><a href="ui-pagination.html">Pagination</a></li>
                                                <li><a href="ui-popovers.html">Popovers</a></li>
                                                <li><a href="ui-progress.html">Progress</a></li>
                                                <li><a href="ui-placeholders.html">Placeholders</a></li>
                                                <li><a href="ui-spinner.html">Spinner</a></li>
                                                <li><a href="ui-sweetalerts.html">Sweet Alerts</a></li>
                                                <li><a href="ui-nav-tabs.html">Tabs</a></li>
                                                <li><a href="ui-toasts.html">Toasts</a></li>
                                                <li><a href="ui-tooltips.html">Tooltips</a></li>
                                                <li><a href="ui-typography.html">Typography</a></li>
                                                <li><a href="ui-video.html">Video</a></li>
                                                <li><a href="ui-sortable.html">Sortable</a></li>
                                                <li><a href="ui-swiperjs.html">Swiperjs</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"> Advanced UI <span class="menu-arrow"></span> </a>
                                            <ul>
                                                <li><a href="ui-ribbon.html">Ribbon</a></li>
                                                <li><a href="ui-clipboard.html">Clipboard</a></li>
                                                <li><a href="ui-drag-drop.html">Drag & Drop</a></li>
                                                <li><a href="ui-rangeslider.html">Range Slider</a></li>
                                                <li><a href="ui-rating.html">Rating</a></li>
                                                <li><a href="ui-text-editor.html">Text Editor</a></li>
                                                <li><a href="ui-counter.html">Counter</a></li>
                                                <li><a href="ui-scrollbar.html">Scrollbar</a></li>
                                                <li><a href="ui-stickynote.html">Sticky Note</a></li>
                                                <li><a href="ui-timeline.html">Timeline</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);"> Forms <span class="menu-arrow"></span>
                                            </a>
                                            <ul>
                                                <li class="submenu submenu-two">
                                                    <a href="javascript:void(0);">Form Elements<span
                                                            class="menu-arrow inside-submenu"></span></a>
                                                    <ul>
                                                        <li><a href="form-basic-inputs.html">Basic Inputs</a></li>
                                                        <li><a href="form-checkbox-radios.html">Checkbox & Radios</a></li>
                                                        <li><a href="form-input-groups.html">Input Groups</a></li>
                                                        <li><a href="form-grid-gutters.html">Grid & Gutters</a></li>
                                                        <li><a href="form-select.html">Form Select</a></li>
                                                        <li><a href="form-mask.html">Input Masks</a></li>
                                                        <li><a href="form-fileupload.html">File Uploads</a></li>
                                                    </ul>
                                                </li>
                                                <li class="submenu submenu-two">
                                                    <a href="javascript:void(0);">Layouts<span
                                                            class="menu-arrow inside-submenu"></span></a>
                                                    <ul>
                                                        <li><a href="form-horizontal.html">Horizontal Form</a></li>
                                                        <li><a href="form-vertical.html">Vertical Form</a></li>
                                                        <li><a href="form-floating-labels.html">Floating Labels</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="form-validation.html">Form Validation</a></li>
                                                <li><a href="form-select2.html">Select2</a></li>
                                                <li><a href="form-wizard.html">Form Wizard</a></li>
                                                <li><a href="form-pickers.html">Form Picker</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Tables <span class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="tables-basic.html">Basic Tables </a></li>
                                                <li><a href="data-tables.html">Data Table </a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Charts<span class="menu-arrow"></span> </a>
                                            <ul>
                                                <li><a href="chart-apex.html">Apex Charts</a></li>
                                                <li><a href="chart-c3.html">Chart C3</a></li>
                                                <li><a href="chart-js.html">Chart Js</a></li>
                                                <li><a href="chart-morris.html">Morris Charts</a></li>
                                                <li><a href="chart-flot.html">Flot Charts</a></li>
                                                <li><a href="chart-peity.html">Peity Charts</a></li>
                                            </ul>
                                        </li>
                                        <li class="submenu">
                                            <a href="javascript:void(0);">Icons<span class="menu-arrow"></span> </a>
                                            <ul>
                                                <li><a href="icon-fontawesome.html">Fontawesome Icons</a></li>
                                                <li><a href="icon-tabler.html">Tabler Icons</a></li>
                                                <li><a href="icon-bootstrap.html">Bootstrap Icons</a></li>
                                                <li><a href="icon-remix.html">Remix Icons</a></li>
                                                <li><a href="icon-feather.html">Feather Icons</a></li>
                                                <li><a href="icon-ionic.html">Ionic Icons</a></li>
                                                <li><a href="icon-material.html">Material Icons</a></li>
                                                <li><a href="icon-pe7.html">Pe7 Icons</a></li>
                                                <li><a href="icon-simpleline.html">Simpleline Icons</a></li>
                                                <li><a href="icon-themify.html">Themify Icons</a></li>
                                                <li><a href="icon-weather.html">Weather Icons</a></li>
                                                <li><a href="icon-typicon.html">Typicon Icons</a></li>
                                                <li><a href="icon-flag.html">Flag Icons</a></li>

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
                                                    <a href="maps-vector.html">Vector</a>
                                                </li>
                                                <li>
                                                    <a href="maps-leaflet.html">Leaflet</a>
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
                                            <a href="javascript:void(0);"><span>Multi Level</span><span
                                                    class="menu-arrow"></span></a>
                                            <ul>
                                                <li><a href="javascript:void(0);">Multilevel 1</a></li>
                                                <li class="submenu submenu-two">
                                                    <a href="javascript:void(0);">Multilevel 2<span
                                                            class="menu-arrow inside-submenu"></span></a>
                                                    <ul>
                                                        <li><a href="javascript:void(0);">Multilevel 2.1</a></li>
                                                        <li class="submenu submenu-two submenu-three">
                                                            <a href="javascript:void(0);">Multilevel 2.2<span
                                                                    class="menu-arrow inside-submenu inside-submenu-two"></span></a>
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
                        <a href="index.html" class="logo-small">
                            <img src="assets/img/logo-small.svg" alt="Logo">
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
                                    <a href="calendar.html" class="btn btn-menubar">
                                        <i class="ti ti-layout-grid-remove"></i>
                                    </a>
                                </div>
                                <div class="mb-1">
                                    <a href="chat.html" class="btn btn-menubar position-relative">
                                        <i class="ti ti-brand-hipchat"></i>
                                        <span
                                                class="badge bg-info rounded-pill d-flex align-items-center justify-content-center header-badge">5</span>
                                    </a>
                                </div>
                                <div class="mb-1">
                                    <a href="email.html" class="btn btn-menubar">
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
                                    <img src="assets/img/profiles/avatar-02.jpg" alt="Img" class="img-fluid rounded-circle">
                                </div>
                                <h6 class="fs-12 fw-normal mb-1">Adrian Herman</h6>
                                <p class="fs-10">System Admin</p>
                            </div>
                            <div class="stack-menu">
                                <div class="nav flex-column align-items-center nav-pills" role="tablist"
                                     aria-orientation="vertical">
                                    <div class="row g-2">
                                        <div class="col-6">
                                            <a href="#menu-dashboard" role="tab" class="nav-link " title="Dashboard"
                                               data-bs-toggle="tab" data-bs-target="#menu-dashboard" aria-selected="true">
                                                <span><i class="ti ti-smart-home"></i></span>
                                                <p>Dashboard</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-application" role="tab" class="nav-link " title="Apps"
                                               data-bs-toggle="tab" data-bs-target="#menu-application"
                                               aria-selected="false">
                                                <span><i class="ti ti-layout-grid-add"></i></span>
                                                <p>Applications</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-superadmin" role="tab" class="nav-link " title="Apps"
                                               data-bs-toggle="tab" data-bs-target="#menu-superadmin"
                                               aria-selected="false">
                                                <span><i class="ti ti-user-star"></i></span>
                                                <p>Super Admin</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-layout" role="tab" class="nav-link " title="Layout"
                                               data-bs-toggle="tab" data-bs-target="#menu-layout" aria-selected="false">
                                                <span><i class="ti ti-layout-board-split"></i></span>
                                                <p>Layouts</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-project" role="tab" class="nav-link " title="Projects"
                                               data-bs-toggle="tab" data-bs-target="#menu-project" aria-selected="false">
                                                <span><i class="ti ti-folder"></i></span>
                                                <p>Projects</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-crm" role="tab" class="nav-link " title="CRM" data-bs-toggle="tab"
                                               data-bs-target="#menu-crm" aria-selected="false">
                                                <span><i class="ti ti-user-shield"></i></span>
                                                <p>Crm</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-hrm" role="tab" class="nav-link active" title="HRM" data-bs-toggle="tab"
                                               data-bs-target="#menu-hrm" aria-selected="false">
                                                <span><i class="ti ti-users"></i></span>
                                                <p>Hrm</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-finance" role="tab" class="nav-link" title="Finance & Accounts"
                                               data-bs-toggle="tab" data-bs-target="#menu-finance" aria-selected="false">
                                                <span><i class="ti ti-shopping-cart-dollar"></i></span>
                                                <p>Finance & Accounts</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-administration" role="tab" class="nav-link"
                                               title="Administration" data-bs-toggle="tab"
                                               data-bs-target="#menu-administration" aria-selected="false">
                                                <span><i class="ti ti-cash"></i></span>
                                                <p>Administration</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-content" role="tab" class="nav-link" title="Content"
                                               data-bs-toggle="tab" data-bs-target="#menu-content" aria-selected="false">
                                                <span><i class="ti ti-license"></i></span>
                                                <p>Contents</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-pages" role="tab" class="nav-link" title="Pages"
                                               data-bs-toggle="tab" data-bs-target="#menu-pages" aria-selected="false">
                                                <span><i class="ti ti-page-break"></i></span>
                                                <p>Pages</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-authentication" role="tab" class="nav-link"
                                               title="Authentication" data-bs-toggle="tab"
                                               data-bs-target="#menu-authentication" aria-selected="false">
                                                <span><i class="ti ti-lock-check"></i></span>
                                                <p>Authentication</p>
                                            </a>
                                        </div>
                                        <div class="col-6">
                                            <a href="#menu-ui-elements" role="tab" class="nav-link" title="UI Elements"
                                               data-bs-toggle="tab" data-bs-target="#menu-ui-elements"
                                               aria-selected="false">
                                                <span><i class="ti ti-ux-circle"></i></span>
                                                <p>Basic UI</p>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-pane fade" id="menu-dashboard">
                                        <ul class="stack-submenu">
                                            <li><a href="index.html">Admin Dashboard</a></li>
                                            <li><a href="employee-dashboard.html">Employee Dashboard</a></li>
                                            <li><a href="deals-dashboard.html">Deals Dashboard</a></li>
                                            <li><a href="leads-dashboard.html">Leads Dashboard</a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="menu-superadmin">
                                        <ul class="stack-submenu">
                                            <li><a href="dashboard.html">Dashboard</a></li>
                                            <li><a href="companies.html">Companies</a></li>
                                            <li><a href="subscription.html">Subscriptions</a></li>
                                            <li><a href="packages.html">Packages</a></li>
                                            <li><a href="domain.html">Domain</a></li>
                                            <li><a href="purchase-transaction.html">Purchase Transaction</a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="menu-application">
                                        <ul class="stack-submenu">
                                            <li><a href="chat.html">Chat</a></li>
                                            <li class="submenu submenu-two">
                                                <a href="call.html">Calls<span class="menu-arrow inside-submenu"></span></a>
                                                <ul>
                                                    <li><a href="voice-call.html">Voice Call</a></li>
                                                    <li><a href="video-call.html">Video Call</a></li>
                                                    <li><a href="outgoing-call.html">Outgoing Call</a></li>
                                                    <li><a href="incoming-call.html">Incoming Call</a></li>
                                                    <li><a href="call-history.html">Call History</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="calendar.html">Calendar</a></li>
                                            <li><a href="email.html">Email</a></li>
                                            <li><a href="todo.html">To Do</a></li>
                                            <li><a href="notes.html">Notes</a></li>
                                            <li><a href="social-feed.html">Social Feed</a></li>
                                            <li><a href="file-manager.html">File Manager</a></li>
                                            <li><a href="kanban-view.html">Kanban</a></li>
                                            <li><a href="invoices.html">Invoices</a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="menu-layout">
                                        <ul class="stack-submenu">
                                            <li><a href="layout-horizontal.html">Horizontal</a></li>
                                            <li><a href="layout-detached.html">Detached</a></li>
                                            <li><a href="layout-modern.html">Modern</a></li>
                                            <li><a href="layout-two-column.html">Two Column</a></li>
                                            <li><a href="layout-hovered.html">Hovered</a></li>
                                            <li><a href="layout-box.html">Boxed</a></li>
                                            <li><a href="layout-horizontal-single.html">Horizontal Single</a></li>
                                            <li><a href="layout-horizontal-overlay.html">Horizontal Overlay</a></li>
                                            <li><a href="layout-horizontal-box.html">Horizontal Box</a></li>
                                            <li><a href="layout-horizontal-sidemenu.html">Menu Aside</a></li>
                                            <li><a href="layout-vertical-transparent.html">Transparent</a></li>
                                            <li><a href="layout-without-header.html">Without Header</a></li>
                                            <li><a href="layout-rtl.html">RTL</a></li>
                                            <li><a href="layout-dark.html">Dark</a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="menu-project">
                                        <ul class="stack-submenu">
                                            <li><a href="clients-grid.html"><span>Clients</span></a></li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Projects</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="projects-grid.html">Projects</a></li>
                                                    <li><a href="tasks.html">Tasks</a></li>
                                                    <li><a href="task-board.html">Task Board</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="menu-crm">
                                        <ul class="stack-submenu">
                                            <li><a href="contacts-grid.html"><span>Contacts</span></a></li>
                                            <li><a href="companies-grid.html"><span>Companies</span></a></li>
                                            <li><a href="deals-grid.html"><span>Deals</span></a></li>
                                            <li><a href="leads-grid.html"><span>Leads</span></a></li>
                                            <li><a href="pipeline.html"><span>Pipeline</span></a></li>
                                            <li><a href="analytics.html"><span>Analytics</span></a></li>
                                            <li><a href="activity.html"><span>Activities</span></a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade show active" id="menu-hrm">
                                        <ul class="stack-submenu">
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Employees</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="employees.html">Employee Lists</a></li>
                                                    <li><a href="employees-grid.html">Employee Grid</a></li>
                                                    <li><a href="employee-details.html">Employee Details</a></li>
                                                    <li><a href="departments.html">Departments</a></li>
                                                    <li><a href="designations.html">Designations</a></li>
                                                    <li><a href="policy.html">Policies</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Tickets</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="tickets.html">Tickets</a></li>
                                                    <li><a href="ticket-details.html">Ticket Details</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="holidays.html"><span>Holidays</span></a></li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);" class="active"><span>Attendance</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li class="submenu submenu-two">
                                                        <a href="javascript:void(0);">Leaves<span
                                                                class="menu-arrow inside-submenu"></span></a>
                                                        <ul>
                                                            <li><a href="leaves.html">Leaves (Admin)</a></li>
                                                            <li><a href="leaves-employee.html">Leave (Employee)</a></li>
                                                            <li><a href="leave-settings.html">Leave Settings</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="attendance-admin.html">Attendance (Admin)</a></li>
                                                    <li><a href="attendance-employee.html" class="active">Attendance (Employee)</a></li>
                                                    <li><a href="timesheets.html">Timesheets</a></li>
                                                    <li><a href="schedule-timing.html">Shift & Schedule</a></li>
                                                    <li><a href="overtime.html">Overtime</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Performance</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="performance-indicator.html">Performance Indicator</a></li>
                                                    <li><a href="performance-review.html">Performance Review</a></li>
                                                    <li><a href="performance-appraisal.html">Performance Appraisal</a></li>
                                                    <li><a href="goal-tracking.html">Goal List</a></li>
                                                    <li><a href="goal-type.html">Goal Type</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Training</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="training.html">Training List</a></li>
                                                    <li><a href="trainers.html">Trainers</a></li>
                                                    <li><a href="training-type.html">Training Type</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="promotion.html"><span>Promotion</span></a></li>
                                            <li><a href="resignation.html"><span>Resignation</span></a></li>
                                            <li><a href="termination.html"><span>Termination</span></a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="menu-finance">
                                        <ul class="stack-submenu">
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Sales</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="estimates.html">Estimates</a></li>
                                                    <li><a href="invoices.html">Invoices</a></li>
                                                    <li><a href="payments.html">Payments</a></li>
                                                    <li><a href="expenses.html">Expenses</a></li>
                                                    <li><a href="provident-fund.html">Provident Fund</a></li>
                                                    <li><a href="taxes.html">Taxes</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Accounting</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="categories.html">Categories</a></li>
                                                    <li><a href="budgets.html">Budgets</a></li>
                                                    <li><a href="budget-expenses.html">Budget Expenses</a></li>
                                                    <li><a href="budget-revenues.html">Budget Revenues</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Payroll</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="employee-salary.html">Employee Salary</a></li>
                                                    <li><a href="payslip.html">Payslip</a></li>
                                                    <li><a href="payroll.html">Payroll Items</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="menu-administration">
                                        <ul class="stack-submenu">
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Assets</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="assets.html">Assets</a></li>
                                                    <li><a href="asset-categories.html">Asset Categories</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Help & Supports</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="knowledgebase.html">Knowledge Base</a></li>
                                                    <li><a href="activity.html">Activities</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>User Management</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="users.html">Users</a></li>
                                                    <li><a href="roles-permissions.html">Roles & Permissions</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Reports</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="expenses-report.html">Expense Report</a></li>
                                                    <li><a href="invoice-report.html">Invoice Report</a></li>
                                                    <li><a href="payment-report.html">Payment Report</a></li>
                                                    <li><a href="project-report.html">Project Report</a></li>
                                                    <li><a href="task-report.html">Task Report</a></li>
                                                    <li><a href="user-report.html">User Report</a></li>
                                                    <li><a href="employee-report.html">Employee Report</a></li>
                                                    <li><a href="payslip-report.html">Payslip Report</a></li>
                                                    <li><a href="attendance-report.html">Attendance Report</a></li>
                                                    <li><a href="leave-report.html">Leave Report</a></li>
                                                    <li><a href="daily-report.html">Daily Report</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">
                                                    General Settings
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="profile-settings.html">Profile</a></li>
                                                    <li><a href="security-settings.html">Security</a></li>
                                                    <li><a href="notification-settings.html">Notifications</a></li>
                                                    <li><a href="connected-apps.html">Connected Apps</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">
                                                    Website Settings
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="bussiness-settings.html">Business Settings</a></li>
                                                    <li><a href="seo-settings.html">SEO Settings</a></li>
                                                    <li><a href="localization-settings.html">Localization</a></li>
                                                    <li><a href="prefixes.html">Prefixes</a></li>
                                                    <li><a href="preferences.html">Preferences</a></li>
                                                    <li><a href="performance-appraisal.html">Appearance</a></li>
                                                    <li><a href="language.html">Language</a></li>
                                                    <li><a href="authentication-settings.html">Authentication</a></li>
                                                    <li><a href="ai-settings.html">AI Settings</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">App Settings<span
                                                        class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="salary-settings.html">Salary Settings</a></li>
                                                    <li><a href="approval-settings.html">Approval Settings</a></li>
                                                    <li><a href="invoice-settings.html">Invoice Settings</a></li>
                                                    <li><a href="leave-type.html">Leave Type</a></li>
                                                    <li><a href="custom-fields.html">Custom Fields</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">
                                                    System Settings
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="email-settings.html">Email Settings</a></li>
                                                    <li><a href="email-template.html">Email Templates</a></li>
                                                    <li><a href="sms-settings.html">SMS Settings</a></li>
                                                    <li><a href="sms-template.html">SMS Templates</a></li>
                                                    <li><a href="otp-settings.html">OTP</a></li>
                                                    <li><a href="gdpr.html">GDPR Cookies</a></li>
                                                    <li><a href="maintenance-mode.html">Maintenance Mode</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">
                                                    Financial Settings
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li><a href="payment-gateways.html">Payment Gateways</a></li>
                                                    <li><a href="tax-rates.html">Tax Rate</a></li>
                                                    <li><a href="currencies.html">Currencies</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">Other Settings<span
                                                        class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="custom-css.html">Custom CSS</a></li>
                                                    <li><a href="custom-js.html">Custom JS</a></li>
                                                    <li><a href="cronjob.html">Cronjob</a></li>
                                                    <li><a href="storage-settings.html">Storage</a></li>
                                                    <li><a href="ban-ip-address.html">Ban IP Address</a></li>
                                                    <li><a href="backup.html">Backup</a></li>
                                                    <li><a href="clear-cache.html">Clear Cache</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="menu-content">
                                        <ul class="stack-submenu">
                                            <li class="submenu">
                                                <a href="javascript:void(0);">Blogs<span class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="blogs.html">All Blogs</a></li>
                                                    <li><a href="blog-categories.html">Categories</a></li>
                                                    <li><a href="blog-comments.html">Comments</a></li>
                                                    <li><a href="blog-tags.html">Tags</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">Locations<span class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="countries.html">Countries</a></li>
                                                    <li><a href="states.html">States</a></li>
                                                    <li><a href="cities.html">Cities</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="testimonials.html">Testimonials</a></li>
                                            <li><a href="faq.html">FAQ’S</a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="menu-pages">
                                        <ul class="stack-submenu">
                                            <li><a href="starter.html">Starter</a></li>
                                            <li><a href="profile.html">Profile</a></li>
                                            <li><a href="profile-settings.html">Profile Settings</a></li>
                                            <li><a href="gallery.html">Gallery</a></li>
                                            <li><a href="search-result.html">Search Results</a></li>
                                            <li><a href="timeline.html">Timeline</a></li>
                                            <li><a href="pricing.html">Pricing</a></li>
                                            <li><a href="coming-soon.html">Coming Soon</a></li>
                                            <li><a href="under-maintenance.html">Under Maintenance</a></li>
                                            <li><a href="under-construction.html">Under Construction</a></li>
                                            <li><a href="api-keys.html">API Keys</a></li>
                                            <li><a href="privacy-policy.html">Privacy Policy</a></li>
                                            <li><a href="terms-condition.html">Terms & Conditions</a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="menu-authentication">
                                        <ul class="stack-submenu">
                                            <li class="submenu">
                                                <a href="javascript:void(0);" class="">Login<span
                                                        class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="login.html">Cover</a></li>
                                                    <li><a href="login-2.html">Illustration</a></li>
                                                    <li><a href="login-3.html">Basic</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);" class="">Register<span
                                                        class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="register.html">Cover</a></li>
                                                    <li><a href="register-2.html">Illustration</a></li>
                                                    <li><a href="register-3.html">Basic</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">Reset Password<span
                                                        class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="reset-password.html">Cover</a></li>
                                                    <li><a href="reset-password-2.html">Illustration</a></li>
                                                    <li><a href="reset-password-3.html">Basic</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">Email Verification<span
                                                        class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="email-verification.html">Cover</a></li>
                                                    <li><a href="email-verification-2.html">Illustration</a></li>
                                                    <li><a href="email-verification-3.html">Basic</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">2 Step Verification<span
                                                        class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="two-step-verification.html">Cover</a></li>
                                                    <li><a href="two-step-verification-2.html">Illustration</a></li>
                                                    <li><a href="two-step-verification-3.html">Basic</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="lock-screen.html">Lock Screen</a></li>
                                            <li><a href="error-404.html">404 Error</a></li>
                                            <li><a href="error-500.html">500 Error</a></li>
                                        </ul>
                                    </div>
                                    <div class="tab-pane fade" id="menu-ui-elements">
                                        <ul class="stack-submenu">
                                            <li class="submenu">
                                                <a href="javascript:void(0);">Base UI<span class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="ui-alerts.html">Alerts</a></li>
                                                    <li><a href="ui-accordion.html">Accordion</a></li>
                                                    <li><a href="ui-avatar.html">Avatar</a></li>
                                                    <li><a href="ui-badges.html">Badges</a></li>
                                                    <li><a href="ui-borders.html">Border</a></li>
                                                    <li><a href="ui-buttons.html">Buttons</a></li>
                                                    <li><a href="ui-buttons-group.html">Button Group</a></li>
                                                    <li><a href="ui-breadcrumb.html">Breadcrumb</a></li>
                                                    <li><a href="ui-cards.html">Card</a></li>
                                                    <li><a href="ui-carousel.html">Carousel</a></li>
                                                    <li><a href="ui-colors.html">Colors</a></li>
                                                    <li><a href="ui-dropdowns.html">Dropdowns</a></li>
                                                    <li><a href="ui-grid.html">Grid</a></li>
                                                    <li><a href="ui-images.html">Images</a></li>
                                                    <li><a href="ui-lightbox.html">Lightbox</a></li>
                                                    <li><a href="ui-media.html">Media</a></li>
                                                    <li><a href="ui-modals.html">Modals</a></li>
                                                    <li><a href="ui-offcanvas.html">Offcanvas</a></li>
                                                    <li><a href="ui-pagination.html">Pagination</a></li>
                                                    <li><a href="ui-popovers.html">Popovers</a></li>
                                                    <li><a href="ui-progress.html">Progress</a></li>
                                                    <li><a href="ui-placeholders.html">Placeholders</a></li>
                                                    <li><a href="ui-spinner.html">Spinner</a></li>
                                                    <li><a href="ui-sweetalerts.html">Sweet Alerts</a></li>
                                                    <li><a href="ui-nav-tabs.html">Tabs</a></li>
                                                    <li><a href="ui-toasts.html">Toasts</a></li>
                                                    <li><a href="ui-tooltips.html">Tooltips</a></li>
                                                    <li><a href="ui-typography.html">Typography</a></li>
                                                    <li><a href="ui-video.html">Video</a></li>
                                                    <li><a href="ui-sortable.html">Sortable</a></li>
                                                    <li><a href="ui-swiperjs.html">Swiperjs</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);"> Advanced UI<span
                                                        class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="ui-ribbon.html">Ribbon</a></li>
                                                    <li><a href="ui-clipboard.html">Clipboard</a></li>
                                                    <li><a href="ui-drag-drop.html">Drag & Drop</a></li>
                                                    <li><a href="ui-rangeslider.html">Range Slider</a></li>
                                                    <li><a href="ui-rating.html">Rating</a></li>
                                                    <li><a href="ui-text-editor.html">Text Editor</a></li>
                                                    <li><a href="ui-counter.html">Counter</a></li>
                                                    <li><a href="ui-scrollbar.html">Scrollbar</a></li>
                                                    <li><a href="ui-stickynote.html">Sticky Note</a></li>
                                                    <li><a href="ui-timeline.html">Timeline</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">Forms<span class="menu-arrow"></span> </a>
                                                <ul>
                                                    <li class="submenu submenu-two">
                                                        <a href="javascript:void(0);">Form Elements<span
                                                                class="menu-arrow inside-submenu"></span></a>
                                                        <ul>
                                                            <li><a href="form-basic-inputs.html">Basic Inputs</a></li>
                                                            <li><a href="form-checkbox-radios.html">Checkbox & Radios</a>
                                                            </li>
                                                            <li><a href="form-input-groups.html">Input Groups</a></li>
                                                            <li><a href="form-grid-gutters.html">Grid & Gutters</a></li>
                                                            <li><a href="form-select.html">Form Select</a></li>
                                                            <li><a href="form-mask.html">Input Masks</a></li>
                                                            <li><a href="form-fileupload.html">File Uploads</a></li>

                                                        </ul>
                                                    </li>
                                                    <li class="submenu submenu-two">
                                                        <a href="javascript:void(0);">Layouts<span
                                                                class="menu-arrow inside-submenu"></span></a>
                                                        <ul>
                                                            <li><a href="form-horizontal.html">Horizontal Form</a></li>
                                                            <li><a href="form-vertical.html">Vertical Form</a></li>
                                                            <li><a href="form-floating-labels.html">Floating Labels</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="form-validation.html">Form Validation</a></li>
                                                    <li><a href="form-select2.html">Select2</a></li>
                                                    <li><a href="form-wizard.html">Form Wizard</a></li>
                                                    <li><a href="form-pickers.html">Form Picker</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">Tables<span class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="tables-basic.html">Basic Tables </a></li>
                                                    <li><a href="data-tables.html">Data Table </a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">Charts<span class="menu-arrow"></span> </a>
                                                <ul>
                                                    <li><a href="chart-apex.html">Apex Charts</a></li>
                                                    <li><a href="chart-c3.html">Chart C3</a></li>
                                                    <li><a href="chart-js.html">Chart Js</a></li>
                                                    <li><a href="chart-morris.html">Morris Charts</a></li>
                                                    <li><a href="chart-flot.html">Flot Charts</a></li>
                                                    <li><a href="chart-peity.html">Peity Charts</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);">Icons<span class="menu-arrow"></span> </a>
                                                <ul>
                                                    <li><a href="icon-fontawesome.html">Fontawesome Icons</a></li>
                                                    <li><a href="icon-tabler.html">Tabler Icons</a></li>
                                                    <li><a href="icon-bootstrap.html">Bootstrap Icons</a></li>
                                                    <li><a href="icon-remix.html">Remix Icons</a></li>
                                                    <li><a href="icon-feather.html">Feather Icons</a></li>
                                                    <li><a href="icon-ionic.html">Ionic Icons</a></li>
                                                    <li><a href="icon-material.html">Material Icons</a></li>
                                                    <li><a href="icon-pe7.html">Pe7 Icons</a></li>
                                                    <li><a href="icon-simpleline.html">Simpleline Icons</a></li>
                                                    <li><a href="icon-themify.html">Themify Icons</a></li>
                                                    <li><a href="icon-weather.html">Weather Icons</a></li>
                                                    <li><a href="icon-typicon.html">Typicon Icons</a></li>
                                                    <li><a href="icon-flag.html">Flag Icons</a></li>
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
                                                        <a href="maps-vector.html">Vector</a>
                                                    </li>
                                                    <li>
                                                        <a href="maps-leaflet.html">Leaflet</a>
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
                            <a href="javascript:void(0);" class="d-flex align-items-center fs-12">Change Log<span
                                    class="badge bg-pink badge-xs text-white fs-10 ms-2">v4.0.2</span></a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /Stacked Sidebar -->

            <!-- Page Wrapper -->
            <!-- Page Wrapper -->
            <div class="page-wrapper">
                <div class="content">

                    <!-- Breadcrumb -->
                    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                        <div class="my-auto mb-2">
                            <h2 class="mb-1">Timesheets</h2>
                            <nav>
                                <ol class="breadcrumb mb-0">
                                    <li class="breadcrumb-item">
                                        <a href="index.html"><i class="ti ti-smart-home"></i></a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        Employee
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Timesheets</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
                            <div class="me-2 mb-2">
                                <div class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                        <i class="ti ti-file-export me-1"></i>Export
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="mb-2">
                                <a href="#" data-bs-toggle="modal" data-bs-target="#add_timesheet" class="btn btn-primary d-flex align-items-center"><i class="ti ti-circle-plus me-2"></i>Add Today’s Work</a>
                            </div>
                            <div class="head-icons ms-2">
                                <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                                    <i class="ti ti-chevrons-up"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /Breadcrumb -->

                    <!-- Performance Indicator list -->
                    <div class="card">
                        <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                            <h5>Timesheet</h5>
                            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                                <div class="dropdown me-3">
                                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                        Select Project
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Office Management</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Project Management</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Hospital Administration</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                        Sort By : Last 7 Days
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Recently Added</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Ascending</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Desending</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Last Month</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Last 7 Days</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="custom-datatable-filter table-responsive">
                                <table class="table datatable">
                                    <thead class="thead-light">
                                    <tr>
                                        <th>Employee</th>
                                        <th>Date </th>
                                        <th>Project</th>

                                        <th>Worked Hours</th>
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center file-name-icon">
                                                <a href="#" class="avatar avatar-md border avatar-rounded">
                                                    <img src="assets/img/users/user-32.jpg" class="img-fluid" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="#">Anthony Lewis</a></h6>
                                                    <span class="fs-12 fw-normal ">UI/UX Team</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            14 Jan 2024
                                        </td>
                                        <td>
                                            <p class="fs-14 fw-medium text-gray-9 d-flex align-items-center">Office Management <a href="#" class="ms-1" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="Worked on the Management
												design & Development"><i class="ti ti-info-circle text-info"></i></a></p>
                                        </td>
                                        <td>32</td>
                                        <td>
                                            13
                                        </td>

                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- /Performance Indicator list -->

                </div>

                <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
                    <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
                    <p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
                </div>

            </div>
            <!-- /Page Wrapper -->

            <!-- Add Timesheet -->
            <!-- Dynamic Add Timesheet Modal Window Component -->
            <div class="modal fade" id="add_timesheet" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">TimeSheet</h4>
                            <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                                <i class="ti ti-x"></i>
                            </button>
                        </div>

                        <!-- Route form safely straight to your dynamic Timesheet Java Servlet Controller -->
                        <form action="${pageContext.request.contextPath}/AddTimesheet" method="POST">
                            <div class="modal-body pb-0">
                                <div class="row">

                                    <!-- 1. Project Reference Picker List Selection -->
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Project <span class="text-danger"> *</span></label>
                                            <select class="form-select select" name="projectId" required>
                                                <option value="">Select Project</option>
                                                <!-- Value mapped to target integer reference keys matching ProjectId criteria -->
                                                <option value="1">Office Management</option>
                                                <option value="2">Project Management</option>
                                                <option value="3">Hospital Administration</option>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- 2. Date Metric Picker Configuration (Updated from Deadline parameter) -->
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Date <span class="text-danger"> *</span></label>
                                            <div class="input-icon-end position-relative">
                                                <!-- Swapped to robust HTML5 native date picker framework mapping to your LocalDateTime parser -->
                                                <input type="date" class="form-control" name="workDate" required max="2026-09-16">
                                            </div>
                                        </div>
                                    </div>

                                    <!-- 3. Work Hours Input Component Block -->
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Hours<span class="text-danger"> *</span></label>
                                            <!-- Configured step tracking variables constraining bounds to clean logical daily parameters -->
                                            <input type="number" min="1" max="24" class="form-control" name="hoursWorked" placeholder="Enter hours (1 - 24)" required>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <!-- Action Controls Footer Container Bar -->
                            <div class="modal-footer border-0 pt-0">
                                <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary" style="background-color: #ff5b22; border-color: #ff5b22; color: #fff;">Add</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            <!-- /Add Timesheet -->



        </div>
    </div>
</div>


<!-- Scripts -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/live-clock.js"></script>





<script>
    const checkInTime = "${not empty attendance.checkIn ? attendance.checkIn : ''}";
    const lunchInTime = "${not empty attendance.lunchIn ? attendance.lunchIn : ''}";
    const lunchOutTime = "${not empty attendance.lunchOut ? attendance.lunchOut : ''}";
    const checkOutTime = "${not empty attendance.checkOut ? attendance.checkOut : ''}";

    function updateDashboardMetrics() {
        // Current System Time
        const now = new Date();

        // Render the Live Ticking Clock (dd-MM-yyyy HH:mm:ss)
        const day = String(now.getDate()).padStart(2, '0');
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const year = now.getFullYear();
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const seconds = String(now.getSeconds()).padStart(2, '0');

        const clockElement = document.getElementById('live-clock');
        if (clockElement) {
            clockElement.textContent = `${day}-${month}-${year} ${hours}:${minutes}:${seconds}`;
        }

        // Calculate Dynamic Production Time
        if (!checkInTime) {
            document.getElementById('live-production').textContent = "0.00";
            return;
        }

        const checkInDate = new Date(checkInTime);
        let totalProductionMs = 0;

        // --- SEGMENT 1: Check In until either Lunch In, Check Out, or Now ---
        let segment1End;
        if (lunchInTime) {
            segment1End = new Date(lunchInTime);
        } else if (checkOutTime) {
            segment1End = new Date(checkOutTime);
        } else {
            segment1End = now;
        }

        if (segment1End > checkInDate) {
            totalProductionMs += (segment1End - checkInDate);
        }

        // --- SEGMENT 2: Lunch Out until either Check Out or Now ---
        if (lunchOutTime) {
            const lunchOutDate = new Date(lunchOutTime);
            let segment2End = checkOutTime ? new Date(checkOutTime) : now;

            if (segment2End > lunchOutDate) {
                totalProductionMs += (segment2End - lunchOutDate);
            }
        }

        // Convert milliseconds to hours formatted to 2 decimal places
        const totalHours = totalProductionMs / (1000 * 60 * 60);
        const prodElement = document.getElementById('live-production');
        if (prodElement) {
            prodElement.textContent = totalHours.toFixed(2);
        }
    }

    // Initialize instantly and run every 1 second
    document.addEventListener('DOMContentLoaded', () => {
        updateDashboardMetrics();
        setInterval(updateDashboardMetrics, 1000);
    });
</script>

</body>
</html>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List,java.util.Set,java.util.TreeSet,java.util.Collections,java.util.LinkedHashSet,java.text.DecimalFormat,org.example.model.PayslipReport" %>
<%
    List<PayslipReport> payslipList = (List<PayslipReport>) request.getAttribute("payslipList");
    if (payslipList == null) {
        payslipList = Collections.emptyList();
    }

    double totalPayroll = request.getAttribute("totalPayroll") != null
            ? ((Number) request.getAttribute("totalPayroll")).doubleValue() : 0;
    double totalEarnings = request.getAttribute("totalEarnings") != null
            ? ((Number) request.getAttribute("totalEarnings")).doubleValue() : 0;
    double totalDeductions = request.getAttribute("totalDeductions") != null
            ? ((Number) request.getAttribute("totalDeductions")).doubleValue() : 0;
    double totalNetPay = request.getAttribute("totalNetPay") != null
            ? ((Number) request.getAttribute("totalNetPay")).doubleValue() : 0;

    DecimalFormat money = new DecimalFormat("#,##0.00");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr - Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
    <meta name="author" content="Dreams technologies - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>Smarthr Admin Template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png">

    <!-- Theme Script js -->
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <!-- Feather CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <!-- Tabler Icon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <!-- Color Picker Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/themes/nano.min.css">

    <!-- Daterangepikcer CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">


    <style>
        .sidebar {
            height: 100vh !important;
            overflow-y: auto !important;
            overflow-x: hidden !important;
        }

        .sidebar-menu {
            height: auto !important;
            overflow: visible !important;
        }

        .sidebar::-webkit-scrollbar {
            width: 5px;
        }

        .sidebar::-webkit-scrollbar-thumb {
            background: #ccc;
            border-radius: 10px;
        }

        .sidebar-menu li.submenu > ul {
            display: none;
        }

        .sidebar-menu li.submenu.active > ul,
        .sidebar-menu li.submenu > a.subdrop + ul {
            display: block;
        }

        .sidebar-menu li.submenu > a .menu-arrow {
            transition: transform 0.2s ease;
        }

        .sidebar-menu li.submenu.active > a .menu-arrow,
        .sidebar-menu li.submenu > a.subdrop .menu-arrow {
            transform: rotate(90deg);
        }

        @media print {
            .sidebar,
            .header,
            .page-breadcrumb,
            .head-icons,
            .dropdown,
            #payslipSearch,
            #payslipDateRange,
            .card-header .right-content,
            .dataTables_length,
            .dataTables_filter,
            .dataTables_paginate,
            .dataTables_info,
            .dataTables_wrapper > .row:first-child,
            .dataTables_wrapper > .row:last-child {
                display: none !important;
            }

            .main-wrapper,
            .page-wrapper,
            .content {
                margin: 0 !important;
                padding: 0 !important;
                width: 100% !important;
            }

            .card {
                box-shadow: none !important;
                border: 1px solid #ddd !important;
            }

            table {
                width: 100% !important;
            }
        }
    </style>

    <style>
        /* Payslip report: keep the same working Admin sidebar behavior as Dashboard */
        .sidebar {
            height: 100vh !important;
            overflow-y: auto !important;
            overflow-x: hidden !important;
        }
        .sidebar-menu {
            height: auto !important;
            overflow: visible !important;
        }
        .sidebar::-webkit-scrollbar { width: 5px; }
        .sidebar::-webkit-scrollbar-thumb { background: #ccc; border-radius: 10px; }
        .sidebar-menu li.submenu > ul { display: none !important; }
        .sidebar-menu li.submenu.active > ul { display: block !important; }
        .sidebar-menu li.submenu > a .menu-arrow { transition: transform 0.2s ease; }
        .sidebar-menu li.submenu.active > a .menu-arrow { transform: rotate(90deg); }
        .sidebar-menu li.submenu > ul > li > a { display: flex; align-items: center; }
    </style>
</head>

<body>

<div id="global-loader" style="display: none;">
    <div class="page-loader"></div>
</div>

<!-- Main Wrapper -->
<div class="main-wrapper">

    <!-- Header -->
    <div class="header">
        <div class="main-header">

            <div class="header-left">
                <a href="index.html" class="logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="Logo">
                </a>
                <a href="index.html" class="dark-logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="Logo">
                </a>
            </div>

            <a id="mobile_btn" class="mobile_btn" href="#sidebar">
                <span class="bar-icon">
                   <span></span>
                   <span></span>
                   <span></span>
                </span>
            </a>

            <div class="header-user">
                <div class="nav user-menu nav-list">

                    <div class="me-auto d-flex align-items-center" id="header-search">
                        <a id="toggle_btn" href="javascript:void(0);" class="btn btn-menubar me-1">
                            <i class="ti ti-arrow-bar-to-left"></i>
                        </a>
                        <!-- Search -->
                        <div class="input-group input-group-flat d-inline-flex me-1">
                         <span class="input-icon-addon">
                            <i class="ti ti-search"></i>
                         </span>
                            <input type="text" class="form-control" placeholder="Search in HRMS">
                            <span class="input-group-text">
                            <kbd>CTRL + / </kbd>
                         </span>
                        </div>
                        <!-- /Search -->
                        <div class="dropdown crm-dropdown">
                            <a href="#" class="btn btn-menubar me-1" data-bs-toggle="dropdown">
                                <i class="ti ti-layout-grid"></i>
                            </a>
                            <div class="dropdown-menu dropdown-lg dropdown-menu-start">
                                <div class="card mb-0 border-0 shadow-none">
                                    <div class="card-header">
                                        <h4>CRM</h4>
                                    </div>
                                    <div class="card-body pb-1">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <a href="contacts.html"
                                                   class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i class="ti ti-user-shield text-default me-2"></i>Contacts
                                           </span>
                                                    <i class="ti ti-arrow-right"></i>
                                                </a>
                                                <a href="deals-grid.html"
                                                   class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i class="ti ti-heart-handshake text-default me-2"></i>Deals
                                           </span>
                                                    <i class="ti ti-arrow-right"></i>
                                                </a>
                                                <a href="pipeline.html"
                                                   class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i
                                                      class="ti ti-timeline-event-text text-default me-2"></i>Pipeline
                                           </span>
                                                    <i class="ti ti-arrow-right"></i>
                                                </a>
                                            </div>
                                            <div class="col-sm-6">
                                                <a href="companies-grid.html"
                                                   class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i class="ti ti-building text-default me-2"></i>Companies
                                           </span>
                                                    <i class="ti ti-arrow-right"></i>
                                                </a>
                                                <a href="leads-grid.html"
                                                   class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i class="ti ti-user-check text-default me-2"></i>Leads
                                           </span>
                                                    <i class="ti ti-arrow-right"></i>
                                                </a>
                                                <a href="activity.html"
                                                   class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i class="ti ti-activity text-default me-2"></i>Activities
                                           </span>
                                                    <i class="ti ti-arrow-right"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a href="profile-settings.html" class="btn btn-menubar">
                            <i class="ti ti-settings-cog"></i>
                        </a>
                    </div>

                    <!-- Horizontal Single -->
                    <div class="sidebar sidebar-horizontal" id="horizontal-single">
                        <div class="sidebar-menu">
                            <div class="main-menu">
                                <ul class="nav-menu">
                                    <li class="menu-title">
                                        <span>Main</span>
                                    </li>
                                    <li class="submenu">
                                        <a href="#">
                                            <i class="ti ti-smart-home"></i><span>Dashboard</span>
                                            <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                            <li><a href="index.html">Admin Dashboard</a></li>
                                            <li><a href="employee-dashboard.html">Employee Dashboard</a></li>
                                            <li><a href="deals-dashboard.html">Deals Dashboard</a></li>
                                            <li><a href="leads-dashboard.html">Leads Dashboard</a></li>
                                        </ul>
                                    </li>
                                    <li class="submenu">
                                        <a href="#">
                                            <i class="ti ti-user-star"></i><span>Super Admin</span>
                                            <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                            <li><a href="dashboard.html">Dashboard</a></li>
                                            <li><a href="companies.html">Companies</a></li>
                                            <li><a href="subscription.html">Subscriptions</a></li>
                                            <li><a href="packages.html">Packages</a></li>
                                            <li><a href="domain.html">Domain</a></li>
                                            <li><a href="purchase-transaction.html">Purchase Transaction</a></li>
                                        </ul>
                                    </li>
                                    <li class="submenu">
                                        <a href="#">
                                            <i class="ti ti-layout-grid-add"></i><span>Applications</span>
                                            <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                            <li><a href="chat.html">Chat</a></li>
                                            <li class="submenu submenu-two">
                                                <a href="call.html">Calls<span
                                                        class="menu-arrow inside-submenu"></span></a>
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
                                    </li>
                                    <li class="submenu">
                                        <a href="#">
                                            <i class="ti ti-layout-board-split"></i><span>Layouts</span>
                                            <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="layout-horizontal.html">
                                                    <span>Horizontal</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-detached.html">
                                                    <span>Detached</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-modern.html">
                                                    <span>Modern</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-two-column.html">
                                                    <span>Two Column </span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-hovered.html">
                                                    <span>Hovered</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-box.html">
                                                    <span>Boxed</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-horizontal-single.html">
                                                    <span>Horizontal Single</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-horizontal-overlay.html">
                                                    <span>Horizontal Overlay</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-horizontal-box.html">
                                                    <span>Horizontal Box</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-horizontal-sidemenu.html">
                                                    <span>Menu Aside</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-vertical-transparent.html">
                                                    <span>Transparent</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-without-header.html">
                                                    <span>Without Header</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-rtl.html">
                                                    <span>RTL</span>
                                                </a>
                                            </li>
                                            <li>
                                                <a href="layout-dark.html">
                                                    <span>Dark</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="submenu">
                                        <a href="#" >
                                            <i class="ti ti-user-star"></i><span>Projects</span>
                                            <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                            <li>
                                                <a href="clients-grid.html"><span>Clients</span>
                                                </a>
                                            </li>
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
                                            <li class="submenu">
                                                <a href="call.html">Crm<span class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="contacts-grid.html" ><span>Contacts</span></a></li>
                                                    <li><a href="companies-grid.html"><span>Companies</span></a>
                                                    </li>
                                                    <li><a href="deals-grid.html"><span>Deals</span></a></li>
                                                    <li><a href="leads-grid.html"><span>Leads</span></a></li>
                                                    <li><a href="pipeline.html"><span>Pipeline</span></a></li>
                                                    <li><a href="analytics.html"><span>Analytics</span></a></li>
                                                    <li><a href="activity.html"><span>Activities</span></a></li>
                                                </ul>
                                            </li>
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
                                                <a href="javascript:void(0);"><span>Attendance</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">Leaves<span
                                                                class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="leaves.html">Leaves (Admin)</a></li>
                                                            <li><a href="leaves-employee.html">Leave (Employee)</a>
                                                            </li>
                                                            <li><a href="leave-settings.html">Leave Settings</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="attendance-admin.html">Attendance (Admin)</a></li>
                                                    <li><a href="attendance-employee.html">Attendance (Employee)</a>
                                                    </li>
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
                                                    <li><a href="performance-indicator.html">Performance
                                                        Indicator</a></li>
                                                    <li><a href="performance-review.html">Performance Review</a>
                                                    </li>
                                                    <li><a href="performance-appraisal.html">Performance
                                                        Appraisal</a></li>
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
                                    </li>
                                    <li class="submenu">
                                        <a href="#" class="active subdrop">
                                            <i class="ti ti-user-star"></i><span>Administration</span>
                                            <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
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
                                                <a href="javascript:void(0);" ><span>Accounting</span>
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
                                                    <li><a href="roles-permissions.html">Roles & Permissions</a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);" class="active subdrop"><span>Reports</span>
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
                                                    <li><a href="payslip-report.html" class="active">Payslip Report</a></li>
                                                    <li><a href="attendance-report.html">Attendance Report</a></li>
                                                    <li><a href="leave-report.html">Leave Report</a></li>
                                                    <li><a href="daily-report.html">Daily Report</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="javascript:void(0);"><span>Settings</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">General Settings<span
                                                                class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="profile-settings.html">Profile</a></li>
                                                            <li><a href="security-settings.html">Security</a></li>
                                                            <li><a
                                                                    href="notification-settings.html">Notifications</a>
                                                            </li>
                                                            <li><a href="connected-apps.html">Connected Apps</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">Website Settings<span
                                                                class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="bussiness-settings.html">Business
                                                                Settings</a></li>
                                                            <li><a href="seo-settings.html">SEO Settings</a></li>
                                                            <li><a
                                                                    href="localization-settings.html">Localization</a>
                                                            </li>
                                                            <li><a href="prefixes.html">Prefixes</a></li>
                                                            <li><a href="preferences.html">Preferences</a></li>
                                                            <li><a href="performance-appraisal.html">Appearance</a>
                                                            </li>
                                                            <li><a href="language.html">Language</a></li>
                                                            <li><a
                                                                    href="authentication-settings.html">Authentication</a>
                                                            </li>
                                                            <li><a href="ai-settings.html">AI Settings</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">App Settings<span
                                                                class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="salary-settings.html">Salary Settings</a>
                                                            </li>
                                                            <li><a href="approval-settings.html">Approval
                                                                Settings</a></li>
                                                            <li><a href="invoice-settings.html">Invoice Settings</a>
                                                            </li>
                                                            <li><a href="leave-type.html">Leave Type</a></li>
                                                            <li><a href="custom-fields.html">Custom Fields</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">System Settings<span
                                                                class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="email-settings.html">Email Settings</a>
                                                            </li>
                                                            <li><a href="email-template.html">Email Templates</a>
                                                            </li>
                                                            <li><a href="sms-settings.html">SMS Settings</a></li>
                                                            <li><a href="sms-template.html">SMS Templates</a></li>
                                                            <li><a href="otp-settings.html">OTP</a></li>
                                                            <li><a href="gdpr.html">GDPR Cookies</a></li>
                                                            <li><a href="maintenance-mode.html">Maintenance Mode</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">Financial Settings<span
                                                                class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="payment-gateways.html">Payment Gateways</a>
                                                            </li>
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
                                                            <li><a href="ban-ip-address.html">Ban IP Address</a>
                                                            </li>
                                                            <li><a href="backup.html">Backup</a></li>
                                                            <li><a href="clear-cache.html">Clear Cache</a></li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    <li class="submenu">
                                        <a href="#">
                                            <i class="ti ti-page-break"></i><span>Pages</span>
                                            <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                            <li><a href="starter.html"><span>Starter</span></a></li>
                                            <li><a href="profile.html"><span>Profile</span></a></li>
                                            <li><a href="gallery.html"><span>Gallery</span></a></li>
                                            <li><a href="search-result.html"><span>Search Results</span></a></li>
                                            <li><a href="timeline.html"><span>Timeline</span></a></li>
                                            <li><a href="pricing.html"><span>Pricing</span></a></li>
                                            <li><a href="coming-soon.html"><span>Coming Soon</span></a></li>
                                            <li><a href="under-maintenance.html"><span>Under Maintenance</span></a>
                                            </li>
                                            <li><a href="under-construction.html"><span>Under
                                              Construction</span></a></li>
                                            <li><a href="api-keys.html"><span>API Keys</span></a></li>
                                            <li><a href="privacy-policy.html"><span>Privacy Policy</span></a></li>
                                            <li><a href="terms-condition.html"><span>Terms & Conditions</span></a>
                                            </li>
                                            <li class="submenu">
                                                <a href="#"><span>Content</span> <span
                                                        class="menu-arrow"></span></a>
                                                <ul>
                                                    <li><a href="pages.html">Pages</a></li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">Blogs<span
                                                                class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="blogs.html">All Blogs</a></li>
                                                            <li><a href="blog-categories.html">Categories</a></li>
                                                            <li><a href="blog-comments.html">Comments</a></li>
                                                            <li><a href="blog-tags.html">Tags</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">Locations<span
                                                                class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="countries.html">Countries</a></li>
                                                            <li><a href="states.html">States</a></li>
                                                            <li><a href="cities.html">Cities</a></li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="testimonials.html">Testimonials</a></li>
                                                    <li><a href="faq.html">FAQ’S</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="#">
                                                    <span>Authentication</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
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
                                                    <li class="submenu"><a href="javascript:void(0);">Forgot
                                                        Password<span class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="forgot-password.html">Cover</a></li>
                                                            <li><a href="forgot-password-2.html">Illustration</a>
                                                            </li>
                                                            <li><a href="forgot-password-3.html">Basic</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">Reset Password<span
                                                                class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="reset-password.html">Cover</a></li>
                                                            <li><a href="reset-password-2.html">Illustration</a>
                                                            </li>
                                                            <li><a href="reset-password-3.html">Basic</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">Email Verification<span
                                                                class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="email-verification.html">Cover</a></li>
                                                            <li><a href="email-verification-2.html">Illustration</a>
                                                            </li>
                                                            <li><a href="email-verification-3.html">Basic</a></li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">2 Step Verification<span
                                                                class="menu-arrow"></span></a>
                                                        <ul>
                                                            <li><a href="two-step-verification.html">Cover</a></li>
                                                            <li><a
                                                                    href="two-step-verification-2.html">Illustration</a>
                                                            </li>
                                                            <li><a href="two-step-verification-3.html">Basic</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li><a href="lock-screen.html">Lock Screen</a></li>
                                                    <li><a href="error-404.html">404 Error</a></li>
                                                    <li><a href="error-500.html">500 Error</a></li>
                                                </ul>
                                            </li>
                                            <li class="submenu">
                                                <a href="#">
                                                    <span>UI Interface</span>
                                                    <span class="menu-arrow"></span>
                                                </a>
                                                <ul>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">
                                                            <i class="ti ti-hierarchy-2"></i>
                                                            <span>Base UI</span>
                                                            <span class="menu-arrow"></span>
                                                        </a>
                                                        <ul>
                                                            <li>
                                                                <a href="ui-alerts.html">Alerts</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-accordion.html">Accordion</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-avatar.html">Avatar</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-badges.html">Badges</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-borders.html">Border</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-buttons.html">Buttons</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-buttons-group.html">Button Group</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-breadcrumb.html">Breadcrumb</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-cards.html">Card</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-carousel.html">Carousel</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-colors.html">Colors</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-dropdowns.html">Dropdowns</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-grid.html">Grid</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-images.html">Images</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-lightbox.html">Lightbox</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-media.html">Media</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-modals.html">Modals</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-offcanvas.html">Offcanvas</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-pagination.html">Pagination</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-popovers.html">Popovers</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-progress.html">Progress</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-placeholders.html">Placeholders</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-spinner.html">Spinner</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-sweetalerts.html">Sweet Alerts</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-nav-tabs.html">Tabs</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-toasts.html">Toasts</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-tooltips.html">Tooltips</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-typography.html">Typography</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-video.html">Video</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-sortable.html">Sortable</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-swiperjs.html">Swiperjs</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">
                                                            <i class="ti ti-hierarchy-3"></i>
                                                            <span>Advanced UI</span>
                                                            <span class="menu-arrow"></span>
                                                        </a>
                                                        <ul>
                                                            <li>
                                                                <a href="ui-ribbon.html">Ribbon</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-clipboard.html">Clipboard</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-drag-drop.html">Drag & Drop</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-rangeslider.html">Range Slider</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-rating.html">Rating</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-text-editor.html">Text Editor</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-counter.html">Counter</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-scrollbar.html">Scrollbar</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-stickynote.html">Sticky Note</a>
                                                            </li>
                                                            <li>
                                                                <a href="ui-timeline.html">Timeline</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">
                                                            <i class="ti ti-input-search"></i>
                                                            <span>Forms</span>
                                                            <span class="menu-arrow"></span>
                                                        </a>
                                                        <ul>
                                                            <li class="submenu submenu-two">
                                                                <a href="javascript:void(0);">Form Elements <span
                                                                        class="menu-arrow inside-submenu"></span>
                                                                </a>
                                                                <ul>
                                                                    <li>
                                                                        <a href="form-basic-inputs.html">Basic
                                                                            Inputs</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="form-checkbox-radios.html">Checkbox
                                                                            & Radios</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="form-input-groups.html">Input
                                                                            Groups</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="form-grid-gutters.html">Grid &
                                                                            Gutters</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="form-select.html">Form Select</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="form-mask.html">Input Masks</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="form-fileupload.html">File
                                                                            Uploads</a>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                            <li class="submenu submenu-two">
                                                                <a href="javascript:void(0);">Layouts <span
                                                                        class="menu-arrow inside-submenu"></span>
                                                                </a>
                                                                <ul>
                                                                    <li>
                                                                        <a href="form-horizontal.html">Horizontal
                                                                            Form</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="form-vertical.html">Vertical
                                                                            Form</a>
                                                                    </li>
                                                                    <li>
                                                                        <a href="form-floating-labels.html">Floating
                                                                            Labels</a>
                                                                    </li>
                                                                </ul>
                                                            </li>
                                                            <li>
                                                                <a href="form-validation.html">Form Validation</a>
                                                            </li>

                                                            <li>
                                                                <a href="form-select2.html">Select2</a>
                                                            </li>
                                                            <li>
                                                                <a href="form-wizard.html">Form Wizard</a>
                                                            </li>
                                                            <li>
                                                                <a href="form-pickers.html">Form Pickers</a>
                                                            </li>

                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">
                                                            <i class="ti ti-table-plus"></i>
                                                            <span>Tables</span>
                                                            <span class="menu-arrow"></span>
                                                        </a>
                                                        <ul>
                                                            <li>
                                                                <a href="tables-basic.html">Basic Tables </a>
                                                            </li>
                                                            <li>
                                                                <a href="data-tables.html">Data Table </a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">
                                                            <i class="ti ti-chart-line"></i>
                                                            <span>Charts</span>
                                                            <span class="menu-arrow"></span>
                                                        </a>
                                                        <ul>
                                                            <li>
                                                                <a href="chart-apex.html">Apex Charts</a>
                                                            </li>
                                                            <li>
                                                                <a href="chart-c3.html">Chart C3</a>
                                                            </li>
                                                            <li>
                                                                <a href="chart-js.html">Chart Js</a>
                                                            </li>
                                                            <li>
                                                                <a href="chart-morris.html">Morris Charts</a>
                                                            </li>
                                                            <li>
                                                                <a href="chart-flot.html">Flot Charts</a>
                                                            </li>
                                                            <li>
                                                                <a href="chart-peity.html">Peity Charts</a>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                    <li class="submenu">
                                                        <a href="javascript:void(0);">
                                                            <i class="ti ti-icons"></i>
                                                            <span>Icons</span>
                                                            <span class="menu-arrow"></span>
                                                        </a>
                                                        <ul>
                                                            <li>
                                                                <a href="icon-fontawesome.html">Fontawesome
                                                                    Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-tabler.html">Tabler Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-bootstrap.html">Bootstrap Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-remix.html">Remix Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-feather.html">Feather Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-ionic.html">Ionic Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-material.html">Material Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-pe7.html">Pe7 Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-simpleline.html">Simpleline Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-themify.html">Themify Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-weather.html">Weather Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-typicon.html">Typicon Icons</a>
                                                            </li>
                                                            <li>
                                                                <a href="icon-flag.html">Flag Icons</a>
                                                            </li>
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
                                            </li>
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
                                                            <li><a href="javascript:void(0);">Multilevel 2.1</a>
                                                            </li>
                                                            <li class="submenu submenu-two submenu-three">
                                                                <a href="javascript:void(0);">Multilevel 2.2<span
                                                                        class="menu-arrow inside-submenu inside-submenu-two"></span></a>
                                                                <ul>
                                                                    <li><a href="javascript:void(0);">Multilevel
                                                                        2.2.1</a></li>
                                                                    <li><a href="javascript:void(0);">Multilevel
                                                                        2.2.2</a></li>
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
                    <!-- /Horizontal Single -->

                    <div class="d-flex align-items-center">
                        <div class="me-1">
                            <a href="#" class="btn btn-menubar btnFullscreen">
                                <i class="ti ti-maximize"></i>
                            </a>
                        </div>
                        <div class="dropdown me-1">
                            <a href="#" class="btn btn-menubar" data-bs-toggle="dropdown">
                                <i class="ti ti-layout-grid-remove"></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <div class="card mb-0 border-0 shadow-none">
                                    <div class="card-header">
                                        <h4>Applications</h4>
                                    </div>
                                    <div class="card-body">
                                        <a href="calendar.html" class="d-block pb-2">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                             class="ti ti-calendar text-gray-9"></i></span>Calendar
                                        </a>
                                        <a href="todo.html" class="d-block py-2">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                             class="ti ti-subtask text-gray-9"></i></span>To Do
                                        </a>
                                        <a href="notes.html" class="d-block py-2">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                             class="ti ti-notes text-gray-9"></i></span>Notes
                                        </a>
                                        <a href="file-manager.html" class="d-block py-2">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                             class="ti ti-folder text-gray-9"></i></span>File Manager
                                        </a>
                                        <a href="kanban-view.html" class="d-block py-2">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                             class="ti ti-layout-kanban text-gray-9"></i></span>Kanban
                                        </a>
                                        <a href="invoices.html" class="d-block py-2 pb-0">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                             class="ti ti-file-invoice text-gray-9"></i></span>Invoices
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="me-1">
                            <a href="chat.html" class="btn btn-menubar position-relative">
                                <i class="ti ti-brand-hipchat"></i>
                                <span
                                        class="badge bg-info rounded-pill d-flex align-items-center justify-content-center header-badge">5</span>
                            </a>
                        </div>
                        <div class="me-1">
                            <a href="email.html" class="btn btn-menubar">
                                <i class="ti ti-mail"></i>
                            </a>
                        </div>
                        <div class="me-1 notification_item">
                            <a href="#" class="btn btn-menubar position-relative me-1" id="notification_popup"
                               data-bs-toggle="dropdown">
                                <i class="ti ti-bell"></i>
                                <span class="notification-status-dot"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end notification-dropdown p-4">
                                <div
                                        class="d-flex align-items-center justify-content-between border-bottom p-0 pb-3 mb-3">
                                    <h4 class="notification-title">Notifications (2)</h4>
                                    <div class="d-flex align-items-center">
                                        <a href="#" class="text-primary fs-15 me-3 lh-1">Mark all as read</a>
                                        <div class="dropdown">
                                            <a href="javascript:void(0);" class="bg-white dropdown-toggle"
                                               data-bs-toggle="dropdown">
                                                <i class="ti ti-calendar-due me-1"></i>Today
                                            </a>
                                            <ul class="dropdown-menu mt-2 p-3">
                                                <li>
                                                    <a href="javascript:void(0);" class="dropdown-item rounded-1">
                                                        This Week
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);" class="dropdown-item rounded-1">
                                                        Last Week
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="javascript:void(0);" class="dropdown-item rounded-1">
                                                        Last Month
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="noti-content">
                                    <div class="d-flex flex-column">
                                        <div class="border-bottom mb-3 pb-3">
                                            <a href="activity.html">
                                                <div class="d-flex">
                                           <span class="avatar avatar-lg me-2 flex-shrink-0">
                                              <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-27.jpg" alt="Profile">
                                           </span>
                                                    <div class="flex-grow-1">
                                                        <p class="mb-1"><span
                                                                class="text-dark fw-semibold">Shawn</span>
                                                            performance in Math is below the threshold.</p>
                                                        <span>Just Now</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="border-bottom mb-3 pb-3">
                                            <a href="activity.html" class="pb-0">
                                                <div class="d-flex">
                                           <span class="avatar avatar-lg me-2 flex-shrink-0">
                                              <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-23.jpg" alt="Profile">
                                           </span>
                                                    <div class="flex-grow-1">
                                                        <p class="mb-1"><span
                                                                class="text-dark fw-semibold">Sylvia</span> added
                                                            appointment on 02:00 PM</p>
                                                        <span>10 mins ago</span>
                                                        <div
                                                                class="d-flex justify-content-start align-items-center mt-1">
                                                            <span class="btn btn-light btn-sm me-2">Deny</span>
                                                            <span class="btn btn-primary btn-sm">Approve</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="border-bottom mb-3 pb-3">
                                            <a href="activity.html">
                                                <div class="d-flex">
                                           <span class="avatar avatar-lg me-2 flex-shrink-0">
                                              <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-25.jpg" alt="Profile">
                                           </span>
                                                    <div class="flex-grow-1">
                                                        <p class="mb-1">New student record <span class="text-dark fw-semibold"> George</span>
                                                            is created by <span class="text-dark fw-semibold">Teressa</span>
                                                        </p>
                                                        <span>2 hrs ago</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="border-0 mb-3 pb-0">
                                            <a href="activity.html">
                                                <div class="d-flex">
                                           <span class="avatar avatar-lg me-2 flex-shrink-0">
                                              <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-01.jpg" alt="Profile">
                                           </span>
                                                    <div class="flex-grow-1">
                                                        <p class="mb-1">A new teacher record for <span class="text-dark fw-semibold">Elisa</span> </p>
                                                        <span>09:45 AM</span>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="d-flex p-0">
                                    <a href="#" class="btn btn-light w-100 me-2">Cancel</a>
                                    <a href="activity.html" class="btn btn-primary w-100">View All</a>
                                </div>
                            </div>
                        </div>
                        <div class="dropdown profile-dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle d-flex align-items-center" data-bs-toggle="dropdown">
                            <span class="avatar avatar-sm online">
                               <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-12.jpg" alt="Img" class="img-fluid rounded-circle">
                            </span>
                            </a>
                            <div class="dropdown-menu shadow-none">
                                <div class="card mb-0">
                                    <div class="card-header">
                                        <div class="d-flex align-items-center">
                                     <span class="avatar avatar-lg me-2 avatar-rounded">
                                        <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-12.jpg" alt="img">
                                     </span>
                                            <div>
                                                <h5 class="mb-0">Kevin Larry</h5>
                                                <p class="fs-12 fw-medium mb-0">warren@example.com</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
                                           href="profile.html">
                                            <i class="ti ti-user-circle me-1"></i>My Profile
                                        </a>
                                        <a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
                                           href="bussiness-settings.html">
                                            <i class="ti ti-settings me-1"></i>Settings
                                        </a>

                                        <a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
                                           href="profile-settings.html">
                                            <i class="ti ti-circle-arrow-up me-1"></i>My Account
                                        </a>
                                        <a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
                                           href="knowledgebase.html">
                                            <i class="ti ti-question-mark me-1"></i>Knowledge Base
                                        </a>
                                    </div>
                                    <div class="card-footer py-1">
                                        <a class="dropdown-item d-inline-flex align-items-center p-0 py-2" href="login.html"><i class="ti ti-login me-2"></i>Logout</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Mobile Menu -->
            <div class="dropdown mobile-user-menu">
                <a href="javascript:void(0);" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-ellipsis-v"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-end">
                    <a class="dropdown-item" href="profile.html">My Profile</a>
                    <a class="dropdown-item" href="profile-settings.html">Settings</a>
                    <a class="dropdown-item" href="login.html">Logout</a>
                </div>
            </div>
            <!-- /Mobile Menu -->

        </div>

    </div>
    <!-- /Header -->

    <!-- Sidebar -->
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

        <!-- ADMIN PROFILE -->
        <div class="modern-profile p-3 pb-0">

            <div class="text-center rounded bg-light p-3 mb-4 user-profile">

                <div class="avatar avatar-lg online mb-3">
                    <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg"
                         alt="Admin Profile"
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

        <!-- SIDEBAR MENU -->
        <div class="sidebar-menu">

            <ul>

                <li class="menu-title">
                    <span>MAIN MENU</span>
                </li>

                <!-- DASHBOARD -->
                <li>
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
                        <i class="ti ti-smart-home"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <!-- EMPLOYEES -->
                <li class="submenu">
                    <a href="javascript:void(0);">
                        <i class="ti ti-users"></i>
                        <span>Employees</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="${pageContext.request.contextPath}/Employee/AddDepartment">
                                <span>Add Department</span>
                            </a>
                        </li>


                        <li>
                            <a href="${pageContext.request.contextPath}/Employee/Role">
                                <span>Add Role</span>
                            </a>
                        </li>


                        <li>
                            <a href="${pageContext.request.contextPath}/Employee/AddDesignation">
                                <span>Add Designation</span>
                            </a>
                        </li>


                        <li>
                            <a href="${pageContext.request.contextPath}/Employee/EmployeeList">
                                <span>Employee List</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/Employee/EmployeeGrid">
                                <span>Employee Grid</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/Employee/EmployeeDetails">
                                <span>Employee Details</span>
                            </a>
                        </li>
                    </ul>
                </li>

                <!-- ATTENDANCE -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-calendar-check"></i>
                        <span>Attendance</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li class="submenu">
                            <a href="javascript:void(0);">
                                <span>Leaves</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li>
                                    <a href="javascript:void(0);">
                                        <span>Apply Leave</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">
                                        <span>Leave Details</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">
                                        <span>Leave Approval</span>
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Attendance (Admin)</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Timesheet</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- EVENTS -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-calendar-event"></i>
                        <span>Events</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Add Event</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Add Master Event</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Event List</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- PAYROLL -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-cash"></i>
                        <span>Payroll</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Add Employee Salary</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Master Payroll</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Employee Salary List</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Generate Payslips Monthly</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Transaction History</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- TRAINING -->
                <!-- TRAINING -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-school"></i>
                        <span>Training</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Trainer List</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Trainers</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/training-type">
                                <span>Training Type</span>
                            </a>
                        </li>

                    </ul>

                </li>
                <!-- DOCUMENTS -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-file-description"></i>
                        <span>Documents</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li class="submenu">

                            <a href="javascript:void(0);">
                                <span>Upload Documents</span>
                                <span class="menu-arrow"></span>
                            </a>

                            <ul>

                                <li>
                                    <a href="javascript:void(0);">
                                        <span>Upload Document</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);">
                                        <span>Document List</span>
                                    </a>
                                </li>

                            </ul>

                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Generate Letter</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- MASTER DOCUMENT -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-files"></i>
                        <span>Master Document</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Master Document</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Master Document List</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- PERFORMANCE & GOAL -->
                <li class="submenu">
                    <a href="javascript:void(0);">
                        <i class="ti ti-chart-line"></i>
                        <span>Performance &amp; Goal</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li><a href="javascript:void(0);"><span>Performance</span></a></li>
                        <li><a href="javascript:void(0);"><span>Goals</span></a></li>
                        <li><a href="javascript:void(0);"><span>Appraisal</span></a></li>
                        <li><a href="javascript:void(0);"><span>Performance Report</span></a></li>
                    </ul>
                </li>

                <!-- PROJECTS -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-briefcase"></i>
                        <span>Projects</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Project</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Tasks</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Task Board</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- REPORTS -->
                <li class="submenu active">

                    <a href="javascript:void(0);">
                        <i class="ti ti-report-analytics"></i>
                        <span>Reports</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/employee-report">
                                <span>Employee Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/attendance-report">
                                <span>Attendance Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/leave-report">
                                <span>Leave Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/payslip-report" class="active">
                                <span>Payslip Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Task Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Daily Report</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- PROMOTIONS -->
                <li class="submenu">
                    <a href="javascript:void(0);">
                        <i class="ti ti-trending-up"></i>
                        <span>Promotions</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li><a href="javascript:void(0);"><span>Add Promotion</span></a></li>
                        <li><a href="javascript:void(0);"><span>Promotion List</span></a></li>
                        <li><a href="javascript:void(0);"><span>Promotion History</span></a></li>
                    </ul>
                </li>

                <!-- RESIGNATION -->
                <li class="submenu">
                    <a href="javascript:void(0);">
                        <i class="ti ti-logout-2"></i>
                        <span>Resignation</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li><a href="javascript:void(0);"><span>Resignation Request</span></a></li>
                        <li><a href="javascript:void(0);"><span>Resignation List</span></a></li>
                        <li><a href="javascript:void(0);"><span>Exit Details</span></a></li>
                    </ul>
                </li>

                <!-- TERMINATION -->
                <li class="submenu">
                    <a href="javascript:void(0);">
                        <i class="ti ti-user-x"></i>
                        <span>Termination</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li><a href="javascript:void(0);"><span>Add Termination</span></a></li>
                        <li><a href="javascript:void(0);"><span>Termination List</span></a></li>
                        <li><a href="javascript:void(0);"><span>Termination History</span></a></li>
                    </ul>
                </li>

                <!-- HELP & SUPPORT -->
                <li class="submenu">
                    <a href="javascript:void(0);">
                        <i class="ti ti-headset"></i>
                        <span>Help &amp; Supports</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li><a href="javascript:void(0);"><span>Help Center</span></a></li>
                        <li><a href="javascript:void(0);"><span>FAQs</span></a></li>
                        <li><a href="javascript:void(0);"><span>Contact Support</span></a></li>
                    </ul>
                </li>

                <!-- TICKETS -->
                <li class="submenu">
                    <a href="javascript:void(0);">
                        <i class="ti ti-ticket"></i>
                        <span>Tickets</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li><a href="javascript:void(0);"><span>Create Ticket</span></a></li>
                        <li><a href="javascript:void(0);"><span>My Tickets</span></a></li>
                        <li><a href="javascript:void(0);"><span>All Tickets</span></a></li>
                    </ul>
                </li>

                <!-- LOGOUT -->
                <li class="mt-2">
                    <a href="javascript:void(0);">
                        <i class="ti ti-logout"></i>
                        <span>Logout</span>
                    </a>
                </li>

            </ul>

        </div>

    </div>

    <!-- PAGE WRAPPER -->

    <div class="page-wrapper">
        <!-- Sidebar -->


        <div class="content">

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Payslip Report</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item">HR</li>
                            <li class="breadcrumb-item active" aria-current="page">Payslip Report</li>
                        </ol>
                    </nav>
                </div>

                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
                    <div class="mb-2">
                        <div class="dropdown">
                            <a href="javascript:void(0);"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">
                                <i class="ti ti-file-export me-1"></i>Export
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-2">
                                <li>
                                    <a href="javascript:void(0);" id="exportPayslipPdf"
                                       class="dropdown-item rounded-1">
                                        <i class="ti ti-file-type-pdf me-1"></i>Export as PDF
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" id="exportPayslipExcel"
                                       class="dropdown-item rounded-1">
                                        <i class="ti ti-file-type-xls me-1"></i>Export as Excel
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="head-icons ms-2">
                        <a href="javascript:void(0);" data-bs-toggle="tooltip"
                           data-bs-placement="top" title="Collapse" id="collapse-header">
                            <i class="ti ti-chevrons-up"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- Report cards -->
                <div class="col-xl-6 d-flex">
                    <div class="row flex-fill">

                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="d-flex align-items-center justify-content-between bg-light border rounded p-2 mb-2">
                                        <div>
                                            <span class="fs-14 fw-normal text-truncate mb-1">Total Payroll</span>
                                            <h5>₹<%= money.format(totalPayroll) %></h5>
                                        </div>
                                        <span class="avatar avatar-md avatar-rounded bg-transparent-primary border border-primary">
                                    <span class="text-primary"><i class="ti ti-wallet"></i></span>
                                </span>
                                    </div>
                                    <p class="fs-12 text-muted mb-0">Total salary across payslips</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="d-flex align-items-center justify-content-between bg-light border rounded p-2 mb-2">
                                        <div>
                                            <span class="fs-14 fw-normal text-truncate mb-1">Deductions</span>
                                            <h5>₹<%= money.format(totalDeductions) %></h5>
                                        </div>
                                        <span class="avatar avatar-md avatar-rounded bg-transparent-danger border border-danger">
                                    <span class="text-danger"><i class="ti ti-minus"></i></span>
                                </span>
                                    </div>
                                    <p class="fs-12 text-muted mb-0">Total employee deductions</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="d-flex align-items-center justify-content-between bg-light border rounded p-2 mb-2">
                                        <div>
                                            <span class="fs-14 fw-normal text-truncate mb-1">Net Pay</span>
                                            <h5>₹<%= money.format(totalNetPay) %></h5>
                                        </div>
                                        <span class="avatar avatar-md avatar-rounded bg-transparent-success border border-success">
                                    <span class="text-success"><i class="ti ti-cash"></i></span>
                                </span>
                                    </div>
                                    <p class="fs-12 text-muted mb-0">Total net salary payable</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="d-flex align-items-center justify-content-between bg-light border rounded p-2 mb-2">
                                        <div>
                                            <span class="fs-14 fw-normal text-truncate mb-1">Earnings</span>
                                            <h5>₹<%= money.format(totalEarnings) %></h5>
                                        </div>
                                        <span class="avatar avatar-md avatar-rounded bg-transparent-info border border-info">
                                    <span class="text-info"><i class="ti ti-trending-up"></i></span>
                                </span>
                                    </div>
                                    <p class="fs-12 text-muted mb-0">Total additional earnings</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Payroll chart -->
                <div class="col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header border-0 pb-0">
                            <div class="d-flex flex-wrap justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                            <span class="me-2">
                                <i class="ti ti-chart-area-line text-primary"></i>
                            </span>
                                    <h5>Payroll Trend</h5>
                                </div>

                                <div class="dropdown">
                                    <a href="javascript:void(0);"
                                       id="payslipChartYearButton"
                                       class="dropdown-toggle btn btn-sm fs-12 btn-white d-inline-flex align-items-center"
                                       data-bs-toggle="dropdown">
                                        This Year
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end p-2" id="payslipChartYearMenu">
                                        <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-year-option" data-year="all">All Years</a></li>
                                        <%
                                            Set<Integer> chartYears = new TreeSet<>(Collections.reverseOrder());
                                            for (PayslipReport p : payslipList) {
                                                chartYears.add(p.getYear());
                                            }
                                            for (Integer y : chartYears) {
                                        %>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-year-option"
                                               data-year="<%= y %>"><%= y %></a>
                                        </li>
                                        <% } %>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="card-body py-0">
                            <div id="payslip-chart" style="min-height: 280px;"></div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Payslip table -->
            <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                    <h5>Payslip List</h5>

                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-2">

                        <div class="me-2">
                            <div class="input-icon-end position-relative">
                                <input type="text" id="payslipDateRange"
                                       class="form-control date-range"
                                       placeholder="dd/mm/yyyy - dd/mm/yyyy">
                                <span class="input-icon-addon">
                            <i class="ti ti-chevron-down"></i>
                        </span>
                            </div>
                        </div>

                        <div class="dropdown me-2">
                            <a href="javascript:void(0);"
                               id="payslipSalaryButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">
                                Salary Range
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-2">
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-salary-option" data-range="all">All Salaries</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-salary-option" data-range="0-30000">Below ₹30,000</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-salary-option" data-range="30000-50000">₹30,000 - ₹50,000</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-salary-option" data-range="50000-plus">Above ₹50,000</a></li>
                            </ul>
                        </div>

                        <div class="dropdown me-2">
                            <a href="javascript:void(0);"
                               id="payslipMonthButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">
                                Month
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-2">
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-month-option" data-month="all">All Months</a></li>
                                <%
                                    LinkedHashSet<String> months = new LinkedHashSet<>();
                                    for (PayslipReport p : payslipList) {
                                        if (p.getMonth() != null && !p.getMonth().trim().isEmpty()) {
                                            months.add(p.getMonth());
                                        }
                                    }
                                    for (String m : months) {
                                %>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-month-option"
                                       data-month="<%= m %>"><%= m %></a></li>
                                <% } %>
                            </ul>
                        </div>

                        <div class="dropdown me-2">
                            <a href="javascript:void(0);"
                               id="payslipSortButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">
                                Sort By : Recently Added
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-2">
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-sort-option" data-sort="recent">Recently Added</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-sort-option" data-sort="salary-asc">Salary: Low to High</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-sort-option" data-sort="salary-desc">Salary: High to Low</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-sort-option" data-sort="name-asc">Name: A to Z</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1 payslip-sort-option" data-sort="name-desc">Name: Z to A</a></li>
                            </ul>
                        </div>

                        <div class="input-group" style="width:220px;">
                    <span class="input-group-text bg-white">
                        <i class="ti ti-search"></i>
                    </span>
                            <input type="text" id="payslipSearch" class="form-control"
                                   placeholder="Search employee...">
                        </div>

                    </div>
                </div>

                <div class="card-body p-0">
                    <div class="custom-datatable-filter table-responsive">
                        <table class="table datatable" id="payslipTable">
                            <thead class="thead-light">
                            <tr>
                                <th class="no-sort">
                                    <div class="form-check form-check-md">
                                        <input class="form-check-input" type="checkbox" id="select-all">
                                    </div>
                                </th>
                                <th>Employee</th>
                                <th>Department</th>
                                <th>Designation</th>
                                <th>Total Salary</th>
                                <th>Earnings</th>
                                <th>Deductions</th>
                                <th>Net Pay</th>
                                <th>Month</th>
                                <th>Year</th>
                                <th>Generated On</th>
                            </tr>
                            </thead>

                            <tbody>
                            <%
                                for (PayslipReport p : payslipList) {
                                    String employeeName = p.getEmployeeName() == null || p.getEmployeeName().trim().isEmpty()
                                            ? "Unknown Employee" : p.getEmployeeName().trim();
                                    String department = p.getDepartment() == null ? "-" : p.getDepartment();
                                    String designation = p.getDesignation() == null ? "-" : p.getDesignation();
                                    String month = p.getMonth() == null ? "-" : p.getMonth();
                                    String generatedOn = p.getGeneratedOn() == null ? "-" : p.getGeneratedOn();
                            %>
                            <tr
                                    data-year="<%= p.getYear() %>"
                                    data-month="<%= month %>"
                                    data-generated="<%= generatedOn %>"
                                    data-salary="<%= p.getTotalSalary() %>">

                                <td>
                                    <div class="form-check form-check-md">
                                        <input class="form-check-input payslip-row-check" type="checkbox">
                                    </div>
                                </td>

                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar avatar-md">
                                    <span class="avatar-title rounded-circle bg-transparent-primary text-primary">
                                        <%= employeeName.substring(0, 1).toUpperCase() %>
                                    </span>
                                        </div>
                                        <div class="ms-2">
                                            <p class="text-dark mb-0 fw-medium">
                                                <%= employeeName %>
                                            </p>
                                            <span class="fs-12 text-muted">Employee ID: <%= p.getEmployeeId() %></span>
                                        </div>
                                    </div>
                                </td>

                                <td><%= department %></td>
                                <td><%= designation %></td>
                                <td data-order="<%= p.getTotalSalary() %>">₹<%= money.format(p.getTotalSalary()) %></td>
                                <td data-order="<%= p.getEarnings() %>">₹<%= money.format(p.getEarnings()) %></td>
                                <td data-order="<%= p.getDeductions() %>">₹<%= money.format(p.getDeductions()) %></td>
                                <td data-order="<%= p.getNetPay() %>"><strong>₹<%= money.format(p.getNetPay()) %></strong></td>
                                <td><%= month %></td>
                                <td><%= p.getYear() %></td>
                                <td><%= generatedOn %></td>
                            </tr>
                            <%
                                }
                                if (payslipList.isEmpty()) {
                            %>
                            <tr>
                                <td colspan="11" class="text-center py-5 text-muted">
                                    No payslip records found.
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
            <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
            <p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
        </div>

    </div>
    <!-- /Page Wrapper -->


</div>
<!-- /Main Wrapper -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<!-- Feather Icon JS -->
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<!-- Slimscroll JS -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<!-- Color Picker JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

<!-- Datatable JS -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<!-- Daterangepikcer JS -->
<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<!-- Select2 JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<!-- Chart JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/chart-data.js"></script>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<script>
    document.addEventListener("DOMContentLoaded", function () {

        var payslipTable = $("#payslipTable").DataTable({
            pageLength: 10,
            ordering: true,
            searching: true,
            lengthChange: true,
            columnDefs: [
                { targets: 0, orderable: false },
                { targets: 4, type: "num" },
                { targets: 5, type: "num" },
                { targets: 6, type: "num" },
                { targets: 7, type: "num" }
            ],
            order: [[10, "desc"]]
        });

        var selectedSalaryRange = "all";
        var selectedMonth = "all";
        var selectedStartDate = null;
        var selectedEndDate = null;
        var selectedChartYear = "all";

        function parseGeneratedDate(value) {
            if (!value || value === "-") return null;

            var m = moment(value, [
                "YYYY-MM-DD HH:mm:ss",
                "YYYY-MM-DDTHH:mm:ss",
                "YYYY-MM-DD",
                "DD/MM/YYYY HH:mm:ss",
                "DD/MM/YYYY"
            ], true);

            if (!m.isValid()) {
                m = moment(value);
            }

            return m.isValid() ? m : null;
        }

        function salaryMatches(value) {
            var salary = parseFloat(value || "0");

            if (selectedSalaryRange === "0-30000") {
                return salary < 30000;
            }

            if (selectedSalaryRange === "30000-50000") {
                return salary >= 30000 && salary <= 50000;
            }

            if (selectedSalaryRange === "50000-plus") {
                return salary > 50000;
            }

            return true;
        }

        $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {

            if (settings.nTable.id !== "payslipTable") {
                return true;
            }

            var row = settings.aoData[dataIndex].nTr;
            if (!row) return true;

            var rowMonth = (row.getAttribute("data-month") || "").trim();
            var rowDate = parseGeneratedDate(row.getAttribute("data-generated") || "");
            var rowSalary = row.getAttribute("data-salary") || "0";

            if (selectedMonth !== "all" &&
                rowMonth.toLowerCase() !== selectedMonth.toLowerCase()) {
                return false;
            }

            if (!salaryMatches(rowSalary)) {
                return false;
            }

            if (selectedStartDate && rowDate &&
                rowDate.isBefore(selectedStartDate, "day")) {
                return false;
            }

            if (selectedEndDate && rowDate &&
                rowDate.isAfter(selectedEndDate, "day")) {
                return false;
            }

            if ((selectedStartDate || selectedEndDate) && !rowDate) {
                return false;
            }

            return true;
        });

        $("#payslipSearch").on("keyup", function () {
            payslipTable.search(this.value).draw();
        });

        $(".payslip-salary-option").on("click", function () {
            selectedSalaryRange = $(this).data("range");
            $("#payslipSalaryButton").text($(this).text());
            payslipTable.draw();
        });

        $(".payslip-month-option").on("click", function () {
            selectedMonth = $(this).data("month");
            $("#payslipMonthButton").text($(this).text());
            payslipTable.draw();
        });

        $(".payslip-sort-option").on("click", function () {

            var sort = $(this).data("sort");
            $("#payslipSortButton").text("Sort By : " + $(this).text());

            if (sort === "salary-asc") {
                payslipTable.order([[4, "asc"]]).draw();
            } else if (sort === "salary-desc") {
                payslipTable.order([[4, "desc"]]).draw();
            } else if (sort === "name-asc") {
                payslipTable.order([[1, "asc"]]).draw();
            } else if (sort === "name-desc") {
                payslipTable.order([[1, "desc"]]).draw();
            } else {
                payslipTable.order([[10, "desc"]]).draw();
            }
        });

        if ($.fn.daterangepicker) {
            $("#payslipDateRange").daterangepicker({
                autoUpdateInput: false,
                locale: {
                    cancelLabel: "Clear",
                    format: "DD/MM/YYYY"
                }
            });

            $("#payslipDateRange").on("apply.daterangepicker", function (ev, picker) {
                selectedStartDate = picker.startDate.clone().startOf("day");
                selectedEndDate = picker.endDate.clone().endOf("day");

                $(this).val(
                    picker.startDate.format("DD/MM/YYYY") +
                    " - " +
                    picker.endDate.format("DD/MM/YYYY")
                );

                payslipTable.draw();
            });

            $("#payslipDateRange").on("cancel.daterangepicker", function () {
                selectedStartDate = null;
                selectedEndDate = null;
                $(this).val("");
                payslipTable.draw();
            });
        }

        // Select all rows
        $("#select-all").on("change", function () {
            var checked = this.checked;
            $("#payslipTable tbody .payslip-row-check").prop("checked", checked);
        });

        $("#payslipTable tbody").on("change", ".payslip-row-check", function () {
            var total = $("#payslipTable tbody .payslip-row-check").length;
            var checked = $("#payslipTable tbody .payslip-row-check:checked").length;
            $("#select-all").prop("checked", total > 0 && total === checked);
        });

        // Payroll chart
        var payslipChart = null;

        function buildChartData(year) {

            var monthNames = [
                "January", "February", "March", "April", "May", "June",
                "July", "August", "September", "October", "November", "December"
            ];

            var totals = {};
            monthNames.forEach(function (month) {
                totals[month] = 0;
            });

            $("#payslipTable tbody tr").each(function () {

                var salary = parseFloat($(this).attr("data-salary"));
                var rowYear = $(this).attr("data-year");
                var rowMonth = $(this).attr("data-month");

                if (isNaN(salary) || !rowYear || !rowMonth) {
                    return;
                }

                if (year !== "all" && String(rowYear) !== String(year)) {
                    return;
                }

                var monthIndex = -1;
                var normalizedMonth = String(rowMonth).trim().toLowerCase();

                var monthLookup = {
                    january: 0, jan: 0,
                    february: 1, feb: 1,
                    march: 2, mar: 2,
                    april: 3, apr: 3,
                    may: 4,
                    june: 5, jun: 5,
                    july: 6, jul: 6,
                    august: 7, aug: 7,
                    september: 8, sep: 8, sept: 8,
                    october: 9, oct: 9,
                    november: 10, nov: 10,
                    december: 11, dec: 11
                };

                if (Object.prototype.hasOwnProperty.call(monthLookup, normalizedMonth)) {
                    monthIndex = monthLookup[normalizedMonth];
                } else {
                    var numericMonth = parseInt(normalizedMonth, 10);
                    if (!isNaN(numericMonth) && numericMonth >= 1 && numericMonth <= 12) {
                        monthIndex = numericMonth - 1;
                    }
                }

                if (monthIndex >= 0 && monthIndex < 12) {
                    totals[monthNames[monthIndex]] += salary;
                }
            });

            return {
                categories: monthNames,
                values: monthNames.map(function (month) {
                    return Number(totals[month].toFixed(2));
                })
            };
        }

        function renderPayslipChart(year) {

            var chartData = buildChartData(year);

            var options = {
                chart: {
                    type: "area",
                    height: 280,
                    toolbar: {
                        show: false
                    }
                },
                series: [{
                    name: "Payroll",
                    data: chartData.values
                }],
                xaxis: {
                    categories: chartData.categories
                },
                yaxis: {
                    labels: {
                        formatter: function (value) {
                            return "₹" + Number(value).toLocaleString("en-IN");
                        }
                    }
                },
                tooltip: {
                    y: {
                        formatter: function (value) {
                            return "₹" + Number(value).toLocaleString("en-IN", {
                                minimumFractionDigits: 2,
                                maximumFractionDigits: 2
                            });
                        }
                    }
                },
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: "smooth",
                    width: 2
                },
                fill: {
                    type: "gradient",
                    gradient: {
                        opacityFrom: 0.35,
                        opacityTo: 0.05
                    }
                }
            };

            if (payslipChart) {
                payslipChart.destroy();
            }

            if (document.querySelector("#payslip-chart") &&
                typeof ApexCharts !== "undefined") {

                payslipChart = new ApexCharts(
                    document.querySelector("#payslip-chart"),
                    options
                );

                payslipChart.render();
            }
        }

        $(".payslip-year-option").on("click", function () {
            selectedChartYear = $(this).data("year");
            $("#payslipChartYearButton").text($(this).text());
            renderPayslipChart(selectedChartYear);
        });

        renderPayslipChart("all");

        // Export as Excel-compatible CSV
        $("#exportPayslipExcel").on("click", function () {

            var csv = [];
            var headers = [
                "Employee",
                "Department",
                "Designation",
                "Total Salary",
                "Earnings",
                "Deductions",
                "Net Pay",
                "Month",
                "Year",
                "Generated On"
            ];

            csv.push(headers.map(function (value) {
                return '"' + value.replace(/"/g, '""') + '"';
            }).join(","));

            payslipTable.rows({ search: "applied" }).every(function () {

                var row = $(this.node());

                if (!row.length) return;

                var values = [
                    row.find("td").eq(1).text().trim().replace(/\s+/g, " "),
                    row.find("td").eq(2).text().trim(),
                    row.find("td").eq(3).text().trim(),
                    row.find("td").eq(4).text().trim(),
                    row.find("td").eq(5).text().trim(),
                    row.find("td").eq(6).text().trim(),
                    row.find("td").eq(7).text().trim(),
                    row.find("td").eq(8).text().trim(),
                    row.find("td").eq(9).text().trim(),
                    row.find("td").eq(10).text().trim()
                ];

                csv.push(values.map(function (value) {
                    return '"' + value.replace(/"/g, '""') + '"';
                }).join(","));
            });

            var blob = new Blob(
                ["\ufeff" + csv.join("\r\n")],
                { type: "text/csv;charset=utf-8;" }
            );

            var url = URL.createObjectURL(blob);
            var link = document.createElement("a");

            link.href = url;
            link.download = "payslip-report.csv";
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            URL.revokeObjectURL(url);
        });

        // Export as PDF using browser print dialog
        $("#exportPayslipPdf").on("click", function () {
            window.print();
        });

    });
</script>


<script>
    /* Keep sidebar submenu interactions working on the Payslip Report page. */
    document.addEventListener('DOMContentLoaded', function () {
        var sidebar = document.getElementById('sidebar');
        if (!sidebar) return;

        sidebar.querySelectorAll('.sidebar-menu li.submenu > a').forEach(function (link) {
            link.addEventListener('click', function (e) {
                var parent = link.parentElement;
                if (!parent) return;
                var submenu = parent.querySelector(':scope > ul');
                if (!submenu) return;

                e.preventDefault();
                var wasActive = parent.classList.contains('active');
                parent.classList.toggle('active', !wasActive);
            });
        });
    });
</script>
</body>

</html>

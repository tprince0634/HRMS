<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <title>Project Report | HRMS</title>

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/datatables/css/dataTables.bootstrap5.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">


    <style>

        /* =========================================================
           SIDEBAR
        ========================================================= */

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

        .sidebar-menu > ul {
            display: block !important;
        }

        .sidebar-menu li {
            display: block;
            width: 100%;
        }

        .sidebar-menu li.submenu > ul {
            display: none !important;
        }

        .sidebar-menu li.submenu.active > ul {
            display: block !important;
        }

        .sidebar-menu li.submenu > a .menu-arrow {
            transition: transform .2s ease;
        }

        .sidebar-menu li.submenu.active > a .menu-arrow {
            transform: rotate(90deg);
        }

        .sidebar-menu li.submenu > ul > li > a {
            display: flex;
            align-items: center;
        }


        /* =========================================================
           CARDS
        ========================================================= */

        .report-card .card-body {
            min-height: 145px;
        }

        .report-icon {
            width: 42px;
            height: 42px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin-bottom: 10px;
            font-size: 18px;
        }


        /* =========================================================
           TABLE
        ========================================================= */

        .project-table th {
            white-space: nowrap;
        }

        .project-table td {
            vertical-align: middle;
        }

        .project-name {
            font-weight: 600;
        }

        .project-client {
            font-size: 12px;
            color: #6b7280;
        }

        .task-count {
            min-width: 34px;
            display: inline-block;
            text-align: center;
        }


        /* =========================================================
           CHART AREA
        ========================================================= */

        .chart-box {
            min-height: 320px;
            position: relative;
        }

        .project-chart-wrapper {
            width: 100%;
            height: 280px;
            display: flex;
            align-items: center;
            justify-content: center;
        }


        /* =========================================================
           DONUT CHART
        ========================================================= */

        .donut-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 35px;
            width: 100%;
            height: 260px;
        }

        .donut-chart {
            width: 190px;
            height: 190px;
            border-radius: 50%;
            position: relative;
            flex-shrink: 0;
        }

        .donut-hole {
            width: 105px;
            height: 105px;
            background: #fff;
            border-radius: 50%;
            position: absolute;
            top: 42.5px;
            left: 42.5px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-direction: column;
        }

        .donut-total {
            font-size: 25px;
            font-weight: 700;
            color: #1f2937;
        }

        .donut-label {
            font-size: 12px;
            color: #6b7280;
        }

        .chart-legend {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 14px;
        }

        .legend-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            display: inline-block;
        }

        .legend-value {
            font-weight: 600;
            margin-left: 5px;
        }


        /* =========================================================
           BAR CHART
        ========================================================= */

        .bar-chart {
            width: 100%;
            height: 260px;

            display: flex;
            align-items: flex-end;
            justify-content: space-around;

            padding: 15px 25px 30px;
            border-bottom: 1px solid #e5e7eb;
        }

        .bar-item {
            width: 70px;
            height: 100%;

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-end;
        }

        .bar-value {
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .bar {
            width: 42px;
            min-height: 2px;
            border-radius: 5px 5px 0 0;

            transition: height .4s ease;
        }

        .bar-label {
            margin-top: 8px;
            font-size: 12px;
            text-align: center;
            color: #6b7280;
            white-space: nowrap;
        }


        /* =========================================================
           FILTERS
        ========================================================= */

        .filter-row .dropdown-toggle {
            min-width: 145px;
            justify-content: space-between;
        }

        .daterangepicker { z-index: 99999 !important; }


        /* =========================================================
           STATUS BADGES
        ========================================================= */

        .badge-success {
            background-color: #16c172 !important;
            color: white !important;
        }

        .badge-danger {
            background-color: #ff3b30 !important;
            color: white !important;
        }

        .badge-warning {
            background-color: #ffb000 !important;
            color: white !important;
        }

        .badge-primary {
            background-color: #0d6efd !important;
            color: white !important;
        }

        .badge-secondary {
            background-color: #47798a !important;
            color: white !important;
        }

        .badge-info {
            background-color: #3f8ca1 !important;
            color: white !important;
        }


        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media(max-width: 991px) {

            .filter-row > div {
                margin-bottom: 10px;
            }

            .donut-wrapper {
                gap: 15px;
            }

            .donut-chart {
                width: 150px;
                height: 150px;
            }

            .donut-hole {
                width: 85px;
                height: 85px;
                top: 32.5px;
                left: 32.5px;
            }

        }


        /* =========================================================
           PRINT
        ========================================================= */

        @media print {

            .header,
            .sidebar,
            .page-header-actions,
            .filter-section .card-header,
            .no-print,
            .dataTables_length,
            .dataTables_filter,
            .dataTables_info,
            .dataTables_paginate {
                display: none !important;
            }

            .page-wrapper {
                margin-left: 0 !important;
                padding: 0 !important;
            }

            .content {
                padding: 10px !important;
            }

            .card {
                box-shadow: none !important;
            }

            .chart-box {
                min-height: 280px;
            }

        }

    </style>

</head>


<body>

<!-- =========================================================
     GLOBAL LOADER
========================================================= -->

<div id="global-loader">
    <div class="page-loader"></div>
</div>


<div class="main-wrapper">


    <!-- =========================================================
         HEADER
    ========================================================= -->

    <div class="header">

        <div class="main-header">

            <div class="header-left">

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                         alt="HRMS Logo">

                </a>

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="dark-logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                         alt="HRMS Logo">

                </a>

            </div>


            <a id="mobile_btn"
               class="mobile_btn"
               href="#sidebar">

                <span class="bar-icon">
                    <span></span>
                    <span></span>
                    <span></span>
                </span>

            </a>


            <div class="header-user">

                <div class="nav user-menu nav-list">

                    <div class="me-auto d-flex align-items-center"
                         id="header-search">

                        <a id="toggle_btn"
                           href="javascript:void(0);"
                           class="btn btn-menubar me-1">

                            <i class="ti ti-arrow-bar-to-left"></i>

                        </a>


                        <div class="input-group input-group-flat d-inline-flex me-1">

                            <span class="input-icon-addon">
                                <i class="ti ti-search"></i>
                            </span>

                            <input type="text"
                                   class="form-control"
                                   placeholder="Search in HRMS">

                            <span class="input-group-text">
                                <kbd>CTRL + /</kbd>
                            </span>

                        </div>


                        <a href="javascript:void(0);"
                           class="btn btn-menubar">

                            <i class="ti ti-settings-cog"></i>

                        </a>

                    </div>

                </div>

            </div>


            <div class="dropdown mobile-user-menu">

                <a href="javascript:void(0);"
                   class="nav-link dropdown-toggle"
                   data-bs-toggle="dropdown">

                    <i class="fa fa-ellipsis-v"></i>

                </a>

                <div class="dropdown-menu dropdown-menu-end">

                    <a class="dropdown-item"
                       href="javascript:void(0);">

                        Profile

                    </a>

                    <a class="dropdown-item"
                       href="javascript:void(0);">

                        Settings

                    </a>

                    <a class="dropdown-item"
                       href="javascript:void(0);">

                        Logout

                    </a>

                </div>

            </div>

        </div>

    </div>



    <!-- =========================================================
         SIDEBAR
    ========================================================= -->

    <div class="sidebar"
         id="sidebar">


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
                         class="img-fluid rounded-circle"
                         alt="Admin Profile">

                </div>

                <h6 class="fs-12 fw-normal mb-1">
                    Admin
                </h6>

                <p class="fs-10 mb-0">
                    Administrator
                </p>

            </div>

        </div>


        <div class="sidebar-menu">

            <ul>

                <li class="menu-title">
                    <span>MAIN MENU</span>
                </li>


                <!-- Dashboard -->

                <li>

                    <a href="${pageContext.request.contextPath}/admin/dashboard">

                        <i class="ti ti-smart-home"></i>

                        <span>Dashboard</span>

                    </a>

                </li>


                <!-- Employees -->

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


                <!-- Attendance -->

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


                <!-- Events -->

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


                <!-- Payroll -->

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


                <!-- Training -->

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


                <!-- Documents -->

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


                <!-- Master Document -->

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


                <!-- Performance -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-chart-line"></i>

                        <span>Performance &amp; Goal</span>

                        <span class="menu-arrow"></span>

                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Performance</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Goals</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Appraisal</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Performance Report</span>
                            </a>
                        </li>

                    </ul>

                </li>


                <!-- Projects -->

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


                <!-- =====================================================
                     REPORTS
                ====================================================== -->

                <li class="submenu active">

                    <a href="javascript:void(0);"
                       class="subdrop">

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
                            <a href="${pageContext.request.contextPath}/admin/payslip-report">
                                <span>Payslip Report</span>
                            </a>
                        </li>

                        <li class="active">

                            <a href="${pageContext.request.contextPath}/admin/project-report"
                               class="active">

                                <span>Project Report</span>

                            </a>

                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/task-report">
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


                <!-- Promotions -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-trending-up"></i>

                        <span>Promotions</span>

                        <span class="menu-arrow"></span>

                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Add Promotion</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Promotion List</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Promotion History</span>
                            </a>
                        </li>

                    </ul>

                </li>


                <!-- Resignation -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-logout-2"></i>

                        <span>Resignation</span>

                        <span class="menu-arrow"></span>

                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Resignation Request</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Resignation List</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Exit Details</span>
                            </a>
                        </li>

                    </ul>

                </li>


                <!-- Termination -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-user-x"></i>

                        <span>Termination</span>

                        <span class="menu-arrow"></span>

                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Add Termination</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Termination List</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Termination History</span>
                            </a>
                        </li>

                    </ul>

                </li>


                <!-- Help -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-headset"></i>

                        <span>Help &amp; Supports</span>

                        <span class="menu-arrow"></span>

                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Help Center</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>FAQs</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Contact Support</span>
                            </a>
                        </li>

                    </ul>

                </li>


                <!-- Tickets -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-ticket"></i>

                        <span>Tickets</span>

                        <span class="menu-arrow"></span>

                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Create Ticket</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>My Tickets</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>All Tickets</span>
                            </a>
                        </li>

                    </ul>

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

    </div>



    <!-- =========================================================
         PAGE WRAPPER
    ========================================================= -->

    <div class="page-wrapper">

        <div class="content">


            <!-- =====================================================
                 PAGE HEADER
            ====================================================== -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">
                        Project Report
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>

                            <li class="breadcrumb-item">
                                Reports
                            </li>

                            <li class="breadcrumb-item active">
                                Project Report
                            </li>

                        </ol>

                    </nav>

                </div>


                <div class="d-flex align-items-center flex-wrap page-header-actions">

                    <div class="dropdown me-2 mb-2">

                        <a href="javascript:void(0);"
                           class="dropdown-toggle btn btn-white"
                           data-bs-toggle="dropdown">

                            <i class="ti ti-file-export me-1"></i>

                            Export

                        </a>


                        <ul class="dropdown-menu dropdown-menu-end p-2">

                            <li>

                                <a href="javascript:void(0);"
                                   id="exportExcel"
                                   class="dropdown-item">

                                    <i class="ti ti-file-type-xls me-1"></i>

                                    Export as Excel / CSV

                                </a>

                            </li>


                            <li>

                                <a href="javascript:void(0);"
                                   id="exportPdf"
                                   class="dropdown-item">

                                    <i class="ti ti-file-type-pdf me-1"></i>

                                    Export as PDF

                                </a>

                            </li>

                        </ul>

                    </div>


                    <button type="button"
                            id="resetFilters"
                            class="btn btn-white border mb-2">

                        <i class="ti ti-refresh me-1"></i>

                        Reset

                    </button>

                </div>

            </div>



            <!-- =====================================================
                 CARDS
            ====================================================== -->

            <div class="row">


                <!-- Total Projects -->

                <div class="col-xl-3 col-md-6 d-flex">

                    <div class="card report-card flex-fill">

                        <div class="card-body">

                            <span class="report-icon bg-primary text-white">

                                <i class="ti ti-briefcase"></i>

                            </span>

                            <h6 class="fs-13 fw-medium">
                                Total Projects
                            </h6>

                            <h3 id="totalProjectsCard">
                                ${totalProjects}
                            </h3>

                            <small class="text-muted">
                                All projects
                            </small>

                        </div>

                    </div>

                </div>


                <!-- Active Projects -->

                <div class="col-xl-3 col-md-6 d-flex">

                    <div class="card report-card flex-fill">

                        <div class="card-body">

                            <span class="report-icon bg-success text-white">

                                <i class="ti ti-check"></i>

                            </span>

                            <h6 class="fs-13 fw-medium">
                                Active Projects
                            </h6>

                            <h3 id="activeProjectsCard">
                                ${activeProjects}
                            </h3>

                            <small class="text-muted">
                                Currently active
                            </small>

                        </div>

                    </div>

                </div>


                <!-- Inactive Projects -->

                <div class="col-xl-3 col-md-6 d-flex">

                    <div class="card report-card flex-fill">

                        <div class="card-body">

                            <span class="report-icon bg-secondary text-white">

                                <i class="ti ti-player-pause"></i>

                            </span>

                            <h6 class="fs-13 fw-medium">
                                Inactive Projects
                            </h6>

                            <h3 id="inactiveProjectsCard">
                                ${inactiveProjects}
                            </h3>

                            <small class="text-muted">
                                Currently inactive
                            </small>

                        </div>

                    </div>

                </div>


                <!-- Total Tasks -->

                <div class="col-xl-3 col-md-6 d-flex">

                    <div class="card report-card flex-fill">

                        <div class="card-body">

                            <span class="report-icon bg-info text-white">

                                <i class="ti ti-list-check"></i>

                            </span>

                            <h6 class="fs-13 fw-medium">
                                Total Tasks
                            </h6>

                            <h3>
                                ${totalTasks}
                            </h3>

                            <small class="text-muted">
                                Across all projects
                            </small>

                        </div>

                    </div>

                </div>

            </div>



            <div class="row">


                <!-- Completed -->

                <div class="col-xl-3 col-md-6 d-flex">

                    <div class="card report-card flex-fill">

                        <div class="card-body">

                            <span class="report-icon bg-success text-white">

                                <i class="ti ti-circle-check"></i>

                            </span>

                            <h6 class="fs-13 fw-medium">
                                Completed Tasks
                            </h6>

                            <h3>
                                ${completedTasks}
                            </h3>

                        </div>

                    </div>

                </div>


                <!-- Pending -->

                <div class="col-xl-3 col-md-6 d-flex">

                    <div class="card report-card flex-fill">

                        <div class="card-body">

                            <span class="report-icon bg-warning text-white">

                                <i class="ti ti-clock"></i>

                            </span>

                            <h6 class="fs-13 fw-medium">
                                Pending Tasks
                            </h6>

                            <h3>
                                ${pendingTasks}
                            </h3>

                        </div>

                    </div>

                </div>


                <!-- In Progress -->

                <div class="col-xl-3 col-md-6 d-flex">

                    <div class="card report-card flex-fill">

                        <div class="card-body">

                            <span class="report-icon bg-primary text-white">

                                <i class="ti ti-loader"></i>

                            </span>

                            <h6 class="fs-13 fw-medium">
                                In Progress
                            </h6>

                            <h3>
                                ${inProgressTasks}
                            </h3>

                        </div>

                    </div>

                </div>


                <!-- Overdue -->

                <div class="col-xl-3 col-md-6 d-flex">

                    <div class="card report-card flex-fill">

                        <div class="card-body">

                            <span class="report-icon bg-danger text-white">

                                <i class="ti ti-alert-triangle"></i>

                            </span>

                            <h6 class="fs-13 fw-medium">
                                Overdue Tasks
                            </h6>

                            <h3>
                                ${overdueTasks}
                            </h3>

                        </div>

                    </div>

                </div>

            </div>



            <!-- =====================================================
                 CHARTS
            ====================================================== -->

            <div class="row">


                <!-- Project Status -->

                <div class="col-xl-5 d-flex">

                    <div class="card flex-fill">

                        <div class="card-header">

                            <h5 class="mb-0">
                                Project Status
                            </h5>

                            <small class="text-muted">
                                Active vs inactive projects
                            </small>

                        </div>


                        <div class="card-body chart-box">

                            <div id="projectStatusChart"
                                 class="project-chart-wrapper">

                            </div>

                        </div>

                    </div>

                </div>



                <!-- Task Status -->

                <div class="col-xl-7 d-flex">

                    <div class="card flex-fill">

                        <div class="card-header">

                            <h5 class="mb-0">
                                Task Status
                            </h5>

                            <small class="text-muted">
                                Task distribution
                            </small>

                        </div>


                        <div class="card-body chart-box">

                            <div id="taskStatusChart"
                                 class="project-chart-wrapper">

                            </div>

                        </div>

                    </div>

                </div>

            </div>



            <!-- =====================================================
                 PROJECT TABLE
            ====================================================== -->

            <div class="card filter-section">


                <!-- FILTER HEADER -->

                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">

                    <h5 class="mb-0">
                        Projects List
                    </h5>


                    <div class="d-flex align-items-center flex-wrap filter-row">


                        <!-- Date -->

                        <div class="me-2">

                            <div class="input-icon-end position-relative">

                                <input type="text"
                                       id="projectDateRange"
                                       class="form-control"
                                       placeholder="dd/mm/yyyy - dd/mm/yyyy"
                                       autocomplete="off">

                                <span class="input-icon-addon">

                                    <i class="ti ti-calendar"></i>

                                </span>

                            </div>

                        </div>


                        <!-- Status -->

                        <div class="dropdown me-2">

                            <a href="javascript:void(0);"
                               id="projectStatusButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">

                                Status

                            </a>


                            <ul class="dropdown-menu dropdown-menu-end p-2">

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-status-filter"
                                       data-value="">

                                        All Status

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-status-filter"
                                       data-value="Active">

                                        Active

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-status-filter"
                                       data-value="Inactive">

                                        Inactive

                                    </a>
                                </li>

                            </ul>

                        </div>


                        <!-- Priority -->

                        <div class="dropdown me-2">

                            <a href="javascript:void(0);"
                               id="projectPriorityButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">

                                Priority

                            </a>


                            <ul class="dropdown-menu dropdown-menu-end p-2">

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-priority-filter"
                                       data-value="">

                                        All Priority

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-priority-filter"
                                       data-value="High">

                                        High

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-priority-filter"
                                       data-value="Medium">

                                        Medium

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-priority-filter"
                                       data-value="Low">

                                        Low

                                    </a>
                                </li>

                            </ul>

                        </div>


                        <!-- Sort -->

                        <div class="dropdown me-2">

                            <a href="javascript:void(0);"
                               id="projectSortButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">

                                Sort By : Recently Added

                            </a>


                            <ul class="dropdown-menu dropdown-menu-end p-2">

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-sort"
                                       data-sort="recent">

                                        Recently Added

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-sort"
                                       data-sort="nameAsc">

                                        Name A - Z

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-sort"
                                       data-sort="nameDesc">

                                        Name Z - A

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-sort"
                                       data-sort="startAsc">

                                        Start Date Ascending

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-sort"
                                       data-sort="startDesc">

                                        Start Date Descending

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-sort"
                                       data-sort="valueAsc">

                                        Project Value Low - High

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item project-sort"
                                       data-sort="valueDesc">

                                        Project Value High - Low

                                    </a>
                                </li>

                            </ul>

                        </div>


                        <!-- Search -->

                        <div>

                            <div class="input-icon position-relative">

                                <span class="input-icon-addon">

                                    <i class="ti ti-search"></i>

                                </span>

                                <input type="text"
                                       id="projectSearch"
                                       class="form-control"
                                       placeholder="Search project">

                            </div>

                        </div>

                    </div>

                </div>



                <!-- TABLE -->

                <div class="card-body">

                    <div class="table-responsive">

                        <table id="projectReportTable"
                               class="table table-striped table-hover project-table">


                            <thead>

                            <tr>

                                <th>

                                    <input type="checkbox"
                                           id="selectAllProjects"
                                           class="form-check-input">

                                </th>

                                <th>Project</th>

                                <th>Manager</th>

                                <th>Start Date</th>

                                <th>End Date</th>

                                <th>Priority</th>

                                <th>Project Value</th>

                                <th>Status</th>

                                <th>Total Tasks</th>

                                <th>Completed</th>

                                <th>Pending</th>

                                <th>In Progress</th>

                                <th>On Hold</th>

                                <th>Overdue</th>

                            </tr>

                            </thead>


                            <tbody>


                            <c:forEach var="project"
                                       items="${projectList}">


                                <tr

                                        data-project-id="${project.projectId}"

                                        data-status="${project.status}"

                                        data-priority="${project.priority}"

                                        data-start="${project.startDate}"

                                        data-end="${project.endDate}"

                                        data-value="${project.projectValue}"

                                        data-project-name="${project.projectName}"

                                        data-manager="${project.managerName}">


                                    <td>

                                        <input type="checkbox"
                                               class="form-check-input project-checkbox"
                                               value="${project.projectId}">

                                    </td>


                                    <td>

                                        <div class="project-name">

                                            <c:out value="${project.projectName}"/>

                                        </div>

                                        <div class="project-client">

                                            <c:out value="${project.clientName}"/>

                                        </div>

                                    </td>


                                    <td>

                                        <c:out value="${project.managerName}"/>

                                    </td>


                                    <td data-order="${project.startDate}">

                                        <c:out value="${project.startDate}"/>

                                    </td>


                                    <td data-order="${project.endDate}">

                                        <c:out value="${project.endDate}"/>

                                    </td>


                                    <td>

                                        <span class="badge
                                            ${project.priority eq 'High'
                                                ? 'badge-danger'
                                                : project.priority eq 'Medium'
                                                    ? 'badge-warning'
                                                    : 'badge-info'}">

                                            <c:out value="${project.priority}"/>

                                        </span>

                                    </td>


                                    <td data-order="${project.projectValue}">

                                        <c:out value="${project.projectValue}"/>

                                    </td>


                                    <td>

                                        <span class="badge
                                            ${project.status eq 'Active'
                                                ? 'badge-success'
                                                : 'badge-secondary'}">

                                            <c:out value="${project.status}"/>

                                        </span>

                                    </td>


                                    <td>

                                        <span class="badge badge-light task-count">

                                                ${project.totalTasks}

                                        </span>

                                    </td>


                                    <td>

                                        <span class="badge badge-success task-count">

                                                ${project.completedTasks}

                                        </span>

                                    </td>


                                    <td>

                                        <span class="badge badge-warning task-count">

                                                ${project.pendingTasks}

                                        </span>

                                    </td>


                                    <td>

                                        <span class="badge badge-primary task-count">

                                                ${project.inProgressTasks}

                                        </span>

                                    </td>


                                    <td>

                                        <span class="badge badge-secondary task-count">

                                                ${project.onHoldTasks}

                                        </span>

                                    </td>


                                    <td>

                                        <span class="badge
                                            ${project.overdueTasks > 0
                                                ? 'badge-danger'
                                                : 'badge-success'}
                                            task-count">

                                                ${project.overdueTasks}

                                        </span>

                                    </td>


                                </tr>


                            </c:forEach>


                            </tbody>

                        </table>

                    </div>

                </div>

            </div>


        </div>

    </div>

</div>



<!-- =========================================================
     JAVASCRIPT LIBRARIES
========================================================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/datatables/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/datatables/js/dataTables.bootstrap5.min.js"></script>



<!-- =========================================================
     PROJECT REPORT JAVASCRIPT
========================================================= -->

<script>

    document.addEventListener("DOMContentLoaded", function () {

        console.log("Project Report JS Started");


        /* =========================================================
           LOADER
        ========================================================= */

        var loader = document.getElementById("global-loader");

        if (loader) {

            loader.style.display = "none";

        }


        /* =========================================================
           SERVER VALUES
        ========================================================= */

        var activeProjects =
            Number("${activeProjects}") || 0;

        var inactiveProjects =
            Number("${inactiveProjects}") || 0;

        var completedTasks =
            Number("${completedTasks}") || 0;

        var pendingTasks =
            Number("${pendingTasks}") || 0;

        var inProgressTasks =
            Number("${inProgressTasks}") || 0;

        var onHoldTasks =
            Number("${onHoldTasks}") || 0;

        var overdueTasks =
            Number("${overdueTasks}") || 0;


        console.log("Project Counts:", {
            activeProjects,
            inactiveProjects
        });

        console.log("Task Counts:", {
            completedTasks,
            pendingTasks,
            inProgressTasks,
            onHoldTasks,
            overdueTasks
        });



        /* =========================================================
           SIDEBAR
        ========================================================= */

        document.querySelectorAll(
            ".sidebar-menu li.submenu > a"
        ).forEach(function (link) {

            link.addEventListener("click", function (event) {

                event.preventDefault();

                var parent = this.parentElement;

                if (!parent) {
                    return;
                }

                parent.classList.toggle("active");

            });

        });



        /* =========================================================
           PROJECT STATUS CHART
           PURE HTML/CSS - NO APEXCHART DEPENDENCY
        ========================================================= */

        function renderProjectStatusChart() {
            var container = document.getElementById("projectStatusChart");
            if (!container) return;

            var active = 0;
            var inactive = 0;

            getProjectRows().forEach(function (row) {
                var status = String(
                    row.getAttribute("data-status") || ""
                ).trim().toLowerCase();

                if (status === "active") active++;
                else if (status === "inactive") inactive++;
            });

            var total = active + inactive;

            if (total === 0) {
                container.innerHTML =
                    '<div class="text-muted text-center">No project data available</div>';
                return;
            }

            var activePercent = (active / total) * 100;

            container.innerHTML =
                '<div class="donut-wrapper">' +
                '<div class="donut-chart" style="' +
                'background:conic-gradient(#16c172 0% ' +
                activePercent + '%, #47798a ' +
                activePercent + '% 100%);">' +
                '<div class="donut-hole">' +
                '<div class="donut-total">' + total + '</div>' +
                '<div class="donut-label">Projects</div>' +
                '</div>' +
                '</div>' +
                '<div class="chart-legend">' +
                '<div class="legend-item">' +
                '<span class="legend-dot" style="background:#16c172;"></span>' +
                '<span>Active</span>' +
                '<span class="legend-value">' + active + '</span>' +
                '</div>' +
                '<div class="legend-item">' +
                '<span class="legend-dot" style="background:#47798a;"></span>' +
                '<span>Inactive</span>' +
                '<span class="legend-value">' + inactive + '</span>' +
                '</div>' +
                '</div>' +
                '</div>';
        }


        renderProjectStatusChart();



        /* =========================================================
           TASK STATUS BAR CHART
           PURE HTML/CSS
        ========================================================= */

        function renderTaskStatusChart() {
            var container = document.getElementById("taskStatusChart");
            if (!container) return;

            var completed = 0;
            var pending = 0;
            var inProgress = 0;
            var onHold = 0;
            var overdue = 0;

            getProjectRows().forEach(function (row) {
                completed += parseInt(
                    row.cells[10] ? row.cells[10].textContent.trim() : "0", 10
                ) || 0;
                pending += parseInt(
                    row.cells[11] ? row.cells[11].textContent.trim() : "0", 10
                ) || 0;
                inProgress += parseInt(
                    row.cells[12] ? row.cells[12].textContent.trim() : "0", 10
                ) || 0;
                onHold += parseInt(
                    row.cells[13] ? row.cells[13].textContent.trim() : "0", 10
                ) || 0;
                overdue += parseInt(
                    row.cells[14] ? row.cells[14].textContent.trim() : "0", 10
                ) || 0;
            });

            var data = [
                {label:"Completed", value:completed, color:"#16c172"},
                {label:"Pending", value:pending, color:"#ffb000"},
                {label:"In Progress", value:inProgress, color:"#0d6efd"},
                {label:"On Hold", value:onHold, color:"#47798a"},
                {label:"Overdue", value:overdue, color:"#ff3b30"}
            ];

            var maxValue = Math.max.apply(
                null,
                data.map(function (item) { return item.value; })
            );

            if (maxValue === 0) {
                container.innerHTML =
                    '<div class="text-muted text-center">No task data available</div>';
                return;
            }

            var html = '<div class="bar-chart">';

            data.forEach(function (item) {
                var height = item.value === 0
                    ? 2
                    : Math.max(10, (item.value / maxValue) * 190);

                html +=
                    '<div class="bar-item">' +
                    '<div class="bar-value">' + item.value + '</div>' +
                    '<div class="bar" style="height:' + height +
                    'px;background:' + item.color + ';"></div>' +
                    '<div class="bar-label">' + item.label + '</div>' +
                    '</div>';
            });

            html += '</div>';
            container.innerHTML = html;
        }


        renderTaskStatusChart();



        /* =========================================================
           TABLE
        ========================================================= */

        var tableElement =
            document.getElementById("projectReportTable");

        var dataTable = null;


        if (
            window.jQuery &&
            jQuery.fn &&
            jQuery.fn.DataTable &&
            tableElement
        ) {

            try {

                dataTable =
                    jQuery("#projectReportTable").DataTable({

                        pageLength: 10,

                        lengthMenu: [
                            [10, 25, 50, 100],
                            [10, 25, 50, 100]
                        ],

                        order: [
                            [1, "asc"]
                        ],

                        columnDefs: [
                            {
                                orderable: false,
                                targets: [0]
                            }
                        ]

                    });

                console.log("DataTable initialized");

            } catch (error) {

                console.error(
                    "DataTable initialization error:",
                    error
                );

            }

        }



        /* =========================================================
           FILTER VARIABLES
        ========================================================= */

        var selectedStatus = "";

        var selectedPriority = "";

        var selectedStartDate = null;

        var selectedEndDate = null;

        var searchText = "";


        /* =========================================================
           GET TABLE ROWS
        ========================================================= */

        function getProjectRows() {

            return Array.from(
                document.querySelectorAll(
                    "#projectReportTable tbody tr"
                )
            );

        }



        /* =========================================================
           DATE PARSER
        ========================================================= */

        function parseProjectDate(value) {

            if (!value) {
                return null;
            }

            var text = String(value).trim();

            /*
             * Project dates come from JSP as values such as:
             * 2026-09-07
             * 2026-09-07T00:00
             * 2026-09-07 00:00:00
             *
             * Always compare the DATE part only.
             * This avoids timezone/time-of-day problems.
             */
            var match = text.match(/^(\d{4})-(\d{2})-(\d{2})/);

            if (match) {
                var year = Number(match[1]);
                var month = Number(match[2]);
                var day = Number(match[3]);
                var parsed = new Date(year, month - 1, day);

                if (
                    parsed.getFullYear() === year &&
                    parsed.getMonth() === month - 1 &&
                    parsed.getDate() === day
                ) {
                    parsed.setHours(0, 0, 0, 0);
                    return parsed;
                }
            }

            /* Also support DD/MM/YYYY if the value is ever formatted that way. */
            match = text.match(/^(\d{2})\/(\d{2})\/(\d{4})/);

            if (match) {
                var d = Number(match[1]);
                var m = Number(match[2]);
                var y = Number(match[3]);
                var parsedDMY = new Date(y, m - 1, d);

                if (
                    parsedDMY.getFullYear() === y &&
                    parsedDMY.getMonth() === m - 1 &&
                    parsedDMY.getDate() === d
                ) {
                    parsedDMY.setHours(0, 0, 0, 0);
                    return parsedDMY;
                }
            }

            return null;
        }



        /* =========================================================
           APPLY FILTERS
        ========================================================= */

        function applyProjectFilters() {

            var rows =
                getProjectRows();


            rows.forEach(function (row) {

                var status =
                    String(
                        row.getAttribute("data-status") || ""
                    ).toLowerCase();


                var priority =
                    String(
                        row.getAttribute("data-priority") || ""
                    ).toLowerCase();


                var projectName =
                    String(
                        row.getAttribute("data-project-name") || ""
                    ).toLowerCase();


                var manager =
                    String(
                        row.getAttribute("data-manager") || ""
                    ).toLowerCase();


                var matchesStatus =
                    !selectedStatus ||
                    status ===
                    selectedStatus.toLowerCase();


                var matchesPriority =
                    !selectedPriority ||
                    priority ===
                    selectedPriority.toLowerCase();


                var matchesSearch =
                    !searchText ||
                    projectName.includes(searchText) ||
                    manager.includes(searchText);


                var matchesDate = true;


                if (
                    selectedStartDate &&
                    selectedEndDate
                ) {

                    var rowDate =
                        parseProjectDate(
                            row.getAttribute("data-start")
                        );


                    if (!rowDate) {

                        matchesDate = false;

                    } else {

                        var filterStart = new Date(selectedStartDate);
                        var filterEnd = new Date(selectedEndDate);

                        filterStart.setHours(0, 0, 0, 0);
                        filterEnd.setHours(23, 59, 59, 999);

                        matchesDate =
                            rowDate.getTime() >= filterStart.getTime() &&
                            rowDate.getTime() <= filterEnd.getTime();

                    }

                }


                var visible =
                    matchesStatus &&
                    matchesPriority &&
                    matchesSearch &&
                    matchesDate;


                row.dataset.filtered =
                    visible
                        ? "false"
                        : "true";


                if (!dataTable) {

                    row.style.display =
                        visible
                            ? ""
                            : "none";

                }

            });


            if (dataTable) {

                /*
                 * DataTables custom filtering
                 * handled below.
                 */

                dataTable.draw(false);

            }


            renderProjectStatusChart();
            renderTaskStatusChart();
        }



        /* =========================================================
           DATATABLE CUSTOM FILTER
        ========================================================= */

        if (
            window.jQuery &&
            jQuery.fn &&
            jQuery.fn.dataTable
        ) {

            jQuery.fn.dataTable.ext.search.push(

                function (
                    settings,
                    data,
                    dataIndex
                ) {

                    if (
                        !settings.nTable ||
                        settings.nTable.id !==
                        "projectReportTable"
                    ) {

                        return true;

                    }


                    var row =
                        settings
                            .aoData[dataIndex]
                            ? settings
                                .aoData[dataIndex]
                                .nTr
                            : null;


                    if (!row) {
                        return true;
                    }


                    var status =
                        String(
                            row.getAttribute(
                                "data-status"
                            ) || ""
                        ).toLowerCase();


                    var priority =
                        String(
                            row.getAttribute(
                                "data-priority"
                            ) || ""
                        ).toLowerCase();


                    var projectName =
                        String(
                            row.getAttribute(
                                "data-project-name"
                            ) || ""
                        ).toLowerCase();


                    var manager =
                        String(
                            row.getAttribute(
                                "data-manager"
                            ) || ""
                        ).toLowerCase();


                    if (
                        selectedStatus &&
                        status !==
                        selectedStatus.toLowerCase()
                    ) {

                        return false;

                    }


                    if (
                        selectedPriority &&
                        priority !==
                        selectedPriority.toLowerCase()
                    ) {

                        return false;

                    }


                    if (searchText) {

                        if (
                            !projectName.includes(searchText) &&
                            !manager.includes(searchText)
                        ) {

                            return false;

                        }

                    }


                    if (
                        selectedStartDate &&
                        selectedEndDate
                    ) {

                        var rowDate =
                            parseProjectDate(
                                row.getAttribute(
                                    "data-start"
                                )
                            );


                        if (!rowDate) {
                            return false;
                        }


                        var filterStart = new Date(selectedStartDate);
                        var filterEnd = new Date(selectedEndDate);

                        filterStart.setHours(0, 0, 0, 0);
                        filterEnd.setHours(23, 59, 59, 999);

                        if (
                            rowDate.getTime() <
                            filterStart.getTime() ||
                            rowDate.getTime() >
                            filterEnd.getTime()
                        ) {

                            return false;

                        }

                    }


                    return true;

                }

            );

        }



        /* =========================================================
           STATUS FILTER
        ========================================================= */

        document.querySelectorAll(
            ".project-status-filter"
        ).forEach(function (item) {

            item.addEventListener(
                "click",
                function (event) {

                    event.preventDefault();


                    selectedStatus =
                        this.getAttribute(
                            "data-value"
                        ) || "";


                    var button =
                        document.getElementById(
                            "projectStatusButton"
                        );


                    if (button) {

                        button.textContent =
                            selectedStatus ||
                            "Status";

                    }


                    applyProjectFilters();

                }
            );

        });



        /* =========================================================
           PRIORITY FILTER
        ========================================================= */

        document.querySelectorAll(
            ".project-priority-filter"
        ).forEach(function (item) {

            item.addEventListener(
                "click",
                function (event) {

                    event.preventDefault();


                    selectedPriority =
                        this.getAttribute(
                            "data-value"
                        ) || "";


                    var button =
                        document.getElementById(
                            "projectPriorityButton"
                        );


                    if (button) {

                        button.textContent =
                            selectedPriority ||
                            "Priority";

                    }


                    applyProjectFilters();

                }
            );

        });



        /* =========================================================
           SEARCH
        ========================================================= */

        var searchInput =
            document.getElementById(
                "projectSearch"
            );


        if (searchInput) {

            searchInput.addEventListener(
                "input",
                function () {

                    searchText =
                        this.value
                            .trim()
                            .toLowerCase();


                    applyProjectFilters();

                }
            );

        }



        /* =========================================================
           DATE RANGE
        ========================================================= */

        var dateInput =
            document.getElementById(
                "projectDateRange"
            );


        if (
            dateInput &&
            window.jQuery &&
            jQuery.fn &&
            jQuery.fn.daterangepicker
        ) {

            try {

                jQuery(dateInput).daterangepicker({
                    autoUpdateInput: false,
                    autoApply: false,
                    opens: "left",
                    drops: "down",
                    parentEl: "body",
                    showDropdowns: true,
                    locale: {
                        format: "DD/MM/YYYY",
                        separator: " - ",
                        applyLabel: "Apply",
                        cancelLabel: "Clear"
                    }
                });

                jQuery(document).on(
                    "click",
                    "#projectDateRange, #projectDateRange ~ .input-icon-addon",
                    function () {
                        var picker =
                            jQuery("#projectDateRange")
                                .data("daterangepicker");
                        if (picker) {
                            picker.show();
                        }
                    }
                );


                jQuery(dateInput).on(
                    "apply.daterangepicker",
                    function (
                        event,
                        picker
                    ) {

                        selectedStartDate =
                            picker.startDate
                                .clone()
                                .startOf("day")
                                .toDate();


                        selectedEndDate =
                            picker.endDate
                                .clone()
                                .endOf("day")
                                .toDate();


                        this.value =
                            picker.startDate.format(
                                "DD/MM/YYYY"
                            ) +
                            " - " +
                            picker.endDate.format(
                                "DD/MM/YYYY"
                            );


                        applyProjectFilters();

                    }
                );


                jQuery(dateInput).on(
                    "cancel.daterangepicker",
                    function () {

                        this.value = "";

                        selectedStartDate = null;

                        selectedEndDate = null;

                        applyProjectFilters();

                    }
                );


                console.log(
                    "Date range picker initialized"
                );

            } catch (error) {

                console.error(
                    "Date picker error:",
                    error
                );

            }

        } else {

            console.warn(
                "Date range picker plugin not available"
            );

        }



        /* =========================================================
           SORT
        ========================================================= */

        document.querySelectorAll(
            ".project-sort"
        ).forEach(function (item) {

            item.addEventListener(
                "click",
                function (event) {

                    event.preventDefault();


                    var sortType =
                        this.getAttribute(
                            "data-sort"
                        );


                    var label =
                        this.textContent.trim();


                    var sortButton =
                        document.getElementById(
                            "projectSortButton"
                        );


                    if (sortButton) {

                        sortButton.textContent =
                            "Sort By : " + label;

                    }


                    var order =
                        null;


                    switch (sortType) {

                        case "recent":

                            order = [
                                [1, "asc"]
                            ];

                            break;


                        case "nameAsc":

                            order = [
                                [1, "asc"]
                            ];

                            break;


                        case "nameDesc":

                            order = [
                                [1, "desc"]
                            ];

                            break;


                        case "startAsc":

                            order = [
                                [3, "asc"]
                            ];

                            break;


                        case "startDesc":

                            order = [
                                [3, "desc"]
                            ];

                            break;


                        case "valueAsc":

                            order = [
                                [6, "asc"]
                            ];

                            break;


                        case "valueDesc":

                            order = [
                                [6, "desc"]
                            ];

                            break;

                    }


                    if (
                        dataTable &&
                        order
                    ) {

                        dataTable
                            .order(order)
                            .draw();

                    } else if (order) {

                        sortRowsManually(
                            order[0][0],
                            order[0][1]
                        );

                    }

                }
            );

        });



        /* =========================================================
           MANUAL SORT FALLBACK
        ========================================================= */

        function sortRowsManually(
            columnIndex,
            direction
        ) {

            var tbody =
                document.querySelector(
                    "#projectReportTable tbody"
                );


            if (!tbody) {
                return;
            }


            var rows =
                Array.from(
                    tbody.querySelectorAll("tr")
                );


            rows.sort(
                function (a, b) {

                    var aText =
                        a.cells[columnIndex]
                            ? a.cells[columnIndex]
                                .textContent
                                .trim()
                            : "";


                    var bText =
                        b.cells[columnIndex]
                            ? b.cells[columnIndex]
                                .textContent
                                .trim()
                            : "";


                    if (columnIndex === 6) {

                        var aValue =
                            parseFloat(
                                a.getAttribute(
                                    "data-value"
                                )
                            ) || 0;


                        var bValue =
                            parseFloat(
                                b.getAttribute(
                                    "data-value"
                                )
                            ) || 0;


                        return direction === "asc"
                            ? aValue - bValue
                            : bValue - aValue;

                    }


                    if (
                        columnIndex === 3 ||
                        columnIndex === 4
                    ) {

                        var aDate =
                            parseProjectDate(
                                aText
                            );

                        var bDate =
                            parseProjectDate(
                                bText
                            );


                        if (
                            aDate &&
                            bDate
                        ) {

                            return direction === "asc"
                                ? aDate - bDate
                                : bDate - aDate;

                        }

                    }


                    return direction === "asc"
                        ? aText.localeCompare(
                            bText
                        )
                        : bText.localeCompare(
                            aText
                        );

                }
            );


            rows.forEach(function (row) {

                tbody.appendChild(row);

            });


            applyProjectFilters();

        }



        /* =========================================================
           SELECT ALL
        ========================================================= */

        var selectAll =
            document.getElementById(
                "selectAllProjects"
            );


        if (selectAll) {

            selectAll.addEventListener(
                "change",
                function () {

                    var checked =
                        this.checked;


                    document.querySelectorAll(
                        ".project-checkbox"
                    ).forEach(function (checkbox) {

                        var row =
                            checkbox.closest("tr");


                        var hidden =
                            row &&
                            row.dataset.filtered === "true";


                        if (!hidden) {

                            checkbox.checked =
                                checked;

                        }

                    });

                }
            );

        }



        /* =========================================================
           EXPORT CSV
        ========================================================= */

        var exportExcel =
            document.getElementById(
                "exportExcel"
            );


        if (exportExcel) {

            exportExcel.addEventListener(
                "click",
                function (event) {

                    event.preventDefault();


                    var rows = [

                        [
                            "Project",
                            "Client",
                            "Manager",
                            "Start Date",
                            "End Date",
                            "Priority",
                            "Project Value",
                            "Status",
                            "Total Tasks",
                            "Completed",
                            "Pending",
                            "In Progress",
                            "On Hold",
                            "Overdue"
                        ]

                    ];


                    getProjectRows().forEach(
                        function (row) {

                            var isVisible =
                                row.dataset.filtered !==
                                "true";


                            if (!isVisible) {
                                return;
                            }


                            var cells =
                                row.querySelectorAll(
                                    "td"
                                );


                            if (cells.length < 14) {
                                return;
                            }


                            rows.push([

                                cells[1]
                                    .innerText
                                    .replace(/\n/g, " ")
                                    .trim(),

                                cells[1]
                                    .innerText
                                    .split("\n")[1] ||
                                "",

                                cells[2]
                                    .innerText
                                    .trim(),

                                cells[3]
                                    .innerText
                                    .trim(),

                                cells[4]
                                    .innerText
                                    .trim(),

                                cells[5]
                                    .innerText
                                    .trim(),

                                cells[6]
                                    .innerText
                                    .trim(),

                                cells[7]
                                    .innerText
                                    .trim(),

                                cells[8]
                                    .innerText
                                    .trim(),

                                cells[9]
                                    .innerText
                                    .trim(),

                                cells[10]
                                    .innerText
                                    .trim(),

                                cells[11]
                                    .innerText
                                    .trim(),

                                cells[12]
                                    .innerText
                                    .trim(),

                                cells[13]
                                    .innerText
                                    .trim()

                            ]);

                        }
                    );


                    var csv =
                        rows.map(
                            function (row) {

                                return row.map(
                                    function (value) {

                                        return '"' +
                                            String(value)
                                                .replace(
                                                    /"/g,
                                                    '""'
                                                ) +
                                            '"';

                                    }
                                ).join(",");

                            }
                        ).join("\r\n");


                    var blob =
                        new Blob(
                            [
                                "\ufeff" + csv
                            ],
                            {
                                type:
                                    "text/csv;charset=utf-8;"
                            }
                        );


                    var url =
                        URL.createObjectURL(
                            blob
                        );


                    var link =
                        document.createElement("a");


                    link.href = url;

                    link.download =
                        "project-report.csv";


                    document.body.appendChild(
                        link
                    );

                    link.click();

                    document.body.removeChild(
                        link
                    );

                    URL.revokeObjectURL(
                        url
                    );

                }
            );

        }



        /* =========================================================
           PDF EXPORT
        ========================================================= */

        var exportPdf =
            document.getElementById(
                "exportPdf"
            );


        if (exportPdf) {

            exportPdf.addEventListener(
                "click",
                function (event) {

                    event.preventDefault();

                    window.print();

                }
            );

        }



        /* =========================================================
           RESET
        ========================================================= */

        var resetButton =
            document.getElementById(
                "resetFilters"
            );


        if (resetButton) {

            resetButton.addEventListener(
                "click",
                function (event) {

                    event.preventDefault();


                    selectedStatus = "";

                    selectedPriority = "";

                    selectedStartDate = null;

                    selectedEndDate = null;

                    searchText = "";


                    var statusButton =
                        document.getElementById(
                            "projectStatusButton"
                        );


                    if (statusButton) {

                        statusButton.textContent =
                            "Status";

                    }


                    var priorityButton =
                        document.getElementById(
                            "projectPriorityButton"
                        );


                    if (priorityButton) {

                        priorityButton.textContent =
                            "Priority";

                    }


                    var sortButton =
                        document.getElementById(
                            "projectSortButton"
                        );


                    if (sortButton) {

                        sortButton.textContent =
                            "Sort By : Recently Added";

                    }


                    var search =
                        document.getElementById(
                            "projectSearch"
                        );


                    if (search) {

                        search.value = "";

                    }


                    var date =
                        document.getElementById(
                            "projectDateRange"
                        );


                    if (date) {

                        date.value = "";

                    }


                    if (dataTable) {

                        dataTable
                            .search("")
                            .columns()
                            .search("")
                            .order([
                                [1, "asc"]
                            ])
                            .draw();

                    }


                    document.querySelectorAll(
                        ".project-checkbox"
                    ).forEach(function (checkbox) {

                        checkbox.checked = false;

                    });


                    if (selectAll) {

                        selectAll.checked = false;

                    }


                    getProjectRows().forEach(
                        function (row) {

                            row.dataset.filtered =
                                "false";

                            row.style.display = "";

                        }
                    );


                    applyProjectFilters();

                }
            );

        }



        /* =========================================================
           INITIAL STATE
        ========================================================= */

        getProjectRows().forEach(
            function (row) {

                row.dataset.filtered =
                    "false";

            }
        );


        console.log(
            "Project Report JS Loaded Successfully"
        );

    });

</script>


</body>

</html>
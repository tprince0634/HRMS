<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description"
          content="HRMS Training List">

    <meta name="keywords"
          content="HRMS, Training, Training List">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

    <title>Training List | HRMS</title>


    <!-- FAVICON -->

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">


    <!-- THEME SCRIPT -->

    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>


    <!-- BOOTSTRAP -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">


    <!-- ICONS -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">


    <!-- DATE / FILTER PLUGINS -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">


    <!-- MAIN STYLE -->

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

        .sidebar-menu li.submenu > ul {
            display: none !important;
        }

        .sidebar-menu li.submenu.active > ul {
            display: block !important;
        }

        .sidebar-menu li.submenu > a .menu-arrow {
            transition: transform 0.2s ease;
        }

        .sidebar-menu li.submenu.active > a .menu-arrow {
            transform: rotate(90deg);
        }

        .sidebar-menu li.submenu > ul > li > a {
            display: flex;
            align-items: center;
        }


        /* =========================================================
           TRAINING CARD
        ========================================================= */

        .training-card {
            border: 0;
            border-radius: 10px;
            overflow: hidden;
        }

        .training-card .card-header {
            padding: 18px 20px;
        }

        .training-card .card-body {
            padding: 20px;
        }


        /* =========================================================
           FILTER BAR
        ========================================================= */

        .training-filter-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 18px;
        }

        .page-size-wrapper {
            display: flex;
            align-items: center;
            gap: 7px;
            color: #6c757d;
            font-size: 13px;
        }

        .page-size-wrapper label {
            margin: 0;
            font-weight: 500;
            color: #444;
        }

        .page-size-wrapper select {
            width: 75px;
            min-height: 34px;
        }

        .search-wrapper {
            position: relative;
            width: 220px;
        }

        .search-wrapper i {
            position: absolute;
            left: 11px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            z-index: 2;
        }

        .search-wrapper input {
            padding-left: 34px;
            height: 36px;
        }


        /* =========================================================
           TRAINING TABLE
        ========================================================= */

        .training-table {
            width: 100%;
            white-space: nowrap;
            margin-bottom: 0;
        }

        .training-table thead th {
            background: #f8f9fa;
            font-weight: 600;
            font-size: 12px;
            color: #495057;
            vertical-align: middle;
            border-bottom: 1px solid #e9ecef;
            padding: 13px 12px;
        }

        .training-table tbody td {
            vertical-align: middle;
            font-size: 13px;
            color: #495057;
            padding: 13px 12px;
            border-bottom: 1px solid #f0f0f0;
        }

        .training-table tbody tr:last-child td {
            border-bottom: 0;
        }

        .training-table tbody tr:hover {
            background-color: #fafafa;
        }


        /* =========================================================
           TRAINING ID
        ========================================================= */

        .training-id {
            font-weight: 600;
            color: #333;
        }


        /* =========================================================
           PERSON
        ========================================================= */

        .training-person {
            display: flex;
            align-items: center;
            min-width: 160px;
        }

        .training-avatar {
            width: 34px;
            height: 34px;
            min-width: 34px;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-right: 9px;
            background: #f1f3f5;
            color: #666;
        }

        .training-person-name {
            font-weight: 500;
            color: #333;
        }


        /* =========================================================
           DESCRIPTION
        ========================================================= */

        .training-description {
            display: inline-block;
            max-width: 190px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            vertical-align: middle;
            color: #666;
        }


        /* =========================================================
           TRAINING TYPE
        ========================================================= */

        .training-type {
            font-weight: 500;
            color: #444;
        }


        /* =========================================================
           COST
        ========================================================= */

        .training-cost {
            font-weight: 600;
            color: #333;
        }


        /* =========================================================
           STATUS TOGGLE
        ========================================================= */

        .training-status-wrapper {
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .training-status-switch {
            position: relative;
            display: inline-block;
            width: 42px;
            height: 22px;
            min-width: 42px;
            margin: 0;
            cursor: pointer;
        }

        .training-status-switch input {
            position: absolute;
            opacity: 0;
            width: 1px;
            height: 1px;
            margin: 0;
        }

        .training-status-slider {
            position: absolute;
            inset: 0;
            background-color: #dc3545;
            border-radius: 30px;
            transition: all 0.25s ease;
            cursor: pointer;
        }

        .training-status-slider::before {
            content: "";
            position: absolute;
            width: 16px;
            height: 16px;
            left: 3px;
            top: 3px;
            background-color: #fff;
            border-radius: 50%;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.25);
            transition: all 0.25s ease;
        }

        .training-status-switch input:checked
        + .training-status-slider {
            background-color: #198754;
        }

        .training-status-switch input:checked
        + .training-status-slider::before {
            transform: translateX(20px);
        }

        .training-status-switch input:focus-visible
        + .training-status-slider {
            outline: 2px solid #0d6efd;
            outline-offset: 2px;
        }

        .training-status-switch input:disabled
        + .training-status-slider {
            opacity: 0.55;
            cursor: not-allowed;
        }

        .training-status-label {
            min-width: 55px;
            font-size: 12px;
            font-weight: 600;
        }

        .training-status-active {
            color: #198754;
        }

        .training-status-inactive {
            color: #dc3545;
        }


        /* =========================================================
           ACTION BUTTONS
        ========================================================= */

        .training-actions {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .action-btn {
            width: 32px;
            height: 32px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: 0;
            background: transparent;
            border-radius: 5px;
            color: #555;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .action-btn i {
            font-size: 16px;
        }

        .edit-btn:hover {
            background: #eaf2ff;
            color: #0d6efd;
        }

        .delete-btn:hover {
            background: #fff0f1;
            color: #dc3545;
        }


        /* =========================================================
           EMPTY TABLE
        ========================================================= */

        .empty-training {
            padding: 55px 20px;
            text-align: center;
        }

        .empty-training i {
            font-size: 45px;
            display: block;
            margin-bottom: 12px;
            color: #adb5bd;
        }

        .empty-training h6 {
            font-weight: 600;
            color: #444;
        }


        /* =========================================================
           PAGINATION
        ========================================================= */

        .training-pagination {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 20px;
        }

        #entryInfo {
            font-size: 13px;
        }

        .pagination-controls {
            display: flex;
            align-items: center;
        }

        .pagination-btn {
            min-width: 75px;
        }

        .pagination-number {
            min-width: 36px;
            margin: 0 7px;
            text-align: center;
        }


        /* =========================================================
           STATUS MESSAGE
        ========================================================= */

        .status-update-message {
            position: fixed;
            right: 25px;
            bottom: 25px;
            z-index: 9999;
            display: none;
            padding: 12px 18px;
            border-radius: 6px;
            background: #198754;
            color: #fff;
            font-size: 13px;
            font-weight: 500;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
        }

        .status-update-message.error {
            background: #dc3545;
        }


        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media (max-width: 767px) {

            .training-filter-bar {
                align-items: stretch;
            }

            .search-wrapper {
                width: 100%;
            }

            .training-pagination {
                flex-direction: column;
                align-items: flex-start;
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


<!-- =========================================================
     STATUS MESSAGE
========================================================= -->

<div id="statusUpdateMessage"
     class="status-update-message">

    Status updated successfully.

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
                   data-bs-toggle="dropdown"
                   aria-expanded="false">

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


        <!-- =====================================================
             SIDEBAR MENU
        ====================================================== -->

        <div class="sidebar-menu">

            <ul>


                <!-- MAIN MENU -->

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

                <li class="submenu active">

                    <a href="javascript:void(0);">

                        <i class="ti ti-school"></i>

                        <span>Training</span>

                        <span class="menu-arrow"></span>

                    </a>


                    <ul>

                        <li>

                            <a href="${pageContext.request.contextPath}/trainerList">

                                <span>Trainers</span>

                            </a>

                        </li>


                        <li class="active">

                            <a href="${pageContext.request.contextPath}/trainingList">

                                <span>Training</span>

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

                                    <a href="${pageContext.request.contextPath}/uploadFile">

                                        <span>Upload Document</span>

                                    </a>

                                </li>


                                <li>

                                    <a href="${pageContext.request.contextPath}/documentList">

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

                <li class="submenu">

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
                            <a href="javascript:void(0);">
                                <span>Leave Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
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


                <!-- RESIGNATION -->

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


                <!-- TERMINATION -->

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


                <!-- HELP & SUPPORT -->

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


                <!-- TICKETS -->

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


                <!-- LOGOUT -->

                <li>

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


            <!-- =================================================
                 PAGE HEADER
            ================================================= -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">
                        Training
                    </h2>


                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>


                            <li class="breadcrumb-item">
                                Training
                            </li>


                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Training List

                            </li>

                        </ol>

                    </nav>

                </div>


                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

                    <div class="mb-2">

                        <a href="${pageContext.request.contextPath}/addTraining"
                           class="btn btn-primary d-flex align-items-center">

                            <i class="ti ti-circle-plus me-1"></i>

                            Add Training

                        </a>

                    </div>


                    <div class="ms-2 head-icons">

                        <a href="javascript:void(0);"
                           data-bs-toggle="tooltip"
                           data-bs-placement="top"
                           data-bs-original-title="Collapse"
                           id="collapse-header">

                            <i class="ti ti-chevrons-up"></i>

                        </a>

                    </div>

                </div>

            </div>



            <!-- =================================================
                 TRAINING CARD
            ================================================= -->

            <div class="card training-card">


                <!-- CARD HEADER -->

                <div class="card-header">

                    <div class="d-flex align-items-center justify-content-between">

                        <div>

                            <h5 class="mb-1">
                                Training List
                            </h5>

                            <p class="text-muted mb-0 fs-12">
                                Manage all employee training records
                            </p>

                        </div>

                    </div>

                </div>



                <!-- CARD BODY -->

                <div class="card-body">


                    <!-- =================================================
                         FILTER BAR
                    ================================================= -->

                    <div class="training-filter-bar">


                        <div class="page-size-wrapper">

                            <label for="pageSize">
                                Row Per Page:
                            </label>


                            <select id="pageSize"
                                    class="form-select form-select-sm">

                                <option value="5">
                                    5
                                </option>

                                <option value="10"
                                        selected>
                                    10
                                </option>

                                <option value="25">
                                    25
                                </option>

                                <option value="50">
                                    50
                                </option>

                            </select>


                            <span>
                                Entries
                            </span>

                        </div>



                        <div class="search-wrapper">

                            <i class="ti ti-search"></i>

                            <input type="text"
                                   id="searchInput"
                                   class="form-control form-control-sm"
                                   placeholder="Search training...">

                        </div>

                    </div>



                    <!-- =================================================
                         TABLE
                    ================================================= -->

                    <div class="table-responsive">


                        <table class="table table-hover training-table"
                               id="trainingTable">


                            <thead>

                            <tr>

                                <th>
                                    Training ID
                                </th>

                                <th>
                                    Trainer
                                </th>

                                <th>
                                    Training Type
                                </th>

                                <th>
                                    Employee
                                </th>

                                <th>
                                    Cost
                                </th>

                                <th>
                                    Description
                                </th>

                                <th>
                                    Status
                                </th>

                                <th>
                                    Start Date
                                </th>

                                <th>
                                    End Date
                                </th>

                                <th class="text-center">
                                    Actions
                                </th>

                            </tr>

                            </thead>


                            <tbody id="trainingTableBody">


                            <c:choose>


                                <c:when test="${empty trainings}">

                                    <tr>

                                        <td colspan="10">

                                            <div class="empty-training">

                                                <i class="ti ti-school"></i>

                                                <h6 class="mb-1">
                                                    No Training Found
                                                </h6>

                                                <p class="text-muted mb-0">
                                                    No training records are available.
                                                </p>

                                            </div>

                                        </td>

                                    </tr>

                                </c:when>


                                <c:otherwise>


                                    <c:forEach var="training"
                                               items="${trainings}">


                                        <tr class="training-row">


                                            <!-- TRAINING ID -->

                                            <td>

                                                <span class="training-id">

                                                    #${training.trainingId}

                                                </span>

                                            </td>



                                            <!-- TRAINER -->

                                            <td>

                                                <div class="training-person">

                                                    <span class="training-avatar">

                                                        <i class="ti ti-user"></i>

                                                    </span>


                                                    <span class="training-person-name">

                                                        <c:choose>

                                                            <c:when test="${not empty trainerNames[training.trainerId]}">

                                                                ${trainerNames[training.trainerId]}

                                                            </c:when>

                                                            <c:otherwise>

                                                                Unknown Trainer

                                                            </c:otherwise>

                                                        </c:choose>

                                                    </span>

                                                </div>

                                            </td>



                                            <!-- TRAINING TYPE -->

                                            <td>

                                                <span class="training-type">

                                                    <c:choose>

                                                        <c:when test="${not empty trainingTypeNames[training.trainingTypeId]}">

                                                            ${trainingTypeNames[training.trainingTypeId]}

                                                        </c:when>

                                                        <c:otherwise>

                                                            Unknown Type

                                                        </c:otherwise>

                                                    </c:choose>

                                                </span>

                                            </td>



                                            <!-- EMPLOYEE -->

                                            <td>

                                                <div class="training-person">

                                                    <span class="training-avatar">

                                                        <i class="ti ti-user"></i>

                                                    </span>


                                                    <span class="training-person-name">

                                                        <c:choose>

                                                            <c:when test="${not empty userNames[training.userId]}">

                                                                ${userNames[training.userId]}

                                                            </c:when>

                                                            <c:otherwise>

                                                                Unknown Employee

                                                            </c:otherwise>

                                                        </c:choose>

                                                    </span>

                                                </div>

                                            </td>



                                            <!-- COST -->

                                            <td>

                                                <span class="training-cost">

                                                    ₹ ${training.trainingCost}

                                                </span>

                                            </td>



                                            <!-- DESCRIPTION -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${empty training.description}">

                                                        <span class="text-muted">
                                                            -
                                                        </span>

                                                    </c:when>


                                                    <c:otherwise>

                                                        <span class="training-description"
                                                              title="${training.description}">

                                                                ${training.description}

                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>



                                            <!-- STATUS -->

                                            <td>

                                                <div class="training-status-wrapper">


                                                    <label class="training-status-switch"
                                                           title="Change training status">


                                                        <input type="checkbox"

                                                               class="training-status-toggle"

                                                               data-training-id="${training.trainingId}"

                                                        <c:if test="${'Active'.equalsIgnoreCase(training.status)}">
                                                               checked
                                                        </c:if>>


                                                        <span class="training-status-slider"></span>


                                                    </label>


                                                    <span class="training-status-label
                                                        <c:choose>

                                                            <c:when test="${'Active'.equalsIgnoreCase(training.status)}">

                                                                training-status-active

                                                            </c:when>

                                                            <c:otherwise>

                                                                training-status-inactive

                                                            </c:otherwise>

                                                        </c:choose>">


                                                        <c:choose>

                                                            <c:when test="${'Active'.equalsIgnoreCase(training.status)}">

                                                                Active

                                                            </c:when>

                                                            <c:otherwise>

                                                                InActive

                                                            </c:otherwise>

                                                        </c:choose>

                                                    </span>

                                                </div>

                                            </td>



                                            <!-- START DATE -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty training.startDate}">

                                                        ${training.startDate.toLocalDate()}

                                                    </c:when>

                                                    <c:otherwise>

                                                        -

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>



                                            <!-- END DATE -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty training.endDate}">

                                                        ${training.endDate.toLocalDate()}

                                                    </c:when>

                                                    <c:otherwise>

                                                        -

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>



                                            <!-- ACTIONS -->

                                            <td>

                                                <div class="training-actions">


                                                    <!-- EDIT -->

                                                    <a href="${pageContext.request.contextPath}/editTraining?id=${training.trainingId}"
                                                       class="action-btn edit-btn"
                                                       title="Edit Training">

                                                        <i class="ti ti-edit"></i>

                                                    </a>


                                                    <!-- DELETE -->

                                                    <a href="${pageContext.request.contextPath}/deleteTraining?id=${training.trainingId}"
                                                       class="action-btn delete-btn"
                                                       title="Delete Training"
                                                       onclick="return confirmDeleteTraining('${training.trainingId}');">

                                                        <i class="ti ti-trash"></i>

                                                    </a>

                                                </div>

                                            </td>


                                        </tr>


                                    </c:forEach>


                                </c:otherwise>


                            </c:choose>


                            </tbody>

                        </table>

                    </div>



                    <!-- =================================================
                         PAGINATION
                    ================================================= -->

                    <div class="training-pagination">


                        <div id="entryInfo"
                             class="text-muted">

                            Showing 0 to 0 of 0 entries

                        </div>


                        <div class="pagination-controls">


                            <button type="button"
                                    id="previousBtn"
                                    class="btn btn-light btn-sm pagination-btn"
                                    disabled>

                                <i class="ti ti-chevron-left me-1"></i>

                                Previous

                            </button>


                            <span id="pageNumber"
                                  class="btn btn-light btn-sm pagination-number">

                                1

                            </span>


                            <button type="button"
                                    id="nextBtn"
                                    class="btn btn-light btn-sm pagination-btn"
                                    disabled>

                                Next

                                <i class="ti ti-chevron-right ms-1"></i>

                            </button>

                        </div>

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

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>



<!-- =========================================================
     SIDEBAR SCRIPT
========================================================= -->

<script>

    (function () {

        function initHRMSSidebar() {

            var sidebar =
                document.querySelector('.sidebar-menu');


            if (!sidebar) {
                return;
            }


            sidebar.addEventListener(
                'click',
                function (event) {


                    var link =
                        event.target.closest(
                            'li.submenu > a'
                        );


                    if (!link ||
                        !sidebar.contains(link)) {

                        return;

                    }


                    event.preventDefault();

                    event.stopPropagation();


                    var currentItem =
                        link.parentElement;


                    var parentList =
                        currentItem.parentElement;


                    var isOpen =
                        currentItem.classList.contains(
                            'active'
                        );


                    Array.prototype.forEach.call(
                        parentList.children,
                        function (item) {

                            if (
                                item !== currentItem &&
                                item.classList.contains(
                                    'submenu'
                                )
                            ) {

                                item.classList.remove(
                                    'active'
                                );

                            }

                        }
                    );


                    currentItem.classList.toggle(
                        'active',
                        !isOpen
                    );

                }
            );

        }


        if (document.readyState === 'loading') {

            document.addEventListener(
                'DOMContentLoaded',
                initHRMSSidebar
            );

        } else {

            initHRMSSidebar();

        }

    })();

</script>



<!-- =========================================================
     DELETE CONFIRMATION
========================================================= -->

<script>

    function confirmDeleteTraining(trainingId) {

        return confirm(
            'Are you sure you want to delete Training #' +
            trainingId +
            '?\n\nThis action cannot be undone.'
        );

    }

</script>



<!-- =========================================================
     TRAINING STATUS TOGGLE
========================================================= -->

<script>

    document.addEventListener(
        'DOMContentLoaded',
        function () {


            const toggles =
                document.querySelectorAll(
                    '.training-status-toggle'
                );


            const message =
                document.getElementById(
                    'statusUpdateMessage'
                );


            let messageTimer = null;



            function showMessage(
                text,
                isError
            ) {

                message.textContent =
                    text;


                message.classList.toggle(
                    'error',
                    isError
                );


                message.style.display =
                    'block';


                clearTimeout(
                    messageTimer
                );


                messageTimer =
                    setTimeout(
                        function () {

                            message.style.display =
                                'none';

                        },
                        2500
                    );

            }



            toggles.forEach(
                function (toggle) {


                    toggle.addEventListener(
                        'change',
                        function () {


                            const trainingId =
                                this.dataset.trainingId;


                            const newStatus =
                                this.checked
                                    ? 'Active'
                                    : 'InActive';


                            const currentToggle =
                                this;


                            const wrapper =
                                currentToggle.closest(
                                    '.training-status-wrapper'
                                );


                            const statusLabel =
                                wrapper.querySelector(
                                    '.training-status-label'
                                );


                            const previousState =
                                !currentToggle.checked;


                            currentToggle.disabled =
                                true;



                            const formData =
                                new URLSearchParams();


                            formData.append(
                                'id',
                                trainingId
                            );


                            formData.append(
                                'status',
                                newStatus
                            );



                            fetch(
                                '${pageContext.request.contextPath}/changeTrainingStatus',
                                {
                                    method: 'POST',

                                    headers: {
                                        'Content-Type':
                                            'application/x-www-form-urlencoded;charset=UTF-8'
                                    },

                                    body:
                                        formData.toString()
                                }
                            )


                                .then(
                                    function (response) {

                                        if (!response.ok) {

                                            throw new Error(
                                                'HTTP status ' +
                                                response.status
                                            );

                                        }

                                        return response.text();

                                    }
                                )


                                .then(
                                    function () {


                                        statusLabel.textContent =
                                            newStatus;


                                        statusLabel.classList.remove(
                                            'training-status-active',
                                            'training-status-inactive'
                                        );


                                        if (
                                            newStatus ===
                                            'Active'
                                        ) {

                                            statusLabel.classList.add(
                                                'training-status-active'
                                            );

                                        } else {

                                            statusLabel.classList.add(
                                                'training-status-inactive'
                                            );

                                        }


                                        showMessage(
                                            'Training status changed to ' +
                                            newStatus +
                                            '.',
                                            false
                                        );

                                    }
                                )


                                .catch(
                                    function (error) {


                                        console.error(
                                            'Status update failed:',
                                            error
                                        );


                                        currentToggle.checked =
                                            previousState;


                                        showMessage(
                                            'Unable to update training status.',
                                            true
                                        );

                                    }
                                )


                                .finally(
                                    function () {

                                        currentToggle.disabled =
                                            false;

                                    }
                                );

                        }
                    );

                }
            );

        }

    );

</script>



<!-- =========================================================
     SEARCH / SORT / PAGINATION
========================================================= -->

<script>

    document.addEventListener(
        'DOMContentLoaded',
        function () {


            const searchInput =
                document.getElementById(
                    'searchInput'
                );


            const pageSizeSelect =
                document.getElementById(
                    'pageSize'
                );


            const previousBtn =
                document.getElementById(
                    'previousBtn'
                );


            const nextBtn =
                document.getElementById(
                    'nextBtn'
                );


            const pageNumber =
                document.getElementById(
                    'pageNumber'
                );


            const entryInfo =
                document.getElementById(
                    'entryInfo'
                );


            const tbody =
                document.getElementById(
                    'trainingTableBody'
                );


            if (!tbody) {
                return;
            }


            let rows =
                Array.from(
                    tbody.querySelectorAll(
                        '.training-row'
                    )
                );


            let filteredRows =
                [...rows];


            let currentPage =
                1;


            let pageSize =
                parseInt(
                    pageSizeSelect.value,
                    10
                );



            function renderTable() {


                pageSize =
                    parseInt(
                        pageSizeSelect.value,
                        10
                    );


                const totalEntries =
                    filteredRows.length;


                const totalPages =
                    Math.max(
                        1,
                        Math.ceil(
                            totalEntries /
                            pageSize
                        )
                    );


                if (
                    currentPage >
                    totalPages
                ) {

                    currentPage =
                        totalPages;

                }


                const startIndex =
                    (currentPage - 1) *
                    pageSize;


                const endIndex =
                    Math.min(
                        startIndex +
                        pageSize,
                        totalEntries
                    );


                rows.forEach(
                    function (row) {

                        row.style.display =
                            'none';

                    }
                );


                filteredRows
                    .slice(
                        startIndex,
                        endIndex
                    )
                    .forEach(
                        function (row) {

                            row.style.display =
                                '';

                        }
                    );


                pageNumber.textContent =
                    currentPage;


                previousBtn.disabled =
                    currentPage <= 1;


                nextBtn.disabled =
                    currentPage >= totalPages;


                if (totalEntries === 0) {

                    entryInfo.textContent =
                        'Showing 0 to 0 of 0 entries';

                } else {

                    entryInfo.textContent =
                        'Showing ' +
                        (startIndex + 1) +
                        ' to ' +
                        endIndex +
                        ' of ' +
                        totalEntries +
                        ' entries';

                }

            }



            function applySearch() {


                const searchValue =
                    searchInput.value
                        .toLowerCase()
                        .trim();


                filteredRows =
                    rows.filter(
                        function (row) {

                            return row.textContent
                                .toLowerCase()
                                .includes(
                                    searchValue
                                );

                        }
                    );


                currentPage =
                    1;


                renderTable();

            }



            searchInput.addEventListener(
                'input',
                applySearch
            );


            pageSizeSelect.addEventListener(
                'change',
                function () {

                    currentPage =
                        1;

                    renderTable();

                }
            );


            previousBtn.addEventListener(
                'click',
                function () {

                    if (currentPage > 1) {

                        currentPage--;

                        renderTable();

                    }

                }
            );


            nextBtn.addEventListener(
                'click',
                function () {


                    const totalPages =
                        Math.max(
                            1,
                            Math.ceil(
                                filteredRows.length /
                                pageSize
                            )
                        );


                    if (
                        currentPage <
                        totalPages
                    ) {

                        currentPage++;

                        renderTable();

                    }

                }
            );


            renderTable();

        }

    );

</script>


</body>

</html>
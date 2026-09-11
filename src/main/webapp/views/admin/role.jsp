<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.model.Role" %>

<%
    String contextPath = request.getContextPath();

    List<Role> roles =
            (List<Role>) request.getAttribute("roles");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Roles</title>


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
          href="${pageContext.request.contextPath}/assets/css/style.css">
    <!-- =====================================================
             BOOTSTRAP ICONS
             ===================================================== -->

    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <!-- =====================================================
         CSS
         ===================================================== -->

    <style>

        /* Same sidebar behaviour as Admin Dashboard */
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


        body {
            margin: 0;
            background: #f7f7f8;
            font-family: Arial, Helvetica, sans-serif;
            color: #333;
        }


        /* =====================================================
           MAIN
           ===================================================== */

        .main {
            min-height: 100vh;
            width: 100%;
        }


        /* =====================================================
           TOP BAR
           ===================================================== */

        .topbar {
            height: 70px;
            background: #ffffff;
            border-bottom: 1px solid #eeeeee;

            display: flex;
            align-items: center;

            padding: 0 30px;
        }


        .search-box {
            width: 300px;

            border: 1px solid #eeeeee;
            border-radius: 6px;

            padding: 10px 15px;

            outline: none;
        }


        .search-box:focus {
            border-color: #ff6b00;
        }


        /* =====================================================
           CONTENT
           ===================================================== */

        .content {
            padding: 45px 50px;
        }


        /* =====================================================
           PAGE HEADER
           ===================================================== */

        .page-header {
            display: flex;
            align-items: center;
            justify-content: space-between;

            margin-bottom: 30px;
        }


        .page-header h1 {
            font-size: 28px;
            font-weight: 600;

            margin: 0;
        }


        .breadcrumb {
            margin-top: 8px;
            font-size: 14px;
        }


        /* =====================================================
           BUTTONS
           ===================================================== */

        .btn-orange {
            background: #ff6b00;
            color: white;
            border: none;
        }


        .btn-orange:hover {
            background: #e85f00;
            color: white;
        }


        /* =====================================================
           CARD
           ===================================================== */

        .card-custom {
            background: white;

            border: 1px solid #eeeeee;
            border-radius: 8px;
        }


        .card-title {
            padding: 25px 22px;

            font-size: 18px;
            font-weight: 600;

            border-bottom: 1px solid #eeeeee;
        }


        /* =====================================================
           FILTERS
           ===================================================== */

        .filters {
            padding: 15px 20px;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }


        /* =====================================================
           TABLE
           ===================================================== */

        table {
            width: 100%;
        }


        thead th {
            background: #e9ecef;

            padding: 14px 20px;

            font-size: 14px;
            font-weight: 600;

            white-space: nowrap;
        }


        tbody td {
            padding: 15px 20px;

            border-bottom: 1px solid #eeeeee;

            font-size: 14px;
        }


        tbody tr:hover {
            background: #fafafa;
        }


        /* =====================================================
           STATUS
           ===================================================== */

        .status {
            display: inline-block;

            padding: 5px 12px;

            border-radius: 4px;

            font-size: 12px;
            font-weight: 600;
        }


        .status-active {
            background: #20c76b;
            color: white;
        }


        .status-inactive {
            background: #ef233c;
            color: white;
        }


        /* =====================================================
           ACTION BUTTON
           ===================================================== */

        .action-btn {
            border: none;
            background: transparent;

            font-size: 17px;

            margin-right: 10px;

            cursor: pointer;
        }


        .edit-btn {
            color: #555;
        }


        .delete-btn {
            color: #555;
        }


        .action-btn:hover {
            color: #ff6b00;
        }


        /* =====================================================
           EMPTY
           ===================================================== */

        .empty-row {
            text-align: center;

            padding: 30px !important;

            color: #888;
        }


        /* =====================================================
           PAGINATION
           ===================================================== */

        .pagination-wrap {
            gap: 6px;
            flex-wrap: wrap;
        }


        .pagination-wrap button {
            min-width: 36px;
        }


        .pagination-wrap button.active-page {
            background: #ff6b00;

            border-color: #ff6b00;

            color: #fff;
        }


        /* =====================================================
           EXPORT DROPDOWN
           ===================================================== */

        .dropdown-item {
            cursor: pointer;
        }


        .dropdown-item:hover {
            background: #f8f9fa;
        }


        /* =====================================================
           PRINT
           ===================================================== */

        @media print {

            body {
                background: white;
            }

            .topbar,
            .page-header button,
            .page-header .dropdown,
            .filters,
            .pagination-wrap,
            .modal {
                display: none !important;
            }

            .content {
                padding: 20px;
            }

            .card-custom {
                border: none;
            }

            .card-title {
                border: none;
            }

            table {
                width: 100%;
            }

        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 768px) {

            .topbar {
                padding: 0 15px;
            }


            .search-box {
                width: 100%;
            }


            .content {
                padding: 25px 15px;
            }


            .page-header {
                align-items: flex-start;

                gap: 15px;

                flex-direction: column;
            }


            .filters {
                gap: 12px;

                align-items: flex-start;

                flex-direction: column;
            }


            .page-header > div:last-child {
                width: 100%;
            }

        }

        /* Keep sidebar appearance identical to Department page */
        .sidebar-menu a,
        .sidebar-menu a:hover,
        .sidebar-menu a:focus {
            text-decoration: none !important;
        }

    </style>

</head>


<body>


<!-- =====================================================
     MAIN
     ===================================================== -->

<div class="main-wrapper role-page">


    <!-- HEADER - SAME AS ADMIN DASHBOARD -->
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
                <span class="bar-icon"><span></span><span></span><span></span></span>
            </a>

            <div class="header-user">
                <div class="nav user-menu nav-list">
                    <div class="me-auto d-flex align-items-center" id="header-search">

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
                    <a class="dropdown-item" href="javascript:void(0);">Profile</a>
                    <a class="dropdown-item" href="javascript:void(0);">Settings</a>
                    <a class="dropdown-item" href="javascript:void(0);">Logout</a>
                </div>
            </div>

        </div>
    </div>
    <!-- SIDEBAR -->
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
                <li class="submenu active">
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


                        <li class="active">
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
        <div class="content">


            <!-- =================================================
                 PAGE HEADER
                 ================================================= -->

            <div class="page-header">


                <!-- PAGE TITLE -->

                <div>

                    <h1>
                        Roles
                    </h1>


                    <div class="breadcrumb">

                    <span>
                        <i class="bi bi-house"></i>
                    </span>

                        <span class="mx-2">
                        /
                    </span>

                        <span>
                        Employee
                    </span>

                        <span class="mx-2">
                        /
                    </span>

                        <span>
                        Role
                    </span>

                    </div>

                </div>


                <!-- =================================================
                     RIGHT BUTTONS
                     ================================================= -->

                <div class="d-flex align-items-center gap-2">


                    <!-- =================================================
                         EXPORT DROPDOWN
                         ================================================= -->

                    <div class="dropdown">


                        <button
                                type="button"
                                class="btn btn-light border dropdown-toggle"
                                data-bs-toggle="dropdown"
                                aria-expanded="false">

                            <i class="bi bi-file-earmark-arrow-down me-1"></i>

                            Export

                        </button>


                        <ul class="dropdown-menu dropdown-menu-end">


                            <!-- CSV -->

                            <li>

                                <button
                                        type="button"
                                        class="dropdown-item"
                                        onclick="exportRoleCSV()">

                                    <i class="bi bi-filetype-csv me-2"></i>

                                    Export CSV

                                </button>

                            </li>


                            <!-- PRINT -->

                            <li>

                                <button
                                        type="button"
                                        class="dropdown-item"
                                        onclick="printRoles()">

                                    <i class="bi bi-printer me-2"></i>

                                    Print

                                </button>

                            </li>


                        </ul>

                    </div>


                    <!-- =================================================
                         ADD ROLE
                         ================================================= -->

                    <button
                            type="button"
                            class="btn btn-orange"
                            data-bs-toggle="modal"
                            data-bs-target="#add_role">

                        <i class="bi bi-plus-circle me-1"></i>

                        Add Role

                    </button>


                </div>

            </div>
            <!-- END PAGE HEADER -->


            <!-- =====================================================
                 ROLE LIST CARD
                 ===================================================== -->

            <div class="card-custom">


                <!-- CARD TITLE -->

                <div class="card-title">

                    Role List

                </div>


                <!-- =================================================
                     FILTERS
                     ================================================= -->

                <div class="filters">


                    <!-- PAGE SIZE -->

                    <div class="d-flex align-items-center gap-2">

                        <label class="mb-0 fw-semibold">
                            Show
                        </label>


                        <select
                                id="pageSize"
                                class="form-select"
                                style="width: 90px;"
                                onchange="changePageSize()">

                            <option value="5" selected>
                                5
                            </option>

                            <option value="10">
                                10
                            </option>

                            <option value="25">
                                25
                            </option>

                            <option value="50">
                                50
                            </option>

                        </select>


                        <span class="text-muted">
                        entries
                    </span>

                    </div>


                    <!-- SEARCH -->

                    <div class="d-flex align-items-center">

                        <label class="me-2 mb-0">
                            Search:
                        </label>


                        <input
                                type="text"
                                id="roleSearch"
                                class="form-control"
                                style="width: 220px;"
                                placeholder="Search roles..."
                                onkeyup="searchRoles()">

                    </div>


                </div>


                <!-- =================================================
                     TABLE
                     ================================================= -->

                <div class="table-responsive">


                    <table class="table mb-0">


                        <!-- TABLE HEADER -->

                        <thead>

                        <tr>

                            <th>
                                Id
                            </th>

                            <th>
                                Role Name
                            </th>

                            <th>
                                Status
                            </th>

                            <th>
                                CreatedBy
                            </th>

                            <th>
                                ModifiedBy
                            </th>

                            <th>
                                Action
                            </th>

                        </tr>

                        </thead>


                        <!-- =================================================
                             TABLE BODY
                             ================================================= -->

                        <tbody id="roleTable">


                        <%
                            if (roles != null && !roles.isEmpty()) {

                                for (Role role : roles) {
                        %>


                        <tr>


                            <!-- ID -->

                            <td>
                                <%= role.getRoleId() %>
                            </td>


                            <!-- ROLE NAME -->

                            <td>
                                <%= role.getRoleName() %>
                            </td>


                            <!-- STATUS -->

                            <td>

                                <%
                                    if ("Active".equalsIgnoreCase(role.getStatus())) {
                                %>

                                <span class="status status-active">
                                ● Active
                            </span>

                                <%
                                } else {
                                %>

                                <span class="status status-inactive">
                                ● Inactive
                            </span>

                                <%
                                    }
                                %>

                            </td>


                            <!-- CREATED BY -->

                            <td>

                                <%= role.getCreatedBy() != null
                                        ? role.getCreatedBy()
                                        : "null" %>

                            </td>


                            <!-- MODIFIED BY -->

                            <td>

                                <%= role.getModifiedBy() != null
                                        ? role.getModifiedBy()
                                        : "null" %>

                            </td>


                            <!-- ACTION -->

                            <td>


                                <!-- EDIT -->

                                <button
                                        type="button"
                                        class="btn btn-sm btn-light me-1"
                                        data-bs-toggle="modal"
                                        data-bs-target="#edit_role"

                                        data-id="<%= role.getRoleId() %>"

                                        data-name="<%= role.getRoleName() %>"

                                        data-status="<%= role.getStatus() %>"

                                        onclick="editRole(this)">

                                    <i class="bi bi-pencil"></i>

                                </button>


                                <!-- DELETE -->

                                <form
                                        action="<%= contextPath %>/Employee/Role"
                                        method="post"
                                        style="display:inline;">


                                    <input
                                            type="hidden"
                                            name="action"
                                            value="delete">


                                    <input
                                            type="hidden"
                                            name="roleId"
                                            value="<%= role.getRoleId() %>">


                                    <button
                                            type="submit"
                                            class="action-btn delete-btn"

                                            onclick="return confirm('Are you sure you want to delete this role?');">

                                        <i class="bi bi-trash"></i>

                                    </button>


                                </form>


                            </td>


                        </tr>


                        <%
                            }

                        } else {
                        %>


                        <!-- EMPTY -->

                        <tr>

                            <td
                                    colspan="6"
                                    class="empty-row">

                                No roles found.

                            </td>

                        </tr>


                        <%
                            }
                        %>


                        </tbody>

                    </table>


                </div>


                <!-- =================================================
                     FOOTER
                     ================================================= -->

                <div
                        class="p-3 border-top d-flex justify-content-between align-items-center flex-wrap gap-3">


                <span id="paginationInfo">

                    Showing 0 to 0 of 0 entries

                </span>


                    <div
                            class="d-flex pagination-wrap"
                            id="paginationButtons">

                        <!-- Generated by JavaScript -->
                    </div>
                </div>
            </div>
        </div>


        <!-- =====================================================
             ADD ROLE MODAL
             ===================================================== -->

        <div
                class="modal fade"
                id="add_role"
                tabindex="-1"
                aria-hidden="true">


            <div class="modal-dialog modal-dialog-centered">


                <div class="modal-content">


                    <!-- HEADER -->

                    <div class="modal-header">

                        <h4 class="modal-title">
                            Add Role
                        </h4>


                        <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal">

                        </button>

                    </div>


                    <!-- FORM -->

                    <form
                            action="<%= contextPath %>/Employee/Role"
                            method="post">


                        <input
                                type="hidden"
                                name="action"
                                value="add">


                        <!-- BODY -->

                        <div class="modal-body pb-0">


                            <!-- ROLE NAME -->

                            <div class="mb-3">

                                <label class="form-label">
                                    Role Name
                                </label>


                                <input
                                        type="text"
                                        name="roleName"
                                        class="form-control"
                                        placeholder="Enter role name"
                                        required>

                            </div>


                            <!-- STATUS -->

                            <div class="mb-3">

                                <label class="form-label">
                                    Status
                                </label>


                                <select
                                        name="status"
                                        class="form-select"
                                        required>


                                    <option value="">
                                        Select
                                    </option>


                                    <option value="Active">
                                        Active
                                    </option>


                                    <option value="Inactive">
                                        Inactive
                                    </option>


                                </select>

                            </div>


                        </div>


                        <!-- FOOTER -->

                        <div class="modal-footer">


                            <button
                                    type="button"
                                    class="btn btn-light me-2"
                                    data-bs-dismiss="modal">

                                Cancel

                            </button>


                            <button
                                    type="submit"
                                    class="btn btn-primary">

                                Add Role

                            </button>


                        </div>


                    </form>


                </div>

            </div>

        </div>



        <!-- =====================================================
             EDIT ROLE MODAL
             ===================================================== -->

        <div
                class="modal fade"
                id="edit_role"
                tabindex="-1"
                aria-hidden="true">


            <div class="modal-dialog modal-dialog-centered">


                <div class="modal-content">


                    <!-- HEADER -->

                    <div class="modal-header">

                        <h4 class="modal-title">
                            Edit Role
                        </h4>


                        <button
                                type="button"
                                class="btn-close"
                                data-bs-dismiss="modal">

                        </button>

                    </div>


                    <!-- FORM -->

                    <form
                            action="<%= contextPath %>/Employee/Role"
                            method="post">


                        <!-- ACTION -->

                        <input
                                type="hidden"
                                name="action"
                                value="edit">


                        <!-- ROLE ID -->

                        <input
                                type="hidden"
                                name="roleId"
                                id="editRoleId">


                        <!-- BODY -->

                        <div class="modal-body pb-0">


                            <!-- ROLE NAME -->

                            <div class="mb-3">

                                <label class="form-label">
                                    Role Name
                                </label>


                                <input
                                        type="text"
                                        name="roleName"
                                        id="editRoleName"
                                        class="form-control"
                                        required>

                            </div>


                            <!-- STATUS -->

                            <div class="mb-3">

                                <label class="form-label">
                                    Status
                                </label>


                                <select
                                        name="status"
                                        id="editRoleStatus"
                                        class="form-select"
                                        required>


                                    <option value="Active">
                                        Active
                                    </option>


                                    <option value="Inactive">
                                        Inactive
                                    </option>


                                </select>

                            </div>


                        </div>


                        <!-- FOOTER -->

                        <div class="modal-footer">


                            <button
                                    type="button"
                                    class="btn btn-light me-2"
                                    data-bs-dismiss="modal">

                                Cancel

                            </button>


                            <button
                                    type="submit"
                                    class="btn btn-primary">

                                Save

                            </button>


                        </div>


                    </form>


                </div>

            </div>

        </div>



        <!-- =====================================================
             BOOTSTRAP JS
             ===================================================== -->


        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>




        <script>
            (function () {
                function initHRMSSidebar() {
                    var sidebar = document.querySelector('.sidebar-menu');
                    if (!sidebar) return;

                    sidebar.addEventListener('click', function (event) {
                        var link = event.target.closest('li.submenu > a');
                        if (!link || !sidebar.contains(link)) return;

                        event.preventDefault();
                        event.stopPropagation();

                        var currentItem = link.parentElement;
                        var parentList = currentItem.parentElement;
                        var isOpen = currentItem.classList.contains('active');

                        Array.prototype.forEach.call(parentList.children, function (item) {
                            if (item !== currentItem && item.classList.contains('submenu')) {
                                item.classList.remove('active');
                            }
                        });

                        currentItem.classList.toggle('active', !isOpen);
                    });
                }

                if (document.readyState === 'loading') {
                    document.addEventListener('DOMContentLoaded', initHRMSSidebar);
                } else {
                    initHRMSSidebar();
                }
            })();
        </script>

        <!-- =====================================================
             JAVASCRIPT
             ===================================================== -->

        <script>


            /* =====================================================
               EDIT ROLE
               ===================================================== */

            function editRole(button) {

                const roleId =
                    button.getAttribute("data-id");

                const roleName =
                    button.getAttribute("data-name");

                const status =
                    button.getAttribute("data-status");


                document.getElementById("editRoleId").value =
                    roleId;


                document.getElementById("editRoleName").value =
                    roleName;


                document.getElementById("editRoleStatus").value =
                    status;

            }



            /* =====================================================
               SEARCH + PAGINATION
               ===================================================== */

            let currentPage = 1;

            let rowsPerPage = 5;



            /* =====================================================
               GET ROLE ROWS
               ===================================================== */

            function getRoleRows() {

                return Array.from(
                    document.querySelectorAll("#roleTable tr")
                ).filter(function(row) {

                    return !row.querySelector(".empty-row");

                });

            }



            /* =====================================================
               GET FILTERED ROWS
               ===================================================== */

            function getFilteredRows() {

                const searchInput =
                    document.getElementById("roleSearch");


                const filter =
                    searchInput.value
                        .toLowerCase()
                        .trim();


                return getRoleRows().filter(function(row) {

                    return row.innerText
                        .toLowerCase()
                        .includes(filter);

                });

            }



            /* =====================================================
               RENDER TABLE
               ===================================================== */

            function renderTable() {


                rowsPerPage =
                    parseInt(
                        document.getElementById("pageSize").value
                    );


                const allRows =
                    getRoleRows();


                const filteredRows =
                    getFilteredRows();


                /* HIDE ALL ROWS */

                allRows.forEach(function(row) {

                    row.style.display = "none";

                });


                const total =
                    filteredRows.length;


                const totalPages =
                    Math.max(
                        1,
                        Math.ceil(total / rowsPerPage)
                    );


                /* FIX CURRENT PAGE */

                if (currentPage > totalPages) {

                    currentPage = totalPages;

                }


                const start =
                    (currentPage - 1) * rowsPerPage;


                const end =
                    Math.min(
                        start + rowsPerPage,
                        total
                    );


                /* SHOW CURRENT PAGE */

                filteredRows
                    .slice(start, end)
                    .forEach(function(row) {

                        row.style.display = "";

                    });


                /* PAGINATION INFO */

                const info =
                    document.getElementById(
                        "paginationInfo"
                    );


                if (total === 0) {

                    info.innerText =
                        "Showing 0 to 0 of 0 entries";

                } else {

                    info.innerText =
                        "Showing "
                        + (start + 1)
                        + " to "
                        + end
                        + " of "
                        + total
                        + " entries";

                }


                /* PAGINATION BUTTONS */

                renderPagination(totalPages);

            }



            /* =====================================================
               RENDER PAGINATION
               ===================================================== */

            function renderPagination(totalPages) {


                const container =
                    document.getElementById(
                        "paginationButtons"
                    );


                container.innerHTML = "";


                /* FIRST */

                const first =
                    createPageButton(
                        "«",
                        1,
                        currentPage === 1
                    );


                /* PREVIOUS */

                const prev =
                    createPageButton(
                        "‹",
                        currentPage - 1,
                        currentPage === 1
                    );


                container.appendChild(first);

                container.appendChild(prev);


                /* PAGE NUMBERS */

                let startPage =
                    Math.max(
                        1,
                        currentPage - 2
                    );


                let endPage =
                    Math.min(
                        totalPages,
                        startPage + 4
                    );


                if (endPage - startPage < 4) {

                    startPage =
                        Math.max(
                            1,
                            endPage - 4
                        );

                }


                for (
                    let i = startPage;
                    i <= endPage;
                    i++
                ) {


                    const btn =
                        createPageButton(
                            i,
                            i,
                            false
                        );


                    if (i === currentPage) {

                        btn.classList.add(
                            "active-page"
                        );

                    }


                    container.appendChild(btn);

                }


                /* NEXT */

                const next =
                    createPageButton(
                        "›",
                        currentPage + 1,
                        currentPage === totalPages
                    );


                /* LAST */

                const last =
                    createPageButton(
                        "»",
                        totalPages,
                        currentPage === totalPages
                    );


                container.appendChild(next);

                container.appendChild(last);

            }



            /* =====================================================
               CREATE PAGINATION BUTTON
               ===================================================== */

            function createPageButton(
                label,
                page,
                disabled
            ) {


                const btn =
                    document.createElement(
                        "button"
                    );


                btn.type = "button";


                btn.className =
                    "btn btn-sm btn-light border";


                btn.innerText =
                    label;


                btn.disabled =
                    disabled;


                btn.onclick =
                    function() {

                        currentPage = page;

                        renderTable();

                    };


                return btn;

            }



            /* =====================================================
               SEARCH ROLES
               ===================================================== */

            function searchRoles() {

                currentPage = 1;

                renderTable();

            }



            /* =====================================================
               CHANGE PAGE SIZE
               ===================================================== */

            function changePageSize() {

                currentPage = 1;

                renderTable();

            }



            /* =====================================================
               EXPORT ROLE CSV
               ===================================================== */

            function exportRoleCSV() {


                const rows =
                    getFilteredRows();


                if (rows.length === 0) {

                    alert(
                        "No roles available to export."
                    );

                    return;

                }


                let csv = [];


                /* CSV HEADER */

                csv.push(
                    [
                        "Id",
                        "Role Name",
                        "Status",
                        "CreatedBy",
                        "ModifiedBy"
                    ].join(",")
                );


                /* CSV DATA */

                rows.forEach(function(row) {


                    const cells =
                        row.querySelectorAll("td");


                    let data = [];


                    for (
                        let i = 0;
                        i < 5;
                        i++
                    ) {


                        let value =
                            cells[i].innerText
                                .trim()
                                .replace(
                                    /"/g,
                                    '""'
                                );


                        data.push(
                            '"' + value + '"'
                        );

                    }


                    csv.push(
                        data.join(",")
                    );

                });


                /* CREATE CSV FILE */

                const blob =
                    new Blob(
                        [csv.join("\n")],
                        {
                            type:
                                "text/csv;charset=utf-8;"
                        }
                    );


                const url =
                    URL.createObjectURL(blob);


                const link =
                    document.createElement("a");


                link.href =
                    url;


                link.download =
                    "roles.csv";


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



            /* =====================================================
               PRINT ROLES
               ===================================================== */

            function printRoles() {


                const rows =
                    getFilteredRows();


                if (rows.length === 0) {

                    alert(
                        "No roles available to print."
                    );

                    return;

                }


                let printWindow =
                    window.open(
                        "",
                        "_blank"
                    );


                if (!printWindow) {

                    alert(
                        "Please allow pop-ups to print."
                    );

                    return;

                }


                let html = `

            <!DOCTYPE html>

            <html>

            <head>

                <title>
                    Role List
                </title>

                <style>

                    body {
                        font-family:
                            Arial,
                            sans-serif;

                        padding: 30px;
                    }


                    h2 {
                        margin-bottom: 20px;
                    }


                    table {
                        width: 100%;
                        border-collapse:
                            collapse;
                    }


                    th,
                    td {
                        border:
                            1px solid #ccc;

                        padding: 10px;

                        text-align:
                            left;
                    }


                    th {
                        background:
                            #f1f1f1;
                    }

                </style>

            </head>


            <body>

                <h2>
                    Role List
                </h2>


                <table>

                    <thead>

                        <tr>

                            <th>
                                Id
                            </th>

                            <th>
                                Role Name
                            </th>

                            <th>
                                Status
                            </th>

                            <th>
                                CreatedBy
                            </th>

                            <th>
                                ModifiedBy
                            </th>

                        </tr>

                    </thead>


                    <tbody>
        `;


                rows.forEach(function(row) {


                    const cells =
                        row.querySelectorAll("td");


                    html += `

                <tr>

                    <td>
                        ${cells[0].innerText}
                    </td>

                    <td>
                        ${cells[1].innerText}
                    </td>

                    <td>
                        ${cells[2].innerText}
                    </td>

                    <td>
                        ${cells[3].innerText}
                    </td>

                    <td>
                        ${cells[4].innerText}
                    </td>

                </tr>

            `;

                });


                html += `

                    </tbody>

                </table>

            </body>

            </html>

        `;


                printWindow.document.write(
                    html
                );


                printWindow.document.close();


                printWindow.focus();


                printWindow.print();


                printWindow.close();

            }



            /* =====================================================
               PAGE LOAD
               ===================================================== */

            document.addEventListener(
                "DOMContentLoaded",
                function() {

                    renderTable();

                }
            );

        </script>


</body>

</html>



<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<%@ taglib prefix="c"
           uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description"
          content="HRMS Trainer List">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Trainer List">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

    <title>Trainer List | HRMS</title>


    <!-- FAVICON -->
    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">


    <!-- THEME SCRIPT -->
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>


    <!-- BOOTSTRAP -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">


    <!-- FEATHER ICONS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">


    <!-- TABLER ICONS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">


    <!-- SELECT2 -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">


    <!-- FONT AWESOME -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">


    <!-- DATETIME PICKER -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">


    <!-- DATE RANGE PICKER -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">


    <!-- FLATPICKR -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">


    <!-- MAIN STYLE -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">


    <!-- TRAINER LIST STYLE -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/trainer-list.css">


    <!-- ========================================================= -->
    <!-- SIDEBAR CSS -->
    <!-- ========================================================= -->

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

        /*
         * All submenu ULs are closed by default.
         */
        .sidebar-menu li.submenu > ul {
            display: none !important;
        }

        /*
         * Only active submenu is displayed.
         */
        .sidebar-menu li.submenu.active > ul {
            display: block !important;
        }

        /*
         * Arrow animation.
         */
        .sidebar-menu li.submenu > a .menu-arrow {
            transition: transform 0.2s ease;
        }

        /*
         * Rotate arrow when submenu is open.
         */
        .sidebar-menu li.submenu.active > a .menu-arrow {
            transform: rotate(90deg);
        }

        /*
         * Nested submenu links.
         */
        .sidebar-menu li.submenu > ul > li > a {
            display: flex;
            align-items: center;
        }


        /* ===================================================== */
        /* ADD TRAINER BUTTON */
        /* ===================================================== */

        .btn-add {
            display: inline-flex;
            align-items: center;
            justify-content: center;

            padding: 8px 16px;

            border-radius: 6px;

            background-color: #ff6b2c;

            color: #ffffff !important;

            border: 1px solid #ff6b2c;

            text-decoration: none;

            font-weight: 500;
        }

        .btn-add:hover {
            background-color: #e85a20;
            border-color: #e85a20;
            color: #ffffff !important;
        }


        /* ===================================================== */
        /* TRAINER PROFILE IMAGE */
        /* ===================================================== */

        .trainer-avatar {
            width: 35px;
            height: 35px;

            object-fit: cover;

            border-radius: 50%;

            margin-right: 8px;

            vertical-align: middle;
        }

        .trainer-name {
            vertical-align: middle;
        }


        /* ===================================================== */
        /* ACTION BUTTONS */
        /* ===================================================== */

        .trainer-table .btn {
            width: 34px;
            height: 34px;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            padding: 0;
        }


        /* ===================================================== */
        /* EMPTY TABLE */
        /* ===================================================== */

        .empty {
            text-align: center;
            padding: 30px !important;
            color: #777;
        }

    </style>

</head>


<body>


<!-- ========================================================= -->
<!-- GLOBAL LOADER -->
<!-- ========================================================= -->

<div id="global-loader">
    <div class="page-loader"></div>
</div>


<div class="main-wrapper">


    <!-- ========================================================= -->
    <!-- HEADER -->
    <!-- ========================================================= -->

    <div class="header">

        <div class="main-header">


            <div class="header-left">

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="logo">

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


            <!-- MOBILE BUTTON -->

            <a id="mobile_btn"
               class="mobile_btn"
               href="#sidebar">

                <span class="bar-icon">

                    <span></span>
                    <span></span>
                    <span></span>

                </span>

            </a>


            <!-- HEADER USER -->

            <div class="header-user">

                <div class="nav user-menu nav-list">

                    <div class="me-auto d-flex align-items-center"
                         id="header-search">


                        <!-- SIDEBAR TOGGLE -->

                        <a id="toggle_btn"
                           href="javascript:void(0);"
                           class="btn btn-menubar me-1">

                            <i class="ti ti-arrow-bar-to-left"></i>

                        </a>


                        <!-- SEARCH -->

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


                        <!-- SETTINGS -->

                        <a href="javascript:void(0);"
                           class="btn btn-menubar">

                            <i class="ti ti-settings-cog"></i>

                        </a>

                    </div>

                </div>

            </div>


            <!-- MOBILE USER -->

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


    <!-- ========================================================= -->
    <!-- SIDEBAR -->
    <!-- ========================================================= -->

    <div class="sidebar"
         id="sidebar">


        <!-- SIDEBAR LOGO -->

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


                <!-- ================================================= -->
                <!-- DASHBOARD -->
                <!-- ================================================= -->

                <li>

                    <a href="${pageContext.request.contextPath}/admin/dashboard">

                        <i class="ti ti-smart-home"></i>

                        <span>Dashboard</span>

                    </a>

                </li>


                <!-- ================================================= -->
                <!-- EMPLOYEES -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- ATTENDANCE -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- EVENTS -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- PAYROLL -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- TRAINING -->
                <!-- ================================================= -->

                <li class="submenu active">

                    <a href="javascript:void(0);">

                        <i class="ti ti-school"></i>

                        <span>Training</span>

                        <span class="menu-arrow"></span>

                    </a>


                    <ul>

                        <li class="active">

                            <a href="${pageContext.request.contextPath}/trainerList">

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


                <!-- ================================================= -->
                <!-- DOCUMENTS -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- MASTER DOCUMENT -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- PERFORMANCE & GOAL -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- PROJECTS -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- REPORTS -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- PROMOTIONS -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- RESIGNATION -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- TERMINATION -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- HELP & SUPPORT -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- TICKETS -->
                <!-- ================================================= -->

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


                <!-- ================================================= -->
                <!-- LOGOUT -->
                <!-- ================================================= -->

                <li class="mt-2">

                    <a href="javascript:void(0);">

                        <i class="ti ti-logout"></i>

                        <span>Logout</span>

                    </a>

                </li>


            </ul>

        </div>

    </div>


    <!-- ========================================================= -->
    <!-- TRAINER PAGE -->
    <!-- ========================================================= -->

    <div class="page-wrapper">

        <div class="content">


            <!-- ===================================================== -->
            <!-- PAGE HEADER -->
            <!-- ===================================================== -->

            <div class="page-header">

                <div class="row align-items-center">


                    <div class="col-sm-6">

                        <h3 class="page-title">
                            Trainers
                        </h3>


                        <ul class="breadcrumb">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">

                                    Dashboard

                                </a>

                            </li>


                            <li class="breadcrumb-item">

                                Training

                            </li>


                            <li class="breadcrumb-item active">

                                Trainer List

                            </li>

                        </ul>

                    </div>


                    <div class="col-sm-6 text-sm-end mt-3 mt-sm-0">

                        <a href="${pageContext.request.contextPath}/addTrainer"
                           class="btn btn-add">

                            <i class="ti ti-circle-plus me-1"></i>

                            Add Trainer

                        </a>

                    </div>

                </div>

            </div>


            <!-- ===================================================== -->
            <!-- TRAINER CARD -->
            <!-- ===================================================== -->

            <div class="card trainer-card">


                <div class="card-header">

                    <h5 class="card-title mb-0">

                        Trainer List

                    </h5>

                </div>


                <div class="card-body">


                    <!-- ================================================= -->
                    <!-- TOOLBAR -->
                    <!-- ================================================= -->

                    <div class="trainer-toolbar">

                        <label class="mb-0">

                            Rows per page

                            <select id="pageSize">

                                <option value="5">
                                    5
                                </option>

                                <option value="10">
                                    10
                                </option>

                                <option value="25">
                                    25
                                </option>

                            </select>

                        </label>


                        <input id="trainerSearch"
                               type="search"
                               placeholder="Search trainers">

                    </div>


                    <!-- ================================================= -->
                    <!-- TABLE -->
                    <!-- ================================================= -->

                    <div class="table-responsive">

                        <table class="table trainer-table mb-0"
                               id="trainerTable">


                            <thead>

                            <tr>

                                <th>
                                    Trainer ID
                                </th>

                                <th>
                                    Trainer Name
                                </th>

                                <th>
                                    Role
                                </th>

                                <th>
                                    Email
                                </th>

                                <th>
                                    Phone
                                </th>

                                <th>
                                    Description
                                </th>

                                <th>
                                    Status
                                </th>

                                <th class="text-end">
                                    Actions
                                </th>

                            </tr>

                            </thead>


                            <tbody>


                            <c:choose>


                                <c:when test="${not empty trainers}">


                                    <c:forEach items="${trainers}"
                                               var="trainer">


                                        <tr>


                                            <!-- TRAINER ID -->

                                            <td>

                                                ${trainer.trainerId}

                                            </td>


                                            <!-- TRAINER NAME -->

                                            <td>


                                                <c:choose>


                                                    <c:when test="${not empty trainer.profilePicture}">

                                                        <img src="${pageContext.request.contextPath}/trainerImage?id=${trainer.trainerId}"
                                                             alt="${trainer.firstName}"
                                                             class="trainer-avatar">

                                                    </c:when>


                                                    <c:otherwise>

                                                        <span class="avatar avatar-sm bg-light text-primary me-2">

                                                            <i class="ti ti-user"></i>

                                                        </span>

                                                    </c:otherwise>


                                                </c:choose>


                                                <span class="trainer-name">

                                                    ${trainer.firstName}
                                                    ${trainer.lastName}

                                                </span>


                                            </td>


                                            <!-- ROLE -->

                                            <td>

                                                ${trainer.role}

                                            </td>


                                            <!-- EMAIL -->

                                            <td>

                                                ${trainer.email}

                                            </td>


                                            <!-- PHONE -->

                                            <td>

                                                ${trainer.phone}

                                            </td>


                                            <!-- DESCRIPTION -->

                                            <td>

                                                ${trainer.description}

                                            </td>


                                            <!-- STATUS -->

                                            <td>


                                                <a href="${pageContext.request.contextPath}/changeTrainerStatus?id=${trainer.trainerId}"
                                                   style="text-decoration: none;"
                                                   title="Click to change status"
                                                   onclick="return confirm('Change trainer status?');">


                                                    <c:choose>


                                                        <c:when test="${trainer.status eq 'Active'}">

                                                            <span class="badge bg-success">

                                                                ${trainer.status}

                                                            </span>

                                                        </c:when>


                                                        <c:otherwise>

                                                            <span class="badge bg-danger">

                                                                ${trainer.status}

                                                            </span>

                                                        </c:otherwise>


                                                    </c:choose>


                                                </a>


                                            </td>


                                            <!-- ================================================= -->
                                            <!-- ACTIONS -->
                                            <!-- ================================================= -->

                                            <td class="text-end">


                                                <!-- EDIT -->

                                                <a href="${pageContext.request.contextPath}/editTrainer?id=${trainer.trainerId}"
                                                   class="btn btn-sm btn-outline-primary"
                                                   title="Edit Trainer">

                                                    <i class="ti ti-edit"></i>

                                                </a>


                                                <!-- DELETE -->

                                                <form action="${pageContext.request.contextPath}/deleteTrainer"
                                                      method="post"
                                                      style="display: inline;"
                                                      onsubmit="return confirm('Are you sure you want to delete this trainer?');">


                                                    <input type="hidden"
                                                           name="id"
                                                           value="${trainer.trainerId}">


                                                    <button type="submit"
                                                            class="btn btn-sm btn-outline-danger"
                                                            title="Delete Trainer">

                                                        <i class="ti ti-trash"></i>

                                                    </button>


                                                </form>


                                            </td>


                                        </tr>


                                    </c:forEach>


                                </c:when>


                                <c:otherwise>


                                    <tr>

                                        <td colspan="8"
                                            class="empty">

                                            No trainers found.

                                        </td>

                                    </tr>


                                </c:otherwise>


                            </c:choose>


                            </tbody>

                        </table>

                    </div>


                    <!-- ================================================= -->
                    <!-- PAGINATION -->
                    <!-- ================================================= -->

                    <div class="d-flex justify-content-between align-items-center pt-3">


                        <span id="tableInfo"></span>


                        <ul class="pagination mb-0"
                            id="pagination">

                        </ul>


                    </div>


                </div>

            </div>


        </div>


        <!-- ===================================================== -->
        <!-- FOOTER -->
        <!-- ===================================================== -->

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

            <p class="mb-0">

                2025 - 2026 &copy; HRMS.

            </p>

        </div>


    </div>


</div>


<!-- ========================================================= -->
<!-- DASHBOARD JAVASCRIPT -->
<!-- ========================================================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/todo.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/chartjs/chart.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/chartjs/chart-data.js"></script>


<!-- ========================================================= -->
<!-- PERFECT SIDEBAR SUBMENU SCRIPT -->
<!-- ========================================================= -->

<script>

    (function () {

        function initHRMSSidebar() {

            var sidebar =
                document.querySelector(".sidebar-menu");


            if (!sidebar) {
                return;
            }


            sidebar.addEventListener("click", function (event) {


                /*
                 * Find the submenu link that was clicked.
                 */

                var link =
                    event.target.closest("li.submenu > a");


                /*
                 * Ignore normal links.
                 */

                if (!link || !sidebar.contains(link)) {
                    return;
                }


                /*
                 * Prevent javascript:void(0)
                 * from navigating.
                 */

                event.preventDefault();

                event.stopPropagation();


                /*
                 * Current submenu.
                 */

                var currentItem =
                    link.parentElement;


                /*
                 * Parent UL.
                 */

                var parentList =
                    currentItem.parentElement;


                /*
                 * Check whether current submenu
                 * is already open.
                 */

                var isOpen =
                    currentItem.classList.contains("active");


                /*
                 * Close only sibling submenus.
                 *
                 * This is important for nested menus.
                 *
                 * Example:
                 *
                 * Attendance
                 *    └── Leaves
                 *
                 * Opening Leaves should NOT
                 * accidentally close Attendance.
                 */

                Array.prototype.forEach.call(
                    parentList.children,
                    function (item) {

                        if (
                            item !== currentItem &&
                            item.classList.contains("submenu")
                        ) {

                            item.classList.remove("active");

                        }

                    }
                );


                /*
                 * Toggle current submenu.
                 */

                if (isOpen) {

                    currentItem.classList.remove("active");

                } else {

                    currentItem.classList.add("active");

                }

            });

        }


        /*
         * Initialize after DOM is ready.
         */

        if (document.readyState === "loading") {

            document.addEventListener(
                "DOMContentLoaded",
                initHRMSSidebar
            );

        } else {

            initHRMSSidebar();

        }

    })();

</script>


<!-- ========================================================= -->
<!-- TRAINER SEARCH + PAGINATION -->
<!-- ========================================================= -->

<script>

    (function () {


        var table =
            document.getElementById("trainerTable");


        var search =
            document.getElementById("trainerSearch");


        var pageSize =
            document.getElementById("pageSize");


        var tableInfo =
            document.getElementById("tableInfo");


        var pagination =
            document.getElementById("pagination");


        var page = 1;


        /*
         * Get only real trainer rows.
         *
         * Empty-state row contains only one cell,
         * therefore it is ignored.
         */

        var rows =
            Array.prototype.slice.call(
                table.tBodies[0].rows
            ).filter(function (row) {

                return row.cells.length > 1;

            });


        function renderTable() {


            /*
             * Get search value.
             */

            var searchText =
                search.value
                    .toLowerCase()
                    .trim();


            /*
             * Filter trainers.
             */

            var filteredRows =
                rows.filter(function (row) {

                    return row.textContent
                        .toLowerCase()
                        .includes(searchText);

                });


            /*
             * Rows per page.
             */

            var size =
                Number(pageSize.value);


            /*
             * Calculate total pages.
             */

            var totalPages =
                Math.max(
                    1,
                    Math.ceil(
                        filteredRows.length / size
                    )
                );


            /*
             * Keep page inside valid range.
             */

            if (page > totalPages) {

                page = totalPages;

            }


            if (page < 1) {

                page = 1;

            }


            /*
             * Hide every trainer row first.
             */

            rows.forEach(function (row) {

                row.style.display = "none";

            });


            /*
             * Current page indexes.
             */

            var start =
                (page - 1) * size;


            var end =
                page * size;


            /*
             * Display current page rows.
             */

            filteredRows
                .slice(start, end)
                .forEach(function (row) {

                    row.style.display = "";

                });


            /*
             * Table information.
             */

            if (filteredRows.length === 0) {

                tableInfo.textContent =
                    "Showing 0 entries";

            } else {

                tableInfo.textContent =
                    "Showing "
                    + (start + 1)
                    + " to "
                    + Math.min(
                        end,
                        filteredRows.length
                    )
                    + " of "
                    + filteredRows.length
                    + " entries";

            }


            /*
             * Clear old pagination.
             */

            pagination.innerHTML = "";


            /* ================================================= */
            /* PREVIOUS */
            /* ================================================= */

            var previousItem =
                document.createElement("li");


            previousItem.className =
                "page-item";


            if (page === 1) {

                previousItem.classList.add("disabled");

            }


            var previousButton =
                document.createElement("button");


            previousButton.type =
                "button";


            previousButton.className =
                "page-link";


            previousButton.textContent =
                "Previous";


            previousItem.appendChild(
                previousButton
            );


            previousItem.addEventListener(
                "click",
                function () {

                    if (page > 1) {

                        page--;

                        renderTable();

                    }

                }
            );


            pagination.appendChild(
                previousItem
            );


            /* ================================================= */
            /* PAGE NUMBERS */
            /* ================================================= */

            for (
                var i = 1;
                i <= totalPages;
                i++
            ) {


                var item =
                    document.createElement("li");


                item.className =
                    "page-item";


                if (i === page) {

                    item.classList.add("active");

                }


                var button =
                    document.createElement("button");


                button.type =
                    "button";


                button.className =
                    "page-link";


                button.textContent =
                    i;


                (function (pageNumber) {

                    button.addEventListener(
                        "click",
                        function () {

                            page =
                                pageNumber;

                            renderTable();

                        }
                    );

                })(i);


                item.appendChild(
                    button
                );


                pagination.appendChild(
                    item
                );

            }


            /* ================================================= */
            /* NEXT */
            /* ================================================= */

            var nextItem =
                document.createElement("li");


            nextItem.className =
                "page-item";


            if (page === totalPages) {

                nextItem.classList.add("disabled");

            }


            var nextButton =
                document.createElement("button");


            nextButton.type =
                "button";


            nextButton.className =
                "page-link";


            nextButton.textContent =
                "Next";


            nextItem.appendChild(
                nextButton
            );


            nextItem.addEventListener(
                "click",
                function () {

                    if (page < totalPages) {

                        page++;

                        renderTable();

                    }

                }
            );


            pagination.appendChild(
                nextItem
            );

        }


        /* ===================================================== */
        /* SEARCH */
        /* ===================================================== */

        search.addEventListener(
            "input",
            function () {

                page = 1;

                renderTable();

            }
        );


        /* ===================================================== */
        /* PAGE SIZE */
        /* ===================================================== */

        pageSize.addEventListener(
            "change",
            function () {

                page = 1;

                renderTable();

            }
        );


        /* ===================================================== */
        /* INITIAL LOAD */
        /* ===================================================== */

        renderTable();


    })();

</script>


</body>

</html>
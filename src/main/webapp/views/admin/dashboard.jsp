<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="HRMS Admin Dashboard">
    <meta name="keywords" content="HRMS, Human Resource Management System, Admin Dashboard">
    <meta name="author" content="HRMS Team">
    <meta name="robots" content="noindex, nofollow">

    <title>HRMS Admin Dashboard</title>

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
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">


    <style>
        /* =========================
           HRMS SIDEBAR / DASHBOARD FIX
           ========================= */

        .sidebar {
            height: 100vh !important;
            overflow-y: auto !important;
            overflow-x: hidden !important;
            scrollbar-width: thin;
            scrollbar-color: #cfd4dc transparent;
        }

        .sidebar::-webkit-scrollbar {
            width: 5px;
        }

        .sidebar::-webkit-scrollbar-track {
            background: transparent;
        }

        .sidebar::-webkit-scrollbar-thumb {
            background: #cfd4dc;
            border-radius: 10px;
        }

        .sidebar-menu {
            height: auto !important;
            overflow: visible !important;
            padding-bottom: 20px;
        }

        /* Remove browser default bullets/indentation */
        .sidebar-menu ul {
            list-style: none !important;
            margin: 0 !important;
            padding: 0 !important;
        }

        .sidebar-menu li {
            list-style: none !important;
        }

        /* Main menu links */
        .sidebar-menu > ul > li > a {
            display: flex;
            align-items: center;
            min-height: 44px;
            margin: 2px 8px;
            border-radius: 6px;
            transition: all .2s ease;
        }

        .sidebar-menu > ul > li > a:hover {
            background: #f3f6fb;
        }

        .sidebar-menu > ul > li.active > a {
            background: #fff4ec;
            color: #f97316;
        }

        .sidebar-menu > ul > li.active > a i {
            color: #f97316;
        }

        /* All submenu levels stay hidden until their parent is active */
        .sidebar-menu li.submenu > ul {
            display: none !important;
            width: 100%;
            background: transparent;
        }

        .sidebar-menu li.submenu.active > ul {
            display: block !important;
        }

        .sidebar-menu li.submenu > a {
            cursor: pointer;
        }

        .sidebar-menu li.submenu > a .menu-arrow {
            margin-left: auto;
            transition: transform .2s ease;
        }

        .sidebar-menu li.submenu.active > a .menu-arrow {
            transform: rotate(90deg);
        }

        /* First-level submenu items */
        .sidebar-menu li.submenu > ul > li > a {
            display: flex;
            align-items: center;
            min-height: 38px;
            margin: 1px 8px;
            padding: 7px 15px 7px 48px !important;
            border-radius: 5px;
            font-size: 13px;
            transition: all .2s ease;
        }

        .sidebar-menu li.submenu > ul > li > a:hover {
            background: #f6f8fb;
            color: #0d6efd;
        }

        /* Nested submenu */
        .sidebar-menu li.submenu > ul > li.submenu > a {
            padding-left: 48px !important;
        }

        .sidebar-menu li.submenu > ul > li.submenu > ul > li > a {
            padding-left: 68px !important;
            font-size: 12.5px;
        }

        /* Menu title */
        .sidebar-menu .menu-title {
            padding: 18px 20px 8px !important;
        }

        .sidebar-menu .menu-title span {
            font-size: 10px;
            font-weight: 700;
            letter-spacing: .7px;
            color: #98a2b3;
        }

        /* HR action links */
        .sidebar-menu > ul > li > a[href*="/promotion"] i {
            color: #7c3aed;
        }

        .sidebar-menu > ul > li > a[href*="/resignation"] i {
            color: #f97316;
        }

        .sidebar-menu > ul > li > a[href*="/termination"] i {
            color: #ef4444;
        }

        .sidebar-menu > ul > li > a[href*="/promotion"]:hover {
            background: #f4efff;
        }

        .sidebar-menu > ul > li > a[href*="/resignation"]:hover {
            background: #fff5eb;
        }

        .sidebar-menu > ul > li > a[href*="/termination"]:hover {
            background: #fff0f0;
        }

        /* Profile */
        .modern-profile .user-profile {
            border: 1px solid #edf0f5;
            box-shadow: 0 3px 12px rgba(16, 24, 40, .04);
        }

        .modern-profile .avatar-lg img {
            object-fit: cover;
        }

        /* Dashboard */
        .page-wrapper {
            background: #f7f8fa;
        }

        .page-wrapper .content {
            min-height: calc(100vh - 70px);
        }

        .page-wrapper .card {
            border: 1px solid #edf0f5;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(16, 24, 40, .025);
        }

        .page-wrapper .card-header {
            background: transparent;
            border-bottom: 1px solid #f0f2f5;
        }

        .page-wrapper .table > :not(caption) > * > * {
            vertical-align: middle;
        }

        #emp-department {
            min-height: 260px;
        }

        .attendance-canvas {
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            pointer-events: none;
        }

        .emp-stack {
            height: 8px;
            border-radius: 20px;
            overflow: hidden;
        }

        .emp-stack .progress {
            height: 8px;
        }

        @media (max-width: 991px) {
            .sidebar {
                height: 100vh !important;
            }
        }

        @media (max-width: 767px) {
            .page-wrapper .card {
                border-radius: 8px;
            }

            .sidebar-menu > ul > li > a {
                margin-left: 5px;
                margin-right: 5px;
            }
        }
    </style>
</head>

<body>

<div id="global-loader">
    <div class="page-loader"></div>
</div>

<div class="main-wrapper">

    <!-- HEADER -->
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
                <li class="active">
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

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Admin Dashboard</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/Admin/dashboard"><i class="ti ti-smart-home"></i></a>
                            </li>
                            <li class="breadcrumb-item">
                                Dashboard
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Admin Dashboard</li>
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
                        <div class="input-icon w-120 position-relative">
                         <span class="input-icon-addon">
                            <i class="ti ti-calendar text-gray-9"></i>
                         </span>
                            <input type="text" class="form-control yearpicker" value="2025">
                        </div>
                    </div>
                    <div class="ms-2 head-icons">
                        <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                            <i class="ti ti-chevrons-up"></i>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Welcome Wrap -->
            <div class="card border-0">
                <div class="card-body d-flex align-items-center justify-content-between flex-wrap pb-1">
                    <div class="d-flex align-items-center mb-3">
                      <span class="avatar avatar-xl flex-shrink-0">
                         <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-31.jpg" class="rounded-circle" alt="img">
                      </span>
                        <div class="ms-3">
                            <h3 class="mb-2">Welcome Back, Adrian <a href="javascript:void(0);" class="edit-icon"><i class="ti ti-edit fs-14"></i></a></h3>
                            <p>You have <span class="text-primary text-decoration-underline">${pendingLeaves}</span> Pending Approvals & <span class="text-primary text-decoration-underline">${onLeave}</span> Employees On Leave Today</p>
                        </div>
                    </div>
                    <div class="d-flex align-items-center flex-wrap mb-1">
                        <a href="javascript:void(0);" class="btn btn-secondary btn-md me-2 mb-2" data-bs-toggle="modal" data-bs-target="#add_project"><i class="ti ti-square-rounded-plus me-1"></i>Add Project</a>
                        <a href="javascript:void(0);" class="btn btn-primary btn-md mb-2" data-bs-toggle="modal" data-bs-target="#add_leaves"><i class="ti ti-square-rounded-plus me-1"></i>Add Requests</a>
                    </div>
                </div>
            </div>

            <!-- /Welcome Wrap -->

            <div class="row">

                <!-- Widget Info -->
                <div class="col-xxl-8 d-flex">
                    <div class="row flex-fill">
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                               <span class="avatar rounded-circle bg-primary mb-2">
                                  <i class="ti ti-calendar-share fs-16"></i>
                               </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Attendance Overview</h6>
                                    <h3 class="mb-3">${presentToday}/${totalEmployees} <span class="fs-12 fw-medium text-success"><i class="fa-solid fa-caret-up me-1"></i>+2.1%</span></h3>
                                    <a href="javascript:void(0);" class="link-default">View Details</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                               <span class="avatar rounded-circle bg-secondary mb-2">
                                  <i class="ti ti-browser fs-16"></i>
                               </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Total No of Project's</h6>
                                        <h3 class="mb-3">${totalProjects} <span class="fs-12 fw-medium text-danger">
                                        <i class="fa-solid fa-caret-down me-1"></i>-2.1%</span></h3>
                                    <a href="javascript:void(0);" class="link-default">View All</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                               <span class="avatar rounded-circle bg-info mb-2">
                                  <i class="ti ti-users-group fs-16"></i>
                               </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Total No of Clients</h6>
                                    <h3 class="mb-3">${totalClients} <span class="fs-12 fw-medium text-danger"><i class="fa-solid fa-caret-down me-1"></i>-11.2%</span></h3>
                                    <a href="javascript:void(0);" class="link-default">View All</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                               <span class="avatar rounded-circle bg-pink mb-2">
                                  <i class="ti ti-checklist fs-16"></i>
                               </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Total No of Tasks</h6>
                                    <h3 class="mb-3">${totalTasks} <span class="fs-12 fw-medium text-success"><i class="fa-solid fa-caret-down me-1"></i>+11.2%</span></h3>
                                    <a href="javascript:void(0);" class="link-default">View All</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                               <span class="avatar rounded-circle bg-purple mb-2">
                                  <i class="ti ti-moneybag fs-16"></i>
                               </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Earnings</h6>
                                    <h3 class="mb-3">$${totalEarnings} <span class="fs-12 fw-medium text-success"><i class="fa-solid fa-caret-up me-1"></i>+10.2%</span></h3>
                                    <a href="javascript:void(0);" class="link-default">View All</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                               <span class="avatar rounded-circle bg-danger mb-2">
                                  <i class="ti ti-browser fs-16"></i>
                               </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Profit This Week</h6>
                                    <h3 class="mb-3">$5,544 <span class="fs-12 fw-medium text-success"><i class="fa-solid fa-caret-up me-1"></i>+2.1%</span></h3>
                                    <a href="javascript:void(0);" class="link-default">View All</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                               <span class="avatar rounded-circle bg-success mb-2">
                                  <i class="ti ti-users-group fs-16"></i>
                               </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Job Applicants</h6>
                                    <h3 class="mb-3">98 <span class="fs-12 fw-medium text-success"><i class="fa-solid fa-caret-up me-1"></i>+2.1%</span></h3>
                                    <a href="javascript:void(0);" class="link-default">View All</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                               <span class="avatar rounded-circle bg-dark mb-2">
                                  <i class="ti ti-user-star fs-16"></i>
                               </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">New Hire</h6>
                                    <h3 class="mb-3">${newHires} <span class="fs-12 fw-medium text-danger"><i class="fa-solid fa-caret-down me-1"></i>-11.2%</span></h3>
                                    <a href="javascript:void(0);" class="link-default">View All</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Widget Info -->

                <!-- Employees By Department -->
                <div class="col-xxl-4 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Employees By Department</h5>
                            <div class="dropdown mb-2">
                                <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                    <i class="ti ti-calendar me-1"></i>This Week
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end p-3">
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">Last Week</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="emp-department"></div>
                            <p class="fs-13"><i class="ti ti-circle-filled me-2 fs-8 text-primary"></i>No of
                                Employees increased by <span class="text-success fw-bold">+20%</span> from last Week
                            </p>
                        </div>
                    </div>
                </div>
                <!-- /Employees By Department -->

            </div>

            <div class="row">

                <!-- Total Employee -->
                <div class="col-xxl-4 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Employee Status</h5>
                            <div class="dropdown mb-2">
                                <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                    <i class="ti ti-calendar me-1"></i>This Week
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end p-3">
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">Today</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between mb-1">
                                <p class="fs-13 mb-3">Total Employee</p>
                                <h3 class="mb-3">${totalEmployees}</h3>
                            </div>
                            <div class="progress-stacked emp-stack mb-3">
                                <div class="progress" role="progressbar" aria-label="Segment one" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                    <div class="progress-bar bg-warning"></div>
                                </div>
                                <div class="progress" role="progressbar" aria-label="Segment two" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                    <div class="progress-bar bg-secondary"></div>
                                </div>
                                <div class="progress" role="progressbar" aria-label="Segment three" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 10%">
                                    <div class="progress-bar bg-danger"></div>
                                </div>
                                <div class="progress" role="progressbar" aria-label="Segment four" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 30%">
                                    <div class="progress-bar bg-pink"></div>
                                </div>
                            </div>
                            <div class="border mb-3">
                                <div class="row gx-0">
                                    <div class="col-6">
                                        <div class="p-2 flex-fill border-end border-bottom">
                                            <p class="fs-13 mb-2"><i class="ti ti-square-filled text-primary fs-12 me-2"></i>Fulltime <span class="text-gray-9">(48%)</span></p>
                                            <h2 class="display-1">112</h2>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="p-2 flex-fill border-bottom text-end">
                                            <p class="fs-13 mb-2"><i class="ti ti-square-filled me-2 text-secondary fs-12"></i>Contract <span class="text-gray-9">(20%)</span></p>
                                            <h2 class="display-1">112</h2>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="p-2 flex-fill border-end">
                                            <p class="fs-13 mb-2"><i class="ti ti-square-filled me-2 text-danger fs-12"></i>Probation <span class="text-gray-9">(22%)</span></p>
                                            <h2 class="display-1">12</h2>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="p-2 flex-fill text-end">
                                            <p class="fs-13 mb-2"><i class="ti ti-square-filled text-pink me-2 fs-12"></i>WFH <span class="text-gray-9">(20%)</span></p>
                                            <h2 class="display-1">04</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h6 class="mb-2">Top Performer</h6>
                            <div class="p-2 d-flex align-items-center justify-content-between border border-primary bg-primary-100 br-5 mb-4">
                                <div class="d-flex align-items-center overflow-hidden">
                               <span class="me-2">
                                  <i class="ti ti-award-filled text-primary fs-24"></i>
                               </span>
                                    <a href="javascript:void(0);" class="avatar avatar-md me-2">
                                        <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-24.jpg" class="rounded-circle border border-white" alt="img">
                                    </a>
                                    <div>
                                        <h6 class="text-truncate mb-1 fs-14 fw-medium"><a href="javascript:void(0);">Daniel Esbella</a></h6>
                                        <p class="fs-13">IOS Developer</p>
                                    </div>
                                </div>
                                <div class="text-end">
                                    <p class="fs-13 mb-1">Performance</p>
                                    <h5 class="text-primary">99%</h5>
                                </div>
                            </div>
                            <a href="javascript:void(0);" class="btn btn-light btn-md w-100">View All Employees</a>
                        </div>
                    </div>
                </div>
                <!-- /Total Employee -->

                <!-- Attendance Overview -->
                <div class="col-xxl-4 col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Attendance Overview</h5>
                            <div class="dropdown mb-2">
                                <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                    <i class="ti ti-calendar me-1"></i>Today
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end p-3">
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1">Today</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="chartjs-wrapper-demo position-relative mb-4">
                                <canvas id="attendance" height="200"></canvas>
                                <div class="position-absolute text-center attendance-canvas">
                                    <p class="fs-13 mb-1">Total Attendance</p>
                                    <h3>${presentToday}</h3>
                                </div>
                            </div>
                            <h6 class="mb-3">Status</h6>
                            <div class="d-flex align-items-center justify-content-between">
                                <p class="f-13 mb-2"><i class="ti ti-circle-filled text-success me-1"></i>Present</p>
                                <p class="f-13 fw-medium text-gray-9 mb-2">59%</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between">
                                <p class="f-13 mb-2"><i class="ti ti-circle-filled text-secondary me-1"></i>Late</p>
                                <p class="f-13 fw-medium text-gray-9 mb-2">21%</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between">
                                <p class="f-13 mb-2"><i class="ti ti-circle-filled text-warning me-1"></i>Permission</p>
                                <p class="f-13 fw-medium text-gray-9 mb-2">2%</p>
                            </div>
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p class="f-13 mb-2"><i class="ti ti-circle-filled text-danger me-1"></i>Absent</p>
                                <p class="f-13 fw-medium text-gray-9 mb-2">15%</p>
                            </div>
                            <div class="bg-light br-5 box-shadow-xs p-2 pb-0 d-flex align-items-center justify-content-between flex-wrap">
                                <div class="d-flex align-items-center">
                                    <p class="mb-2 me-2">Total Absenties</p>
                                    <div class="avatar-list-stacked avatar-group-sm mb-2">
                                  <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-27.jpg" alt="img">
                                  </span>
                                        <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-30.jpg" alt="img">
                                  </span>
                                        <span class="avatar avatar-rounded">
                                     <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-14.jpg" alt="img">
                                  </span>
                                        <span class="avatar avatar-rounded">
                                     <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-29.jpg" alt="img">
                                  </span>
                                        <a class="avatar bg-primary avatar-rounded text-fixed-white fs-10" href="javascript:void(0);">
                                            +1
                                        </a>
                                    </div>
                                </div>
                                <a href="javascript:void(0);" class="fs-13 link-primary text-decoration-underline mb-2">View Details</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Attendance Overview -->

                <!-- Clock-In/Out -->
                <div class="col-xxl-4 col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Clock-In/Out</h5>
                            <div class="d-flex align-items-center">
                                <div class="dropdown mb-2">
                                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white btn-sm d-inline-flex align-items-center border-0 fs-13 me-2" data-bs-toggle="dropdown">
                                        All Departments
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Finance</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Development</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Marketing</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="dropdown mb-2">
                                    <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                        <i class="ti ti-calendar me-1"></i>Today
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Today</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div>
                                <div
                                        class="d-flex align-items-center justify-content-between mb-3 p-2 border border-dashed br-5">
                                    <div class="d-flex align-items-center">
                                        <a href="javascript:void(0);" class="avatar flex-shrink-0">
                                            <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-24.jpg" class="rounded-circle border border-2" alt="img">
                                        </a>
                                        <div class="ms-2">
                                            <h6 class="fs-14 fw-medium text-truncate">Daniel Esbella</h6>
                                            <p class="fs-13">UI/UX Designer</p>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <a href="javascript:void(0);" class="link-default me-2"><i class="ti ti-clock-share"></i></a>
                                        <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-success"><i class="ti ti-circle-filled fs-5 me-1"></i>09:15</span>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center justify-content-between mb-3 p-2 border br-5">
                                    <div class="d-flex align-items-center">
                                        <a href="javascript:void(0);" class="avatar flex-shrink-0">
                                            <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-23.jpg" class="rounded-circle border border-2" alt="img">
                                        </a>
                                        <div class="ms-2">
                                            <h6 class="fs-14 fw-medium">Doglas Martini</h6>
                                            <p class="fs-13">Project Manager</p>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center">
                                        <a href="javascript:void(0);" class="link-default me-2"><i class="ti ti-clock-share"></i></a>
                                        <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-success"><i class="ti ti-circle-filled fs-5 me-1"></i>09:36</span>
                                    </div>
                                </div>
                                <div class="mb-3 p-2 border br-5">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <a href="javascript:void(0);" class="avatar flex-shrink-0">
                                                <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-27.jpg" class="rounded-circle border border-2" alt="img">
                                            </a>
                                            <div class="ms-2">
                                                <h6 class="fs-14 fw-medium text-truncate">Brian Villalobos</h6>
                                                <p class="fs-13">PHP Developer</p>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <a href="javascript:void(0);" class="link-default me-2"><i class="ti ti-clock-share"></i></a>
                                            <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-success"><i class="ti ti-circle-filled fs-5 me-1"></i>09:15</span>
                                        </div>
                                    </div>
                                    <div
                                            class="d-flex align-items-center justify-content-between flex-wrap mt-2 border br-5 p-2 pb-0">
                                        <div>
                                            <p class="mb-1 d-inline-flex align-items-center"><i class="ti ti-circle-filled text-success fs-5 me-1"></i>Clock In</p>
                                            <h6 class="fs-13 fw-normal mb-2">10:30 AM</h6>
                                        </div>
                                        <div>
                                            <p class="mb-1 d-inline-flex align-items-center"><i class="ti ti-circle-filled text-danger fs-5 me-1"></i>Clock Out</p>
                                            <h6 class="fs-13 fw-normal mb-2">09:45 AM</h6>
                                        </div>
                                        <div>
                                            <p class="mb-1 d-inline-flex align-items-center"><i class="ti ti-circle-filled text-warning fs-5 me-1"></i>Production</p>
                                            <h6 class="fs-13 fw-normal mb-2">09:21 Hrs</h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h6 class="mb-2">Late</h6>
                            <div class="d-flex align-items-center justify-content-between mb-3 p-2 border border-dashed br-5">
                                <div class="d-flex align-items-center">
                               <span class="avatar flex-shrink-0">
                                  <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-29.jpg" class="rounded-circle border border-2" alt="img">
                               </span>
                                    <div class="ms-2">
                                        <h6 class="fs-14 fw-medium text-truncate">Anthony Lewis <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-success"><i class="ti ti-clock-hour-11 me-1"></i>30 Min</span></h6>
                                        <p class="fs-13">Marketing Head</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <a href="javascript:void(0);" class="link-default me-2"><i class="ti ti-clock-share"></i></a>
                                    <span class="fs-10 fw-medium d-inline-flex align-items-center badge badge-danger"><i class="ti ti-circle-filled fs-5 me-1"></i>08:35</span>
                                </div>
                            </div>
                            <a href="javascript:void(0);" class="btn btn-light btn-md w-100">View All Attendance</a>
                        </div>
                    </div>
                </div>
                <!-- /Clock-In/Out -->

            </div>

            <div class="row">

                <!-- Jobs Applicants -->
                <div class="col-xxl-4 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Jobs Applicants</h5>
                            <a href="javascript:void(0);" class="btn btn-light btn-md mb-2">View All</a>
                        </div>
                        <div class="card-body">
                            <ul class="nav nav-tabs tab-style-1 nav-justified d-sm-flex d-block p-0 mb-4" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link fw-medium" data-bs-toggle="tab" data-bs-target="#openings" aria-current="page" href="#openings" aria-selected="true" role="tab">Openings</a>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <a class="nav-link fw-medium active" data-bs-toggle="tab" data-bs-target="#applicants" href="#applicants" aria-selected="false" tabindex="-1" role="tab">Applicants</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade" id="openings">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center">
                                            <a href="javascript:void(0);" class="avatar overflow-hidden flex-shrink-0 bg-gray-100">
                                                <img src="${pageContext.request.contextPath}/assets/img/icons/apple.svg" class="img-fluid rounded-circle w-auto h-auto" alt="img">
                                            </a>
                                            <div class="ms-2 overflow-hidden">
                                                <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Senior IOS Developer</a></p>
                                                <span class="fs-12">No of Openings : 25 </span>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="btn btn-light btn-sm p-0 btn-icon d-flex align-items-center justify-content-center"><i class="ti ti-edit"></i></a>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center">
                                            <a href="javascript:void(0);" class="avatar overflow-hidden flex-shrink-0 bg-gray-100">
                                                <img src="${pageContext.request.contextPath}/assets/img/icons/php.svg" class="img-fluid w-auto h-auto" alt="img">
                                            </a>
                                            <div class="ms-2 overflow-hidden">
                                                <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Junior PHP Developer</a></p>
                                                <span class="fs-12">No of Openings : 20 </span>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="btn btn-light btn-sm p-0 btn-icon d-flex align-items-center justify-content-center"><i class="ti ti-edit"></i></a>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center">
                                            <a href="javascript:void(0);" class="avatar overflow-hidden flex-shrink-0 bg-gray-100">
                                                <img src="${pageContext.request.contextPath}/assets/img/icons/react.svg" class="img-fluid w-auto h-auto" alt="img">
                                            </a>
                                            <div class="ms-2 overflow-hidden">
                                                <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Junior React Developer </a></p>
                                                <span class="fs-12">No of Openings : 30 </span>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="btn btn-light btn-sm p-0 btn-icon d-flex align-items-center justify-content-center"><i class="ti ti-edit"></i></a>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-0">
                                        <div class="d-flex align-items-center">
                                            <a href="javascript:void(0);" class="avatar overflow-hidden flex-shrink-0 bg-gray-100">
                                                <img src="${pageContext.request.contextPath}/assets/img/icons/laravel-icon.svg" class="img-fluid w-auto h-auto" alt="img">
                                            </a>
                                            <div class="ms-2 overflow-hidden">
                                                <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Senior Laravel Developer</a></p>
                                                <span class="fs-12">No of Openings : 40 </span>
                                            </div>
                                        </div>
                                        <a href="javascript:void(0);" class="btn btn-light btn-sm p-0 btn-icon d-flex align-items-center justify-content-center"><i class="ti ti-edit"></i></a>
                                    </div>
                                </div>
                                <div class="tab-pane fade show active" id="applicants">
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center">
                                            <a href="javascript:void(0);" class="avatar overflow-hidden flex-shrink-0">
                                                <img src="${pageContext.request.contextPath}/assets/img/users/user-09.jpg" class="img-fluid rounded-circle" alt="img">
                                            </a>
                                            <div class="ms-2 overflow-hidden">
                                                <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Brian Villalobos</a></p>
                                                <span class="fs-13 d-inline-flex align-items-center">Exp : 5+ Years<i class="ti ti-circle-filled fs-4 mx-2 text-primary"></i>USA</span>
                                            </div>
                                        </div>
                                        <span class="badge badge-secondary badge-xs">UI/UX Designer</span>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center">
                                            <a href="javascript:void(0);" class="avatar overflow-hidden flex-shrink-0">
                                                <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg" class="img-fluid rounded-circle" alt="img">
                                            </a>
                                            <div class="ms-2 overflow-hidden">
                                                <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Anthony Lewis</a></p>
                                                <span class="fs-13 d-inline-flex align-items-center">Exp : 4+ Years<i class="ti ti-circle-filled fs-4 mx-2 text-primary"></i>USA</span>
                                            </div>
                                        </div>
                                        <span class="badge badge-info badge-xs">Python Developer</span>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-4">
                                        <div class="d-flex align-items-center">
                                            <a href="javascript:void(0);" class="avatar overflow-hidden flex-shrink-0">
                                                <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg" class="img-fluid rounded-circle" alt="img">
                                            </a>
                                            <div class="ms-2 overflow-hidden">
                                                <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Stephan Peralt</a></p>
                                                <span class="fs-13 d-inline-flex align-items-center">Exp : 6+ Years<i class="ti ti-circle-filled fs-4 mx-2 text-primary"></i>USA</span>
                                            </div>
                                        </div>
                                        <span class="badge badge-pink badge-xs">Android Developer</span>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mb-0">
                                        <div class="d-flex align-items-center">
                                            <a href="javascript:void(0);" class="avatar overflow-hidden flex-shrink-0">
                                                <img src="${pageContext.request.contextPath}/assets/img/users/user-34.jpg" class="img-fluid rounded-circle" alt="img">
                                            </a>
                                            <div class="ms-2 overflow-hidden">
                                                <p class="text-dark fw-medium text-truncate mb-0"><a href="javascript:void(0);">Doglas Martini</a></p>
                                                <span class="fs-13 d-inline-flex align-items-center">Exp : 2+ Years<i class="ti ti-circle-filled fs-4 mx-2 text-primary"></i>USA</span>
                                            </div>
                                        </div>
                                        <span class="badge badge-purple badge-xs">React Developer</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Jobs Applicants -->

                <!-- Employees -->
                <div class="col-xxl-4 col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Employees</h5>
                            <a href="javascript:void(0);" class="btn btn-light btn-md mb-2">View All</a>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-nowrap mb-0">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Department</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <a href="javascript:void(0);" class="avatar">
                                                    <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="javascript:void(0);">Anthony Lewis</a></h6>
                                                    <span class="fs-12">Finance</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                        <span class="badge badge-secondary-transparent badge-xs">
                                           Finance
                                        </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <a href="javascript:void(0);" class="avatar">
                                                    <img src="${pageContext.request.contextPath}/assets/img/users/user-09.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="javascript:void(0);">Brian Villalobos</a></h6>
                                                    <span class="fs-12">PHP Developer</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="badge badge-danger-transparent badge-xs">Development</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <a href="javascript:void(0);" class="avatar">
                                                    <img src="${pageContext.request.contextPath}/assets/img/users/user-01.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="javascript:void(0);">Stephan Peralt</a></h6>
                                                    <span class="fs-12">Executive</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="badge badge-info-transparent badge-xs">Marketing</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <a href="javascript:void(0);" class="avatar">
                                                    <img src="${pageContext.request.contextPath}/assets/img/users/user-34.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="javascript:void(0);">Doglas Martini</a></h6>
                                                    <span class="fs-12">Project Manager</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="badge badge-purple-transparent badge-xs">Manager</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="border-0">
                                            <div class="d-flex align-items-center">
                                                <a href="javascript:void(0);" class="avatar">
                                                    <img src="${pageContext.request.contextPath}/assets/img/users/user-37.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="javascript:void(0);">Anthony Lewis</a></h6>
                                                    <span class="fs-12">UI/UX Designer</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="border-0">
                                            <span class="badge badge-pink-transparent badge-xs">UI/UX Design</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Employees -->

                <!-- Todo -->
                <div class="col-xxl-4 col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Todo</h5>
                            <div class="d-flex align-items-center">
                                <div class="dropdown mb-2 me-2">
                                    <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                        <i class="ti ti-calendar me-1"></i>Today
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Today</a>
                                        </li>
                                    </ul>
                                </div>
                                <a href="javascript:void(0);" class="btn btn-primary btn-icon btn-xs rounded-circle d-flex align-items-center justify-content-center p-0 mb-2"  data-bs-toggle="modal" data-bs-target="#add_todo"><i class="ti ti-plus fs-16"></i></a>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex align-items-center todo-item border p-2 br-5 mb-2">
                                <i class="ti ti-grid-dots me-2"></i>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="todo1">
                                    <label class="form-check-label fw-medium" for="todo1">Add Holidays</label>
                                </div>
                            </div>
                            <div class="d-flex align-items-center todo-item border p-2 br-5 mb-2">
                                <i class="ti ti-grid-dots me-2"></i>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="todo2">
                                    <label class="form-check-label fw-medium" for="todo2">Add Meeting  to Client</label>
                                </div>
                            </div>
                            <div class="d-flex align-items-center todo-item border p-2 br-5 mb-2">
                                <i class="ti ti-grid-dots me-2"></i>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="todo3">
                                    <label class="form-check-label fw-medium" for="todo3">Chat with Adrian</label>
                                </div>
                            </div>
                            <div class="d-flex align-items-center todo-item border p-2 br-5 mb-2">
                                <i class="ti ti-grid-dots me-2"></i>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="todo4">
                                    <label class="form-check-label fw-medium" for="todo4">Management Call</label>
                                </div>
                            </div>
                            <div class="d-flex align-items-center todo-item border p-2 br-5 mb-2">
                                <i class="ti ti-grid-dots me-2"></i>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="todo5">
                                    <label class="form-check-label fw-medium" for="todo5">Add Payroll</label>
                                </div>
                            </div>
                            <div class="d-flex align-items-center todo-item border p-2 br-5 mb-0">
                                <i class="ti ti-grid-dots me-2"></i>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="todo6">
                                    <label class="form-check-label fw-medium" for="todo6">Add Policy for Increment </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Todo -->

            </div>

            <div class="row">

                <!-- Sales Overview -->
                <div class="col-xl-7 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Sales Overview</h5>
                            <div class="d-flex align-items-center">
                                <div class="dropdown mb-2">
                                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white border-0 btn-sm d-inline-flex align-items-center fs-13 me-2" data-bs-toggle="dropdown">
                                        All Departments
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">UI/UX Designer</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">HR Manager</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Junior Tester</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body pb-0">
                            <div class="d-flex align-items-center justify-content-between flex-wrap">
                                <div class="d-flex align-items-center mb-1">
                                    <p class="fs-13 text-gray-9 me-3 mb-0"><i class="ti ti-square-filled me-2 text-primary"></i>Income</p>
                                    <p class="fs-13 text-gray-9 mb-0"><i class="ti ti-square-filled me-2 text-gray-2"></i>Expenses</p>
                                </div>
                                <p class="fs-13 mb-1">Last Updated at 11:30PM</p>
                            </div>
                            <div id="sales-income"></div>
                        </div>
                    </div>
                </div>
                <!-- /Sales Overview -->

                <!-- Invoices -->
                <div class="col-xl-5 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Invoices</h5>
                            <div class="d-flex align-items-center">
                                <div class="dropdown mb-2">
                                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white btn-sm d-inline-flex align-items-center fs-13 me-2 border-0" data-bs-toggle="dropdown">
                                        Invoices
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Invoices</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Paid</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Unpaid</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="dropdown mb-2">
                                    <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center"  data-bs-toggle="dropdown">
                                        <i class="ti ti-calendar me-1"></i>This Week
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Today</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body pt-2">
                            <div class="table-responsive pt-1">
                                <table class="table table-nowrap table-borderless mb-0">
                                    <tbody>
                                    <tr>
                                        <td class="px-0">
                                            <div class="d-flex align-items-center">
                                                <a href="javascript:void(0);" class="avatar">
                                                    <img src="${pageContext.request.contextPath}/assets/img/users/user-39.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="javascript:void(0);">Redesign Website</a></h6>
                                                    <span class="fs-13 d-inline-flex align-items-center">#INVOO2<i class="ti ti-circle-filled fs-4 mx-1 text-primary"></i>Logistics</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="fs-13 mb-1">Payment</p>
                                            <h6 class="fw-medium">$3560</h6>
                                        </td>
                                        <td class="px-0 text-end">
                                            <span class="badge badge-danger-transparent badge-xs d-inline-flex align-items-center"><i class="ti ti-circle-filled fs-5 me-1"></i>Unpaid</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-0">
                                            <div class="d-flex align-items-center">
                                                <a href="javascript:void(0);" class="avatar">
                                                    <img src="${pageContext.request.contextPath}/assets/img/users/user-40.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="javascript:void(0);">Module Completion</a></h6>
                                                    <span class="fs-13 d-inline-flex align-items-center">#INVOO5<i class="ti ti-circle-filled fs-4 mx-1 text-primary"></i>Yip Corp</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="fs-13 mb-1">Payment</p>
                                            <h6 class="fw-medium">$4175</h6>
                                        </td>
                                        <td class="px-0 text-end">
                                            <span class="badge badge-danger-transparent badge-xs d-inline-flex align-items-center"><i class="ti ti-circle-filled fs-5 me-1"></i>Unpaid</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-0">
                                            <div class="d-flex align-items-center">
                                                <a href="javascript:void(0);" class="avatar">
                                                    <img src="${pageContext.request.contextPath}/assets/img/users/user-55.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="javascript:void(0);">Change on Emp Module</a></h6>
                                                    <span class="fs-13 d-inline-flex align-items-center">#INVOO3<i class="ti ti-circle-filled fs-4 mx-1 text-primary"></i>Ignis LLP</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="fs-13 mb-1">Payment</p>
                                            <h6 class="fw-medium">$6985</h6>
                                        </td>
                                        <td class="px-0 text-end">
                                            <span class="badge badge-danger-transparent badge-xs d-inline-flex align-items-center"><i class="ti ti-circle-filled fs-5 me-1"></i>Unpaid</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-0">
                                            <div class="d-flex align-items-center">
                                                <a href="javascript:void(0);" class="avatar">
                                                    <img src="${pageContext.request.contextPath}/assets/img/users/user-42.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="javascript:void(0);">Changes on the Board</a></h6>
                                                    <span class="fs-13 d-inline-flex align-items-center">#INVOO2<i class="ti ti-circle-filled fs-4 mx-1 text-primary"></i>Ignis LLP</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="fs-13 mb-1">Payment</p>
                                            <h6 class="fw-medium">$1457</h6>
                                        </td>
                                        <td class="px-0 text-end">
                                            <span class="badge badge-danger-transparent badge-xs d-inline-flex align-items-center"><i class="ti ti-circle-filled fs-5 me-1"></i>Unpaid</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="px-0">
                                            <div class="d-flex align-items-center">
                                                <a href="javascript:void(0);" class="avatar">
                                                    <img src="${pageContext.request.contextPath}/assets/img/users/user-44.jpg" class="img-fluid rounded-circle" alt="img">
                                                </a>
                                                <div class="ms-2">
                                                    <h6 class="fw-medium"><a href="javascript:void(0);">Hospital Management</a></h6>
                                                    <span class="fs-13 d-inline-flex align-items-center">#INVOO6<i class="ti ti-circle-filled fs-4 mx-1 text-primary"></i>HCL Corp</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="fs-13 mb-1">Payment</p>
                                            <h6 class="fw-medium">$6458</h6>
                                        </td>
                                        <td class="px-0 text-end">
                                            <span class="badge badge-success-transparent badge-xs d-inline-flex align-items-center"><i class="ti ti-circle-filled fs-5 me-1"></i>Paid</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <a href="javascript:void(0);" class="btn btn-light btn-md w-100 mt-2">View All</a>
                        </div>
                    </div>
                </div>
                <!-- /Invoices -->

            </div>

            <div class="row">

                <!-- Projects -->
                <div class="col-xxl-8 col-xl-7 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Projects</h5>
                            <div class="d-flex align-items-center">
                                <div class="dropdown mb-2">
                                    <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center"  data-bs-toggle="dropdown">
                                        <i class="ti ti-calendar me-1"></i>This Week
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Today</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-nowrap mb-0">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Team</th>
                                        <th>Hours</th>
                                        <th>Deadline</th>
                                        <th>Priority</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><a href="javascript:void(0);" class="link-default">PRO-001</a></td>
                                        <td><h6 class="fw-medium"><a href="javascript:void(0);">Office Management App</a></h6></td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">
                                           <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-03.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-05.jpg" alt="img">
                                           </span>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="mb-1">15/255 Hrs</p>
                                            <div class="progress progress-xs w-100" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar bg-primary" style="width: 40%"></div>
                                            </div>
                                        </td>
                                        <td>12/09/2024</td>
                                        <td>
                                        <span class="badge badge-danger d-inline-flex align-items-center badge-xs">
                                           <i class="ti ti-point-filled me-1"></i>High
                                        </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0);" class="link-default">PRO-002</a></td>
                                        <td><h6 class="fw-medium"><a href="javascript:void(0);">Clinic Management </a></h6></td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">
                                           <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-06.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-07.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-08.jpg" alt="img">
                                           </span>
                                                <a class="avatar bg-primary avatar-rounded text-fixed-white fs-10 fw-medium" href="javascript:void(0);">
                                                    +1
                                                </a>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="mb-1">15/255 Hrs</p>
                                            <div class="progress progress-xs w-100" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar bg-primary" style="width: 40%"></div>
                                            </div>
                                        </td>
                                        <td>24/10/2024</td>
                                        <td>
                                        <span class="badge badge-success d-inline-flex align-items-center badge-xs">
                                           <i class="ti ti-point-filled me-1"></i>Low
                                        </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0);" class="link-default">PRO-003</a></td>
                                        <td><h6 class="fw-medium"><a href="javascript:void(0);">Educational Platform</a></h6></td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">
                                           <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-06.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-08.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-09.jpg" alt="img">
                                           </span>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="mb-1">40/255 Hrs</p>
                                            <div class="progress progress-xs w-100" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar bg-primary" style="width: 50%"></div>
                                            </div>
                                        </td>
                                        <td>18/02/2024</td>
                                        <td>
                                        <span class="badge badge-pink d-inline-flex align-items-center badge-xs">
                                           <i class="ti ti-point-filled me-1"></i>Medium
                                        </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0);" class="link-default">PRO-004</a></td>
                                        <td><h6 class="fw-medium"><a href="javascript:void(0);">Chat & Call Mobile App</a></h6></td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">
                                           <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-11.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-12.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-13.jpg" alt="img">
                                           </span>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="mb-1">35/155 Hrs</p>
                                            <div class="progress progress-xs w-100" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar bg-primary" style="width: 50%"></div>
                                            </div>
                                        </td>
                                        <td>19/02/2024</td>
                                        <td>
                                        <span class="badge badge-danger d-inline-flex align-items-center badge-xs">
                                           <i class="ti ti-point-filled me-1"></i>High
                                        </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0);" class="link-default">PRO-005</a></td>
                                        <td><h6 class="fw-medium"><a href="javascript:void(0);">Travel Planning Website</a></h6></td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">
                                           <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-17.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-18.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-19.jpg" alt="img">
                                           </span>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="mb-1">50/235 Hrs</p>
                                            <div class="progress progress-xs w-100" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar bg-primary" style="width: 50%"></div>
                                            </div>
                                        </td>
                                        <td>18/02/2024</td>
                                        <td>
                                        <span class="badge badge-pink d-inline-flex align-items-center badge-xs">
                                           <i class="ti ti-point-filled me-1"></i>Medium
                                        </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><a href="javascript:void(0);" class="link-default">PRO-006</a></td>
                                        <td><h6 class="fw-medium"><a href="javascript:void(0);">Service Booking Software</a></h6></td>
                                        <td>
                                            <div class="avatar-list-stacked avatar-group-sm">
                                           <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-06.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-08.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-09.jpg" alt="img">
                                           </span>
                                            </div>
                                        </td>
                                        <td>
                                            <p class="mb-1">40/255 Hrs</p>
                                            <div class="progress progress-xs w-100" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar bg-primary" style="width: 50%"></div>
                                            </div>
                                        </td>
                                        <td>20/02/2024</td>
                                        <td>
                                        <span class="badge badge-success d-inline-flex align-items-center badge-xs">
                                           <i class="ti ti-point-filled me-1"></i>Low
                                        </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="border-0"><a href="javascript:void(0);" class="link-default">PRO-008</a></td>
                                        <td class="border-0"><h6 class="fw-medium"><a href="javascript:void(0);">Travel Planning Website</a></h6></td>
                                        <td class="border-0">
                                            <div class="avatar-list-stacked avatar-group-sm">
                                           <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-15.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-16.jpg" alt="img">
                                           </span>
                                                <span class="avatar avatar-rounded">
                                              <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-17.jpg" alt="img">
                                           </span>
                                                <a class="avatar bg-primary avatar-rounded text-fixed-white fs-10 fw-medium" href="javascript:void(0);">
                                                    +2
                                                </a>
                                            </div>
                                        </td>
                                        <td class="border-0">
                                            <p class="mb-1">15/255 Hrs</p>
                                            <div class="progress progress-xs w-100" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100">
                                                <div class="progress-bar bg-primary" style="width: 45%"></div>
                                            </div>
                                        </td>
                                        <td class="border-0">17/10/2024</td>
                                        <td class="border-0">
                                        <span class="badge badge-pink d-inline-flex align-items-center badge-xs">
                                           <i class="ti ti-point-filled me-1"></i>Medium
                                        </span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Projects -->

                <!-- Tasks Statistics -->
                <div class="col-xxl-4 col-xl-5 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Tasks Statistics</h5>
                            <div class="d-flex align-items-center">
                                <div class="dropdown mb-2">
                                    <a href="javascript:void(0);" class="btn btn-white border btn-sm d-inline-flex align-items-center"  data-bs-toggle="dropdown">
                                        <i class="ti ti-calendar me-1"></i>This Week
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Today</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="chartjs-wrapper-demo position-relative mb-4">
                                <canvas id="mySemiDonutChart" height="190"></canvas>
                                <div class="position-absolute text-center attendance-canvas">
                                    <p class="fs-13 mb-1">Total Tasks</p>
                                    <h3>124/165</h3>
                                </div>
                            </div>
                            <div class="d-flex align-items-center flex-wrap">
                                <div class="border-end text-center me-2 pe-2 mb-3">
                                    <p class="fs-13 d-inline-flex align-items-center mb-1"><i class="ti ti-circle-filled fs-10 me-1 text-warning"></i>Ongoing</p>
                                    <h5>24%</h5>
                                </div>
                                <div class="border-end text-center me-2 pe-2 mb-3">
                                    <p class="fs-13 d-inline-flex align-items-center mb-1"><i class="ti ti-circle-filled fs-10 me-1 text-info"></i>On Hold </p>
                                    <h5>10%</h5>
                                </div>
                                <div class="border-end text-center me-2 pe-2 mb-3">
                                    <p class="fs-13 d-inline-flex align-items-center mb-1"><i class="ti ti-circle-filled fs-10 me-1 text-danger"></i>Overdue</p>
                                    <h5>16%</h5>
                                </div>
                                <div class="text-center me-2 pe-2 mb-3">
                                    <p class="fs-13 d-inline-flex align-items-center mb-1"><i class="ti ti-circle-filled fs-10 me-1 text-success"></i>Ongoing</p>
                                    <h5>40%</h5>
                                </div>
                            </div>
                            <div class="bg-dark br-5 p-3 pb-0 d-flex align-items-center justify-content-between">
                                <div class="mb-2">
                                    <h4 class="text-success">389/689 hrs</h4>
                                    <p class="fs-13 mb-0">Spent on Overall Tasks This Week</p>
                                </div>
                                <a href="javascript:void(0);" class="btn btn-sm btn-light mb-2 text-nowrap">View All</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Tasks Statistics -->

            </div>

            <div class="row">

                <!-- Schedules -->
                <div class="col-xxl-4 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Schedules</h5>
                            <a href="javascript:void(0);" class="btn btn-light btn-md mb-2">View All</a>
                        </div>
                        <div class="card-body">
                            <div class="bg-light p-3 br-5 mb-4">
                                <span class="badge badge-secondary badge-xs mb-1">UI/ UX Designer</span>
                                <h6 class="mb-2 text-truncate">Interview Candidates - UI/UX Designer</h6>
                                <div class="d-flex align-items-center flex-wrap">
                                    <p class="fs-13 mb-1 me-2"><i class="ti ti-calendar-event me-2"></i>Thu, 15 Feb 2025</p>
                                    <p class="fs-13 mb-1"><i class="ti ti-clock-hour-11 me-2"></i>01:00 PM - 02:20 PM</p>
                                </div>
                                <div class="d-flex align-items-center justify-content-between border-top mt-2 pt-3">
                                    <div class="avatar-list-stacked avatar-group-sm">
                                  <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/users/user-49.jpg" alt="img">
                                  </span>
                                        <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/users/user-13.jpg" alt="img">
                                  </span>
                                        <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/users/user-11.jpg" alt="img">
                                  </span>
                                        <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/users/user-22.jpg" alt="img">
                                  </span>
                                        <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/users/user-58.jpg" alt="img">
                                  </span>
                                        <a class="avatar bg-primary avatar-rounded text-fixed-white fs-10 fw-medium" href="javascript:void(0);">
                                            +3
                                        </a>
                                    </div>
                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs">Join Meeting</a>
                                </div>
                            </div>
                            <div class="bg-light p-3 br-5 mb-0">
                                <span class="badge badge-dark badge-xs mb-1">IOS Developer</span>
                                <h6 class="mb-2 text-truncate">Interview Candidates - IOS Developer</h6>
                                <div class="d-flex align-items-center flex-wrap">
                                    <p class="fs-13 mb-1 me-2"><i class="ti ti-calendar-event me-2"></i>Thu, 15 Feb 2025</p>
                                    <p class="fs-13 mb-1"><i class="ti ti-clock-hour-11 me-2"></i>02:00 PM - 04:20 PM</p>
                                </div>
                                <div class="d-flex align-items-center justify-content-between border-top mt-2 pt-3">
                                    <div class="avatar-list-stacked avatar-group-sm">
                                  <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/users/user-49.jpg" alt="img">
                                  </span>
                                        <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/users/user-13.jpg" alt="img">
                                  </span>
                                        <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/users/user-11.jpg" alt="img">
                                  </span>
                                        <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/users/user-22.jpg" alt="img">
                                  </span>
                                        <span class="avatar avatar-rounded">
                                     <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/users/user-58.jpg" alt="img">
                                  </span>
                                        <a class="avatar bg-primary avatar-rounded text-fixed-white fs-10 fw-medium" href="javascript:void(0);">
                                            +3
                                        </a>
                                    </div>
                                    <a href="javascript:void(0);" class="btn btn-primary btn-xs">Join Meeting</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Schedules -->

                <!-- Recent Activities -->
                <div class="col-xxl-4 col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Recent Activities</h5>
                            <a href="javascript:void(0);" class="btn btn-light btn-md mb-2">View All</a>
                        </div>
                        <div class="card-body">
                            <div class="recent-item">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center w-100">
                                        <a href="javascript:void(0);" class="avatar  flex-shrink-0">
                                            <img src="${pageContext.request.contextPath}/assets/img/users/user-38.jpg" class="rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 flex-fill">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h6 class="fs-medium text-truncate"><a href="javascript:void(0);">Matt Morgan</a></h6>
                                                <p class="fs-13">05:30 PM</p>
                                            </div>
                                            <p class="fs-13">Added New Project <span class="text-primary">HRMS Dashboard</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="recent-item">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center w-100">
                                        <a href="javascript:void(0);" class="avatar  flex-shrink-0">
                                            <img src="${pageContext.request.contextPath}/assets/img/users/user-01.jpg" class="rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 flex-fill">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h6 class="fs-medium text-truncate"><a href="javascript:void(0);">Jay Ze</a></h6>
                                                <p class="fs-13">05:00 PM</p>
                                            </div>
                                            <p class="fs-13">Commented on Uploaded Document</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="recent-item">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center w-100">
                                        <a href="javascript:void(0);" class="avatar  flex-shrink-0">
                                            <img src="${pageContext.request.contextPath}/assets/img/users/user-19.jpg" class="rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 flex-fill">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h6 class="fs-medium text-truncate"><a href="javascript:void(0);">Mary Donald</a></h6>
                                                <p class="fs-13">05:30 PM</p>
                                            </div>
                                            <p class="fs-13">Approved Task Projects</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="recent-item">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center w-100">
                                        <a href="javascript:void(0);" class="avatar  flex-shrink-0">
                                            <img src="${pageContext.request.contextPath}/assets/img/users/user-11.jpg" class="rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 flex-fill">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h6 class="fs-medium text-truncate"><a href="javascript:void(0);">George David</a></h6>
                                                <p class="fs-13">06:00 PM</p>
                                            </div>
                                            <p class="fs-13">Requesting Access to Module Tickets</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="recent-item">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center w-100">
                                        <a href="javascript:void(0);" class="avatar  flex-shrink-0">
                                            <img src="${pageContext.request.contextPath}/assets/img/users/user-20.jpg" class="rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 flex-fill">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h6 class="fs-medium text-truncate"><a href="javascript:void(0);">Aaron Zeen</a></h6>
                                                <p class="fs-13">06:30 PM</p>
                                            </div>
                                            <p class="fs-13">Downloaded App Reportss</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="recent-item">
                                <div class="d-flex justify-content-between">
                                    <div class="d-flex align-items-center w-100">
                                        <a href="javascript:void(0);" class="avatar  flex-shrink-0">
                                            <img src="${pageContext.request.contextPath}/assets/img/users/user-08.jpg" class="rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 flex-fill">
                                            <div class="d-flex align-items-center justify-content-between">
                                                <h6 class="fs-medium text-truncate"><a href="javascript:void(0);">Hendry Daniel</a></h6>
                                                <p class="fs-13">05:30 PM</p>
                                            </div>
                                            <p class="fs-13">Completed New Project <span>HMS</span></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Recent Activities -->

                <!-- Birthdays -->
                <div class="col-xxl-4 col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Birthdays</h5>
                            <a href="javascript:void(0);" class="btn btn-light btn-md mb-2">View All</a>
                        </div>
                        <div class="card-body pb-1">
                            <h6 class="mb-2">Today</h6>
                            <div class="bg-light p-2 border border-dashed rounded-top mb-3">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="d-flex align-items-center">
                                        <a href="javascript:void(0);" class="avatar">
                                            <img src="${pageContext.request.contextPath}/assets/img/users/user-38.jpg" class="rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 overflow-hidden">
                                            <h6 class="fs-medium ">Andrew Jermia</h6>
                                            <p class="fs-13">IOS Developer</p>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" class="btn btn-secondary btn-xs"><i class="ti ti-cake me-1"></i>Send</a>
                                </div>
                            </div>
                            <h6 class="mb-2">Tomorow</h6>
                            <div class="bg-light p-2 border border-dashed rounded-top mb-3">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="d-flex align-items-center">
                                        <a href="javascript:void(0);" class="avatar">
                                            <img src="${pageContext.request.contextPath}/assets/img/users/user-10.jpg" class="rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 overflow-hidden">
                                            <h6 class="fs-medium"><a href="javascript:void(0);">Mary Zeen</a></h6>
                                            <p class="fs-13">UI/UX Designer</p>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" class="btn btn-secondary btn-xs"><i class="ti ti-cake me-1"></i>Send</a>
                                </div>
                            </div>
                            <div class="bg-light p-2 border border-dashed rounded-top mb-3">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="d-flex align-items-center">
                                        <a href="javascript:void(0);" class="avatar">
                                            <img src="${pageContext.request.contextPath}/assets/img/users/user-09.jpg" class="rounded-circle" alt="img">
                                        </a>
                                        <div class="ms-2 overflow-hidden">
                                            <h6 class="fs-medium "><a href="javascript:void(0);">Antony Lewis</a></h6>
                                            <p class="fs-13">Android Developer</p>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" class="btn btn-secondary btn-xs"><i class="ti ti-cake me-1"></i>Send</a>
                                </div>
                            </div>
                            <h6 class="mb-2">25 Jan 2025</h6>
                            <div class="bg-light p-2 border border-dashed rounded-top mb-3">
                                <div class="d-flex align-items-center justify-content-between">
                                    <div class="d-flex align-items-center">
                                  <span class="avatar">
                                     <img src="${pageContext.request.contextPath}/assets/img/users/user-12.jpg" class="rounded-circle" alt="img">
                                  </span>
                                        <div class="ms-2 overflow-hidden">
                                            <h6 class="fs-medium ">Doglas Martini</h6>
                                            <p class="fs-13">.Net Developer</p>
                                        </div>
                                    </div>
                                    <a href="javascript:void(0);" class="btn btn-secondary btn-xs"><i class="ti ti-cake me-1"></i>Send</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Birthdays -->

            </div>

        </div>

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
            <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
            <p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
        </div>

    </div>
    <!-- /Page Wrapper -->

    <!-- Add Todo -->
    <div class="modal fade" id="add_todo">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add New Todo</h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <form action="${pageContext.request.contextPath}/Admin/dashboard">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="mb-3">
                                    <label class="form-label">Todo Title</label>
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">Tag</label>
                                    <select class="select">
                                        <option>Select</option>
                                        <option>Internal</option>
                                        <option>Projects</option>
                                        <option>Meetings</option>
                                        <option>Reminder</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-6">
                                <div class="mb-3">
                                    <label class="form-label">Priority</label>
                                    <select class="select">
                                        <option>Select</option>
                                        <option>Medium</option>
                                        <option>High</option>
                                        <option>Low</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label class="form-label">Descriptions</label>
                                    <div class="summernote"></div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-3">
                                    <label class="form-label">Add Assignee</label>
                                    <select class="select">
                                        <option>Select</option>
                                        <option>Sophie</option>
                                        <option>Cameron</option>
                                        <option>Doris</option>
                                        <option>Rufana</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mb-0">
                                    <label class="form-label">Status</label>
                                    <select class="select">
                                        <option>Select</option>
                                        <option>Completed</option>
                                        <option>Pending</option>
                                        <option>Onhold</option>
                                        <option>Inprogress</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add New Todo</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- /Add Todo -->

    <!-- Add Project -->
    <div class="modal fade" id="add_project" role="dialog">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header header-border align-items-center justify-content-between">
                    <div class="d-flex align-items-center">
                        <h5 class="modal-title me-2">Add Project </h5>
                        <p class="text-dark">Project ID : PRO-0004</p>
                    </div>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <div class="add-info-fieldset">
                    <div class="add-details-wizard p-3 pb-0">
                        <ul class="progress-bar-wizard d-flex align-items-center border-bottom">
                            <li class="active p-2 pt-0">
                                <h6 class="fw-medium">Basic Information</h6>
                            </li>
                            <li class="p-2 pt-0">
                                <h6 class="fw-medium">Members</h6>
                            </li>
                        </ul>
                    </div>
                    <fieldset id="first-field-file">
                        <form action="${pageContext.request.contextPath}/Admin/dashboard">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">
                                            <div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark frames">
                                                <i class="ti ti-photo text-gray-2 fs-16"></i>
                                            </div>
                                            <div class="profile-upload">
                                                <div class="mb-2">
                                                    <h6 class="mb-1">Upload Project Logo</h6>
                                                    <p class="fs-12">Image should be below 4 mb</p>
                                                </div>
                                                <div class="profile-uploader d-flex align-items-center">
                                                    <div class="drag-upload-btn btn btn-sm btn-primary me-2">
                                                        Upload
                                                        <input type="file" class="form-control image-sign" multiple="">
                                                    </div>
                                                    <a href="javascript:void(0);" class="btn btn-light btn-sm">Cancel</a>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Project Name</label>
                                            <input type="text" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Client</label>
                                            <select class="select">
                                                <option>Select</option>
                                                <option>Anthony Lewis</option>
                                                <option>Brian Villalobos</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Start Date</label>
                                                    <div class="input-icon-end position-relative">
                                                        <input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" value="02-05-2024">
                                                        <span class="input-icon-addon">
                                                 <i class="ti ti-calendar text-gray-7"></i>
                                              </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">End Date</label>
                                                    <div class="input-icon-end position-relative">
                                                        <input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" value="02-05-2024">
                                                        <span class="input-icon-addon">
                                                 <i class="ti ti-calendar text-gray-7"></i>
                                              </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Priority</label>
                                                    <select class="select">
                                                        <option>Select</option>
                                                        <option>High</option>
                                                        <option>Medium</option>
                                                        <option>Low</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Project Value</label>
                                                    <input type="text" class="form-control" value="$">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Total Working Hours</label>
                                                    <div class="input-icon-end position-relative">
                                                        <input type="text" class="form-control timepicker" placeholder="-- : -- : --" value="02-05-2024">
                                                        <span class="input-icon-addon">
                                                 <i class="ti ti-clock-hour-3 text-gray-7"></i>
                                              </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label class="form-label">Extra Time</label>
                                                    <input type="text" class="form-control">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-0">
                                            <label class="form-label">Description</label>
                                            <div class="summernote"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="d-flex align-items-center justify-content-end">
                                    <button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
                                    <button class="btn btn-primary wizard-next-btn" type="button">Add Team Member</button>
                                </div>
                            </div>
                        </form>
                    </fieldset>
                    <fieldset>
                        <form action="${pageContext.request.contextPath}/Admin/dashboard">
                            <div class="modal-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label me-2">Team Members</label>
                                            <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Jerald,Andrew,Philip,Davis">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label me-2">Team Leader</label>
                                            <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Hendry,James">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label me-2">Project Manager</label>
                                            <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Dwight">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label class="form-label">Status</label>
                                            <select class="select">
                                                <option>Select</option>
                                                <option>Active</option>
                                                <option>Inactive</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div>
                                            <label class="form-label">Tags</label>
                                            <select class="select">
                                                <option>Select</option>
                                                <option>High</option>
                                                <option>Low</option>
                                                <option>Medium</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="d-flex align-items-center justify-content-end">
                                    <button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
                                    <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#success_modal">Save</button>
                                </div>
                            </div>
                        </form>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <!-- /Add Project -->

    <!-- Add Leaves -->
    <div class="modal fade" id="add_leaves">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Leave Request</h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <form action="${pageContext.request.contextPath}/Admin/dashboard">
                    <div class="modal-body pb-0">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Employee Name</label>
                                    <select class="select">
                                        <option>Select</option>
                                        <option>Anthony Lewis</option>
                                        <option>Brian Villalobos</option>
                                        <option>Harvey Smith</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Leave Type</label>
                                    <select class="select">
                                        <option>Select</option>
                                        <option>Medical Leave</option>
                                        <option>Casual Leave</option>
                                        <option>Annual Leave</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">From </label>
                                    <div class="input-icon-end position-relative">
                                        <input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy">
                                        <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">To </label>
                                    <div class="input-icon-end position-relative">
                                        <input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy">
                                        <span class="input-icon-addon">
                                                <i class="ti ti-calendar text-gray-7"></i>
                                            </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">No of Days</label>
                                    <input type="text" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Remaining Days</label>
                                    <input type="text" class="form-control" disabled>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Reason</label>
                                    <textarea class="form-control" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary">Add Leaves</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- /Add Leaves -->


</div>
<!-- end main wrapper-->


<!-- JAVASCRIPT -->
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

</body>
</html>

```

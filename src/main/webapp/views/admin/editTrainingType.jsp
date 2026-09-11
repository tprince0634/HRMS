<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<%@ page import="jakarta.servlet.http.HttpServletResponse" %>
<%@ page import="org.example.model.TrainingType" %>

<%
    String context = request.getContextPath();

    TrainingType trainingType =
            (TrainingType) request.getAttribute("trainingType");

    if (trainingType == null) {
        response.sendError(
                HttpServletResponse.SC_NOT_FOUND,
                "Training type not found"
        );
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description"
          content="HRMS Admin Dashboard">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Admin Dashboard">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

    <title>Edit Training Type | HRMS</title>


    <!-- =========================================================
         FAVICON
         ========================================================= -->

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">


    <!-- =========================================================
         THEME SCRIPT
         ========================================================= -->

    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>


    <!-- =========================================================
         CSS
         ========================================================= -->

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


    <!-- =========================================================
         SIDEBAR FIX
         ========================================================= -->

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

        /* =====================================================
           SIDEBAR SUBMENU
           ===================================================== */

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


        /* =====================================================
           EDIT TRAINING TYPE PAGE
           ===================================================== */

        .edit-training-type-page {
            min-height: calc(100vh - 60px);
        }

        .edit-training-type-page .page-breadcrumb h2 {
            font-weight: 600;
        }


        /* =====================================================
           FORM CARD
           ===================================================== */

        .training-type-form-card {
            border: 1px solid #e9edf4;
            border-radius: 6px;
            background: #ffffff;
            overflow: hidden;
        }

        .training-type-form-header {
            padding: 20px 24px;
            border-bottom: 1px solid #e9edf4;
        }

        .training-type-form-header h5 {
            margin: 0;
            font-size: 18px;
            font-weight: 600;
            color: #1f2937;
        }

        .training-type-form-body {
            padding: 24px;
        }


        /* =====================================================
           LABELS
           ===================================================== */

        .training-type-form-body .form-label {
            font-size: 14px;
            font-weight: 500;
            color: #374151;
            margin-bottom: 8px;
        }

        .required {
            color: #f04438;
            margin-left: 2px;
        }


        /* =====================================================
           INPUTS
           ===================================================== */

        .training-type-form-body .form-control,
        .training-type-form-body .form-select {
            min-height: 44px;
            border: 1px solid #d9dfe8;
            border-radius: 5px;
            box-shadow: none;
            font-size: 14px;
            color: #1f2937;
        }

        .training-type-form-body .form-control:focus,
        .training-type-form-body .form-select:focus {
            border-color: #ff5b35;
            box-shadow: 0 0 0 0.15rem rgba(255, 91, 53, 0.10);
        }

        .training-type-form-body textarea.form-control {
            min-height: 130px;
            resize: vertical;
        }


        /* =====================================================
           ID FIELD
           ===================================================== */

        .training-type-id-box {
            background: #f5f6f8 !important;
            color: #6b7280 !important;
            cursor: not-allowed;
        }


        /* =====================================================
           FORM ACTIONS
           ===================================================== */

        .form-actions {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 10px;
            padding-top: 20px;
            margin-top: 8px;
            border-top: 1px solid #e9edf4;
        }


        /* =====================================================
           CANCEL BUTTON
           ===================================================== */

        .btn-training-cancel {
            min-height: 42px;
            padding: 0 20px;
            border: 1px solid #d9dfe8;
            border-radius: 5px;
            background: #ffffff;
            color: #374151;
            text-decoration: none;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            font-size: 14px;
            font-weight: 500;

            transition: all 0.2s ease;
        }

        .btn-training-cancel:hover {
            background: #f5f6f8;
            color: #111827;
        }


        /* =====================================================
           UPDATE BUTTON
           ===================================================== */

        .btn-training-update {
            min-height: 42px;
            padding: 0 22px;

            border: 0;
            border-radius: 5px;

            background: #ff5b35;
            color: #ffffff;

            display: inline-flex;
            align-items: center;
            justify-content: center;

            gap: 7px;

            font-size: 14px;
            font-weight: 500;

            cursor: pointer;

            transition: all 0.2s ease;
        }

        .btn-training-update:hover {
            background: #e94e2b;
            color: #ffffff;
        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 767px) {

            .training-type-form-body {
                padding: 16px;
            }

            .training-type-form-header {
                padding: 16px;
            }

            .form-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .btn-training-cancel,
            .btn-training-update {
                width: 100%;
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
     MAIN WRAPPER
     ========================================================= -->

<div class="main-wrapper">


    <!-- =========================================================
         HEADER
         ========================================================= -->

    <div class="header">

        <div class="main-header">


            <!-- =================================================
                 HEADER LEFT / LOGO
                 ================================================= -->

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


            <!-- =================================================
                 MOBILE BUTTON
                 ================================================= -->

            <a id="mobile_btn"
               class="mobile_btn"
               href="#sidebar">

                <span class="bar-icon">
                    <span></span>
                    <span></span>
                    <span></span>
                </span>

            </a>


            <!-- =================================================
                 HEADER SEARCH
                 ================================================= -->

            <div class="header-user">

                <div class="nav user-menu nav-list">

                    <div class="me-auto d-flex align-items-center"
                         id="header-search">


                        <!-- Sidebar toggle -->

                        <a id="toggle_btn"
                           href="javascript:void(0);"
                           class="btn btn-menubar me-1">

                            <i class="ti ti-arrow-bar-to-left"></i>

                        </a>


                        <!-- Search -->

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


                        <!-- Settings -->

                        <a href="javascript:void(0);"
                           class="btn btn-menubar">

                            <i class="ti ti-settings-cog"></i>

                        </a>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 MOBILE USER MENU
                 ================================================= -->

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


        <!-- =====================================================
             SIDEBAR LOGO
             ===================================================== -->

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


        <!-- =====================================================
             ADMIN PROFILE
             ===================================================== -->

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
             ===================================================== -->

        <div class="sidebar-menu">

            <ul>


                <!-- =================================================
                     MAIN MENU
                     ================================================= -->

                <li class="menu-title">

                    <span>MAIN MENU</span>

                </li>


                <!-- =================================================
                     DASHBOARD
                     ================================================= -->

                <li>

                    <a href="${pageContext.request.contextPath}/admin/dashboard">

                        <i class="ti ti-smart-home"></i>

                        <span>Dashboard</span>

                    </a>

                </li>


                <!-- =================================================
                     EMPLOYEES
                     ================================================= -->

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


                <!-- =================================================
                     ATTENDANCE
                     ================================================= -->

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


                <!-- =================================================
                     EVENTS
                     ================================================= -->

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


                <!-- =================================================
                     PAYROLL
                     ================================================= -->

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


                <!-- =================================================
                     TRAINING
                     ================================================= -->

                <li class="submenu active">

                    <a href="javascript:void(0);">

                        <i class="ti ti-school"></i>

                        <span>Training</span>

                        <span class="menu-arrow"></span>

                    </a>


                    <ul>


                        <!-- TRAINERS -->

                        <li>

                            <a href="${pageContext.request.contextPath}/trainerList">

                                <span>Trainers</span>

                            </a>

                        </li>


                        <!-- TRAINING -->

                        <li>

                            <a href="${pageContext.request.contextPath}/trainingList">

                                <span>Training</span>

                            </a>

                        </li>


                        <!-- TRAINING TYPE -->

                        <li class="active">

                            <a href="${pageContext.request.contextPath}/trainingTypeList">

                                <span>Training Type</span>

                            </a>

                        </li>

                    </ul>

                </li>


                <!-- =================================================
                     DOCUMENTS
                     ================================================= -->

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


                <!-- =================================================
                     MASTER DOCUMENT
                     ================================================= -->

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


                <!-- =================================================
                     PERFORMANCE & GOAL
                     ================================================= -->

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


                <!-- =================================================
                     PROJECTS
                     ================================================= -->

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


                <!-- =================================================
                     REPORTS
                     ================================================= -->

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


                <!-- =================================================
                     PROMOTIONS
                     ================================================= -->

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


                <!-- =================================================
                     RESIGNATION
                     ================================================= -->

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


                <!-- =================================================
                     TERMINATION
                     ================================================= -->

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


                <!-- =================================================
                     HELP & SUPPORT
                     ================================================= -->

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


                <!-- =================================================
                     TICKETS
                     ================================================= -->

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


                <!-- =================================================
                     LOGOUT
                     ================================================= -->

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

    <div class="page-wrapper edit-training-type-page">

        <div class="content">


            <!-- =====================================================
                 PAGE HEADER
                 ===================================================== -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">


                <div class="my-auto mb-2">

                    <h2 class="mb-1">
                        Edit Training Type
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


                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/trainingTypeList">

                                    Training Type

                                </a>

                            </li>


                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Edit Training Type

                            </li>

                        </ol>

                    </nav>

                </div>

            </div>


            <!-- =====================================================
                 FORM CARD
                 ===================================================== -->

            <div class="training-type-form-card card border-0">


                <!-- =================================================
                     CARD HEADER
                     ================================================= -->

                <div class="training-type-form-header">

                    <h5>
                        Training Type Information
                    </h5>

                </div>


                <!-- =================================================
                     FORM BODY
                     ================================================= -->

                <div class="training-type-form-body">


                    <form action="${pageContext.request.contextPath}/editTrainingType"
                          method="post">


                        <!-- =================================================
                             HIDDEN ID
                             ================================================= -->

                        <input type="hidden"
                               name="trainingTypeId"
                               value="<%= trainingType.getTrainingTypeId() %>">


                        <!-- =================================================
                             ID + TRAINING TYPE NAME
                             ================================================= -->

                        <div class="row">


                            <!-- Training Type ID -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Training Type ID

                                    </label>


                                    <input type="text"
                                           class="form-control training-type-id-box"
                                           value="<%= trainingType.getTrainingTypeId() %>"
                                           readonly>

                                </div>

                            </div>


                            <!-- Training Type Name -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label for="trainingTypeName"
                                           class="form-label">

                                        Training Type Name

                                        <span class="required">
                                            *
                                        </span>

                                    </label>


                                    <input type="text"
                                           id="trainingTypeName"
                                           name="trainingTypeName"
                                           class="form-control"
                                           value="<%= trainingType.getTrainingTypeName() == null
                                                   ? ""
                                                   : trainingType.getTrainingTypeName() %>"
                                           placeholder="Enter training type name"
                                           maxlength="255"
                                           required>

                                </div>

                            </div>

                        </div>


                        <!-- =================================================
                             DESCRIPTION
                             ================================================= -->

                        <div class="row">

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label for="description"
                                           class="form-label">

                                        Description

                                        <span class="required">
                                            *
                                        </span>

                                    </label>


                                    <textarea id="description"
                                              name="description"
                                              class="form-control"
                                              placeholder="Enter training type description"
                                              required><%= trainingType.getDescription() == null
                                            ? ""
                                            : trainingType.getDescription() %></textarea>

                                </div>

                            </div>

                        </div>


                        <!-- =================================================
                             STATUS
                             ================================================= -->

                        <div class="row">

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label for="status"
                                           class="form-label">

                                        Status

                                        <span class="required">
                                            *
                                        </span>

                                    </label>


                                    <select id="status"
                                            name="status"
                                            class="form-select"
                                            required>


                                        <option value="Active"
                                                <%= "Active".equalsIgnoreCase(
                                                        trainingType.getStatus())
                                                        ? "selected"
                                                        : "" %>>

                                            Active

                                        </option>


                                        <option value="InActive"
                                                <%= "InActive".equalsIgnoreCase(
                                                        trainingType.getStatus())
                                                        ? "selected"
                                                        : "" %>>

                                            InActive

                                        </option>


                                    </select>

                                </div>

                            </div>

                        </div>


                        <!-- =================================================
                             FORM ACTIONS
                             ================================================= -->

                        <div class="form-actions">


                            <!-- CANCEL -->

                            <a href="${pageContext.request.contextPath}/trainingTypeList"
                               class="btn-training-cancel">

                                <i class="ti ti-arrow-left me-1"></i>

                                Cancel

                            </a>


                            <!-- UPDATE -->

                            <button type="submit"
                                    class="btn-training-update">

                                <i class="ti ti-check"></i>

                                Update Training Type

                            </button>


                        </div>


                    </form>

                </div>

            </div>


        </div>

    </div>


</div>
<!-- /main-wrapper -->


<!-- =========================================================
     JAVASCRIPT
     ========================================================= -->

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


<!-- =========================================================
     HRMS SIDEBAR JAVASCRIPT
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


</body>

</html>
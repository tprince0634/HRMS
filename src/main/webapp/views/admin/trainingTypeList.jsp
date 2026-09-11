<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.example.model.TrainingType" %>

<%
    String context = request.getContextPath();

    List<TrainingType> trainingTypes =
            (List<TrainingType>) request.getAttribute("trainingTypes");

    if (trainingTypes == null) {
        trainingTypes = new ArrayList<>();
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description"
          content="HRMS Training Type">

    <meta name="keywords"
          content="HRMS, Training Type">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">


    <title>Training Type | HRMS</title>


    <!-- Favicon -->

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">


    <!-- Theme -->

    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>


    <!-- Bootstrap -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">


    <!-- Feather Icons -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">


    <!-- Tabler Icons -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">


    <!-- Select2 -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">


    <!-- Font Awesome -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">


    <!-- Date Time Picker -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">


    <!-- Date Range Picker -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">


    <!-- Flatpickr -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">


    <!-- Main CSS -->

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
           TRAINING TYPE PAGE
           ========================================================= */

        .training-type-card {
            border: 1px solid #e6e8eb;
            border-radius: 8px;
            overflow: hidden;
        }


        /* =========================================================
           ADD BUTTON
           ========================================================= */

        .add-training-type-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 10px 16px;
            border-radius: 5px;
            background: #ff5b35;
            color: #ffffff !important;
            font-weight: 600;
            text-decoration: none;
            border: 1px solid #ff5b35;
        }

        .add-training-type-btn:hover {
            background: #e94d29;
            border-color: #e94d29;
            color: #ffffff !important;
        }


        /* =========================================================
           TABLE TOOLBAR
           ========================================================= */

        .training-type-toolbar {
            padding: 20px 24px;
            border-bottom: 1px solid #e9ecef;
        }

        .row-per-page {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #6b7280;
            font-size: 14px;
        }

        .row-per-page select {
            width: 96px;
            height: 42px;
            border: 1px solid #d9dee5;
            border-radius: 6px;
            padding: 0 12px;
            background: #ffffff;
            outline: none;
        }

        .training-type-search {
            width: 260px;
            position: relative;
        }

        .training-type-search i {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #8b95a1;
            z-index: 2;
        }

        .training-type-search input {
            width: 100%;
            height: 42px;
            padding-left: 40px;
            padding-right: 12px;
            border: 1px solid #d9dee5;
            border-radius: 6px;
            outline: none;
            font-size: 14px;
        }

        .training-type-search input:focus {
            border-color: #ff5b35;
            box-shadow: 0 0 0 2px rgba(255, 91, 53, 0.08);
        }


        /* =========================================================
           TABLE
           ========================================================= */

        .training-type-table-wrapper {
            padding: 0 24px;
            overflow-x: auto;
        }

        .training-type-table {
            width: 100%;
            min-width: 800px;
            border-collapse: collapse;
        }

        .training-type-table thead th {
            background: #f1f3f5;
            color: #111827;
            font-size: 14px;
            font-weight: 700;
            padding: 15px 12px;
            border-bottom: 1px solid #dfe3e7;
            white-space: nowrap;
        }

        .training-type-table tbody td {
            padding: 16px 12px;
            border-bottom: 1px solid #e8eaed;
            color: #667085;
            font-size: 14px;
            vertical-align: middle;
        }

        .training-type-table tbody tr:hover {
            background: #fafafa;
        }

        .training-type-id {
            color: #111827 !important;
            font-weight: 700;
        }

        .training-type-name {
            color: #111827;
            font-weight: 500;
        }

        .training-type-description {
            color: #667085;
            max-width: 450px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }


        /* =========================================================
           STATUS
           ========================================================= */

        .training-status-btn {
            border: 0;
            min-width: 76px;
            padding: 7px 11px;
            border-radius: 5px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            font-size: 12px;
            font-weight: 600;
            cursor: pointer;
        }

        .training-status-btn.active {
            background: #22c55e;
            color: #ffffff;
        }

        .training-status-btn.inactive {
            background: #ef2929;
            color: #ffffff;
        }

        .training-status-btn:hover {
            opacity: 0.88;
        }

        .status-dot {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: #ffffff;
            display: inline-block;
        }


        /* =========================================================
           ACTION BUTTONS
           ========================================================= */

        .training-actions {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .training-action-btn {
            width: 36px;
            height: 36px;
            border-radius: 6px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            border: 1px solid #e2e6ea;
            font-size: 17px;
            transition: 0.2s ease;
        }

        .training-edit-btn {
            color: #0d6efd;
            background: #f3f8ff;
        }

        .training-edit-btn:hover {
            color: #ffffff;
            background: #0d6efd;
            border-color: #0d6efd;
        }

        .training-delete-btn {
            color: #dc3545;
            background: #fff5f5;
        }

        .training-delete-btn:hover {
            color: #ffffff;
            background: #dc3545;
            border-color: #dc3545;
        }


        /* =========================================================
           EMPTY
           ========================================================= */

        .training-empty {
            text-align: center;
            padding: 50px 20px !important;
            color: #98a2b3 !important;
        }

        .training-empty i {
            display: block;
            font-size: 35px;
            margin-bottom: 10px;
        }


        /* =========================================================
           FOOTER
           ========================================================= */

        .training-table-footer {
            padding: 18px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .training-entries-info {
            color: #667085;
            font-size: 14px;
        }

        .training-pagination {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .training-pagination button {
            min-width: 34px;
            height: 34px;
            border: 1px solid #dfe3e7;
            background: #ffffff;
            color: #344054;
            border-radius: 5px;
            font-size: 13px;
            cursor: pointer;
        }

        .training-pagination button:hover {
            background: #f5f6f7;
        }

        .training-pagination button.active {
            background: #ff5b35;
            border-color: #ff5b35;
            color: #ffffff;
        }

        .training-pagination button:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }


        /* =========================================================
           RESPONSIVE
           ========================================================= */

        @media (max-width: 767px) {

            .training-type-toolbar {
                padding: 15px;
            }

            .training-type-search {
                width: 100%;
                margin-top: 15px;
            }

            .training-type-table-wrapper {
                padding: 0 15px;
            }

            .training-table-footer {
                padding: 15px;
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
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


    <!-- =====================================================
         HEADER
         ===================================================== -->

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


    <!-- =====================================================
         SIDEBAR
         ===================================================== -->

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


        <!-- SIDEBAR MENU -->

        <div class="sidebar-menu">


            <ul>


                <!-- =================================================
                     MAIN MENU
                     ================================================= -->

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


                        <li>

                            <a href="${pageContext.request.contextPath}/trainerList">

                                <span>Trainers</span>

                            </a>

                        </li>


                        <li>

                            <a href="${pageContext.request.contextPath}/trainingList">

                                <span>Training</span>

                            </a>

                        </li>


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


    <!-- =====================================================
         PAGE WRAPPER
         ===================================================== -->

    <div class="page-wrapper">


        <div class="content">


            <!-- =================================================
                 PAGE HEADER
                 ================================================= -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">


                <div class="my-auto mb-2">


                    <h2 class="mb-1">

                        Training Type

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

                                Training Type

                            </li>


                        </ol>

                    </nav>


                </div>


                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">


                    <div class="mb-2">

                        <a href="${pageContext.request.contextPath}/addTrainingType"
                           class="btn btn-primary">

                            <i class="ti ti-square-rounded-plus me-1"></i>

                            Add Training Type

                        </a>

                    </div>


                </div>


            </div>


            <!-- =================================================
                 TRAINING TYPE LIST CARD
                 ================================================= -->

            <div class="card training-type-card">


                <!-- CARD HEADER -->

                <div class="card-header">

                    <h4 class="card-title">

                        Training Type List

                    </h4>

                </div>


                <!-- TOOLBAR -->

                <div class="training-type-toolbar">


                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">


                        <div class="row-per-page">

                            <span>

                                Row Per Page

                            </span>


                            <select id="rowsPerPage">

                                <option value="10">
                                    10
                                </option>

                                <option value="25">
                                    25
                                </option>

                                <option value="50">
                                    50
                                </option>

                                <option value="100">
                                    100
                                </option>

                            </select>


                            <span>

                                Entries

                            </span>

                        </div>


                        <div class="training-type-search">


                            <i class="ti ti-search"></i>


                            <input type="text"
                                   id="trainingTypeSearch"
                                   placeholder="Search">


                        </div>


                    </div>

                </div>


                <!-- =================================================
                     TABLE
                     ================================================= -->

                <div class="training-type-table-wrapper">


                    <table class="training-type-table">


                        <thead>

                        <tr>


                            <th>

                                ID

                            </th>


                            <th>

                                Training Type

                            </th>


                            <th>

                                Description

                            </th>


                            <th>

                                Status

                            </th>


                            <th>

                                Action

                            </th>


                        </tr>

                        </thead>


                        <tbody id="trainingTypeTableBody">


                        <%
                            if (trainingTypes.isEmpty()) {
                        %>


                        <tr>

                            <td colspan="5"
                                class="training-empty">

                                <i class="ti ti-folder-open"></i>

                                No training types found.

                            </td>

                        </tr>


                        <%
                        } else {

                            for (TrainingType trainingType : trainingTypes) {

                                boolean active =
                                        "Active".equalsIgnoreCase(
                                                trainingType.getStatus()
                                        );

                                String description =
                                        trainingType.getDescription();

                                if (description == null ||
                                        description.trim().isEmpty()) {

                                    description = "Nil";

                                }
                        %>


                        <tr class="training-type-row">


                            <!-- ID -->

                            <td class="training-type-id">

                                <%= trainingType.getTrainingTypeId() %>

                            </td>


                            <!-- TRAINING TYPE -->

                            <td>

                                <span class="training-type-name">

                                    <%= trainingType.getTrainingTypeName() %>

                                </span>

                            </td>


                            <!-- DESCRIPTION -->

                            <td>


                                <div class="training-type-description"
                                     title="<%= description %>">

                                    <%= description %>

                                </div>


                            </td>


                            <!-- STATUS -->

                            <td>


                                <form action="<%= context %>/changeTrainingTypeStatus"
                                      method="post"
                                      style="display:inline;">


                                    <input type="hidden"
                                           name="id"
                                           value="<%= trainingType.getTrainingTypeId() %>">


                                    <input type="hidden"
                                           name="status"
                                           value="<%= active ? "InActive" : "Active" %>">


                                    <button type="submit"
                                            class="training-status-btn <%= active ? "active" : "inactive" %>"
                                            title="Click to change status">


                                        <span class="status-dot"></span>


                                        <%= active ? "Active" : "Inactive" %>


                                    </button>


                                </form>


                            </td>


                            <!-- ACTION -->

                            <td>


                                <div class="training-actions">


                                    <!-- EDIT -->

                                    <a href="<%= context %>/editTrainingType?id=<%= trainingType.getTrainingTypeId() %>"
                                       class="training-action-btn training-edit-btn"
                                       title="Edit Training Type">


                                        <i class="ti ti-edit"></i>


                                    </a>


                                    <!-- DELETE -->

                                    <a href="<%= context %>/deleteTrainingType?id=<%= trainingType.getTrainingTypeId() %>"
                                       class="training-action-btn training-delete-btn"
                                       title="Delete Training Type"
                                       onclick="return confirmDeleteTrainingType(<%= trainingType.getTrainingTypeId() %>);">


                                        <i class="ti ti-trash"></i>


                                    </a>


                                </div>


                            </td>


                        </tr>


                        <%
                                }
                            }
                        %>


                        </tbody>


                    </table>


                </div>


                <!-- =================================================
                     TABLE FOOTER
                     ================================================= -->

                <div class="training-table-footer">


                    <div class="training-entries-info"
                         id="entriesInfo">

                        Showing 0 to 0 of 0 entries

                    </div>


                    <div class="training-pagination"
                         id="pagination">

                    </div>


                </div>


            </div>


        </div>

    </div>


</div>


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

    function confirmDeleteTrainingType(trainingTypeId) {

        return confirm(

            "Are you sure you want to delete Training Type #" +
            trainingTypeId +
            "?\n\nThis action cannot be undone."

        );

    }

</script>


<!-- =========================================================
     SEARCH + PAGINATION
     ========================================================= -->

<script>

    document.addEventListener(
        'DOMContentLoaded',
        function () {


            const searchInput =
                document.getElementById(
                    'trainingTypeSearch'
                );


            const rowsPerPageSelect =
                document.getElementById(
                    'rowsPerPage'
                );


            const tableBody =
                document.getElementById(
                    'trainingTypeTableBody'
                );


            const entriesInfo =
                document.getElementById(
                    'entriesInfo'
                );


            const pagination =
                document.getElementById(
                    'pagination'
                );


            let currentPage = 1;


            function getRows() {

                return Array.from(
                    tableBody.querySelectorAll(
                        'tr.training-type-row'
                    )
                );

            }


            function renderTable() {


                const rows =
                    getRows();


                const searchValue =
                    searchInput.value
                        .toLowerCase()
                        .trim();


                const matchingRows =
                    rows.filter(
                        function (row) {

                            return row.innerText
                                .toLowerCase()
                                .includes(searchValue);

                        }
                    );


                const rowsPerPage =
                    parseInt(
                        rowsPerPageSelect.value
                    );


                const totalRows =
                    matchingRows.length;


                const totalPages =
                    Math.max(
                        1,
                        Math.ceil(
                            totalRows /
                            rowsPerPage
                        )
                    );


                if (currentPage > totalPages) {

                    currentPage =
                        totalPages;

                }


                rows.forEach(
                    function (row) {

                        row.style.display =
                            'none';

                    }
                );


                const startIndex =
                    (currentPage - 1) *
                    rowsPerPage;


                const endIndex =
                    startIndex +
                    rowsPerPage;


                matchingRows
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


                if (totalRows === 0) {


                    entriesInfo.textContent =
                        'Showing 0 to 0 of 0 entries';


                } else {


                    const from =
                        startIndex + 1;


                    const to =
                        Math.min(
                            endIndex,
                            totalRows
                        );


                    entriesInfo.textContent =
                        'Showing ' +
                        from +
                        ' to ' +
                        to +
                        ' of ' +
                        totalRows +
                        ' entries';


                }


                renderPagination(
                    totalPages
                );

            }


            function renderPagination(
                totalPages
            ) {


                pagination.innerHTML = '';


                if (totalPages <= 1) {

                    return;

                }


                const previous =
                    document.createElement(
                        'button'
                    );


                previous.type =
                    'button';


                previous.textContent =
                    'Previous';


                previous.disabled =
                    currentPage === 1;


                previous.addEventListener(
                    'click',
                    function () {


                        if (currentPage > 1) {

                            currentPage--;

                            renderTable();

                        }

                    }
                );


                pagination.appendChild(
                    previous
                );


                for (
                    let page = 1;
                    page <= totalPages;
                    page++
                ) {


                    const button =
                        document.createElement(
                            'button'
                        );


                    button.type =
                        'button';


                    button.textContent =
                        page;


                    if (page === currentPage) {

                        button.classList.add(
                            'active'
                        );

                    }


                    button.addEventListener(
                        'click',
                        function () {

                            currentPage =
                                page;

                            renderTable();

                        }
                    );


                    pagination.appendChild(
                        button
                    );

                }


                const next =
                    document.createElement(
                        'button'
                    );


                next.type =
                    'button';


                next.textContent =
                    'Next';


                next.disabled =
                    currentPage === totalPages;


                next.addEventListener(
                    'click',
                    function () {


                        if (
                            currentPage <
                            totalPages
                        ) {

                            currentPage++;

                            renderTable();

                        }

                    }
                );


                pagination.appendChild(
                    next
                );


            }


            searchInput.addEventListener(
                'input',
                function () {

                    currentPage = 1;

                    renderTable();

                }
            );


            rowsPerPageSelect.addEventListener(
                'change',
                function () {

                    currentPage = 1;

                    renderTable();

                }
            );


            renderTable();


        }
    );

</script>


</body>

</html>
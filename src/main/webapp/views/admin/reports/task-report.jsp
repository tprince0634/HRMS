<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
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
    </style>

</head>
<body>
<div class="main-wrapper">

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

                    <a class="subdrop" href="javascript:void(0);">
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

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/project-report">
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



    <div class="page-wrapper">
        <div class="content">

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Task Report</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item">HR</li>
                            <li class="breadcrumb-item active" aria-current="page">Task Report</li>
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
                            <ul class="dropdown-menu dropdown-menu-end p-3">
                                <li>
                                    <a href="javascript:void(0);" id="exportPdf"
                                       class="dropdown-item rounded-1">
                                        <i class="ti ti-file-type-pdf me-1"></i>Export as PDF
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" id="exportExcel"
                                       class="dropdown-item rounded-1">
                                        <i class="ti ti-file-type-xls me-1"></i>Export as Excel
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="head-icons ms-2">
                        <a href="javascript:void(0);" data-bs-toggle="tooltip"
                           data-bs-placement="top" title="Collapse"
                           id="collapse-header">
                            <i class="ti ti-chevrons-up"></i>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Dynamic Task Summary -->
            <div class="row">

                <div class="col-lg-6 col-md-6 d-flex">
                    <div class="row flex-fill">

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <span class="fs-14 fw-normal text-truncate mb-1">Total Tasks</span>
                                            <h5>${totalTasks}</h5>
                                        </div>
                                        <div class="col-4">
                                            <p class="data-attributes">
                                                <span>100/100</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <span class="fs-14 fw-normal text-truncate mb-1">Completed</span>
                                            <h5>${completedTasks}</h5>
                                        </div>
                                        <div class="col-4">
                                            <p class="data-attributes">
                                                <span>100/100</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <span class="fs-14 fw-normal text-truncate mb-1">On Hold</span>
                                            <h5>${onHoldTasks}</h5>
                                        </div>
                                        <div class="col-4">
                                            <p class="data-attributes">
                                                <span>100/100</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <span class="fs-14 fw-normal text-truncate mb-1">Overdue</span>
                                            <h5>${overdueTasks}</h5>
                                        </div>
                                        <div class="col-4">
                                            <p class="data-attributes">
                                                <span>100/100</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Dynamic Task Chart -->
                <div class="col-lg-6 col-md-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header border-0">
                            <div class="d-flex flex-wrap justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                        <span class="me-2">
                                            <i class="ti ti-chart-pie text-danger"></i>
                                        </span>
                                    <h5>Tasks</h5>
                                </div>

                                <div class="dropdown">
                                    <a href="javascript:void(0);"
                                       id="chartProjectButton"
                                       class="dropdown-toggle btn btn-sm fs-12 btn-white d-inline-flex align-items-center"
                                       data-bs-toggle="dropdown">
                                        All Projects
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end p-2" id="chartProjectFilter">
                                        <li>
                                            <a href="javascript:void(0);"
                                               class="dropdown-item rounded-1 chart-project-option"
                                               data-project-id="">
                                                All Projects
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="card-body pt-0">
                            <div class="row align-items-center">
                                <div class="col-md-6 d-flex align-items-center justify-content-center">
                                    <div class="position-relative payment-total">
                                        <div id="task-reports"></div>
                                        <div class="task-total-content">
                                            <p class="fs-16 fw-normal mb-0">Pending</p>
                                            <span id="task-pending-percent"
                                                  class="display-3 fs-24 fw-bold text-skyblue">0%</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="row gy-4">
                                        <div class="col-md-6">
                                            <div class="d-flex task-report-icons">
                                                    <span class="me-2">
                                                        <i class="ti ti-arrow-badge-right-filled text-success"></i>
                                                    </span>
                                                <h6 class="fs-16">
                                                    Completed
                                                    <span id="completed-percent" class="fs-14 fw-normal">0%</span>
                                                </h6>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="d-flex task-report-icons">
                                                    <span class="me-2">
                                                        <i class="ti ti-arrow-badge-right-filled text-skyblue"></i>
                                                    </span>
                                                <h6 class="fs-16">
                                                    Pending
                                                    <span id="pending-percent" class="fs-14 fw-normal">0%</span>
                                                </h6>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="d-flex task-report-icons">
                                                    <span class="me-2">
                                                        <i class="ti ti-arrow-badge-right-filled text-warning"></i>
                                                    </span>
                                                <h6 class="fs-16">
                                                    In Progress
                                                    <span id="inprogress-percent" class="fs-14 fw-normal">0%</span>
                                                </h6>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="d-flex task-report-icons">
                                                    <span class="me-2">
                                                        <i class="ti ti-arrow-badge-right-filled text-purple"></i>
                                                    </span>
                                                <h6 class="fs-16">
                                                    On Hold
                                                    <span id="onhold-percent" class="fs-14 fw-normal">0%</span>
                                                </h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Tasks List -->
            <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                    <h5>Tasks List</h5>

                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">

                        <div class="me-3">
                            <div class="input-icon-end position-relative">
                                <input type="text"
                                       id="taskDateRange"
                                       class="form-control date-range bookingrange"
                                       placeholder="dd/mm/yyyy - dd/mm/yyyy">
                                <span class="input-icon-addon">
                                        <i class="ti ti-chevron-down"></i>
                                    </span>
                            </div>
                        </div>

                        <div class="dropdown me-3">
                            <a href="javascript:void(0);"
                               id="priorityFilterButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">
                                Select Priority
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-3" id="priorityFilter">
                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1 task-priority-filter"
                                       data-value="">
                                        All Priority
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="dropdown me-3">
                            <a href="javascript:void(0);"
                               id="statusFilterButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">
                                Select Status
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-3" id="statusFilter">
                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1 task-status-filter"
                                       data-value="">
                                        All Status
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <div class="dropdown">
                            <a href="javascript:void(0);"
                               id="taskSortButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">
                                Sort By : Latest Due Date
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-3">
                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1 task-sort"
                                       data-sort="latest">
                                        Latest Due Date
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1 task-sort"
                                       data-sort="oldest">
                                        Oldest Due Date
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1 task-sort"
                                       data-sort="nameAsc">
                                        Task Name A-Z
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1 task-sort"
                                       data-sort="nameDesc">
                                        Task Name Z-A
                                    </a>
                                </li>
                            </ul>
                        </div>

                        <button type="button" id="resetTaskFilters"
                                class="btn btn-light ms-3">
                            Reset
                        </button>

                    </div>
                </div>

                <div class="card-body p-0">
                    <div class="custom-datatable-filter table-responsive">

                        <table id="taskReportTable" class="table datatable">
                            <thead class="thead-light">
                            <tr>
                                <th class="no-sort">
                                    <div class="form-check form-check-md">
                                        <input class="form-check-input"
                                               type="checkbox"
                                               id="select-all">
                                    </div>
                                </th>
                                <th>Task Name</th>
                                <th>Project Name</th>
                                <th>Created Date</th>
                                <th>Due Date</th>
                                <th>Priority</th>
                                <th>Status</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:if test="${empty tasks}">
                                <tr>
                                    <td colspan="7" class="text-center py-4 text-muted">
                                        No tasks found.
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="task" items="${tasks}">
                                <tr data-task-id="${task.taskId}"
                                    data-project-id="${task.projectId}"
                                    data-status="${task.status}"
                                    data-priority="${task.priority}"
                                    data-deadline="${task.deadline}">

                                    <td>
                                        <div class="form-check form-check-md">
                                            <input class="form-check-input task-checkbox"
                                                   type="checkbox">
                                        </div>
                                    </td>

                                    <td>
                                        <div class="d-flex align-items-center file-name-icon">
                                            <h6 class="fw-medium mb-0">
                                                <a href="javascript:void(0);">
                                                    <c:out value="${task.title}"/>
                                                </a>
                                            </h6>
                                        </div>
                                    </td>

                                    <td>
                                        <c:out value="${task.projectName}"/>
                                    </td>

                                    <!-- task table has no CreatedDate column -->
                                    <td>—</td>

                                    <td class="task-deadline">
                                        <c:out value="${task.deadline}"/>
                                    </td>

                                    <td>
                                                <span class="badge task-priority-badge text-dark bg-light">
                                                    <i class="ti ti-point-filled me-1"></i>
                                                    <c:out value="${task.priority}"/>
                                                </span>
                                    </td>

                                    <td>
                                                <span class="badge task-status-badge d-inline-flex align-items-center badge-xs text-dark bg-light">
                                                    <i class="ti ti-point-filled me-1"></i>
                                                    <c:out value="${task.status}"/>
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

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
            <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
            <p>Designed &amp; Developed By
                <a href="javascript:void(0);" class="text-primary">Dreams</a>
            </p>
        </div>

    </div>
    <!-- /Page Wrapper -->

</div>
<!-- /Main Wrapper -->


<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function () {

        var totalTasks = Number("${totalTasks}") || 0;
        var completedTasks = Number("${completedTasks}") || 0;
        var pendingTasks = Number("${pendingTasks}") || 0;
        var inProgressTasks = Number("${inProgressTasks}") || 0;
        var onHoldTasks = Number("${onHoldTasks}") || 0;

        function percent(value, total) {
            if (!total) return 0;
            return Math.round((value / total) * 100);
        }

        function normalize(value) {
            return String(value || "").trim().toLowerCase();
        }

        /*
         * Dynamic Priority / Status / Project options
         * Values come directly from the tasks already fetched from DB.
         */
        function addDynamicFilterOptions(listId, itemClass, dataAttribute, allText) {

            var list = document.getElementById(listId);

            if (!list) {
                return;
            }

            var seen = {};

            document.querySelectorAll("#taskReportTable tbody tr[data-task-id]").forEach(function (row) {

                var value = row.getAttribute(dataAttribute);

                if (!value || !value.trim()) {
                    return;
                }

                var key = normalize(value);

                if (seen[key]) {
                    return;
                }

                seen[key] = true;

                var li = document.createElement("li");
                var a = document.createElement("a");

                a.href = "javascript:void(0);";
                a.className = "dropdown-item rounded-1 " + itemClass;
                a.setAttribute("data-value", value);
                a.textContent = value;

                li.appendChild(a);
                list.appendChild(li);
            });
        }

        addDynamicFilterOptions(
            "priorityFilter",
            "task-priority-filter",
            "data-priority",
            "All Priority"
        );

        addDynamicFilterOptions(
            "statusFilter",
            "task-status-filter",
            "data-status",
            "All Status"
        );

        /*
         * Dynamic Project options for the chart.
         * The first option remains All Projects.
         */
        (function buildProjectFilter() {

            var list = document.getElementById("chartProjectFilter");

            if (!list) {
                return;
            }

            var seenProjects = {};

            document.querySelectorAll("#taskReportTable tbody tr[data-task-id]").forEach(function (row) {

                var projectId = row.getAttribute("data-project-id");

                if (!projectId || seenProjects[projectId]) {
                    return;
                }

                var projectCell = row.children[2];

                if (!projectCell) {
                    return;
                }

                var projectName = projectCell.textContent.trim();

                if (!projectName || projectName === "—") {
                    return;
                }

                seenProjects[projectId] = true;

                var li = document.createElement("li");
                var a = document.createElement("a");

                a.href = "javascript:void(0);";
                a.className = "dropdown-item rounded-1 chart-project-option";
                a.setAttribute("data-project-id", projectId);
                a.textContent = projectName;

                li.appendChild(a);
                list.appendChild(li);
            });
        })();

        document.getElementById("completed-percent").textContent =
            percent(completedTasks, totalTasks) + "%";

        document.getElementById("pending-percent").textContent =
            percent(pendingTasks, totalTasks) + "%";

        document.getElementById("inprogress-percent").textContent =
            percent(inProgressTasks, totalTasks) + "%";

        document.getElementById("onhold-percent").textContent =
            percent(onHoldTasks, totalTasks) + "%";

        document.getElementById("task-pending-percent").textContent =
            percent(pendingTasks, totalTasks) + "%";


        /* -----------------------------
           Format Due Date
           ----------------------------- */
        document.querySelectorAll(".task-deadline").forEach(function (cell) {

            var row = cell.closest("tr");
            var raw = row ? row.getAttribute("data-deadline") : "";

            if (!raw) {
                cell.textContent = "—";
                return;
            }

            var date = new Date(raw);

            if (isNaN(date.getTime())) {
                cell.textContent = raw.replace("T", " ");
                return;
            }

            cell.textContent =
                String(date.getDate()).padStart(2, "0") + " " +
                date.toLocaleString("en-US", { month: "short" }) + " " +
                date.getFullYear();
        });


        /* -----------------------------
           Remove duplicate filter options
           ----------------------------- */
        function removeDuplicateOptions(selector) {

            var seen = {};

            document.querySelectorAll(selector).forEach(function (item) {

                var value = normalize(item.getAttribute("data-value"));

                if (!value) return;

                if (seen[value]) {
                    var li = item.closest("li");
                    if (li) li.remove();
                } else {
                    seen[value] = true;
                }
            });
        }

        removeDuplicateOptions(".task-priority-filter");
        removeDuplicateOptions(".task-status-filter");


        /* -----------------------------
           ApexCharts
           ----------------------------- */
        var chart = null;

        function renderChart(projectId) {

            var counts = {
                completed: 0,
                pending: 0,
                inProgress: 0,
                onHold: 0
            };

            document.querySelectorAll("#taskReportTable tbody tr").forEach(function (row) {

                if (projectId &&
                    row.getAttribute("data-project-id") !== String(projectId)) {
                    return;
                }

                var status = normalize(row.getAttribute("data-status"));

                if (status === "completed") {
                    counts.completed++;
                } else if (status === "pending") {
                    counts.pending++;
                } else if (status === "in progress" || status === "inprogress") {
                    counts.inProgress++;
                } else if (status === "on hold" || status === "onhold") {
                    counts.onHold++;
                }
            });

            var values = [
                counts.completed,
                counts.pending,
                counts.inProgress,
                counts.onHold
            ];

            var total = values.reduce(function (a, b) {
                return a + b;
            }, 0);

            document.getElementById("completed-percent").textContent =
                percent(counts.completed, total) + "%";

            document.getElementById("pending-percent").textContent =
                percent(counts.pending, total) + "%";

            document.getElementById("inprogress-percent").textContent =
                percent(counts.inProgress, total) + "%";

            document.getElementById("onhold-percent").textContent =
                percent(counts.onHold, total) + "%";

            document.getElementById("task-pending-percent").textContent =
                percent(counts.pending, total) + "%";

            if (typeof ApexCharts === "undefined") {
                return;
            }

            var element = document.querySelector("#task-reports");

            if (!element) {
                return;
            }

            if (chart) {
                chart.destroy();
            }

            chart = new ApexCharts(element, {
                chart: {
                    type: "donut",
                    height: 260,
                    toolbar: {
                        show: false
                    }
                },
                series: values,
                labels: [
                    "Completed",
                    "Pending",
                    "In Progress",
                    "On Hold"
                ],
                dataLabels: {
                    enabled: false
                },
                legend: {
                    show: false
                },
                stroke: {
                    width: 2
                },
                plotOptions: {
                    pie: {
                        donut: {
                            size: "72%"
                        }
                    }
                }
            });

            chart.render();
        }

        renderChart("");


        /* -----------------------------
           DataTable
           ----------------------------- */
        var table = null;

        if (window.jQuery && jQuery.fn.DataTable) {

            table = jQuery("#taskReportTable").DataTable({
                pageLength: 10,
                order: [[4, "desc"]],
                columnDefs: [
                    {
                        orderable: false,
                        targets: 0
                    }
                ],
                language: {
                    search: "Search:",
                    searchPlaceholder: "Search tasks..."
                }
            });


            /* Priority */
            jQuery(document).on("click", ".task-priority-filter", function () {

                var value = jQuery(this).attr("data-value") || "";

                jQuery("#priorityFilterButton").text(
                    value ? value : "Select Priority"
                );

                table.column(5).search(value).draw();
            });


            /* Status */
            jQuery(document).on("click", ".task-status-filter", function () {

                var value = jQuery(this).attr("data-value") || "";

                jQuery("#statusFilterButton").text(
                    value ? value : "Select Status"
                );

                if (value === "") {
                    table.column(6).search("").draw();
                } else {
                    table.column(6).search(value).draw();
                }
            });


            /* Sorting */
            jQuery(document).on("click", ".task-sort", function () {

                var sort = jQuery(this).data("sort");
                var label = jQuery(this).text().trim();

                if (sort === "latest") {
                    table.order([4, "desc"]).draw();
                } else if (sort === "oldest") {
                    table.order([4, "asc"]).draw();
                } else if (sort === "nameAsc") {
                    table.order([1, "asc"]).draw();
                } else if (sort === "nameDesc") {
                    table.order([1, "desc"]).draw();
                }

                jQuery("#taskSortButton").text("Sort By : " + label);
            });


            /* Search */
            jQuery("#taskReportTable_filter input").attr(
                "placeholder",
                "Search task..."
            );


            /* Date range - filters Due Date */
            var startDate = null;
            var endDate = null;

            if (jQuery.fn.daterangepicker) {

                jQuery("#taskDateRange").daterangepicker({
                    autoUpdateInput: false,
                    locale: {
                        format: "DD/MM/YYYY",
                        cancelLabel: "Clear"
                    }
                })
                    .on("apply.daterangepicker", function (ev, picker) {

                        startDate = picker.startDate.clone().startOf("day").toDate();
                        endDate = picker.endDate.clone().endOf("day").toDate();

                        jQuery(this).val(
                            picker.startDate.format("DD/MM/YYYY") +
                            " - " +
                            picker.endDate.format("DD/MM/YYYY")
                        );

                        table.draw();
                    })
                    .on("cancel.daterangepicker", function () {

                        jQuery(this).val("");

                        startDate = null;
                        endDate = null;

                        table.draw();
                    });

                jQuery.fn.dataTable.ext.search.push(function (
                    settings,
                    data,
                    dataIndex
                ) {

                    if (settings.nTable.id !== "taskReportTable") {
                        return true;
                    }

                    if (!startDate || !endDate) {
                        return true;
                    }

                    var row = settings.aoData[dataIndex].nTr;

                    if (!row) {
                        return true;
                    }

                    var rawDate = row.getAttribute("data-deadline");

                    if (!rawDate) {
                        return false;
                    }

                    var taskDate = new Date(rawDate);

                    if (isNaN(taskDate.getTime())) {
                        return false;
                    }

                    return taskDate >= startDate && taskDate <= endDate;
                });
            }


            /* Select all */
            jQuery("#select-all").on("change", function () {

                jQuery("#taskReportTable tbody .task-checkbox:visible")
                    .prop("checked", this.checked);
            });


            /* Reset */
            jQuery("#resetTaskFilters").on("click", function () {

                startDate = null;
                endDate = null;

                jQuery("#taskDateRange").val("");
                jQuery("#priorityFilterButton").text("Select Priority");
                jQuery("#statusFilterButton").text("Select Status");
                jQuery("#taskSortButton").text("Sort By : Latest Due Date");

                table.search("");
                table.columns().search("");
                table.order([[4, "desc"]]).draw();

                jQuery(".task-checkbox").prop("checked", false);
                jQuery("#select-all").prop("checked", false);

                renderChart("");
            });


            /* -----------------------------
               Project chart filter
               ----------------------------- */
            jQuery(document).on("click", ".chart-project-option", function () {

                var projectId = jQuery(this).data("project-id") || "";
                var projectName = jQuery(this).text().trim();

                jQuery("#chartProjectButton")
                    .text(projectName || "All Projects")
                    .data("project-id", projectId);

                renderChart(projectId);
            });
            /* Chart is redrawn only when the project selection changes or filters are reset. */
        }


        /* -----------------------------
           Export as Excel / CSV
           ----------------------------- */
        if (window.jQuery) jQuery("#exportExcel").on("click", function () {

            if (!table) return;

            var rows = [];

            rows.push([
                "Task Name",
                "Project Name",
                "Created Date",
                "Due Date",
                "Priority",
                "Status"
            ]);

            table.rows({
                search: "applied"
            }).every(function () {

                var row = this.node();

                var cells = jQuery(row).find("td");

                rows.push([
                    jQuery(cells[1]).text().trim(),
                    jQuery(cells[2]).text().trim(),
                    jQuery(cells[3]).text().trim(),
                    jQuery(cells[4]).text().trim(),
                    jQuery(cells[5]).text().trim(),
                    jQuery(cells[6]).text().trim()
                ]);
            });

            var csv = rows.map(function (row) {

                return row.map(function (value) {

                    return '"' +
                        String(value || "")
                            .replaceAll('"', '""') +
                        '"';

                }).join(",");

            }).join("\r\n");

            var blob = new Blob(
                ["\ufeff" + csv],
                {
                    type: "text/csv;charset=utf-8;"
                }
            );

            var link = document.createElement("a");

            link.href = URL.createObjectURL(blob);
            link.download = "task-report.csv";

            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        });


        /* -----------------------------
           Export as PDF
           ----------------------------- */
        if (window.jQuery) jQuery("#exportPdf").on("click", function () {
            window.print();
        });

    });
</script>

</body>

</html>
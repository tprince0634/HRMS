<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

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

    <!-- Bootstrap Tagsinput CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">

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

        /* HRMS SIDEBAR SUBMENU FIX */
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

<div id="global-loader" style="display: none;">
    <div class="page-loader"></div>
</div>

<!-- Main Wrapper -->
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

                    <a href="javascript:void(0);" class="active subdrop">
                        <i class="ti ti-report-analytics"></i>
                        <span>Reports</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/employee-report" class="active">
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
                    <h2 class="mb-1">Employee Report</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="index.html"><i class="ti ti-smart-home"></i></a>
                            </li>
                            <li class="breadcrumb-item">
                                HR
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Employee Report</li>
                        </ol>
                    </nav>
                </div>
                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
                    <div class="mb-2">
                        <div class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                <i class="ti ti-file-export me-1"></i>Export
                            </a>
                            <ul class="dropdown-menu  dropdown-menu-end p-3">
                                <li>
                                    <a href="javascript:void(0);" id="exportEmployeePdf" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" id="exportEmployeeExcel" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
                                </li>
                            </ul>
                        </div>

                    </div>
                    <div class="head-icons ms-2">
                        <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                            <i class="ti ti-chevrons-up"></i>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->
            <div class="row">
                <div class="col-xl-6 d-flex">
                    <div class="row flex-fill">

                        <!-- Total Companies -->
                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="overflow-hidden d-flex mb-2 align-items-center">
                                        <span class="me-2"><img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-icon.svg" alt="Img" class="img-fluid"></span>
                                        <div>
                                            <p class="fs-14 fw-normal mb-1 text-truncate">Total Employee</p>
                                            <h5>${totalEmployees}</h5>
                                        </div>
                                    </div>
                                    <div>
                                        <p class="fs-12 fw-normal d-flex align-items-center text-truncate "><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last week</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Total Companies -->

                        <!-- Total Companies -->
                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="overflow-hidden d-flex mb-2 align-items-center">
                                        <span class="me-2"><img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-success.svg" alt="Img" class="img-fluid"></span>
                                        <div>
                                            <p class="fs-14 fw-normal mb-1 text-truncate">Active Employee</p>
                                            <h5>${activeEmployees}</h5>
                                        </div>
                                    </div>
                                    <div>
                                        <p class="fs-12 fw-normal d-flex align-items-center text-truncate "><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last week</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Total Companies -->

                        <!-- Total Department -->
                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="overflow-hidden d-flex mb-2 align-items-center">
                                            <span class="me-2">
                                                <img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-info.svg"
                                                     alt="Img" class="img-fluid">
                                            </span>
                                        <div>
                                            <p class="fs-14 fw-normal mb-1 text-truncate">Total Department</p>
                                            <h5>${totalDepartments}</h5>
                                        </div>
                                    </div>
                                    <div>
                                        <p class="fs-12 fw-normal d-flex align-items-center text-truncate">
                                                <span class="text-success fs-12 d-flex align-items-center me-1">
                                                    <i class="ti ti-building-community me-1"></i>
                                                </span>
                                            Departments
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Total Department -->

                        <!-- Total Roles -->
                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="overflow-hidden d-flex mb-2 align-items-center">
                                            <span class="me-2">
                                                <img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-danger.svg"
                                                     alt="Img" class="img-fluid">
                                            </span>
                                        <div>
                                            <p class="fs-14 fw-normal mb-1 text-truncate">Total Roles</p>
                                            <h5>${totalRoles}</h5>
                                        </div>
                                    </div>
                                    <div>
                                        <p class="fs-12 fw-normal d-flex align-items-center text-truncate">
                                                <span class="text-success fs-12 d-flex align-items-center me-1">
                                                    <i class="ti ti-user-star me-1"></i>
                                                </span>
                                            Roles
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /Total Roles -->
                    </div>
                </div>
                <div class="col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header border-0 pb-0">
                            <div class="d-flex flex-wrap justify-content-between align-items-center row-gap-2">
                                <div class="d-flex align-items-center ">
                                    <span class="me-2"><i class="ti ti-chart-bar text-danger"></i></span>
                                    <h5>Employee </h5>
                                </div>
                                <div class="d-flex align-items-center">
                                    <p class="d-inline-flex align-items-center me-3 mb-0">
                                        <i class="ti ti-square-filled fs-12 text-success me-2"></i>
                                        Active Employees
                                    </p>
                                    <p class="d-inline-flex align-items-center">
                                        <i class="ti ti-square-filled fs-12 text-gray-1 me-2 mb-0"></i>
                                        Inactive Employees
                                    </p>
                                </div>
                                <div class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-sm fs-12 btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                        This Year
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-2">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">2024</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">2023</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">2022</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body py-0">
                            <div id="employee-reports"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                    <h5>Employees List</h5>
                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                        <div class="me-3">
                            <div class="input-icon-end position-relative">
                                <input type="text" id="employeeDateRange" class="form-control date-range bookingrange" placeholder="dd/mm/yyyy - dd/mm/yyyy">
                                <span class="input-icon-addon">
                               <i class="ti ti-chevron-down"></i>
                            </span>
                            </div>
                        </div>
                        <div class="dropdown me-3">
                            <a href="javascript:void(0);" id="designationFilterButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">
                                Designation
                            </a>
                            <ul id="designationFilterMenu" class="dropdown-menu dropdown-menu-end p-3">
                                <li>
                                    <a href="javascript:void(0);" class="dropdown-item rounded-1 designation-filter" data-value="">
                                        All Designations
                                    </a>
                                </li>
                                <c:forEach var="designation" items="${designations}">
                                    <c:if test="${not empty designation.name}">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1 designation-filter" data-value="${designation.name}">
                                                    ${designation.name}
                                            </a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="dropdown me-3">
                            <a href="javascript:void(0);" id="statusFilterButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">
                                Select Status
                            </a>
                            <ul id="statusFilterMenu" class="dropdown-menu dropdown-menu-end p-3">
                                <li>
                                    <a href="javascript:void(0);" class="dropdown-item rounded-1 status-filter" data-value="">
                                        All Status
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" class="dropdown-item rounded-1 status-filter" data-value="Active">
                                        Active
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" class="dropdown-item rounded-1 status-filter" data-value="Inactive">
                                        Inactive
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="dropdown">
                            <a href="javascript:void(0);" id="employeeSortButton"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">
                                Sort By : Recently Added
                            </a>
                            <ul id="employeeSortMenu" class="dropdown-menu dropdown-menu-end p-3">
                                <li>
                                    <a href="javascript:void(0);" class="dropdown-item rounded-1 employee-sort" data-sort="recent">
                                        Recently Added
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" class="dropdown-item rounded-1 employee-sort" data-sort="asc">
                                        Ascending
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" class="dropdown-item rounded-1 employee-sort" data-sort="desc">
                                        Descending
                                    </a>
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
                                <th>Emp ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Department</th>
                                <th>Phone</th>
                                <th>Joining Date</th>
                                <th>Status</th>
                                <th class="employee-designation-column">Designation</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${not empty employees}">
                                    <c:forEach var="employee" items="${employees}">
                                        <tr>
                                            <td>
                                                <a href="#" class="link-default">Emp-${employee.employeeId}</a>
                                            </td>

                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <a href="#" class="avatar avatar-md">
                                                        <img src="${pageContext.request.contextPath}/assets/img/users/user-01.jpg"
                                                             class="img-fluid rounded-circle" alt="Employee">
                                                    </a>

                                                    <div class="ms-2">
                                                        <p class="text-dark mb-0">
                                                                ${employee.firstName} ${employee.lastName}
                                                        </p>
                                                        <span class="fs-12">
                                                                ${employee.designation}
                                                        </span>
                                                    </div>
                                                </div>
                                            </td>

                                            <td>${employee.email}</td>
                                            <td>${employee.department}</td>
                                            <td>${employee.phoneNumber}</td>

                                            <td data-joining-date="${employee.dateOfJoining}">
                                                <c:choose>
                                                    <c:when test="${not empty employee.dateOfJoining}">
                                                        ${employee.dateOfJoining.dayOfMonth}
                                                        ${employee.dateOfJoining.month}
                                                        ${employee.dateOfJoining.year}
                                                    </c:when>
                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>

                                            <td>
                                                <c:choose>
                                                    <c:when test="${employee.status eq 'Active'}">
                            <span class="badge badge-success d-inline-flex align-items-center badge-xs">
                                <i class="ti ti-point-filled me-1"></i>Active
                            </span>
                                                    </c:when>

                                                    <c:otherwise>
                            <span class="badge badge-danger d-inline-flex align-items-center badge-sm">
                                <i class="ti ti-point-filled me-1"></i>
                                ${employee.status}
                            </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>

                                            <td class="employee-designation-column">${employee.designation}</td>
                                        </tr>
                                    </c:forEach>
                                </c:when>

                                <c:otherwise>
                                    <tr>
                                        <td colspan="8" class="text-center py-4">
                                            No employees found.
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
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

<!-- Bootstrap Tagsinput JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

<!-- Chart JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/chart-data.js"></script>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<script>
    document.addEventListener("DOMContentLoaded", function () {
        var chartElement = document.querySelector("#employee-reports");

        if (!chartElement || typeof ApexCharts === "undefined") {
            return;
        }

        var activeEmployees = Number("${activeEmployees}");
        var inactiveEmployees = Number("${inactiveEmployees}");

        var options = {
            chart: {
                type: "bar",
                height: 300,
                toolbar: {
                    show: false
                }
            },
            series: [{
                name: "Employees",
                data: [activeEmployees, inactiveEmployees]
            }],
            xaxis: {
                categories: ["Active Employees", "Inactive Employees"]
            },
            dataLabels: {
                enabled: true
            },
            plotOptions: {
                bar: {
                    borderRadius: 4,
                    columnWidth: "45%"
                }
            },
            legend: {
                show: false
            }
        };

        new ApexCharts(chartElement, options).render();
    });
</script>

<style>
    .employee-designation-column {
        display: none !important;
    }
</style>

<script>
    document.addEventListener("DOMContentLoaded", function () {

        if (typeof jQuery === "undefined" || !jQuery.fn.DataTable) {
            return;
        }

        var $ = jQuery;
        var tableElement = $(".datatable");

        if (!tableElement.length) {
            return;
        }

        var employeeTable;

        // Reuse SmartHR's DataTable if script.js already initialized it.
        if ($.fn.DataTable.isDataTable(tableElement[0])) {
            employeeTable = tableElement.DataTable();
        } else {
            employeeTable = tableElement.DataTable({
                pageLength: 10,
                lengthMenu: [[10, 25, 50, 100], [10, 25, 50, 100]],
                order: [[0, "desc"]],
                columnDefs: [
                    {
                        targets: 7,
                        visible: false,
                        searchable: true
                    }
                ]
            });
        }

        // Keep the helper Designation column hidden.
        employeeTable.column(7).visible(false, false);

        // SEARCH
        $("#employeeSearch").on("keyup", function () {
            employeeTable.search(this.value).draw();
        });

        // Designation list is loaded from the Designation master table by the servlet.

        // DESIGNATION FILTER
        $(document).on("click", ".designation-filter", function () {

            var value = $(this).data("value") || "";

            $("#designationFilterButton").text(
                value ? value : "Designation"
            );

            if (value) {
                employeeTable
                    .column(7)
                    .search(
                        "^" + $.fn.dataTable.util.escapeRegex(value) + "$",
                        true,
                        false
                    )
                    .draw();
            } else {
                employeeTable.column(7).search("").draw();
            }
        });

        // STATUS FILTER
        $(document).on("click", ".status-filter", function () {

            var value = $(this).data("value") || "";

            $("#statusFilterButton").text(
                value ? value : "Select Status"
            );

            if (value) {
                employeeTable
                    .column(6)
                    .search(
                        "^" + $.fn.dataTable.util.escapeRegex(value) + "$",
                        true,
                        false
                    )
                    .draw();
            } else {
                employeeTable.column(6).search("").draw();
            }
        });

        // SORT
        $(document).on("click", ".employee-sort", function () {

            var sortType = $(this).data("sort");
            var label = $(this).text().trim();

            $("#employeeSortButton").text("Sort By : " + label);

            if (sortType === "asc") {
                employeeTable.order([0, "asc"]).draw();
            } else if (sortType === "desc") {
                employeeTable.order([0, "desc"]).draw();
            } else {
                // Recently Added = latest joining date first.
                employeeTable.order([5, "desc"]).draw();
            }
        });

    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {

        if (typeof jQuery === "undefined" || !jQuery.fn.DataTable) {
            return;
        }

        var $ = jQuery;
        var tableElement = $(".datatable");

        if (!tableElement.length) {
            return;
        }

        var employeeTable = tableElement.DataTable();

        /*
         * Joining Date range filter
         *
         * DataTables receives the visible Joining Date column as:
         * day MONTH year
         *
         * We keep the original date in a data attribute so filtering
         * remains reliable.
         */
        $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {

            if (settings.nTable !== tableElement[0]) {
                return true;
            }

            var selectedRange = $("#employeeDateRange").val();

            if (!selectedRange || selectedRange.indexOf(" - ") === -1) {
                return true;
            }

            var parts = selectedRange.split(" - ");

            if (parts.length !== 2) {
                return true;
            }

            function parseDate(value) {
                var dateParts = value.trim().split("/");

                if (dateParts.length !== 3) {
                    return null;
                }

                var day = parseInt(dateParts[0], 10);
                var month = parseInt(dateParts[1], 10) - 1;
                var year = parseInt(dateParts[2], 10);

                var date = new Date(year, month, day);

                if (isNaN(date.getTime())) {
                    return null;
                }

                return date;
            }

            var startDate = parseDate(parts[0]);
            var endDate = parseDate(parts[1]);

            if (!startDate || !endDate) {
                return true;
            }

            startDate.setHours(0, 0, 0, 0);
            endDate.setHours(23, 59, 59, 999);

            var row = employeeTable.row(dataIndex).node();

            if (!row) {
                return true;
            }

            var dateCell = row.cells[5];

            if (!dateCell) {
                return true;
            }

            /*
             * Prefer the raw ISO date if available.
             * Otherwise parse the displayed date.
             */
            var rawDate = dateCell.getAttribute("data-joining-date");

            if (rawDate) {
                var employeeDate = new Date(rawDate);

                if (isNaN(employeeDate.getTime())) {
                    return false;
                }

                return employeeDate >= startDate && employeeDate <= endDate;
            }

            return true;
        });

        /*
         * Initialize daterangepicker only if the plugin is available.
         */
        if ($.fn.daterangepicker && $("#employeeDateRange").length) {

            $("#employeeDateRange").daterangepicker({
                autoUpdateInput: false,
                locale: {
                    format: "DD/MM/YYYY",
                    cancelLabel: "Clear"
                }
            });

            $("#employeeDateRange").on("apply.daterangepicker", function (ev, picker) {

                $(this).val(
                    picker.startDate.format("DD/MM/YYYY") +
                    " - " +
                    picker.endDate.format("DD/MM/YYYY")
                );

                employeeTable.draw();
            });

            $("#employeeDateRange").on("cancel.daterangepicker", function () {

                $(this).val("");
                employeeTable.draw();
            });
        }

    });
</script>


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

<script>
    /* Employee Report Export */
    function getEmployeeReportData() {
        var table = document.querySelector(".datatable");
        if (!table) return [];

        // Export all filtered DataTables rows, not only the currently visible page.
        if (window.jQuery && jQuery.fn.DataTable && jQuery.fn.DataTable.isDataTable(table)) {
            var dt = jQuery(table).DataTable();
            var rows = [];
            dt.rows({ search: "applied" }).every(function () {
                var cells = this.nodes().to$().find("td");
                if (cells.length < 7) return;
                var row = [];
                for (var i = 0; i < 7; i++) {
                    row.push(cells.eq(i).text().trim());
                }
                rows.push(row);
            });
            return rows;
        }

        var rows = [];
        table.querySelectorAll("tbody tr").forEach(function (tr) {
            var cells = tr.querySelectorAll("td");
            if (cells.length < 7) return;
            var row = [];
            for (var i = 0; i < 7; i++) {
                row.push((cells[i].innerText || cells[i].textContent || "").trim());
            }
            rows.push(row);
        });
        return rows;
    }

    function escapeExportText(value) {
        return String(value == null ? "" : value)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/\"/g, "&quot;");
    }

    function exportEmployeeExcel() {
        var rows = getEmployeeReportData();
        var html = '<html><head><meta charset="UTF-8"></head><body>';
        html += '<table border="1"><tr>' +
            '<th>Emp ID</th><th>Name</th><th>Email</th><th>Department</th>' +
            '<th>Phone</th><th>Joining Date</th><th>Status</th></tr>';

        rows.forEach(function (row) {
            html += "<tr>";
            row.forEach(function (cell) {
                html += "<td>" + escapeExportText(cell) + "</td>";
            });
            html += "</tr>";
        });
        html += '</table></body></html>';

        var blob = new Blob(["\ufeff", html], {
            type: "application/vnd.ms-excel;charset=utf-8"
        });
        var url = URL.createObjectURL(blob);
        var link = document.createElement("a");
        link.href = url;
        link.download = "Employee_Report.xls";
        document.body.appendChild(link);
        link.click();
        link.remove();
        setTimeout(function () { URL.revokeObjectURL(url); }, 1000);

        return false;
    }

    function exportEmployeePdf() {
        var rows = getEmployeeReportData();
        var printWindow = window.open("", "_blank", "width=1100,height=800");

        if (!printWindow) {
            alert("Please allow pop-ups for PDF export.");
            return false;
        }

        var html = '<!DOCTYPE html><html><head><meta charset="UTF-8">' +
            '<title>Employee Report</title><style>' +
            'body{font-family:Arial,sans-serif;padding:25px;color:#222}' +
            'h2{text-align:center;margin-bottom:5px}' +
            '.date{text-align:center;color:#666;margin-bottom:20px}' +
            'table{width:100%;border-collapse:collapse;font-size:12px}' +
            'th,td{border:1px solid #999;padding:7px;text-align:left}' +
            'th{font-weight:bold}' +
            '@media print{body{padding:10px}}' +
            '</style></head><body>';

        html += '<h2>Employee Report</h2>';
        html += '<div class="date">Generated on ' + new Date().toLocaleDateString("en-IN") + '</div>';
        html += '<table><thead><tr>' +
            '<th>Emp ID</th><th>Name</th><th>Email</th><th>Department</th>' +
            '<th>Phone</th><th>Joining Date</th><th>Status</th></tr></thead><tbody>';

        rows.forEach(function (row) {
            html += "<tr>";
            row.forEach(function (cell) {
                html += "<td>" + escapeExportText(cell) + "</td>";
            });
            html += "</tr>";
        });

        html += '</tbody></table></body></html>';

        printWindow.document.open();
        printWindow.document.write(html);
        printWindow.document.close();
        printWindow.focus();
        setTimeout(function () { printWindow.print(); }, 500);

        return false;
    }
</script>

<script>
    /* Employee Report Export binding - export functionality only */
    document.addEventListener("DOMContentLoaded", function () {
        var pdfButton = document.getElementById("exportEmployeePdf");
        var excelButton = document.getElementById("exportEmployeeExcel");

        if (pdfButton) {
            pdfButton.addEventListener("click", function (event) {
                event.preventDefault();
                return exportEmployeePdf();
            });
        }

        if (excelButton) {
            excelButton.addEventListener("click", function (event) {
                event.preventDefault();
                return exportEmployeeExcel();
            });
        }
    });
</script>

</body>

</html>
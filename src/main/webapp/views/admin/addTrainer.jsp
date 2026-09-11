<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description"
          content="HRMS Add Trainer">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Add Trainer">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

    <title>Add Trainer | HRMS</title>


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


    <!-- SIDEBAR CSS -->
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


<!-- GLOBAL LOADER -->

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


    <!-- ========================================================= -->
    <!-- FULL DASHBOARD SIDEBAR -->
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
                <!-- HELP & SUPPORTS -->
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
    <!-- PAGE CONTENT -->
    <!-- ========================================================= -->

    <div class="page-wrapper">

        <div class="content">


            <!-- PAGE HEADER -->

            <div class="page-header">

                <div class="row align-items-center">


                    <div class="col">

                        <h3 class="page-title">
                            Add Trainer
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


                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/trainerList">

                                    Trainer List

                                </a>

                            </li>


                            <li class="breadcrumb-item active">

                                Add Trainer

                            </li>


                        </ul>

                    </div>


                </div>

            </div>


            <!-- TRAINER FORM -->

            <div class="card">


                <div class="card-header">

                    <h5 class="card-title mb-0">

                        Trainer Information

                    </h5>

                </div>


                <div class="card-body">


                    <!-- IMPORTANT:
                         enctype is required for file upload -->

                    <form method="post"
                          action="${pageContext.request.contextPath}/addTrainer"
                          enctype="multipart/form-data">


                        <div class="row">


                            <!-- FIRST NAME -->

                            <div class="col-md-6 mb-3">

                                <label class="form-label">

                                    First Name

                                    <span class="text-danger">*</span>

                                </label>


                                <input type="text"
                                       name="firstName"
                                       class="form-control"
                                       placeholder="Enter first name"
                                       required>

                            </div>


                            <!-- LAST NAME -->

                            <div class="col-md-6 mb-3">

                                <label class="form-label">

                                    Last Name

                                    <span class="text-danger">*</span>

                                </label>


                                <input type="text"
                                       name="lastName"
                                       class="form-control"
                                       placeholder="Enter last name"
                                       required>

                            </div>


                            <!-- ROLE -->

                            <div class="col-md-6 mb-3">

                                <label class="form-label">

                                    Role

                                    <span class="text-danger">*</span>

                                </label>


                                <input type="text"
                                       name="role"
                                       class="form-control"
                                       placeholder="Enter trainer role"
                                       required>

                            </div>


                            <!-- EMAIL -->

                            <div class="col-md-6 mb-3">

                                <label class="form-label">

                                    Email

                                    <span class="text-danger">*</span>

                                </label>


                                <input type="email"
                                       name="email"
                                       class="form-control"
                                       placeholder="Enter email"
                                       required>

                            </div>


                            <!-- PHONE -->

                            <div class="col-md-6 mb-3">

                                <label class="form-label">

                                    Phone

                                    <span class="text-danger">*</span>

                                </label>


                                <input type="tel"
                                       name="phone"
                                       class="form-control"
                                       placeholder="Enter phone number"
                                       maxlength="15"
                                       required>

                            </div>


                            <!-- PROFILE PICTURE -->

                            <div class="col-md-6 mb-3">

                                <label class="form-label">

                                    Profile Picture

                                </label>


                                <input type="file"
                                       name="profilePicture"
                                       class="form-control"
                                       accept="image/*">


                                <small class="text-muted">

                                    Select JPG, JPEG, PNG or WEBP image.

                                </small>

                            </div>


                            <!-- DESCRIPTION -->

                            <div class="col-12 mb-3">

                                <label class="form-label">

                                    Description

                                </label>


                                <textarea name="description"
                                          class="form-control"
                                          rows="4"
                                          placeholder="Enter trainer description"></textarea>

                            </div>


                            <!-- BUTTONS -->

                            <div class="col-12">


                                <button type="submit"
                                        class="btn btn-primary me-2">

                                    <i class="ti ti-device-floppy me-1"></i>

                                    Save Trainer

                                </button>


                                <a href="${pageContext.request.contextPath}/trainerList"
                                   class="btn btn-light">

                                    Cancel

                                </a>


                            </div>


                        </div>


                    </form>

                </div>

            </div>


        </div>


        <!-- FOOTER -->

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

            <p class="mb-0">

                2025 - 2026 &copy; HRMS.

            </p>

        </div>


    </div>


</div>


<!-- ========================================================= -->
<!-- JAVASCRIPT -->
<!-- ========================================================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/todo.js"></script>


<!-- ========================================================= -->
<!-- SIDEBAR SCRIPT -->
<!-- ========================================================= -->

<script>

    (function () {

        function initHRMSSidebar() {

            var sidebar =
                document.querySelector('.sidebar-menu');

            if (!sidebar) return;


            sidebar.addEventListener('click', function (event) {


                var link =
                    event.target.closest('li.submenu > a');


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
                    currentItem.classList.contains('active');


                Array.prototype.forEach.call(
                    parentList.children,
                    function (item) {

                        if (
                            item !== currentItem &&
                            item.classList.contains('submenu')
                        ) {

                            item.classList.remove('active');

                        }

                    }
                );


                currentItem.classList.toggle(
                    'active',
                    !isOpen
                );

            });

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
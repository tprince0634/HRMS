<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Add Training | HRMS</title>

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

        .training-form-card {
            border-radius: 8px;
        }

        .form-label {
            font-weight: 500;
        }

        .required {
            color: #dc3545;
        }

    </style>

</head>


<body>


<!-- =========================================================
     MAIN WRAPPER
     ========================================================= -->

<div class="main-wrapper">


    <!-- =====================================================
         HEADER
         ===================================================== -->

    <div class="header">

        <div class="main-header">


            <!-- LOGO -->

            <div class="header-left">

                <div class="logo">

                    <a href="${pageContext.request.contextPath}/admin/dashboard"
                       class="logo-normal">

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

            </div>


            <!-- HEADER USER -->

            <div class="header-user">

                <div class="nav user-menu nav-list">


                    <!-- SEARCH -->

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


            <!-- MOBILE USER MENU -->

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

                        <i class="ti ti-layout-dashboard"></i>

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

                        <i class="ti ti-file"></i>

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

                        <i class="ti ti-chart-bar"></i>

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

                        <i class="ti ti-report"></i>

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

                        <i class="ti ti-award"></i>

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

                        <i class="ti ti-user-minus"></i>

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
                     HELP & SUPPORTS
                     ================================================= -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-help"></i>

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
                        Add Training
                    </h2>


                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">

                                    Home

                                </a>

                            </li>


                            <li class="breadcrumb-item">

                                Training

                            </li>


                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Add Training

                            </li>

                        </ol>

                    </nav>

                </div>


                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

                    <div class="mb-2">

                        <a href="${pageContext.request.contextPath}/trainingList"
                           class="btn btn-light d-flex align-items-center">

                            <i class="ti ti-arrow-left me-2"></i>

                            Training List

                        </a>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 TRAINING FORM
                 ================================================= -->

            <div class="card training-form-card">


                <div class="card-header">

                    <h5 class="card-title mb-0">

                        Training Information

                    </h5>

                </div>


                <div class="card-body">


                    <form method="post"
                          action="${pageContext.request.contextPath}/addTraining">


                        <div class="row">


                            <!-- =====================================
                                 EMPLOYEE
                                 ===================================== -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Employee

                                        <span class="required">*</span>

                                    </label>


                                    <select name="userId"
                                            class="form-select"
                                            required>

                                        <option value="">

                                            Select Employee

                                        </option>


                                        <c:forEach var="user"
                                                   items="${users}">

                                            <option value="${user.userId}">

                                                    ${user.firstName}
                                                    ${user.lastName}

                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>


                            <!-- =====================================
                                 TRAINER
                                 ===================================== -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Trainer

                                        <span class="required">*</span>

                                    </label>


                                    <select name="trainerId"
                                            class="form-select"
                                            required>

                                        <option value="">

                                            Select Trainer

                                        </option>


                                        <c:forEach var="trainer"
                                                   items="${trainers}">

                                            <option value="${trainer.trainerId}">

                                                    ${trainer.firstName}
                                                    ${trainer.lastName}

                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>


                            <!-- =====================================
                                 TRAINING TYPE
                                 ===================================== -->

                            <!-- =====================================
      TRAINING TYPE
      ===================================== -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Training Type

                                        <span class="required">*</span>

                                    </label>


                                    <select name="trainingTypeId"
                                            class="form-select"
                                            required>

                                        <option value="">

                                            Select Training Type

                                        </option>


                                        <c:forEach var="trainingType"
                                                   items="${trainingTypes}">

                                            <option value="${trainingType.trainingTypeId}">

                                                    ${trainingType.trainingTypeName}

                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>


                            <!-- =====================================
                                 TRAINING COST
                                 ===================================== -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Training Cost

                                        <span class="required">*</span>

                                    </label>


                                    <input type="number"
                                           name="trainingCost"
                                           class="form-control"
                                           placeholder="Enter training cost"
                                           min="0"
                                           step="0.01"
                                           required>

                                </div>

                            </div>


                            <!-- =====================================
                                 START DATE
                                 ===================================== -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Start Date

                                        <span class="required">*</span>

                                    </label>


                                    <input type="datetime-local"
                                           name="startDate"
                                           class="form-control"
                                           required>

                                </div>

                            </div>


                            <!-- =====================================
                                 END DATE
                                 ===================================== -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        End Date

                                        <span class="required">*</span>

                                    </label>


                                    <input type="datetime-local"
                                           name="endDate"
                                           class="form-control"
                                           required>

                                </div>

                            </div>


                            <!-- =====================================
                                 STATUS
                                 ===================================== -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Status

                                        <span class="required">*</span>

                                    </label>


                                    <select name="status"
                                            class="form-select"
                                            required>

                                        <option value="Active">

                                            Active

                                        </option>


                                        <option value="InActive">

                                            InActive

                                        </option>

                                    </select>

                                </div>

                            </div>


                            <!-- =====================================
                                 DESCRIPTION
                                 ===================================== -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Description

                                        <span class="required">*</span>

                                    </label>


                                    <textarea name="description"
                                              class="form-control"
                                              rows="5"
                                              placeholder="Enter training description"
                                              required></textarea>

                                </div>

                            </div>


                        </div>


                        <!-- =========================================
                             FORM BUTTONS
                             ========================================= -->

                        <div class="d-flex align-items-center justify-content-end">


                            <a href="${pageContext.request.contextPath}/trainingList"
                               class="btn btn-light me-2">

                                Cancel

                            </a>


                            <button type="submit"
                                    class="btn btn-primary">

                                <i class="ti ti-device-floppy me-1"></i>

                                Save Training

                            </button>


                        </div>


                    </form>

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

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<!-- =========================================================
     SIDEBAR SCRIPT
     ========================================================= -->

<script>

    (function () {

        function initHRMSSidebar() {

            var sidebar = document.querySelector('.sidebar-menu');

            if (!sidebar) {
                return;
            }


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

                        if (item !== currentItem &&
                            item.classList.contains('submenu')) {

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
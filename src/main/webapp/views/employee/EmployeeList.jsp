
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Employee List</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <!-- Tabler Icons -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <!-- Main CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">


    <style>

        /* =====================================================
   ADD EMPLOYEE MODAL - FINAL SCROLL FIX
   ===================================================== */

        #addEmployeeModal .modal-dialog {
            width: 95%;
            max-width: 1100px;
            height: 95vh;
            margin: 2.5vh auto;
        }

        #addEmployeeModal .modal-content {
            height: 100%;
            max-height: 95vh;
            display: flex;
            flex-direction: column;
            overflow: hidden;
        }

        /* Header stays fixed */
        #addEmployeeModal .modal-header {
            flex: 0 0 auto;
        }

        /* Form must also become a flex container */
        #addEmployeeModal form {
            display: flex;
            flex-direction: column;
            flex: 1 1 auto;
            min-height: 0;
        }

        /* THIS IS THE ACTUAL SCROLL AREA */
        #addEmployeeModal .modal-body {
            flex: 1 1 auto;
            min-height: 0;
            overflow-y: scroll !important;
            overflow-x: hidden !important;
            height: auto !important;
        }

        /* Footer stays fixed */
        #addEmployeeModal .modal-footer {
            flex: 0 0 auto;
        }

        /* Make scrollbar clearly visible */
        #addEmployeeModal .modal-body::-webkit-scrollbar {
            width: 8px;
        }

        #addEmployeeModal .modal-body::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        #addEmployeeModal .modal-body::-webkit-scrollbar-thumb {
            background: #999;
            border-radius: 10px;
        }

        #addEmployeeModal .modal-body::-webkit-scrollbar-thumb:hover {
            background: #666;
        }

        /* =====================================================
   ADD EMPLOYEE MODAL - MAKE BODY SCROLLABLE
   ===================================================== */

        #addEmployeeModal .modal-dialog {
            max-height: 95vh;
            margin: 1.75rem auto;
        }

        #addEmployeeModal .modal-content {
            height: 95vh;
            display: flex;
            flex-direction: column;
        }

        #addEmployeeModal .modal-header {
            flex-shrink: 0;
        }

        #addEmployeeModal .modal-body {
            overflow-y: auto !important;
            overflow-x: hidden;
            flex: 1 1 auto;
        }

        #addEmployeeModal .modal-footer {
            flex-shrink: 0;
        }

        /* Scrollbar */
        #addEmployeeModal .modal-body::-webkit-scrollbar {
            width: 6px;
        }

        #addEmployeeModal .modal-body::-webkit-scrollbar-thumb {
            background: #cfd4dc;
            border-radius: 10px;
        }

        /* SIDEBAR SCROLL */
        .sidebar {
            height: 100vh !important;
            overflow-y: auto !important;
            overflow-x: hidden !important;
        }

        .sidebar-menu {
            height: auto !important;
            overflow: visible !important;
            padding-bottom: 20px;
        }

        /* Scrollbar */
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

        body {
            background: #f7f8fa;
        }

        .page-wrapper {
            background: #f7f8fa;
        }

        .employee-card {
            border: 1px solid #edf0f5;
            border-radius: 10px;
            background: white;
            height: 100%;
        }

        .employee-card .card-body {
            padding: 20px;
        }

        .summary-icon {
            width: 45px;
            height: 45px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            font-size: 22px;
            background: #fff1e8;
            color: #f97316;
        }

        .employee-table-card {
            border: 1px solid #edf0f5;
            border-radius: 10px;
            background: white;
        }

        .employee-table-card .card-header {
            background: white;
            border-bottom: 1px solid #edf0f5;
            padding: 20px;
        }

        .employee-table-card .card-body {
            padding: 0;
        }

        .filter-area {
            padding: 20px;
            border-bottom: 1px solid #edf0f5;
        }

        .employee-table th {
            background: #fafafa;
            white-space: nowrap;
            font-size: 13px;
            font-weight: 600;
        }

        .employee-table td {
            vertical-align: middle;
            white-space: nowrap;
            font-size: 13px;
        }

        .employee-avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            object-fit: cover;
            margin-right: 10px;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: 600;
        }

        .status-active {
            background: #e8f8ef;
            color: #198754;
        }

        .status-inactive {
            background: #ffe9e9;
            color: #dc3545;
        }

        .modal-header {
            border-bottom: 1px solid #edf0f5;
        }

        .profile-preview {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #eee;
        }

        .about-box {
            min-height: 100px;
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
                <li class="active">
                    <a href="${pageContext.request.contextPath}/Admin/dashboard">
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

                        <!-- ADD EVENT -->
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/events?action=add">
                                <span>Add Event</span>
                            </a>
                        </li>

                        <!-- ADD MASTER EVENT -->
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/event-types">
                                <span>Add Master Event</span>
                            </a>
                        </li>

                        <!-- EVENT LIST -->
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/events?action=list">
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
                <li>
                    <a href="${pageContext.request.contextPath}/promotion">
                        <i class="ti ti-trending-up"></i>
                        <span>Promotions</span>
                    </a>
                </li>

                <!-- RESIGNATION -->
                <li>
                    <a href="${pageContext.request.contextPath}/resignation">
                        <i class="ti ti-logout-2"></i>
                        <span>Resignation</span>
                    </a>
                </li>
                <!-- TERMINATION -->
                <li>
                    <a href="${pageContext.request.contextPath}/termination">
                        <i class="ti ti-user-x"></i>
                        <span>Termination</span>
                    </a>
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



    <!-- =====================================================
         PAGE WRAPPER
         ===================================================== -->

    <div class="page-wrapper">

        <div class="content">


            <!-- =================================================
                 PAGE HEADER
                 ================================================= -->

            <div class="d-md-flex
                        d-block
                        align-items-center
                        justify-content-between
                        page-breadcrumb
                        mb-3">

                <div>

                    <h2 class="mb-1">
                        Employee List
                    </h2>

                    <ol class="breadcrumb mb-0">

                        <li class="breadcrumb-item">

                            <a href="${pageContext.request.contextPath}/admin/dashboard">

                                <i class="ti ti-smart-home"></i>

                            </a>

                        </li>

                        <li class="breadcrumb-item">
                            Employees
                        </li>

                        <li class="breadcrumb-item active">
                            Employee List
                        </li>

                    </ol>

                </div>


                <!-- ADD EMPLOYEE -->

                <div class="mt-3 mt-md-0">

                    <button type="button"
                            class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addEmployeeModal">
                        <i class="ti ti-plus me-1"></i>
                        Add Employee
                    </button>

                </div>

            </div>


            <!-- =================================================
                 SUMMARY CARDS
                 ================================================= -->

            <div class="row mb-4">


                <!-- TOTAL -->

                <div class="col-xl-3 col-md-6 mb-3">

                    <div class="employee-card">

                        <div class="card-body">

                            <div class="d-flex
                                        align-items-center
                                        justify-content-between">

                                <div>

                                    <p class="text-muted mb-1">
                                        Total Employee
                                    </p>

                                    <h2 class="mb-0">
                                        ${totalEmployees}
                                    </h2>

                                </div>

                                <div class="summary-icon">

                                    <i class="ti ti-users"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- ACTIVE -->

                <div class="col-xl-3 col-md-6 mb-3">

                    <div class="employee-card">

                        <div class="card-body">

                            <div class="d-flex
                                        align-items-center
                                        justify-content-between">

                                <div>

                                    <p class="text-muted mb-1">
                                        Active
                                    </p>

                                    <h2 class="mb-0">
                                        ${activeEmployees}
                                    </h2>

                                </div>

                                <div class="summary-icon">

                                    <i class="ti ti-user-check"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- INACTIVE -->

                <div class="col-xl-3 col-md-6 mb-3">

                    <div class="employee-card">

                        <div class="card-body">

                            <div class="d-flex
                                        align-items-center
                                        justify-content-between">

                                <div>

                                    <p class="text-muted mb-1">
                                        Inactive
                                    </p>

                                    <h2 class="mb-0">
                                        ${inactiveEmployees}
                                    </h2>

                                </div>

                                <div class="summary-icon">

                                    <i class="ti ti-user-x"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- NEW JOINERS -->

                <div class="col-xl-3 col-md-6 mb-3">

                    <div class="employee-card">

                        <div class="card-body">

                            <div class="d-flex
                                        align-items-center
                                        justify-content-between">

                                <div>

                                    <p class="text-muted mb-1">
                                        New Joiners
                                    </p>

                                    <h2 class="mb-0">
                                        ${newJoiners}
                                    </h2>

                                </div>

                                <div class="summary-icon">

                                    <i class="ti ti-user-plus"></i>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 EMPLOYEE TABLE
                 ================================================= -->

            <div class="employee-table-card">


                <!-- HEADER -->

                <div class="card-header
                            d-flex
                            align-items-center
                            justify-content-between
                            flex-wrap
                            gap-2">

                    <h5 class="mb-0">
                        Employee List
                    </h5>

                    <span class="text-muted">
                        Manage employees
                    </span>

                </div>


                <!-- FILTERS -->

                <div class="filter-area">

                    <div class="row g-3">


                        <!-- SEARCH -->

                        <div class="col-lg-3 col-md-6">

                            <label class="form-label">
                                Search
                            </label>

                            <input type="text"
                                   id="searchEmployee"
                                   class="form-control"
                                   placeholder="Search employee..."
                                   onkeyup="filterEmployees()">

                        </div>


                        <!-- START DATE -->

                        <div class="col-lg-2 col-md-6">

                            <label class="form-label">
                                Start Date
                            </label>

                            <input type="date"
                                   id="startDate"
                                   class="form-control"
                                   onchange="filterEmployees()">

                        </div>


                        <!-- END DATE -->

                        <div class="col-lg-2 col-md-6">

                            <label class="form-label">
                                End Date
                            </label>

                            <input type="date"
                                   id="endDate"
                                   class="form-control"
                                   onchange="filterEmployees()">

                        </div>


                        <!-- DESIGNATION -->

                        <div class="col-lg-2 col-md-6">

                            <label class="form-label">
                                Designation
                            </label>

                            <select id="designationFilter"
                                    class="form-select"
                                    onchange="filterEmployees()">

                                <option value="">
                                    All Designations
                                </option>

                                <c:forEach
                                        items="${employees}"
                                        var="employee">

                                    <c:if test="${not empty employee.designationName}">

                                        <option value="${employee.designationName}">
                                                ${employee.designationName}
                                        </option>

                                    </c:if>

                                </c:forEach>

                            </select>

                        </div>


                        <!-- STATUS -->

                        <div class="col-lg-2 col-md-6">

                            <label class="form-label">
                                Status
                            </label>

                            <select id="statusFilter"
                                    class="form-select"
                                    onchange="filterEmployees()">

                                <option value="">
                                    All Status
                                </option>

                                <option value="Active">
                                    Active
                                </option>

                                <option value="Inactive">
                                    Inactive
                                </option>

                            </select>

                        </div>


                        <!-- SORT -->

                        <div class="col-lg-1 col-md-6">

                            <label class="form-label">
                                Sort
                            </label>

                            <select id="sortEmployees"
                                    class="form-select"
                                    onchange="sortEmployees()">

                                <option value="newest">
                                    Newest
                                </option>

                                <option value="oldest">
                                    Oldest
                                </option>

                                <option value="nameAsc">
                                    A-Z
                                </option>

                                <option value="nameDesc">
                                    Z-A
                                </option>

                            </select>

                        </div>

                    </div>

                </div>


                <!-- TABLE -->

                <div class="table-responsive">

                    <table class="table
                                  table-hover
                                  employee-table
                                  mb-0"
                           id="employeeTable">

                        <thead>

                        <tr>

                            <th>
                                Employee
                            </th>

                            <th>
                                Email
                            </th>

                            <th>
                                Phone
                            </th>

                            <th>
                                Role
                            </th>

                            <th>
                                Department
                            </th>

                            <th>
                                Designation
                            </th>

                            <th>
                                Joining Date
                            </th>

                            <th>
                                Manager
                            </th>

                            <th>
                                Status
                            </th>

                        </tr>

                        </thead>


                        <tbody id="employeeTableBody">


                        <c:forEach
                                items="${employees}"
                                var="employee">


                            <tr class="employee-row"

                                data-name="${employee.firstName} ${employee.lastName}"

                                data-email="${employee.email}"

                                data-phone="${employee.phoneNumber}"

                                data-designation="${employee.designationName}"

                                data-status="${employee.status}"

                                data-joining="${employee.dateOfJoining}">


                                <!-- EMPLOYEE -->

                                <td>

                                    <div class="d-flex
                                                align-items-center">

                                        <img
                                                class="employee-avatar"

                                                src="${pageContext.request.contextPath}/assets/img/profiles/${employee.profilePicture}"

                                                onerror="this.src='${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg'"

                                                alt="Employee">


                                        <div>

                                            <strong>
                                                    ${employee.firstName}
                                                    ${employee.lastName}
                                            </strong>

                                        </div>

                                    </div>

                                </td>


                                <!-- EMAIL -->

                                <td>
                                        ${employee.email}
                                </td>


                                <!-- PHONE -->

                                <td>
                                        ${employee.phoneNumber}
                                </td>


                                <!-- ROLE -->

                                <td>
                                        ${employee.roleName}
                                </td>


                                <!-- DEPARTMENT -->

                                <td>
                                        ${employee.departmentName}
                                </td>


                                <!-- DESIGNATION -->

                                <td>
                                        ${employee.designationName}
                                </td>


                                <!-- JOINING DATE -->

                                <td>

                                    <fmt:formatDate
                                            value="${employee.dateOfJoining}"
                                            pattern="dd-MM-yyyy"/>

                                </td>


                                <!-- MANAGER -->

                                <td>
                                        ${employee.reportingManager}
                                </td>


                                <!-- STATUS -->

                                <td>

                                    <c:choose>

                                        <c:when test="${employee.status eq 'Active'}">

                                            <span class="status-badge status-active">
                                                Active
                                            </span>

                                        </c:when>

                                        <c:otherwise>

                                            <span class="status-badge status-inactive">
                                                    ${employee.status}
                                            </span>

                                        </c:otherwise>

                                    </c:choose>

                                </td>


                            </tr>


                        </c:forEach>


                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </div>

</div>


<!-- =========================================================
     ADD EMPLOYEE MODAL
     ========================================================= -->

<div class="modal fade"
     id="addEmployeeModal"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-xl">

        <div class="modal-content">

            <!-- HEADER -->

            <div class="modal-header">

                <h5 class="modal-title">
                    Add Employee
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <!-- FORM -->

            <form method="post"
                  action="${pageContext.request.contextPath}/Employee/AddEmployee">


                <div class="modal-body">


                    <!-- PROFILE -->

                    <div class="text-center mb-4">

                        <img
                                id="profilePreview"

                                src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg"

                                class="profile-preview mb-2"

                                alt="Profile">

                        <br>

                        <input type="file"
                               id="profileImage"
                               class="form-control"
                               accept="image/*"
                               style="max-width:300px;margin:auto;"
                               onchange="previewProfile(event)">

                    </div>


                    <div class="row g-3">


                        <!-- FIRST NAME -->

                        <div class="col-md-6">

                            <label class="form-label">
                                First Name *
                            </label>

                            <input type="text"
                                   name="firstName"
                                   class="form-control"
                                   required>

                        </div>


                        <!-- LAST NAME -->

                        <div class="col-md-6">

                            <label class="form-label">
                                Last Name *
                            </label>

                            <input type="text"
                                   name="lastName"
                                   class="form-control"
                                   required>

                        </div>


                        <!-- EMAIL -->

                        <div class="col-md-6">

                            <label class="form-label">
                                Email *
                            </label>

                            <input type="email"
                                   name="email"
                                   class="form-control"
                                   required>

                        </div>


                        <!-- PASSWORD -->

                        <div class="col-md-6">

                            <label class="form-label">
                                Password *
                            </label>

                            <input type="password"
                                   name="password"
                                   class="form-control"
                                   required>

                        </div>


                        <!-- JOINING DATE -->

                        <div class="col-md-6">

                            <label class="form-label">
                                Joining Date *
                            </label>

                            <input type="date"
                                   name="dateOfJoining"
                                   class="form-control"
                                   required>

                        </div>


                        <!-- BIRTH DATE -->

                        <div class="col-md-6">

                            <label class="form-label">
                                Birth Date *
                            </label>

                            <input type="date"
                                   name="dateOfBirth"
                                   class="form-control"
                                   required>

                        </div>


                        <!-- ROLE -->

                        <div class="col-md-6">

                            <label class="form-label">
                                Role *
                            </label>

                            <select class="form-select" name="roleId" required>

                                <option value="">Select Role</option>

                                <c:forEach var="role" items="${roles}">
                                    <option value="${role.RoleId}">
                                            ${role.RoleName}
                                    </option>
                                </c:forEach>
                            </select>

                        </div>


                        <!-- DEPARTMENT -->

                        <div class="col-md-6">

                            <label class="form-label">
                                Department
                            </label>

                            <select class="form-select" name="departmentId" required>

                                <option value="">Select Department</option>

                                <c:forEach var="department" items="${departments}">
                                    <option value="${department.DepartmentId}">
                                            ${department.Name}
                                    </option>
                                </c:forEach>

                            </select>

                        </div>


                        <!-- MANAGER -->

                        <div class="col-md-6">

                            <label class="form-label">
                                Manager
                            </label>

                            <select class="form-select" name="reportingManager">
                                <option value="">Select Manager</option>

                                <c:forEach var="manager" items="${managers}">
                                    <option value="${manager.UserId}">
                                            ${manager.FirstName} ${manager.LastName}
                                    </option>
                                </c:forEach>

                            </select>

                        </div>


                        <!-- DESIGNATION -->

                        <div class="col-md-6">

                            <label class="form-label">
                                Designation
                            </label>

                            <select class="form-select" name="designationId" required>

                                <option value="">Select Designation</option>

                                <c:forEach var="designation" items="${designations}">
                                    <option value="${designation.DesignationId}">
                                            ${designation.Name}
                                    </option>
                                </c:forEach>

                            </select>

                        </div>


                        <!-- PHONE -->

                        <div class="col-md-6">

                            <label class="form-label">
                                Phone Number *
                            </label>

                            <input type="text"
                                   name="phoneNumber"
                                   class="form-control"
                                   required>

                        </div>


                        <!-- GENDER -->

                        <div class="col-md-3">

                            <label class="form-label">
                                Gender
                            </label>

                            <select name="gender"
                                    class="form-select">

                                <option value="">
                                    Select
                                </option>

                                <option value="Male">
                                    Male
                                </option>

                                <option value="Female">
                                    Female
                                </option>

                                <option value="Other">
                                    Other
                                </option>

                            </select>

                        </div>


                        <!-- STATUS -->

                        <div class="col-md-3">

                            <label class="form-label">
                                Status
                            </label>

                            <select name="status"
                                    class="form-select">

                                <option value="Active">
                                    Active
                                </option>

                                <option value="Inactive">
                                    Inactive
                                </option>

                            </select>

                        </div>


                        <!-- ADDRESS -->

                        <div class="col-md-12">

                            <label class="form-label">
                                Address
                            </label>

                            <textarea
                                    name="address"
                                    class="form-control"
                                    rows="3"></textarea>

                        </div>


                        <!-- ABOUT -->

                        <div class="col-md-12">

                            <label class="form-label">
                                About Employee
                            </label>

                            <textarea
                                    name="aboutEmployee"
                                    class="form-control about-box"
                                    rows="4"></textarea>

                        </div>


                    </div>

                </div>


                <!-- FOOTER -->

                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <button type="submit"
                            class="btn btn-primary">

                        <i class="ti ti-device-floppy me-1"></i>

                        Save Employee

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>


<!-- =========================================================
     JAVASCRIPT
     ========================================================= -->

<!-- JAVASCRIPT -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<script>


    // ============================================================
    // SEARCH + FILTER
    // ============================================================

    function filterEmployees() {

        const search =
            document.getElementById("searchEmployee")
                .value
                .toLowerCase();

        const startDate =
            document.getElementById("startDate").value;

        const endDate =
            document.getElementById("endDate").value;

        const designation =
            document.getElementById("designationFilter")
                .value
                .toLowerCase();

        const status =
            document.getElementById("statusFilter")
                .value
                .toLowerCase();


        const rows =
            document.querySelectorAll(".employee-row");


        rows.forEach(function(row) {

            const name =
                row.dataset.name.toLowerCase();

            const email =
                row.dataset.email.toLowerCase();

            const phone =
                row.dataset.phone.toLowerCase();

            const rowDesignation =
                row.dataset.designation.toLowerCase();

            const rowStatus =
                row.dataset.status.toLowerCase();


            let show = true;


            // SEARCH

            if (
                search &&
                !name.includes(search) &&
                !email.includes(search) &&
                !phone.includes(search)
            ) {

                show = false;
            }


            // DESIGNATION

            if (
                designation &&
                rowDesignation !== designation
            ) {

                show = false;
            }


            // STATUS

            if (
                status &&
                rowStatus !== status
            ) {

                show = false;
            }


            // DATE

            const joining =
                row.dataset.joining;


            if (startDate && joining) {

                if (joining.substring(0, 10) < startDate) {
                    show = false;
                }
            }


            if (endDate && joining) {

                if (joining.substring(0, 10) > endDate) {
                    show = false;
                }
            }


            row.style.display =
                show ? "" : "none";

        });

    }


    // ============================================================
    // SORT
    // ============================================================

    function sortEmployees() {

        const sort =
            document.getElementById("sortEmployees").value;

        const tbody =
            document.getElementById("employeeTableBody");

        const rows =
            Array.from(
                tbody.querySelectorAll(".employee-row")
            );


        rows.sort(function(a, b) {

            if (sort === "nameAsc") {

                return a.dataset.name
                    .localeCompare(
                        b.dataset.name
                    );
            }


            if (sort === "nameDesc") {

                return b.dataset.name
                    .localeCompare(
                        a.dataset.name
                    );
            }


            if (sort === "oldest") {

                return a.dataset.joining
                    .localeCompare(
                        b.dataset.joining
                    );
            }


            return b.dataset.joining
                .localeCompare(
                    a.dataset.joining
                );

        });


        rows.forEach(function(row) {

            tbody.appendChild(row);

        });

    }


    // ============================================================
    // PROFILE PREVIEW
    // ============================================================

    function previewProfile(event) {

        const file =
            event.target.files[0];

        if (!file) {
            return;
        }


        const reader =
            new FileReader();


        reader.onload = function(e) {

            document.getElementById(
                "profilePreview"
            ).src = e.target.result;

        };


        reader.readAsDataURL(file);

    }

</script>

<script>
    (function () {

        function initHRMSSidebar() {

            var sidebar = document.querySelector('.sidebar-menu');

            if (!sidebar) {
                return;
            }

            sidebar.addEventListener('click', function (event) {

                var link = event.target.closest('li.submenu > a');

                if (!link || !sidebar.contains(link)) {
                    return;
                }

                event.preventDefault();
                event.stopPropagation();

                var currentItem = link.parentElement;
                var parentList = currentItem.parentElement;

                var isOpen = currentItem.classList.contains('active');

                // Close other submenus
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

                // Open / close clicked submenu
                currentItem.classList.toggle('active', !isOpen);

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
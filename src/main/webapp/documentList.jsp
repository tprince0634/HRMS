<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>HRMS | Document List</title>

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
    </style>
</head>

<body>

<div class="main-wrapper">

    <!-- ===================================================== -->
    <!-- YOUR EXACT DASHBOARD SIDEBAR / NAVBAR -->
    <!-- ===================================================== -->

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
                <li class="submenu active">
                    <a href="javascript:void(0);">
                        <i class="ti ti-file-description"></i>
                        <span>Documents</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>
                        <li class="submenu active">
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

                                <li class="active">
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
                        <li><a href="javascript:void(0);"><span>Project</span></a></li>
                        <li><a href="javascript:void(0);"><span>Tasks</span></a></li>
                        <li><a href="javascript:void(0);"><span>Task Board</span></a></li>
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

                        <li><a href="javascript:void(0);"><span>Leave Report</span></a></li>
                        <li><a href="javascript:void(0);"><span>Payslip Report</span></a></li>
                        <li><a href="javascript:void(0);"><span>Task Report</span></a></li>
                        <li><a href="javascript:void(0);"><span>Daily Report</span></a></li>
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


    <!-- ===================================================== -->
    <!-- PAGE CONTENT -->
    <!-- ===================================================== -->

    <div class="page-wrapper">

        <div class="content">

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">
                    <h2 class="mb-1">Document List</h2>

                    <nav>
                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                            </li>

                            <li class="breadcrumb-item">
                                Documents
                            </li>

                            <li class="breadcrumb-item active">
                                Document List
                            </li>

                        </ol>
                    </nav>
                </div>

                <div>
                    <a href="${pageContext.request.contextPath}/uploadFile"
                       class="btn btn-primary">
                        <i class="ti ti-upload me-1"></i>
                        Upload Document
                    </a>
                </div>

            </div>


            <!-- DOCUMENT LIST CARD -->
            <div class="card">

                <div class="card-header">
                    <h5 class="card-title mb-0">
                        Uploaded Documents
                    </h5>
                </div>

                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-bordered table-hover">

                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>File Name</th>
                                <th>File Path</th>
                                <th>User ID</th>
                                <th>Action</th>
                            </tr>
                            </thead>

                            <tbody>

                            <c:choose>

                                <c:when test="${not empty documentList}">

                                    <c:forEach var="file" items="${documentList}">

                                        <tr>

                                            <td>
                                                ${file.id}
                                            </td>

                                            <td>
                                                ${file.fileName}
                                            </td>

                                            <td>
                                                ${file.filePath}
                                            </td>

                                            <td>
                                                ${file.userId}
                                            </td>

                                            <td>

                                                <a href="${pageContext.request.contextPath}/viewFile?id=${file.id}"
                                                   target="_blank"
                                                   class="btn btn-sm btn-info">
                                                    <i class="ti ti-eye"></i>
                                                    View
                                                </a>

                                                <a href="${pageContext.request.contextPath}/downloadFile?id=${file.id}"
                                                   class="btn btn-sm btn-success">
                                                    <i class="ti ti-download"></i>
                                                    Download
                                                </a>

                                                <form action="${pageContext.request.contextPath}/deleteFile"
                                                      method="post"
                                                      style="display:inline;"
                                                      onsubmit="return confirm('Are you sure you want to delete this file?');">

                                                    <input type="hidden"
                                                           name="id"
                                                           value="${file.id}">

                                                    <button type="submit"
                                                            class="btn btn-sm btn-danger">
                                                        <i class="ti ti-trash"></i>
                                                        Delete
                                                    </button>

                                                </form>

                                            </td>

                                        </tr>

                                    </c:forEach>

                                </c:when>

                                <c:otherwise>

                                    <tr>
                                        <td colspan="5"
                                            class="text-center">
                                            No documents found.
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

    </div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="HRMS Upload Document">
    <meta name="keywords" content="HRMS, Human Resource Management System, Admin Dashboard">
    <meta name="author" content="HRMS Team">
    <meta name="robots" content="noindex, nofollow">

    <title>Upload Document | HRMS</title>

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

        /* SELF-CONTAINED FILE UPLOAD CONTROL */
        .doc-upload__clear {
            margin-left: 6px;
            color: #6c757d;
            text-decoration: none;
        }

        .doc-upload__control {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background: #f8f9fc;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            padding: 8px 8px 8px 16px;
        }

        .doc-upload__filename {
            color: #8a8a8a;
            font-size: 14px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .doc-upload__filename.has-file {
            color: #1b2850;
        }

        .doc-upload__browse-btn {
            flex-shrink: 0;
            background: #ff9b44;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 8px 22px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
        }

        .doc-upload__browse-btn:hover {
            background: #ff8a24;
        }

        .doc-upload__preview {
            text-align: center;
            margin-top: 20px;
        }

        .doc-upload__preview img {
            max-width: 260px;
            max-height: 260px;
            border-radius: 6px;
            object-fit: contain;
        }

        .doc-upload__preview .doc-upload__file-chip {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: #f8f9fc;
            border: 1px solid #e5e7eb;
            border-radius: 6px;
            padding: 10px 16px;
        }

        .doc-upload__preview-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 14px;
            margin-top: 20px;
        }

        .doc-upload__preview-grid .doc-upload__grid-item {
            width: 90px;
            text-align: center;
        }

        .doc-upload__preview-grid .doc-upload__grid-thumb {
            width: 90px;
            height: 90px;
            border-radius: 6px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f8f9fc;
            border: 1px solid #e5e7eb;
        }

        .doc-upload__preview-grid .doc-upload__grid-thumb img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .doc-upload__preview-grid .doc-upload__grid-name {
            display: block;
            margin-top: 6px;
            font-size: 11px;
            color: #8a8a8a;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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
                            <a href="javascript:void(0);">
                                <span>Add Employee</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span>All Employees</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span>Department</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:void(0);">
                                <span>Designation</span>
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

                                <li class="active">
                                    <a href="${pageContext.request.contextPath}/uploadFile">
                                        <span>Upload Document</span>
                                    </a>
                                </li>

                                <li class="">
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
                            <a href="javascript:void(0);">
                                <span>Employee Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
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

            <!-- Page Header -->
            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col-sm-12">
                        <h3 class="page-title">Upload Document</h3>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                            </li>
                            <li class="breadcrumb-item">Documents</li>
                            <li class="breadcrumb-item active">Upload Document</li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /Page Header -->

            <!-- Server-side flash messages: set successMessage / errorMessage as request attributes in the servlet -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="row">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title mb-0">Upload New Document</h5>
                        </div>
                        <div class="card-body">

                            <form action="${pageContext.request.contextPath}/uploadFile"
                                  method="post"
                                  enctype="multipart/form-data"
                                  id="documentUploadForm">

                                <label class="form-label">
                                    Choose File <span class="text-danger">*</span>
                                    <a href="javascript:void(0)"
                                       class="doc-upload__clear"
                                       id="docFileClear"
                                       title="Clear">x</a>
                                </label>

                                <div class="doc-upload" id="docUploadBox">
                                    <div class="doc-upload__control">
                                        <span class="doc-upload__filename" id="docFileName">Choose file...</span>
                                        <button type="button" class="doc-upload__browse-btn" id="docFileBrowseBtn">Browse</button>
                                    </div>

                                    <input type="file"
                                           class="d-none"
                                           id="documentFile"
                                           name="documentFile"
                                           accept="image/*,.pdf,.doc,.docx"
                                           required>

                                    <div class="doc-upload__preview d-none" id="docFilePreview"></div>
                                </div>

                                <div class="d-flex justify-content-end mt-3">
                                    <button type="reset" class="btn btn-outline-light border me-2" id="uploadResetBtn">
                                        Cancel
                                    </button>
                                    <button type="submit" class="btn btn-primary">
                                        <i class="ti ti-upload me-1"></i> Upload Document
                                    </button>
                                </div>

                            </form>

                        </div>
                    </div>

                    <!-- <script>Multiple File Upload -->
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="card-title mb-0">Upload Multiple Documents</h5>
                                </div>
                                <div class="card-body">

                                    <form action="${pageContext.request.contextPath}/uploadFiles"
                                          method="post"
                                          enctype="multipart/form-data"
                                          id="multiUploadForm">

                                        <label class="form-label">
                                            Choose Files <span class="text-danger">*</span>
                                            <a href="javascript:void(0)"
                                               class="doc-upload__clear"
                                               id="docFilesClear"
                                               title="Clear">x</a>
                                        </label>

                                        <div class="doc-upload" id="docFilesUploadBox">
                                            <div class="doc-upload__control">
                                                <span class="doc-upload__filename" id="docFilesName">Choose file...</span>
                                                <button type="button" class="doc-upload__browse-btn" id="docFilesBrowseBtn">Browse</button>
                                            </div>

                                            <input type="file"
                                                   class="d-none"
                                                   id="documentFiles"
                                                   name="documentFiles"
                                                   accept="image/*,.pdf,.doc,.docx"
                                                   multiple
                                                   required>

                                            <div class="doc-upload__preview-grid d-none" id="docFilesPreview"></div>
                                        </div>

                                        <div class="d-flex justify-content-end mt-3">
                                            <button type="reset" class="btn btn-outline-light border me-2" id="multiUploadResetBtn">
                                                Cancel
                                            </button>
                                            <button type="submit" class="btn btn-primary">
                                                <i class="ti ti-upload me-1"></i> Upload Documents
                                            </button>
                                        </div>

                                    </form>

                                </div>
                            </div>

                        </div>
                    </div>

                </div>

                <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
                    <p class="mb-0">2025 - 2026 &copy; HRMS.</p>
                </div>
            </div>
            <!-- /Page Wrapper -->

        </div>
        <!-- end main wrapper-->


        <!-- JAVASCRIPT -->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

        <!-- SIDEBAR ACCORDION (same fix used on dashboard.jsp) -->
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

        <!-- FILE UPLOAD (self-contained: no external plugin dependency) -->
        <script>
            (function () {
                var fileInput = document.getElementById('documentFile');
                var browseBtn = document.getElementById('docFileBrowseBtn');
                var fileNameEl = document.getElementById('docFileName');
                var previewEl = document.getElementById('docFilePreview');
                var clearBtn = document.getElementById('docFileClear');

                if (!fileInput) return;

                function iconLabelForFile(name) {
                    var ext = name.split('.').pop().toLowerCase();
                    if (ext === 'pdf') return 'PDF file';
                    if (ext === 'doc' || ext === 'docx') return 'Word document';
                    return 'File';
                }

                function resetControl() {
                    fileInput.value = '';
                    fileNameEl.textContent = 'Choose file...';
                    fileNameEl.classList.remove('has-file');
                    previewEl.innerHTML = '';
                    previewEl.classList.add('d-none');
                }

                browseBtn.addEventListener('click', function () {
                    fileInput.click();
                });

                fileInput.addEventListener('change', function () {
                    if (!this.files || !this.files[0]) {
                        resetControl();
                        return;
                    }

                    var file = this.files[0];
                    fileNameEl.textContent = file.name;
                    fileNameEl.classList.add('has-file');
                    previewEl.innerHTML = '';

                    if (file.type.indexOf('image/') === 0) {
                        var img = document.createElement('img');
                        img.src = URL.createObjectURL(file);
                        img.alt = file.name;
                        previewEl.appendChild(img);
                    } else {
                        var chip = document.createElement('div');
                        chip.className = 'doc-upload__file-chip';
                        chip.innerHTML = '<i class="ti ti-file-text fs-18 text-primary"></i><span>' +
                            iconLabelForFile(file.name) + '</span>';
                        previewEl.appendChild(chip);
                    }

                    previewEl.classList.remove('d-none');
                });

                clearBtn.addEventListener('click', function (e) {
                    e.preventDefault();
                    resetControl();
                });
            })();
        </script>

        <!-- MULTIPLE FILE UPLOAD (self-contained) -->

    <script>
        (function () {
            var fileInput = document.getElementById('documentFiles');
            var browseBtn = document.getElementById('docFilesBrowseBtn');
            var fileNameEl = document.getElementById('docFilesName');
            var previewGrid = document.getElementById('docFilesPreview');
            var clearBtn = document.getElementById('docFilesClear');
            var form = document.getElementById('multiUploadForm');

            if (!fileInput) return;

            var selectedFiles = [];

            function resetControl() {
                selectedFiles = [];
                fileInput.value = '';
                fileNameEl.textContent = 'Choose files...';
                fileNameEl.classList.remove('has-file');
                previewGrid.innerHTML = '';
                previewGrid.classList.add('d-none');
            }

            function updateInputFiles() {
                var dataTransfer = new DataTransfer();

                selectedFiles.forEach(function (file) {
                    dataTransfer.items.add(file);
                });

                fileInput.files = dataTransfer.files;
            }

            function renderFiles() {
                previewGrid.innerHTML = '';

                if (selectedFiles.length === 0) {
                    fileNameEl.textContent = 'Choose files...';
                    fileNameEl.classList.remove('has-file');
                    previewGrid.classList.add('d-none');
                    return;
                }

                fileNameEl.textContent = selectedFiles.length + ' file(s) selected';
                fileNameEl.classList.add('has-file');

                selectedFiles.forEach(function (file, index) {
                    var item = document.createElement('div');
                    item.className = 'doc-upload__grid-item';

                    var thumb = document.createElement('div');
                    thumb.className = 'doc-upload__grid-thumb';

                    if (file.type.indexOf('image/') === 0) {
                        var img = document.createElement('img');
                        img.src = URL.createObjectURL(file);
                        img.alt = file.name;
                        thumb.appendChild(img);
                    } else {
                        thumb.innerHTML =
                            '<i class="ti ti-file-text fs-24 text-primary"></i>';
                    }

                    var name = document.createElement('span');
                    name.className = 'doc-upload__grid-name';
                    name.textContent = file.name;
                    name.title = 'Click to remove: ' + file.name;
                    name.style.cursor = 'pointer';

                    name.addEventListener('click', function () {
                        selectedFiles.splice(index, 1);
                        updateInputFiles();
                        renderFiles();
                    });

                    item.appendChild(thumb);
                    item.appendChild(name);
                    previewGrid.appendChild(item);
                });

                previewGrid.classList.remove('d-none');
            }

            browseBtn.addEventListener('click', function () {
                fileInput.click();
            });

            fileInput.addEventListener('change', function () {
                Array.prototype.forEach.call(fileInput.files, function (newFile) {
                    var alreadyAdded = selectedFiles.some(function (oldFile) {
                        return oldFile.name === newFile.name &&
                               oldFile.size === newFile.size &&
                               oldFile.lastModified === newFile.lastModified;
                    });

                    if (!alreadyAdded) {
                        selectedFiles.push(newFile);
                    }
                });

                updateInputFiles();
                renderFiles();
            });

            clearBtn.addEventListener('click', function (event) {
                event.preventDefault();
                resetControl();
            });

            form.addEventListener('reset', function () {
                setTimeout(resetControl, 0);
            });
        })();
    </script>

</body>
</html>

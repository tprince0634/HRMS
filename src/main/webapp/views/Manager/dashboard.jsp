
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description" content="HRMS Manager Dashboard">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Manager Dashboard">

    <meta name="author" content="HRMS Team">

    <meta name="robots" content="noindex, nofollow">

    <title>HRMS Manager Dashboard</title>


    <!-- Favicon -->
    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">


    <!-- Theme Script -->
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>


    <!-- CSS -->
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

</head>


<body>


<!-- Default Dashboard Values -->
<c:set var="totalEmployees" value="0"/>
<c:set var="presentToday" value="0"/>
<c:set var="onLeave" value="0"/>
<c:set var="pendingLeaves" value="0"/>


<!-- Global Loader -->
<div id="global-loader">

    <div class="page-loader"></div>

</div>


<!-- Main Wrapper -->
<div class="main-wrapper">


    <!-- ========================================================= -->
    <!-- HEADER -->
    <!-- ========================================================= -->

    <div class="header">

        <div class="main-header">


            <!-- Header Logo -->
            <div class="header-left">

                <a href="${pageContext.request.contextPath}/manager/dashboard"
                   class="logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                         alt="HRMS Logo">

                </a>


                <a href="${pageContext.request.contextPath}/manager/dashboard"
                   class="dark-logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                         alt="HRMS Logo">

                </a>

            </div>


            <!-- Mobile Button -->
            <a id="mobile_btn"
               class="mobile_btn"
               href="#sidebar">

                <span class="bar-icon">

                    <span></span>
                    <span></span>
                    <span></span>

                </span>

            </a>


            <!-- Header User -->
            <div class="header-user">

                <div class="nav user-menu nav-list">


                    <div class="me-auto d-flex align-items-center"
                         id="header-search">


                        <!-- Sidebar Toggle -->
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


            <!-- Mobile User Menu -->
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
    <!-- SIDEBAR -->
    <!-- ========================================================= -->

    <div class="sidebar"
         id="sidebar">


        <!-- Sidebar Logo -->
        <div class="sidebar-logo">


            <a href="${pageContext.request.contextPath}/manager/dashboard"
               class="logo logo-normal">

                <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                     alt="HRMS Logo">

            </a>


            <a href="${pageContext.request.contextPath}/manager/dashboard"
               class="logo-small">

                <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg"
                     alt="HRMS Logo">

            </a>


            <a href="${pageContext.request.contextPath}/manager/dashboard"
               class="dark-logo">

                <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                     alt="HRMS Logo">

            </a>

        </div>


        <!-- Manager Profile -->
        <div class="modern-profile p-3 pb-0">

            <div class="text-center rounded bg-light p-3 mb-4 user-profile">


                <div class="avatar avatar-lg online mb-3">

                    <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg"
                         alt="Manager Profile"
                         class="img-fluid rounded-circle">

                </div>


                <h6 class="fs-12 fw-normal mb-1">

                    Manager

                </h6>


                <p class="fs-10 mb-0">

                    Manager

                </p>

            </div>

        </div>


        <!-- ========================================================= -->
        <!-- SIDEBAR MENU -->
        <!-- ========================================================= -->

        <div class="sidebar-menu">

            <ul>


                <!-- MENU TITLE -->
                <li class="menu-title">

                    <span>MAIN MENU</span>

                </li>


                <!-- ================================================= -->
                <!-- PROJECTS -->
                <!-- ================================================= -->

                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-briefcase"></i>

                        <span>Projects</span>

                    </a>

                </li>


                <!-- ================================================= -->
                <!-- LEAVE -->
                <!-- ================================================= -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-calendar-off"></i>

                        <span>Leave</span>

                        <span class="menu-arrow"></span>

                    </a>


                    <ul>


                        <!-- Leaves -->
                        <li class="submenu">

                            <a href="javascript:void(0);">

                                <span>Leaves</span>

                                <span class="menu-arrow"></span>

                            </a>


                            <ul>


                                <!-- Leave Approval -->
                                <li>

                                    <a href="javascript:void(0);">

                                        <span>Leave Approval</span>

                                    </a>

                                </li>


                                <!-- Timesheet Approval -->
                                <li>

                                    <a href="javascript:void(0);">

                                        <span>Timesheet Approval</span>

                                    </a>

                                </li>


                                <!-- Leave Allocation -->
                                <li>

                                    <a href="javascript:void(0);">

                                        <span>Leave Allocation</span>

                                    </a>

                                </li>


                            </ul>

                        </li>


                    </ul>

                </li>


                <!-- ================================================= -->
                <!-- TICKETS -->
                <!-- ================================================= -->

                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-ticket"></i>

                        <span>Tickets</span>

                    </a>

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
    <!-- PAGE WRAPPER -->
    <!-- ========================================================= -->

    <div class="page-wrapper">


        <div class="content">


            <!-- ================================================= -->
            <!-- BREADCRUMB -->
            <!-- ================================================= -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">


                <div class="my-auto mb-2">

                    <h2 class="mb-1">

                         Manager Dashboard

                    </h2>


                    <nav>

                        <ol class="breadcrumb mb-0">


                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/manager/dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>


                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Dashboard

                            </li>


                        </ol>

                    </nav>

                </div>


                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">


                    <div class="input-icon mb-2 position-relative">

                        <span class="input-icon-addon">

                            <i class="ti ti-calendar text-gray-9"></i>

                        </span>


                        <input type="text"
                               class="form-control date-range bookingrange"
                               placeholder="dd/mm/yyyy - dd/mm/yyyy">

                    </div>


                    <div class="ms-2 head-icons">

                        <a href="javascript:void(0);"
                           data-bs-toggle="tooltip"
                           data-bs-placement="top"
                           title="Collapse"
                           id="collapse-header">

                            <i class="ti ti-chevrons-up"></i>

                        </a>

                    </div>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- WELCOME -->
            <!-- ================================================= -->

            <div class="welcome-wrap mb-4">


                <div class="d-flex align-items-center justify-content-between flex-wrap">


                    <div class="mb-3">

                        <h2 class="mb-1 text-white">

                            Welcome to HRMS

                        </h2>


                        <p class="text-light mb-0">

                            Human Resource Management System - Manager Panel

                        </p>

                    </div>

                </div>


                <div class="welcome-bg">


                    <img src="${pageContext.request.contextPath}/assets/img/bg/welcome-bg-02.svg"
                         alt=""
                         class="welcome-bg-01">


                    <img src="${pageContext.request.contextPath}/assets/img/bg/welcome-bg-03.svg"
                         alt=""
                         class="welcome-bg-02">


                    <img src="${pageContext.request.contextPath}/assets/img/bg/welcome-bg-01.svg"
                         alt=""
                         class="welcome-bg-03">


                </div>

            </div>


            <!-- ================================================= -->
            <!-- SUMMARY CARDS -->
            <!-- ================================================= -->

            <div class="row">


                <!-- Total Employees -->
                <div class="col-xl-3 col-sm-6 d-flex">

                    <div class="card flex-fill">

                        <div class="card-body">


                            <span class="avatar avatar-md bg-dark mb-3">

                                <i class="ti ti-users fs-16"></i>

                            </span>


                            <h2 class="mb-1">

                                ${totalEmployees}

                            </h2>


                            <p class="fs-13 mb-0">

                                Total Employees

                            </p>


                        </div>

                    </div>

                </div>


                <!-- Present Today -->
                <div class="col-xl-3 col-sm-6 d-flex">

                    <div class="card flex-fill">

                        <div class="card-body">


                            <span class="avatar avatar-md bg-dark mb-3">

                                <i class="ti ti-user-check fs-16"></i>

                            </span>


                            <h2 class="mb-1">

                                ${presentToday}

                            </h2>


                            <p class="fs-13 mb-0">

                                Present Today

                            </p>


                        </div>

                    </div>

                </div>


                <!-- On Leave -->
                <div class="col-xl-3 col-sm-6 d-flex">

                    <div class="card flex-fill">

                        <div class="card-body">


                            <span class="avatar avatar-md bg-dark mb-3">

                                <i class="ti ti-calendar-off fs-16"></i>

                            </span>


                            <h2 class="mb-1">

                                ${onLeave}

                            </h2>


                            <p class="fs-13 mb-0">

                                On Leave

                            </p>


                        </div>

                    </div>

                </div>


                <!-- Pending Leaves -->
                <div class="col-xl-3 col-sm-6 d-flex">

                    <div class="card flex-fill">

                        <div class="card-body">


                            <span class="avatar avatar-md bg-dark mb-3">

                                <i class="ti ti-clock-hour-4 fs-16"></i>

                            </span>


                            <h2 class="mb-1">

                                ${pendingLeaves}

                            </h2>


                            <p class="fs-13 mb-0">

                                Pending Leave Requests

                            </p>


                        </div>

                    </div>

                </div>


            </div>


            <!-- ================================================= -->
            <!-- ATTENDANCE + EMPLOYEE OVERVIEW -->
            <!-- ================================================= -->

            <div class="row">


                <!-- Attendance Overview -->
                <div class="col-xxl-8 col-xl-7 d-flex">

                    <div class="card flex-fill">


                        <div class="card-header pb-2 d-flex align-items-center justify-content-between">

                            <h5 class="mb-0">

                                Attendance Overview

                            </h5>


                            <button type="button"
                                    class="btn btn-white border btn-sm"
                                    disabled>

                                Overview

                            </button>

                        </div>


                        <div class="card-body">

                            <div id="attendance-overview-chart"
                                 style="min-height:280px;">

                            </div>

                        </div>


                    </div>

                </div>


                <!-- Employee Overview -->
                <div class="col-xxl-4 col-xl-5 d-flex">

                    <div class="card flex-fill">


                        <div class="card-header pb-2">

                            <h5 class="mb-0">

                                Employee Overview

                            </h5>

                        </div>


                        <div class="card-body">

                            <div id="employee-overview-chart"
                                 style="min-height:280px;">

                            </div>

                        </div>


                    </div>

                </div>


            </div>


            <!-- ================================================= -->
            <!-- LEAVE + RECENT ACTIVITY -->
            <!-- ================================================= -->

            <div class="row">


                <!-- Leave Overview -->
                <div class="col-xl-6 d-flex">

                    <div class="card flex-fill">


                        <div class="card-header pb-2">

                            <h5 class="mb-0">

                                Leave Overview

                            </h5>

                        </div>


                        <div class="card-body">

                            <div id="leave-overview-chart"
                                 style="min-height:250px;">

                            </div>

                        </div>


                    </div>

                </div>


                <!-- Recent Activity -->
                <div class="col-xl-6 d-flex">

                    <div class="card flex-fill">


                        <div class="card-header pb-2">

                            <h5 class="mb-0">

                                Recent Activity

                            </h5>

                        </div>


                        <div class="card-body">


                            <div class="text-center py-5 text-muted">


                                <i class="ti ti-activity fs-32 mb-2 d-block"></i>


                                <p class="mb-0">

                                    No activity available

                                </p>


                            </div>


                        </div>

                    </div>

                </div>


            </div>


            <!-- ================================================= -->
            <!-- HRMS INFORMATION -->
            <!-- ================================================= -->

            <div class="row">


                <div class="col-12 d-flex">

                    <div class="card flex-fill">


                        <div class="card-header pb-2">

                            <h5 class="mb-0">

                                HRMS Information

                            </h5>

                        </div>


                        <div class="card-body">


                            <div class="text-center py-4 text-muted">

                                <p class="mb-0">

                                    Information will appear here as HRMS modules are implemented.

                                </p>

                            </div>


                        </div>

                    </div>

                </div>


            </div>


        </div>


        <!-- ================================================= -->
        <!-- FOOTER -->
        <!-- ================================================= -->

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">


            <p class="mb-0">

                HRMS

            </p>


            <p class="mb-0">

                Human Resource Management System

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

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


</body>

</html>


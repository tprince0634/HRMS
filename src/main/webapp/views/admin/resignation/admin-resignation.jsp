<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

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
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/apple-touch-icon.png">

    <!-- Theme Script js -->
    <script src="assets/js/theme-script.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <!-- Feather CSS -->
    <link rel="stylesheet" href="assets/plugins/icons/feather/feather.css">

    <!-- Tabler Icon CSS -->
    <link rel="stylesheet" href="assets/plugins/tabler-icons/tabler-icons.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

    <!-- Player CSS -->
    <link rel="stylesheet" href="assets/css/plyr.css">

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="assets/css/dataTables.bootstrap5.min.css">

    <!-- Datepicker CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

    <!-- Daterangepikcer CSS -->
    <link rel="stylesheet" href="assets/plugins/daterangepicker/daterangepicker.css">

    <!-- Owl Carousel -->
    <link rel="stylesheet" href="assets/plugins/owlcarousel/owl.carousel.min.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

     <!-- Color Picker Css -->
    <link rel="stylesheet" href="assets/plugins/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="assets/plugins/@simonwep/pickr/themes/nano.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/style.css">

<script>
document.addEventListener("DOMContentLoaded", function () {

    /* =========================================================
       RESIGNATION - SORT BY
       ========================================================= */

    const sortDropdown = document.querySelector(
        ".dropdown .dropdown-toggle[data-bs-toggle='dropdown']"
    );

    const sortItems = document.querySelectorAll(
        ".dropdown .dropdown-menu .dropdown-item"
    );

    const table = document.querySelector(
        "table.table.datatable"
    );

    if (!sortDropdown || !table || sortItems.length === 0) {
        return;
    }

    const tbody = table.querySelector("tbody");

    if (!tbody) {
        return;
    }


    /* ---------------------------------------------------------
       Get real resignation rows
       --------------------------------------------------------- */

    function getResignationRows() {

        return Array.from(
            tbody.querySelectorAll("tr")
        ).filter(function (row) {

            /*
             * Real resignation row contains
             * .edit-resignation
             */
            return row.querySelector(".edit-resignation") !== null;
        });
    }


    /* ---------------------------------------------------------
       Convert YYYY-MM-DD to Date
       --------------------------------------------------------- */

    function parseDate(value) {

        if (!value) {
            return null;
        }

        value = value.trim();

        /*
         * Expected:
         * 2026-09-08
         */

        const parts = value.split("-");

        if (parts.length !== 3) {
            return null;
        }

        return new Date(
            parseInt(parts[0], 10),
            parseInt(parts[1], 10) - 1,
            parseInt(parts[2], 10)
        );
    }


    /* ---------------------------------------------------------
       Update Sort Button
       --------------------------------------------------------- */

    function updateSortButton(text) {

        sortDropdown.innerHTML =
            '<p class="fs-12 d-inline-flex me-1 mb-0">' +
            'Sort By :' +
            '</p> ' +
            text +
            ' <i class="ti ti-chevron-down ms-1"></i>';
    }


    /* ---------------------------------------------------------
       SORT
       --------------------------------------------------------- */

    function sortResignations(type) {

        let rows = getResignationRows();

        if (rows.length === 0) {
            return;
        }


        /* =====================================================
           RECENTLY ADDED
           ===================================================== */

        if (type === "Recently Added") {

            rows.sort(function (rowA, rowB) {

                const buttonA =
                    rowA.querySelector(".edit-resignation");

                const buttonB =
                    rowB.querySelector(".edit-resignation");

                const idA = parseInt(
                    buttonA
                        ? buttonA.getAttribute("data-id")
                        : "0",
                    10
                );

                const idB = parseInt(
                    buttonB
                        ? buttonB.getAttribute("data-id")
                        : "0",
                    10
                );

                /*
                 * Highest resignation ID first
                 */
                return idB - idA;
            });
        }


        /* =====================================================
           ASCENDING - NOTICE DATE
           ===================================================== */

        else if (type === "Ascending") {

            rows.sort(function (rowA, rowB) {

                const dateA = parseDate(
                    rowA.cells[4]
                        ? rowA.cells[4].innerText
                        : ""
                );

                const dateB = parseDate(
                    rowB.cells[4]
                        ? rowB.cells[4].innerText
                        : ""
                );

                if (!dateA && !dateB) {
                    return 0;
                }

                if (!dateA) {
                    return 1;
                }

                if (!dateB) {
                    return -1;
                }

                return dateA.getTime() -
                       dateB.getTime();
            });
        }


        /* =====================================================
           DESCENDING - NOTICE DATE
           ===================================================== */

        else if (type === "Descending") {

            rows.sort(function (rowA, rowB) {

                const dateA = parseDate(
                    rowA.cells[4]
                        ? rowA.cells[4].innerText
                        : ""
                );

                const dateB = parseDate(
                    rowB.cells[4]
                        ? rowB.cells[4].innerText
                        : ""
                );

                if (!dateA && !dateB) {
                    return 0;
                }

                if (!dateA) {
                    return 1;
                }

                if (!dateB) {
                    return -1;
                }

                return dateB.getTime() -
                       dateA.getTime();
            });
        }


        /* =====================================================
           RE-APPEND SORTED ROWS
           ===================================================== */

        rows.forEach(function (row) {
            tbody.appendChild(row);
        });


        /*
         * Keep "No resignation records found" row untouched
         */
        updateSortButton(type);
    }


    /* ---------------------------------------------------------
       CLICK EVENTS
       --------------------------------------------------------- */

    sortItems.forEach(function (item) {

        item.addEventListener("click", function (event) {

            event.preventDefault();
            event.stopPropagation();

            const selectedSort =
                this.textContent.trim();

            if (
                selectedSort === "Recently Added" ||
                selectedSort === "Ascending" ||
                selectedSort === "Descending"
            ) {

                sortResignations(selectedSort);
            }

        });

    });

});
</script>
</head>

<body>

    <div id="global-loader" style="display: none;">
       <div class="page-loader"></div>
    </div>

    <!-- Main Wrapper -->
    <div class="main-wrapper">

       <!-- Header -->
       <div class="header">
          <div class="main-header">

             <div class="header-left">
                <a href="${pageContext.request.contextPath}/admin-dashboard" class="logo">
                   <img src="assets/img/logo.svg" alt="Logo">
                </a>
                <a href="${pageContext.request.contextPath}/admin-dashboard" class="dark-logo">
                   <img src="assets/img/logo-white.svg" alt="Logo">
                </a>
             </div>

             <a id="mobile_btn" class="mobile_btn" href="#sidebar">
                <span class="bar-icon">
                   <span></span>
                   <span></span>
                   <span></span>
                </span>
             </a>

             <div class="header-user">
                <div class="nav user-menu nav-list">

                   <div class="me-auto d-flex align-items-center" id="header-search">
                      <a id="toggle_btn" href="javascript:void(0);" class="btn btn-menubar me-1">
                         <i class="ti ti-arrow-bar-to-left"></i>
                      </a>
                      <!-- Search -->
                      <div class="input-group input-group-flat d-inline-flex me-1">
                         <span class="input-icon-addon">
                            <i class="ti ti-search"></i>
                         </span>
                         <input type="text" class="form-control" placeholder="Search in HRMS">
                         <span class="input-group-text">
                            <kbd>CTRL + / </kbd>
                         </span>
                      </div>
                      <!-- /Search -->
                      <div class="dropdown crm-dropdown">
                         <a href="#" class="btn btn-menubar me-1" data-bs-toggle="dropdown">
                            <i class="ti ti-layout-grid"></i>
                         </a>
                         <div class="dropdown-menu dropdown-lg dropdown-menu-start">
                            <div class="card mb-0 border-0 shadow-none">
                               <div class="card-header">
                                  <h4>CRM</h4>
                               </div>
                               <div class="card-body pb-1">
                                  <div class="row">
                                     <div class="col-sm-6">
                                        <a href="contacts.html"
                                           class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i class="ti ti-user-shield text-default me-2"></i>Contacts
                                           </span>
                                           <i class="ti ti-arrow-right"></i>
                                        </a>
                                        <a href="deals-grid.html"
                                           class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i class="ti ti-heart-handshake text-default me-2"></i>Deals
                                           </span>
                                           <i class="ti ti-arrow-right"></i>
                                        </a>
                                        <a href="pipeline.html"
                                           class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i
                                                 class="ti ti-timeline-event-text text-default me-2"></i>Pipeline
                                           </span>
                                           <i class="ti ti-arrow-right"></i>
                                        </a>
                                     </div>
                                     <div class="col-sm-6">
                                        <a href="companies-grid.html"
                                           class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i class="ti ti-building text-default me-2"></i>Companies
                                           </span>
                                           <i class="ti ti-arrow-right"></i>
                                        </a>
                                        <a href="leads-grid.html"
                                           class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i class="ti ti-user-check text-default me-2"></i>Leads
                                           </span>
                                           <i class="ti ti-arrow-right"></i>
                                        </a>
                                        <a href="activity.html"
                                           class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
                                           <span class="d-flex align-items-center me-3">
                                              <i class="ti ti-activity text-default me-2"></i>Activities
                                           </span>
                                           <i class="ti ti-arrow-right"></i>
                                        </a>
                                     </div>
                                  </div>
                               </div>
                            </div>
                         </div>
                      </div>
                      <a href="profile-settings.html" class="btn btn-menubar">
                         <i class="ti ti-settings-cog"></i>
                      </a>
                   </div>

                   <!-- Horizontal Single -->
                   <div class="sidebar sidebar-horizontal" id="horizontal-single">
                      <div class="sidebar-menu">
                         <div class="main-menu">
                            <ul class="nav-menu">
                               <li class="menu-title">
                                  <span>Main</span>
                               </li>
                               <li class="submenu">
                                  <a href="#">
                                     <i class="ti ti-smart-home"></i><span>Dashboard</span>
                                     <span class="menu-arrow"></span>
                                  </a>
                                  <ul>
                                     <li><a href="index.html">Admin Dashboard</a></li>
                                     <li><a href="employee-dashboard.html">Employee Dashboard</a></li>
                                     <li><a href="deals-dashboard.html">Deals Dashboard</a></li>
                                     <li><a href="leads-dashboard.html">Leads Dashboard</a></li>
                                  </ul>
                               </li>
                               <li class="submenu">
                                  <a href="#">
                                     <i class="ti ti-user-star"></i><span>Super Admin</span>
                                     <span class="menu-arrow"></span>
                                  </a>
                                  <ul>
                                     <li><a href="dashboard.html">Dashboard</a></li>
                                     <li><a href="companies.html">Companies</a></li>
                                     <li><a href="subscription.html">Subscriptions</a></li>
                                     <li><a href="packages.html">Packages</a></li>
                                     <li><a href="domain.html">Domain</a></li>
                                     <li><a href="purchase-transaction.html">Purchase Transaction</a></li>
                                  </ul>
                               </li>
                               <li class="submenu">
                                  <a href="#">
                                     <i class="ti ti-layout-grid-add"></i><span>Applications</span>
                                     <span class="menu-arrow"></span>
                                  </a>
                                  <ul>
                                     <li><a href="chat.html">Chat</a></li>
                                     <li class="submenu submenu-two">
                                        <a href="call.html">Calls<span
                                              class="menu-arrow inside-submenu"></span></a>
                                        <ul>
                                           <li><a href="voice-call.html">Voice Call</a></li>
                                           <li><a href="video-call.html">Video Call</a></li>
                                           <li><a href="outgoing-call.html">Outgoing Call</a></li>
                                           <li><a href="incoming-call.html">Incoming Call</a></li>
                                           <li><a href="call-history.html">Call History</a></li>
                                        </ul>
                                     </li>
                                     <li><a href="calendar.html">Calendar</a></li>
                                     <li><a href="email.html">Email</a></li>
                                     <li><a href="todo.html">To Do</a></li>
                                     <li><a href="notes.html">Notes</a></li>
                                     <li><a href="social-feed.html">Social Feed</a></li>
                                     <li><a href="file-manager.html">File Manager</a></li>
                                     <li><a href="kanban-view.html">Kanban</a></li>
                                     <li><a href="invoices.html">Invoices</a></li>
                                  </ul>
                               </li>
                               <li class="submenu">
                                  <a href="#">
                                     <i class="ti ti-layout-board-split"></i><span>Layouts</span>
                                     <span class="menu-arrow"></span>
                                  </a>
                                  <ul>
                                     <li>
                                        <a href="layout-horizontal.html">
                                           <span>Horizontal</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-detached.html">
                                           <span>Detached</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-modern.html">
                                           <span>Modern</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-two-column.html">
                                           <span>Two Column </span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-hovered.html">
                                           <span>Hovered</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-box.html">
                                           <span>Boxed</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-horizontal-single.html">
                                           <span>Horizontal Single</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-horizontal-overlay.html">
                                           <span>Horizontal Overlay</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-horizontal-box.html">
                                           <span>Horizontal Box</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-horizontal-sidemenu.html">
                                           <span>Menu Aside</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-vertical-transparent.html">
                                           <span>Transparent</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-without-header.html">
                                           <span>Without Header</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-rtl.html">
                                           <span>RTL</span>
                                        </a>
                                     </li>
                                     <li>
                                        <a href="layout-dark.html">
                                           <span>Dark</span>
                                        </a>
                                     </li>
                                  </ul>
                               </li>
                               <li class="submenu">
                                  <a href="#" class="active" >
                                     <i class="ti ti-user-star"></i><span>Projects</span>
                                     <span class="menu-arrow"></span>
                                  </a>
                                  <ul>
                                     <li>
                                        <a href="clients-grid.html"><span>Clients</span>
                                        </a>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Projects</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="projects-grid.html">Projects</a></li>
                                           <li><a href="tasks.html">Tasks</a></li>
                                           <li><a href="task-board.html">Task Board</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="call.html">Crm<span class="menu-arrow"></span></a>
                                        <ul>
                                           <li><a href="contacts-grid.html" ><span>Contacts</span></a></li>
                                           <li><a href="companies-grid.html"><span>Companies</span></a>
                                           </li>
                                           <li><a href="deals-grid.html"><span>Deals</span></a></li>
                                           <li><a href="leads-grid.html"><span>Leads</span></a></li>
                                           <li><a href="pipeline.html"><span>Pipeline</span></a></li>
                                           <li><a href="analytics.html"><span>Analytics</span></a></li>
                                           <li><a href="activity.html"><span>Activities</span></a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Employees</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="employees.html">Employee Lists</a></li>
                                           <li><a href="employees-grid.html">Employee Grid</a></li>
                                           <li><a href="employee-details.html">Employee Details</a></li>
                                           <li><a href="departments.html">Departments</a></li>
                                           <li><a href="designations.html">Designations</a></li>
                                           <li><a href="policy.html">Policies</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Tickets</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="tickets.html">Tickets</a></li>
                                           <li><a href="ticket-details.html">Ticket Details</a></li>
                                        </ul>
                                     </li>
                                     <li><a href="holidays.html"><span>Holidays</span></a></li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Attendance</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">Leaves<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="leaves.html">Leaves (Admin)</a></li>
                                                 <li><a href="leaves-employee.html">Leave (Employee)</a>
                                                 </li>
                                                 <li><a href="leave-settings.html">Leave Settings</a>
                                                 </li>
                                              </ul>
                                           </li>
                                           <li><a href="attendance-admin.html">Attendance (Admin)</a></li>
                                           <li><a href="attendance-employee.html">Attendance (Employee)</a>
                                           </li>
                                           <li><a href="timesheets.html">Timesheets</a></li>
                                           <li><a href="schedule-timing.html">Shift & Schedule</a></li>
                                           <li><a href="overtime.html">Overtime</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Performance</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="performance-indicator.html">Performance
                                                 Indicator</a></li>
                                           <li><a href="performance-review.html">Performance Review</a>
                                           </li>
                                           <li><a href="performance-appraisal.html">Performance
                                                 Appraisal</a></li>
                                           <li><a href="goal-tracking.html">Goal List</a></li>
                                           <li><a href="goal-type.html">Goal Type</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Training</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="training.html">Training List</a></li>
                                           <li><a href="trainers.html">Trainers</a></li>
                                           <li><a href="training-type.html">Training Type</a></li>
                                        </ul>
                                     </li>
                                     <li><a href="promotion.html"><span>Promotion</span></a></li>
                                     <li><a href="resignation.html" class="active"><span>Resignation</span></a></li>
                                     <li><a href="termination.html"><span>Termination</span></a></li>
                                  </ul>
                               </li>
                               <li class="submenu">
                                  <a href="#">
                                     <i class="ti ti-user-star"></i><span>Administration</span>
                                     <span class="menu-arrow"></span>
                                  </a>
                                  <ul>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Sales</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="estimates.html">Estimates</a></li>
                                           <li><a href="invoices.html">Invoices</a></li>
                                           <li><a href="payments.html">Payments</a></li>
                                           <li><a href="expenses.html">Expenses</a></li>
                                           <li><a href="provident-fund.html">Provident Fund</a></li>
                                           <li><a href="taxes.html">Taxes</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Accounting</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="categories.html">Categories</a></li>
                                           <li><a href="budgets.html">Budgets</a></li>
                                           <li><a href="budget-expenses.html">Budget Expenses</a></li>
                                           <li><a href="budget-revenues.html">Budget Revenues</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Payroll</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="employee-salary.html">Employee Salary</a></li>
                                           <li><a href="payslip.html">Payslip</a></li>
                                           <li><a href="payroll.html">Payroll Items</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Assets</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="assets.html">Assets</a></li>
                                           <li><a href="asset-categories.html">Asset Categories</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Help & Supports</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="knowledgebase.html">Knowledge Base</a></li>
                                           <li><a href="activity.html">Activities</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>User Management</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="users.html">Users</a></li>
                                           <li><a href="roles-permissions.html">Roles & Permissions</a>
                                           </li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Reports</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li><a href="expenses-report.html">Expense Report</a></li>
                                           <li><a href="invoice-report.html">Invoice Report</a></li>
                                           <li><a href="payment-report.html">Payment Report</a></li>
                                           <li><a href="project-report.html">Project Report</a></li>
                                           <li><a href="task-report.html">Task Report</a></li>
                                           <li><a href="user-report.html">User Report</a></li>
                                           <li><a href="employee-report.html">Employee Report</a></li>
                                           <li><a href="payslip-report.html">Payslip Report</a></li>
                                           <li><a href="attendance-report.html">Attendance Report</a></li>
                                           <li><a href="leave-report.html">Leave Report</a></li>
                                           <li><a href="daily-report.html">Daily Report</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Settings</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">General Settings<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="profile-settings.html">Profile</a></li>
                                                 <li><a href="security-settings.html">Security</a></li>
                                                 <li><a
                                                       href="notification-settings.html">Notifications</a>
                                                 </li>
                                                 <li><a href="connected-apps.html">Connected Apps</a>
                                                 </li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">Website Settings<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="bussiness-settings.html">Business
                                                       Settings</a></li>
                                                 <li><a href="seo-settings.html">SEO Settings</a></li>
                                                 <li><a
                                                       href="localization-settings.html">Localization</a>
                                                 </li>
                                                 <li><a href="prefixes.html">Prefixes</a></li>
                                                 <li><a href="preferences.html">Preferences</a></li>
                                                 <li><a href="performance-appraisal.html">Appearance</a>
                                                 </li>
                                                 <li><a href="language.html">Language</a></li>
                                                 <li><a
                                                       href="authentication-settings.html">Authentication</a>
                                                 </li>
                                                 <li><a href="ai-settings.html">AI Settings</a></li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">App Settings<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="salary-settings.html">Salary Settings</a>
                                                 </li>
                                                 <li><a href="approval-settings.html">Approval
                                                       Settings</a></li>
                                                 <li><a href="invoice-settings.html">Invoice Settings</a>
                                                 </li>
                                                 <li><a href="leave-type.html">Leave Type</a></li>
                                                 <li><a href="custom-fields.html">Custom Fields</a></li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">System Settings<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="email-settings.html">Email Settings</a>
                                                 </li>
                                                 <li><a href="email-template.html">Email Templates</a>
                                                 </li>
                                                 <li><a href="sms-settings.html">SMS Settings</a></li>
                                                 <li><a href="sms-template.html">SMS Templates</a></li>
                                                 <li><a href="otp-settings.html">OTP</a></li>
                                                 <li><a href="gdpr.html">GDPR Cookies</a></li>
                                                 <li><a href="maintenance-mode.html">Maintenance Mode</a>
                                                 </li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">Financial Settings<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="payment-gateways.html">Payment Gateways</a>
                                                 </li>
                                                 <li><a href="tax-rates.html">Tax Rate</a></li>
                                                 <li><a href="currencies.html">Currencies</a></li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">Other Settings<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="custom-css.html">Custom CSS</a></li>
                                                 <li><a href="custom-js.html">Custom JS</a></li>
                                                 <li><a href="cronjob.html">Cronjob</a></li>
                                                 <li><a href="storage-settings.html">Storage</a></li>
                                                 <li><a href="ban-ip-address.html">Ban IP Address</a>
                                                 </li>
                                                 <li><a href="backup.html">Backup</a></li>
                                                 <li><a href="clear-cache.html">Clear Cache</a></li>
                                              </ul>
                                           </li>
                                        </ul>
                                     </li>
                                  </ul>
                               </li>
                               <li class="submenu">
                                  <a href="#">
                                     <i class="ti ti-page-break"></i><span>Pages</span>
                                     <span class="menu-arrow"></span>
                                  </a>
                                  <ul>
                                     <li><a href="starter.html"><span>Starter</span></a></li>
                                     <li><a href="profile.html"><span>Profile</span></a></li>
                                     <li><a href="gallery.html"><span>Gallery</span></a></li>
                                     <li><a href="search-result.html"><span>Search Results</span></a></li>
                                     <li><a href="timeline.html"><span>Timeline</span></a></li>
                                     <li><a href="pricing.html"><span>Pricing</span></a></li>
                                     <li><a href="coming-soon.html"><span>Coming Soon</span></a></li>
                                     <li><a href="under-maintenance.html"><span>Under Maintenance</span></a>
                                     </li>
                                     <li><a href="under-construction.html"><span>Under
                                              Construction</span></a></li>
                                     <li><a href="api-keys.html"><span>API Keys</span></a></li>
                                     <li><a href="privacy-policy.html"><span>Privacy Policy</span></a></li>
                                     <li><a href="terms-condition.html"><span>Terms & Conditions</span></a>
                                     </li>
                                     <li class="submenu">
                                        <a href="#"><span>Content</span> <span
                                              class="menu-arrow"></span></a>
                                        <ul>
                                           <li><a href="pages.html">Pages</a></li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">Blogs<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="blogs.html">All Blogs</a></li>
                                                 <li><a href="blog-categories.html">Categories</a></li>
                                                 <li><a href="blog-comments.html">Comments</a></li>
                                                 <li><a href="blog-tags.html">Tags</a></li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">Locations<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="countries.html">Countries</a></li>
                                                 <li><a href="states.html">States</a></li>
                                                 <li><a href="cities.html">Cities</a></li>
                                              </ul>
                                           </li>
                                           <li><a href="testimonials.html">Testimonials</a></li>
                                           <li><a href="faq.html">FAQ’S</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="#">
                                           <span>Authentication</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li class="submenu">
                                              <a href="javascript:void(0);" class="">Login<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="login.html">Cover</a></li>
                                                 <li><a href="login-2.html">Illustration</a></li>
                                                 <li><a href="login-3.html">Basic</a></li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);" class="">Register<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="register.html">Cover</a></li>
                                                 <li><a href="register-2.html">Illustration</a></li>
                                                 <li><a href="register-3.html">Basic</a></li>
                                              </ul>
                                           </li>
                                           <li class="submenu"><a href="javascript:void(0);">Forgot
                                                 Password<span class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="forgot-password.html">Cover</a></li>
                                                 <li><a href="forgot-password-2.html">Illustration</a>
                                                 </li>
                                                 <li><a href="forgot-password-3.html">Basic</a></li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">Reset Password<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="reset-password.html">Cover</a></li>
                                                 <li><a href="reset-password-2.html">Illustration</a>
                                                 </li>
                                                 <li><a href="reset-password-3.html">Basic</a></li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">Email Verification<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="email-verification.html">Cover</a></li>
                                                 <li><a href="email-verification-2.html">Illustration</a>
                                                 </li>
                                                 <li><a href="email-verification-3.html">Basic</a></li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">2 Step Verification<span
                                                    class="menu-arrow"></span></a>
                                              <ul>
                                                 <li><a href="two-step-verification.html">Cover</a></li>
                                                 <li><a
                                                       href="two-step-verification-2.html">Illustration</a>
                                                 </li>
                                                 <li><a href="two-step-verification-3.html">Basic</a>
                                                 </li>
                                              </ul>
                                           </li>
                                           <li><a href="lock-screen.html">Lock Screen</a></li>
                                           <li><a href="error-404.html">404 Error</a></li>
                                           <li><a href="error-500.html">500 Error</a></li>
                                        </ul>
                                     </li>
                                     <li class="submenu">
                                        <a href="#">
                                           <span>UI Interface</span>
                                           <span class="menu-arrow"></span>
                                        </a>
                                        <ul>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">
                                                 <i class="ti ti-hierarchy-2"></i>
                                                 <span>Base UI</span>
                                                 <span class="menu-arrow"></span>
                                              </a>
                                              <ul>
                                                 <li>
                                                    <a href="ui-alerts.html">Alerts</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-accordion.html">Accordion</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-avatar.html">Avatar</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-badges.html">Badges</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-borders.html">Border</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-buttons.html">Buttons</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-buttons-group.html">Button Group</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-breadcrumb.html">Breadcrumb</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-cards.html">Card</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-carousel.html">Carousel</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-colors.html">Colors</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-dropdowns.html">Dropdowns</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-grid.html">Grid</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-images.html">Images</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-lightbox.html">Lightbox</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-media.html">Media</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-modals.html">Modals</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-offcanvas.html">Offcanvas</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-pagination.html">Pagination</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-popovers.html">Popovers</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-progress.html">Progress</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-placeholders.html">Placeholders</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-spinner.html">Spinner</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-sweetalerts.html">Sweet Alerts</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-nav-tabs.html">Tabs</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-toasts.html">Toasts</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-tooltips.html">Tooltips</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-typography.html">Typography</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-video.html">Video</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-sortable.html">Sortable</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-swiperjs.html">Swiperjs</a>
                                                 </li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">
                                                 <i class="ti ti-hierarchy-3"></i>
                                                 <span>Advanced UI</span>
                                                 <span class="menu-arrow"></span>
                                              </a>
                                              <ul>
                                                 <li>
                                                    <a href="ui-ribbon.html">Ribbon</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-clipboard.html">Clipboard</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-drag-drop.html">Drag & Drop</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-rangeslider.html">Range Slider</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-rating.html">Rating</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-text-editor.html">Text Editor</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-counter.html">Counter</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-scrollbar.html">Scrollbar</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-stickynote.html">Sticky Note</a>
                                                 </li>
                                                 <li>
                                                    <a href="ui-timeline.html">Timeline</a>
                                                 </li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">
                                                 <i class="ti ti-input-search"></i>
                                                 <span>Forms</span>
                                                 <span class="menu-arrow"></span>
                                              </a>
                                              <ul>
                                                 <li class="submenu submenu-two">
                                                    <a href="javascript:void(0);">Form Elements <span
                                                          class="menu-arrow inside-submenu"></span>
                                                    </a>
                                                    <ul>
                                                       <li>
                                                          <a href="form-basic-inputs.html">Basic
                                                             Inputs</a>
                                                       </li>
                                                       <li>
                                                          <a href="form-checkbox-radios.html">Checkbox
                                                             & Radios</a>
                                                       </li>
                                                       <li>
                                                          <a href="form-input-groups.html">Input
                                                             Groups</a>
                                                       </li>
                                                       <li>
                                                          <a href="form-grid-gutters.html">Grid &
                                                             Gutters</a>
                                                       </li>
                                                       <li>
                                                          <a href="form-select.html">Form Select</a>
                                                       </li>
                                                       <li>
                                                          <a href="form-mask.html">Input Masks</a>
                                                       </li>
                                                       <li>
                                                          <a href="form-fileupload.html">File
                                                             Uploads</a>
                                                       </li>
                                                    </ul>
                                                 </li>
                                                 <li class="submenu submenu-two">
                                                    <a href="javascript:void(0);">Layouts <span
                                                          class="menu-arrow inside-submenu"></span>
                                                    </a>
                                                    <ul>
                                                       <li>
                                                          <a href="form-horizontal.html">Horizontal
                                                             Form</a>
                                                       </li>
                                                       <li>
                                                          <a href="form-vertical.html">Vertical
                                                             Form</a>
                                                       </li>
                                                       <li>
                                                          <a href="form-floating-labels.html">Floating
                                                             Labels</a>
                                                       </li>
                                                    </ul>
                                                 </li>
                                                 <li>
                                                    <a href="form-validation.html">Form Validation</a>
                                                 </li>

                                                 <li>
                                                    <a href="form-select2.html">Select2</a>
                                                 </li>
                                                 <li>
                                                    <a href="form-wizard.html">Form Wizard</a>
                                                 </li>
                                                 <li>
                                                    <a href="form-pickers.html">Form Pickers</a>
                                                 </li>

                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">
                                                 <i class="ti ti-table-plus"></i>
                                                 <span>Tables</span>
                                                 <span class="menu-arrow"></span>
                                              </a>
                                              <ul>
                                                 <li>
                                                    <a href="tables-basic.html">Basic Tables </a>
                                                 </li>
                                                 <li>
                                                    <a href="data-tables.html">Data Table </a>
                                                 </li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">
                                                 <i class="ti ti-chart-line"></i>
                                                 <span>Charts</span>
                                                 <span class="menu-arrow"></span>
                                              </a>
                                              <ul>
                                                 <li>
                                                    <a href="chart-apex.html">Apex Charts</a>
                                                 </li>
                                                 <li>
                                                    <a href="chart-c3.html">Chart C3</a>
                                                 </li>
                                                 <li>
                                                    <a href="chart-js.html">Chart Js</a>
                                                 </li>
                                                 <li>
                                                    <a href="chart-morris.html">Morris Charts</a>
                                                 </li>
                                                 <li>
                                                    <a href="chart-flot.html">Flot Charts</a>
                                                 </li>
                                                 <li>
                                                    <a href="chart-peity.html">Peity Charts</a>
                                                 </li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">
                                                 <i class="ti ti-icons"></i>
                                                 <span>Icons</span>
                                                 <span class="menu-arrow"></span>
                                              </a>
                                              <ul>
                                                 <li>
                                                    <a href="icon-fontawesome.html">Fontawesome
                                                       Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-tabler.html">Tabler Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-bootstrap.html">Bootstrap Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-remix.html">Remix Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-feather.html">Feather Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-ionic.html">Ionic Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-material.html">Material Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-pe7.html">Pe7 Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-simpleline.html">Simpleline Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-themify.html">Themify Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-weather.html">Weather Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-typicon.html">Typicon Icons</a>
                                                 </li>
                                                 <li>
                                                    <a href="icon-flag.html">Flag Icons</a>
                                                 </li>
                                              </ul>
                                           </li>
                                           <li class="submenu">
                                              <a href="javascript:void(0);">
                                                 <i class="ti ti-table-plus"></i>
                                                 <span>Maps</span>
                                                 <span class="menu-arrow"></span>
                                              </a>
                                              <ul>
                                                 <li>
                                                    <a href="maps-vector.html">Vector</a>
                                                 </li>
                                                 <li>
                                                    <a href="maps-leaflet.html">Leaflet</a>
                                                 </li>
                                              </ul>
                                           </li>
                                        </ul>
                                     </li>
                                     <li><a href="#">Documentation</a></li>
                                     <li><a href="#">Change Log</a></li>
                                     <li class="submenu">
                                        <a href="javascript:void(0);"><span>Multi Level</span><span
                                              class="menu-arrow"></span></a>
                                        <ul>
                                           <li><a href="javascript:void(0);">Multilevel 1</a></li>
                                           <li class="submenu submenu-two">
                                              <a href="javascript:void(0);">Multilevel 2<span
                                                    class="menu-arrow inside-submenu"></span></a>
                                              <ul>
                                                 <li><a href="javascript:void(0);">Multilevel 2.1</a>
                                                 </li>
                                                 <li class="submenu submenu-two submenu-three">
                                                    <a href="javascript:void(0);">Multilevel 2.2<span
                                                          class="menu-arrow inside-submenu inside-submenu-two"></span></a>
                                                    <ul>
                                                       <li><a href="javascript:void(0);">Multilevel
                                                             2.2.1</a></li>
                                                       <li><a href="javascript:void(0);">Multilevel
                                                             2.2.2</a></li>
                                                    </ul>
                                                 </li>
                                              </ul>
                                           </li>
                                           <li><a href="javascript:void(0);">Multilevel 3</a></li>
                                        </ul>
                                     </li>
                                  </ul>
                               </li>
                            </ul>
                         </div>
                      </div>
                   </div>
                   <!-- /Horizontal Single -->

                   <div class="d-flex align-items-center">
                      <div class="me-1">
                         <a href="#" class="btn btn-menubar btnFullscreen">
                            <i class="ti ti-maximize"></i>
                         </a>
                      </div>
                      <div class="dropdown me-1">
                         <a href="#" class="btn btn-menubar" data-bs-toggle="dropdown">
                            <i class="ti ti-layout-grid-remove"></i>
                         </a>
                         <div class="dropdown-menu dropdown-menu-end">
                            <div class="card mb-0 border-0 shadow-none">
                               <div class="card-header">
                                  <h4>Applications</h4>
                               </div>
                               <div class="card-body">
                                  <a href="calendar.html" class="d-block pb-2">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                           class="ti ti-calendar text-gray-9"></i></span>Calendar
                                  </a>
                                  <a href="todo.html" class="d-block py-2">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                           class="ti ti-subtask text-gray-9"></i></span>To Do
                                  </a>
                                  <a href="notes.html" class="d-block py-2">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                           class="ti ti-notes text-gray-9"></i></span>Notes
                                  </a>
                                  <a href="file-manager.html" class="d-block py-2">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                           class="ti ti-folder text-gray-9"></i></span>File Manager
                                  </a>
                                  <a href="kanban-view.html" class="d-block py-2">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                           class="ti ti-layout-kanban text-gray-9"></i></span>Kanban
                                  </a>
                                  <a href="invoices.html" class="d-block py-2 pb-0">
                                     <span class="avatar avatar-md bg-transparent-dark me-2"><i
                                           class="ti ti-file-invoice text-gray-9"></i></span>Invoices
                                  </a>
                               </div>
                            </div>
                         </div>
                      </div>
                      <div class="me-1">
                         <a href="chat.html" class="btn btn-menubar position-relative">
                            <i class="ti ti-brand-hipchat"></i>
                            <span
                               class="badge bg-info rounded-pill d-flex align-items-center justify-content-center header-badge">5</span>
                         </a>
                      </div>
                      <div class="me-1">
                         <a href="email.html" class="btn btn-menubar">
                            <i class="ti ti-mail"></i>
                         </a>
                      </div>
                      <div class="me-1 notification_item">
                         <a href="#" class="btn btn-menubar position-relative me-1" id="notification_popup"
                            data-bs-toggle="dropdown">
                            <i class="ti ti-bell"></i>
                            <span class="notification-status-dot"></span>
                         </a>
                         <div class="dropdown-menu dropdown-menu-end notification-dropdown p-4">
                            <div
                               class="d-flex align-items-center justify-content-between border-bottom p-0 pb-3 mb-3">
                               <h4 class="notification-title">Notifications (2)</h4>
                               <div class="d-flex align-items-center">
                                  <a href="#" class="text-primary fs-15 me-3 lh-1">Mark all as read</a>
                                  <div class="dropdown">
                                     <a href="javascript:void(0);" class="bg-white dropdown-toggle"
                                        data-bs-toggle="dropdown">
                                        <i class="ti ti-calendar-due me-1"></i>Today
                                     </a>
                                     <ul class="dropdown-menu mt-2 p-3">
                                        <li>
                                           <a href="javascript:void(0);" class="dropdown-item rounded-1">
                                              This Week
                                           </a>
                                        </li>
                                        <li>
                                           <a href="javascript:void(0);" class="dropdown-item rounded-1">
                                              Last Week
                                           </a>
                                        </li>
                                        <li>
                                           <a href="javascript:void(0);" class="dropdown-item rounded-1">
                                              Last Month
                                           </a>
                                        </li>
                                     </ul>
                                  </div>
                               </div>
                            </div>
                            <div class="noti-content">
                               <div class="d-flex flex-column">
                                  <div class="border-bottom mb-3 pb-3">
                                     <a href="activity.html">
                                        <div class="d-flex">
                                           <span class="avatar avatar-lg me-2 flex-shrink-0">
                                              <img src="assets/img/profiles/avatar-27.jpg" alt="Profile">
                                           </span>
                                           <div class="flex-grow-1">
                                              <p class="mb-1"><span
                                                    class="text-dark fw-semibold">Shawn</span>
                                                 performance in Math is below the threshold.</p>
                                              <span>Just Now</span>
                                           </div>
                                        </div>
                                     </a>
                                  </div>
                                  <div class="border-bottom mb-3 pb-3">
                                     <a href="activity.html" class="pb-0">
                                        <div class="d-flex">
                                           <span class="avatar avatar-lg me-2 flex-shrink-0">
                                              <img src="assets/img/profiles/avatar-23.jpg" alt="Profile">
                                           </span>
                                           <div class="flex-grow-1">
                                              <p class="mb-1"><span
                                                    class="text-dark fw-semibold">Sylvia</span> added
                                                 appointment on 02:00 PM</p>
                                              <span>10 mins ago</span>
                                              <div
                                                 class="d-flex justify-content-start align-items-center mt-1">
                                                 <span class="btn btn-light btn-sm me-2">Deny</span>
                                                 <span class="btn btn-primary btn-sm">Approve</span>
                                              </div>
                                           </div>
                                        </div>
                                     </a>
                                  </div>
                                  <div class="border-bottom mb-3 pb-3">
                                     <a href="activity.html">
                                        <div class="d-flex">
                                           <span class="avatar avatar-lg me-2 flex-shrink-0">
                                              <img src="assets/img/profiles/avatar-25.jpg" alt="Profile">
                                           </span>
                                           <div class="flex-grow-1">
                                              <p class="mb-1">New student record <span class="text-dark fw-semibold"> George</span>
                                                 is created by <span class="text-dark fw-semibold">Teressa</span>
                                              </p>
                                              <span>2 hrs ago</span>
                                           </div>
                                        </div>
                                     </a>
                                  </div>
                                  <div class="border-0 mb-3 pb-0">
                                     <a href="activity.html">
                                        <div class="d-flex">
                                           <span class="avatar avatar-lg me-2 flex-shrink-0">
                                              <img src="assets/img/profiles/avatar-01.jpg" alt="Profile">
                                           </span>
                                           <div class="flex-grow-1">
                                              <p class="mb-1">A new teacher record for <span class="text-dark fw-semibold">Elisa</span> </p>
                                              <span>09:45 AM</span>
                                           </div>
                                        </div>
                                     </a>
                                  </div>
                               </div>
                            </div>
                            <div class="d-flex p-0">
                               <a href="#" class="btn btn-light w-100 me-2">Cancel</a>
                               <a href="activity.html" class="btn btn-primary w-100">View All</a>
                            </div>
                         </div>
                      </div>
                      <div class="dropdown profile-dropdown">
                         <a href="javascript:void(0);" class="dropdown-toggle d-flex align-items-center" data-bs-toggle="dropdown">
                            <span class="avatar avatar-sm online">
                               <img src="assets/img/profiles/avatar-12.jpg" alt="Img" class="img-fluid rounded-circle">
                            </span>
                         </a>
                         <div class="dropdown-menu shadow-none">
                            <div class="card mb-0">
                               <div class="card-header">
                                  <div class="d-flex align-items-center">
                                     <span class="avatar avatar-lg me-2 avatar-rounded">
                                        <img src="assets/img/profiles/avatar-12.jpg" alt="img">
                                     </span>
                                     <div>
                                        <h5 class="mb-0">Kevin Larry</h5>
                                        <p class="fs-12 fw-medium mb-0">warren@example.com</p>
                                     </div>
                                  </div>
                               </div>
                               <div class="card-body">
                                  <a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
                                     href="profile.html">
                                     <i class="ti ti-user-circle me-1"></i>My Profile
                                  </a>
                                  <a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
                                     href="bussiness-settings.html">
                                     <i class="ti ti-settings me-1"></i>Settings
                                  </a>

                                  <a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
                                     href="profile-settings.html">
                                     <i class="ti ti-circle-arrow-up me-1"></i>My Account
                                  </a>
                                  <a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
                                     href="knowledgebase.html">
                                     <i class="ti ti-question-mark me-1"></i>Knowledge Base
                                  </a>
                               </div>
                               <div class="card-footer py-1">
                                  <a class="dropdown-item d-inline-flex align-items-center p-0 py-2" href="login.html"><i class="ti ti-login me-2"></i>Logout</a>
                               </div>
                            </div>
                         </div>
                      </div>
                   </div>
                </div>
             </div>

             <!-- Mobile Menu -->
             <div class="dropdown mobile-user-menu">
                <a href="javascript:void(0);" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                   <i class="fa fa-ellipsis-v"></i>
                </a>
                <div class="dropdown-menu dropdown-menu-end">
                   <a class="dropdown-item" href="profile.html">My Profile</a>
                   <a class="dropdown-item" href="profile-settings.html">Settings</a>
                   <a class="dropdown-item" href="login.html">Logout</a>
                </div>
             </div>
             <!-- /Mobile Menu -->

          </div>

       </div>
       <!-- /Header -->

       <!-- Sidebar -->
       <%@ include file="../adminSidebar.jsp" %>

<div class="page-wrapper">
          <div class="content">

             <!-- Breadcrumb -->
             <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                   <h2 class="mb-1">Resignation</h2>
                   <nav>
                      <ol class="breadcrumb mb-0">
                         <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                               <i class="ti ti-smart-home"></i>
                            </a>
                         </li>
                         <li class="breadcrumb-item">Performance</li>
                         <li class="breadcrumb-item active" aria-current="page">Resignation</li>
                      </ol>
                   </nav>
                </div>

                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
                   <div class="mb-2">
                      <a href="javascript:void(0);"
                         class="btn btn-primary d-flex align-items-center"
                         data-bs-toggle="modal"
                         data-bs-target="#new_resignation">
                         <i class="ti ti-circle-plus me-2"></i>Add Resignation
                      </a>
                   </div>

                   <div class="head-icons ms-2">
                      <a href="javascript:void(0);"
                         data-bs-toggle="tooltip"
                         data-bs-placement="top"
                         data-bs-original-title="Collapse"
                         id="collapse-header">
                         <i class="ti ti-chevrons-up"></i>
                      </a>
                   </div>
                </div>
             </div>
             <!-- /Breadcrumb -->

             <!-- Success Message -->
             <c:if test="${not empty sessionScope.successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                   <c:out value="${sessionScope.successMessage}"/>
                   <button type="button"
                         class="btn-close"
                         data-bs-dismiss="alert"
                         aria-label="Close"></button>
                </div>
                <c:remove var="successMessage" scope="session"/>
             </c:if>

             <!-- Error Message -->
             <c:if test="${not empty sessionScope.errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                   <c:out value="${sessionScope.errorMessage}"/>
                   <button type="button"
                         class="btn-close"
                         data-bs-dismiss="alert"
                         aria-label="Close"></button>
                </div>
                <c:remove var="errorMessage" scope="session"/>
             </c:if>

             <!-- Resignation List -->
             <div class="row">
                <div class="col-sm-12">
                   <div class="card">

                      <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                         <h5 class="d-flex align-items-center">Resignation List</h5>

                         <div class="d-flex align-items-center flex-wrap row-gap-3">
                            <div class="input-icon position-relative me-2">
                               <span class="input-icon-addon">
                                  <i class="ti ti-calendar"></i>
                               </span>
                               <input type="text"
                                     class="form-control date-range bookingrange"
                                     placeholder="dd/mm/yyyy - dd/mm/yyyy">
                            </div>

                            <div class="dropdown">
                               <a href="javascript:void(0);"
                                  class="dropdown-toggle btn btn-white d-inline-flex align-items-center fs-12"
                                  data-bs-toggle="dropdown">
                                  <p class="fs-12 d-inline-flex me-1">Sort By : </p>
                                  Last 7 Days
                               </a>

                               <ul class="dropdown-menu dropdown-menu-end p-3">
                                  <li>
                                     <a href="javascript:void(0);"
                                        class="dropdown-item rounded-1">Recently Added</a>
                                  </li>
                                  <li>
                                     <a href="javascript:void(0);"
                                        class="dropdown-item rounded-1">Ascending</a>
                                  </li>
                                  <li>
                                     <a href="javascript:void(0);"
                                        class="dropdown-item rounded-1">Descending</a>
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
                                     <th class="no-sort">
                                        <div class="form-check form-check-md">
                                           <input class="form-check-input"
                                                 type="checkbox"
                                                 id="select-all">
                                        </div>
                                     </th>

                                     <th>Resigning Employee</th>
                                     <th>Department</th>
                                     <th>Reason</th>
                                     <th>Notice Date</th>
                                     <th>Resignation Date</th>
                                     <th></th>
                                  </tr>
                               </thead>

                               <tbody>

                                  <c:choose>

                                     <c:when test="${not empty resignations}">

                                        <c:forEach var="resignation"
                                                 items="${resignations}">

                                           <tr>

                                              <td>
                                                 <div class="form-check form-check-md">
                                                    <input class="form-check-input"
                                                          type="checkbox"
                                                          value="${resignation.resignationId}">
                                                 </div>
                                              </td>

                                              <td>
                                                 <div class="d-flex align-items-center">

                                                    <a href="javascript:void(0);"
                                                       class="avatar avatar-md me-2">
                                                       <img src="${pageContext.request.contextPath}/assets/img/users/user-01.jpg"
                                                           class="rounded-circle"
                                                           alt="user">
                                                    </a>

                                                    <h6 class="fw-medium mb-0">

                                                       <c:set var="employeeFound"
                                                             value="false"/>

                                                       <c:forEach var="employee"
                                                                items="${employees}">

                                                          <c:if test="${employee.userId == resignation.userId}">

                                                             <a href="javascript:void(0);">
                                                                <c:out value="${employee.firstName}"/>
                                                                <c:if test="${not empty employee.lastName}">
                                                                   <c:out value=" ${employee.lastName}"/>
                                                                </c:if>
                                                             </a>

                                                             <c:set var="employeeFound"
                                                                   value="true"/>

                                                          </c:if>

                                                       </c:forEach>

                                                       <c:if test="${not employeeFound}">
                                                          <a href="javascript:void(0);">
                                                             Employee
                                                          </a>
                                                       </c:if>

                                                    </h6>
                                                 </div>
                                              </td>

                                              <td>

                                                 <c:set var="departmentFound"
                                                       value="false"/>

                                                 <c:forEach var="employee"
                                                          items="${employees}">

                                                    <c:if test="${employee.userId == resignation.userId}">

                                                       <c:out value="${employee.departmentName}"/>

                                                       <c:set var="departmentFound"
                                                             value="true"/>

                                                    </c:if>

                                                 </c:forEach>

                                                 <c:if test="${not departmentFound}">
                                                    -
                                                 </c:if>

                                              </td>

                                              <td>
                                                 <c:out value="${resignation.reason}"/>
                                              </td>

                                              <td>
                                                 ${fn:substring(resignation.noticeDate, 0, 10)}
                                              </td>

                                              <td>
                                                 ${fn:substring(resignation.resignDate, 0, 10)}
                                              </td>

                                              <td>
                                                 <div class="action-icon d-inline-flex">

                                                    <a href="javascript:void(0);"
                                                       class="me-2 edit-resignation"
                                                       data-bs-toggle="modal"
                                                       data-bs-target="#edit_resignation"

                                                       data-id="${resignation.resignationId}"
                                                       data-user-id="${resignation.userId}"
                                                       data-department-id="${resignation.departmentId}"

                                                       data-notice-date="${fn:substring(resignation.noticeDate, 0, 10)}"
                                                       data-resign-date="${fn:substring(resignation.resignDate, 0, 10)}"

                                                       data-reason="${fn:escapeXml(resignation.reason)}">

                                                       <i class="ti ti-edit"></i>
                                                    </a>

                                                    <a href="javascript:void(0);"
                                                       class="delete-resignation"
                                                       data-bs-toggle="modal"
                                                       data-bs-target="#delete_modal"
                                                       data-id="${resignation.resignationId}">

                                                       <i class="ti ti-trash"></i>
                                                    </a>

                                                 </div>
                                              </td>

                                           </tr>

                                        </c:forEach>

                                     </c:when>

                                     <c:otherwise>

                                        <tr>
                                           <td colspan="7"
                                              class="text-center py-4">
                                              No resignation records found.
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
             <!-- /Resignation List -->

          </div>

          <!-- Footer -->
          <div class="footer d-sm-flex align-items-center justify-content-between bg-white border-top p-3">
             <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
             <p>
                Designed &amp; Developed By
                <a href="#" class="text-primary">Dreams</a>
             </p>
          </div>
          <!-- /Footer -->

       </div>
       <!-- /Page Wrapper -->


       <!-- ========================================================= -->
       <!-- ADD RESIGNATION MODAL                                    -->
       <!-- ========================================================= -->

       <div class="modal fade"
           id="new_resignation"
           tabindex="-1"
           aria-hidden="true">

          <div class="modal-dialog modal-dialog-centered modal-md">

             <div class="modal-content">

                <div class="modal-header">

                   <h4 class="modal-title">
                      Add Resignation
                   </h4>

                   <button type="button"
                         class="btn-close custom-btn-close"
                         data-bs-dismiss="modal"
                         aria-label="Close">

                      <i class="ti ti-x"></i>

                   </button>

                </div>

                <form action="${pageContext.request.contextPath}/resignation"
                     method="post">

                   <input type="hidden"
                         name="action"
                         value="add">

                   <!-- DepartmentId is automatically filled
                       from selected employee -->
                   <input type="hidden"
                         id="addDepartmentId"
                         name="departmentId">

                   <div class="modal-body pb-0">

                      <div class="row">

                         <!-- Employee -->
                         <div class="col-md-12">

                            <div class="mb-3">

                               <label class="form-label">
                                  Resigning Employee
                               </label>

                               <select name="userId"
                                     id="addUserId"
                                     class="select"
                                     required>

                                  <option value="">
                                     Select
                                  </option>

                                  <c:forEach var="employee"
                                           items="${employees}">

                                     <option value="${employee.userId}"
                                           data-department-id="${employee.departmentId}">

                                        <c:out value="${employee.firstName}"/>

                                        <c:if test="${not empty employee.lastName}">
                                           <c:out value=" ${employee.lastName}"/>
                                        </c:if>

                                     </option>

                                  </c:forEach>

                               </select>

                            </div>

                         </div>

                         <!-- Notice Date -->
                         <div class="col-md-12">

                            <div class="mb-3">

                               <label class="form-label">
                                  Notice Date
                               </label>

                               <div class="input-icon-end position-relative">

                                  <input type="text"
                                        name="noticeDate"
                                        id="addNoticeDate"
                                        class="form-control datetimepicker"
                                        placeholder="dd/mm/yyyy"
                                        autocomplete="off"
                                        required>

                                  <span class="input-icon-addon">
                                     <i class="ti ti-calendar text-gray-7"></i>
                                  </span>

                               </div>

                            </div>

                         </div>

                         <!-- Resignation Date -->
                         <div class="col-md-12">

                            <div class="mb-3">

                               <label class="form-label">
                                  Resignation Date
                               </label>

                               <div class="input-icon-end position-relative">

                                  <input type="text"
                                        name="resignDate"
                                        id="addResignDate"
                                        class="form-control datetimepicker"
                                        placeholder="dd/mm/yyyy"
                                        autocomplete="off"
                                        required>

                                  <span class="input-icon-addon">
                                     <i class="ti ti-calendar text-gray-7"></i>
                                  </span>

                               </div>

                            </div>

                         </div>

                         <!-- Reason -->
                         <div class="col-md-12">

                            <div class="mb-3">

                               <label class="form-label">
                                  Reason
                               </label>

                               <textarea name="reason"
                                       class="form-control"
                                       rows="3"
                                       required></textarea>

                            </div>

                         </div>

                      </div>
                   </div>

                   <div class="modal-footer">

                      <button type="button"
                            class="btn btn-white border me-2"
                            data-bs-dismiss="modal">

                         Cancel

                      </button>

                      <button type="submit"
                            class="btn btn-primary">

                         Add Resignation

                      </button>

                   </div>

                </form>

             </div>
          </div>
       </div>


       <!-- ========================================================= -->
       <!-- EDIT RESIGNATION MODAL                                   -->
       <!-- ========================================================= -->

       <div class="modal fade"
           id="edit_resignation"
           tabindex="-1"
           aria-hidden="true">

          <div class="modal-dialog modal-dialog-centered modal-md">

             <div class="modal-content">

                <div class="modal-header">

                   <h4 class="modal-title">
                      Edit Resignation
                   </h4>

                   <button type="button"
                         class="btn-close custom-btn-close"
                         data-bs-dismiss="modal"
                         aria-label="Close">

                      <i class="ti ti-x"></i>

                   </button>

                </div>

                <form action="${pageContext.request.contextPath}/resignation"
                     method="post">

                   <input type="hidden"
                         name="action"
                         value="update">

                   <input type="hidden"
                         id="editResignationId"
                         name="resignationId">

                   <!-- Automatically populated from selected employee -->
                   <input type="hidden"
                         id="editDepartmentId"
                         name="departmentId">

                   <div class="modal-body pb-0">

                      <div class="row">

                         <!-- Employee -->
                         <div class="col-md-12">

                            <div class="mb-3">

                               <label class="form-label">
                                  Resigning Employee
                               </label>

                               <select name="userId"
                                     id="editUserId"
                                     class="select"
                                     required>

                                  <option value="">
                                     Select
                                  </option>

                                  <c:forEach var="employee"
                                           items="${employees}">

                                     <option value="${employee.userId}"
                                           data-department-id="${employee.departmentId}">

                                        <c:out value="${employee.firstName}"/>

                                        <c:if test="${not empty employee.lastName}">
                                           <c:out value=" ${employee.lastName}"/>
                                        </c:if>

                                     </option>

                                  </c:forEach>

                               </select>

                            </div>

                         </div>

                         <!-- Notice Date -->
                         <div class="col-md-12">

                            <div class="mb-3">

                               <label class="form-label">
                                  Notice Date
                               </label>

                               <div class="input-icon-end position-relative">

                                  <input type="text"
                                        name="noticeDate"
                                        id="editNoticeDate"
                                        class="form-control datetimepicker"
                                        placeholder="dd/mm/yyyy"
                                        autocomplete="off"
                                        required>

                                  <span class="input-icon-addon">
                                     <i class="ti ti-calendar text-gray-7"></i>
                                  </span>

                               </div>

                            </div>

                         </div>

                         <!-- Resignation Date -->
                         <div class="col-md-12">

                            <div class="mb-3">

                               <label class="form-label">
                                  Resignation Date
                               </label>

                               <div class="input-icon-end position-relative">

                                  <input type="text"
                                        name="resignDate"
                                        id="editResignDate"
                                        class="form-control datetimepicker"
                                        placeholder="dd/mm/yyyy"
                                        autocomplete="off"
                                        required>

                                  <span class="input-icon-addon">
                                     <i class="ti ti-calendar text-gray-7"></i>
                                  </span>

                               </div>

                            </div>

                         </div>

                         <!-- Reason -->
                         <div class="col-md-12">

                            <div class="mb-3">

                               <label class="form-label">
                                  Reason
                               </label>

                               <textarea name="reason"
                                       id="editReason"
                                       class="form-control"
                                       rows="3"
                                       required></textarea>

                            </div>

                         </div>

                      </div>
                   </div>

                   <div class="modal-footer">

                      <button type="button"
                            class="btn btn-white border me-2"
                            data-bs-dismiss="modal">

                         Cancel

                      </button>

                      <button type="submit"
                            class="btn btn-primary">

                         Save Changes

                      </button>

                   </div>

                </form>

             </div>
          </div>
       </div>


       <!-- ========================================================= -->
       <!-- DELETE MODAL                                              -->
       <!-- ========================================================= -->

       <div class="modal fade"
           id="delete_modal"
           tabindex="-1"
           aria-hidden="true">

          <div class="modal-dialog modal-dialog-centered">

             <div class="modal-content">

                <div class="modal-body text-center">

                   <span class="avatar avatar-xl bg-transparent-danger text-danger mb-3">
                      <i class="ti ti-trash-x fs-36"></i>
                   </span>

                   <h4 class="mb-1">
                      Confirm Delete
                   </h4>

                   <p class="mb-3">
                      You want to delete all the marked items,
                      this cant be undone once you delete.
                   </p>

                   <form action="${pageContext.request.contextPath}/resignation"
                        method="post">

                      <input type="hidden"
                            name="action"
                            value="delete">

                      <input type="hidden"
                            id="deleteResignationId"
                            name="resignationId">

                      <div class="d-flex justify-content-center">

                         <button type="button"
                               class="btn btn-light me-3"
                               data-bs-dismiss="modal">

                            Cancel

                         </button>

                         <button type="submit"
                               class="btn btn-danger">

                            Yes, Delete

                         </button>

                      </div>

                   </form>

                </div>

             </div>

          </div>
       </div>


       <!-- ========================================================= -->
       <!-- JAVASCRIPT FOR EMPLOYEE + EDIT + DELETE                   -->
       <!-- ========================================================= -->

       <script>

          document.addEventListener("DOMContentLoaded", function () {

             /*
              * ADD
              * When employee is selected, departmentId is automatically
              * populated from that employee's data.
              */
             var addUserSelect = document.getElementById("addUserId");
             var addDepartmentInput = document.getElementById("addDepartmentId");

             if (addUserSelect) {

                addUserSelect.addEventListener("change", function () {

                   var selectedOption =
                         this.options[this.selectedIndex];

                   var departmentId =
                         selectedOption.getAttribute(
                               "data-department-id"
                         );

                   if (addDepartmentInput) {
                      addDepartmentInput.value =
                            departmentId || "";
                   }
                });
             }


             /*
              * EDIT
              */
             document.querySelectorAll(".edit-resignation")
                   .forEach(function (button) {

                      button.addEventListener("click", function () {

                         var resignationId =
                               button.getAttribute("data-id");

                         var userId =
                               button.getAttribute("data-user-id");

                         var departmentId =
                               button.getAttribute(
                                     "data-department-id"
                               );

                         var noticeDate =
                               button.getAttribute(
                                     "data-notice-date"
                               );

                         var resignDate =
                               button.getAttribute(
                                     "data-resign-date"
                               );

                         var reason =
                               button.getAttribute(
                                     "data-reason"
                               );

                         document.getElementById(
                               "editResignationId"
                         ).value = resignationId || "";

                         var editUserSelect =
                               document.getElementById(
                                     "editUserId"
                               );

                         if (editUserSelect) {

                            editUserSelect.value =
                                  userId || "";

                            /*
                             * Set department from selected employee.
                             */
                            var selectedOption =
                                  editUserSelect.options[
                                        editUserSelect.selectedIndex
                                  ];

                            var employeeDepartment =
                                  selectedOption
                                        ? selectedOption
                                           .getAttribute(
                                              "data-department-id"
                                           )
                                        : null;

                            document.getElementById(
                                  "editDepartmentId"
                            ).value =
                                  employeeDepartment
                                        || departmentId
                                        || "";
                         }

                         document.getElementById(
                               "editNoticeDate"
                         ).value =
                               formatDateForInput(noticeDate);

                         document.getElementById(
                               "editResignDate"
                         ).value =
                               formatDateForInput(resignDate);

                         document.getElementById(
                               "editReason"
                         ).value =
                               reason || "";
                      });
                   });


             /*
              * If employee changes while editing, update department.
              */
             var editUserSelect =
                   document.getElementById("editUserId");

             if (editUserSelect) {

                editUserSelect.addEventListener("change", function () {

                   var selectedOption =
                         this.options[this.selectedIndex];

                   var departmentId =
                         selectedOption.getAttribute(
                               "data-department-id"
                         );

                   document.getElementById(
                         "editDepartmentId"
                   ).value =
                         departmentId || "";
                });
             }


             /*
              * DELETE
              */
             document.querySelectorAll(".delete-resignation")
                   .forEach(function (button) {

                      button.addEventListener("click", function () {

                         var resignationId =
                               button.getAttribute("data-id");

                         document.getElementById(
                               "deleteResignationId"
                         ).value =
                               resignationId || "";
                      });
                   });


             /*
              * Convert database ISO date:
              * 2026-09-08
              * into:
              * 08/09/2026
              */
             function formatDateForInput(value) {

                if (!value) {
                   return "";
                }

                var parts =
                      value.split("-");

                if (parts.length !== 3) {
                   return value;
                }

                return parts[2]
                      + "/"
                      + parts[1]
                      + "/"
                      + parts[0];
             }

          });

       </script>

    </div>

    <!-- /Main Wrapper -->

    <!-- jQuery -->
    <script src="assets/js/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <!-- Feather Icon JS -->
    <script src="assets/js/feather.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="assets/js/jquery.slimscroll.min.js"></script>

    <!-- Color Picker JS -->
    <script src="assets/js/plyr-js.js"></script>
    <script src="assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

    <!-- Datatable JS -->
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/dataTables.bootstrap5.min.js"></script>

    <!-- Datepicker Core JS -->
    <script src="assets/plugins/moment/moment.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

    <!-- Daterangepikcer JS -->
    <script src="assets/js/moment.js"></script>
    <script src="assets/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

    <!-- Chart JS -->
    <script src="assets/plugins/apexchart/apexcharts.min.js"></script>
    <script src="assets/plugins/apexchart/chart-data.js"></script>

    <!-- Owl Carousel -->
    <script src="assets/plugins/owlcarousel/owl.carousel.min.js"></script>

    <!-- Select2 JS -->
    <script src="assets/plugins/select2/js/select2.min.js"></script>

    <!-- Custom JS -->
    <script src="assets/js/theme-colorpicker.js"></script>
    <script src="assets/js/script.js"></script>

</body>

</html>


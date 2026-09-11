
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
   <meta name="description" content="Smarthr - Bootstrap Admin Template">
   <meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
   <meta name="author" content="Dreams technologies - Bootstrap Admin Template">
   <meta name="robots" content="noindex, nofollow">
   <title>Attendance Report</title>

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
            <a href="index.html" class="logo">
               <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="Logo">
            </a>
            <a href="index.html" class="dark-logo">
               <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="Logo">
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
                              <a href="#" >
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
                                 <li><a href="resignation.html"><span>Resignation</span></a></li>
                                 <li><a href="termination.html"><span>Termination</span></a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="#" class="active subdrop">
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
                                    <a href="javascript:void(0);" ><span>Accounting</span>
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
                                    <a href="javascript:void(0);" class="active subdrop"><span>Reports</span>
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
                                       <li><a href="${pageContext.request.contextPath}/admin/attendance-report" class="active">Attendance Report</a></li>
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
                                              <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-27.jpg" alt="Profile">
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
                                              <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-23.jpg" alt="Profile">
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
                                              <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-25.jpg" alt="Profile">
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
                                              <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-01.jpg" alt="Profile">
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
                               <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-12.jpg" alt="Img" class="img-fluid rounded-circle">
                            </span>
                     </a>
                     <div class="dropdown-menu shadow-none">
                        <div class="card mb-0">
                           <div class="card-header">
                              <div class="d-flex align-items-center">
                                     <span class="avatar avatar-lg me-2 avatar-rounded">
                                        <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-12.jpg" alt="img">
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
   <div class="sidebar" id="sidebar">
      <div class="sidebar-logo">
         <a href="${pageContext.request.contextPath}/Admin/dashboard" class="logo logo-normal">
            <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="Logo">
         </a>
         <a href="${pageContext.request.contextPath}/Admin/dashboard" class="logo-small">
            <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg" alt="Logo">
         </a>
         <a href="${pageContext.request.contextPath}/Admin/dashboard" class="dark-logo">
            <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="Logo">
         </a>
      </div>
      <div class="sidebar-inner slimscroll">
         <div id="sidebar-menu" class="sidebar-menu">
            <ul>
               <li class="menu-title"><span>MAIN MENU</span></li>
               <li><a href="${pageContext.request.contextPath}/Admin/dashboard"><i class="ti ti-smart-home"></i><span>Dashboard</span></a></li>
               <li class="submenu">
                  <a href="javascript:void(0);"><i class="ti ti-users"></i><span>Employees</span><span class="menu-arrow"></span></a>
                  <ul>
                     <li><a href="javascript:void(0);">Employees</a></li>
                     <li><a href="${pageContext.request.contextPath}/Employee/AddDepartment">Departments</a></li>
                     <li><a href="javascript:void(0);">Designations</a></li>
                  </ul>
               </li>
               <li class="submenu">
                  <a href="javascript:void(0);"><i class="ti ti-calendar"></i><span>Attendance</span><span class="menu-arrow"></span></a>
                  <ul>
                     <li><a href="${pageContext.request.contextPath}/admin/attendance-report">Attendance Report</a></li>
                     <li><a href="${pageContext.request.contextPath}/admin/leave-report">Leave Report</a></li>
                  </ul>
               </li>
               <li><a href="javascript:void(0);"><i class="ti ti-calendar-event"></i><span>Events</span></a></li>
               <li><a href="javascript:void(0);"><i class="ti ti-wallet"></i><span>Payroll</span></a></li>
               <li><a href="javascript:void(0);"><i class="ti ti-school"></i><span>Training</span></a></li>
               <li><a href="javascript:void(0);"><i class="ti ti-file"></i><span>Documents</span></a></li>
               <li><a href="javascript:void(0);"><i class="ti ti-folder"></i><span>Master Document</span></a></li>
               <li><a href="javascript:void(0);"><i class="ti ti-chart-line"></i><span>Performance &amp; Goals</span></a></li>
               <li><a href="javascript:void(0);"><i class="ti ti-briefcase"></i><span>Projects</span></a></li>
               <li class="submenu">
                  <a href="javascript:void(0);" class="active subdrop"><i class="ti ti-file-report"></i><span>Reports</span><span class="menu-arrow"></span></a>
                  <ul>
                     <li><a href="${pageContext.request.contextPath}/admin/employee-report" data-report="employee">Employee Report</a></li>
                     <li><a href="${pageContext.request.contextPath}/admin/attendance-report" data-report="attendance" class="active">Attendance Report</a></li>
                     <li><a href="${pageContext.request.contextPath}/admin/leave-report" data-report="leave">Leave Report</a></li>
                  </ul>
               </li>
            </ul>
         </div>
      </div>
   </div>
   <!-- /Sidebar -->

   <!-- Horizontal Menu -->
   <div class="sidebar sidebar-horizontal" id="horizontal-menu">
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
                        <a href="call.html">Calls<span class="menu-arrow inside-submenu"></span></a>
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
                  <a href="#">
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
                        <a href="call.html" >Crm<span class="menu-arrow"></span></a>
                        <ul>
                           <li><a href="contacts-grid.html"><span>Contacts</span></a></li>
                           <li><a href="companies-grid.html"><span>Companies</span></a></li>
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
                              <a href="javascript:void(0);">Leaves<span class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="leaves.html">Leaves (Admin)</a></li>
                                 <li><a href="leaves-employee.html">Leave (Employee)</a></li>
                                 <li><a href="leave-settings.html">Leave Settings</a></li>
                              </ul>
                           </li>
                           <li><a href="attendance-admin.html">Attendance (Admin)</a></li>
                           <li><a href="attendance-employee.html">Attendance (Employee)</a></li>
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
                           <li><a href="performance-indicator.html">Performance Indicator</a></li>
                           <li><a href="performance-review.html">Performance Review</a></li>
                           <li><a href="performance-appraisal.html">Performance Appraisal</a></li>
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
                     <li><a href="resignation.html"><span>Resignation</span></a></li>
                     <li><a href="termination.html"><span>Termination</span></a></li>
                  </ul>
               </li>
               <li class="submenu">
                  <a href="#"  class="active subdrop">
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
                           <li><a href="roles-permissions.html">Roles & Permissions</a></li>
                        </ul>
                     </li>
                     <li class="submenu">
                        <a href="javascript:void(0);" class="active subdrop"><span>Reports</span>
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
                           <li><a href="${pageContext.request.contextPath}/admin/attendance-report" class="active">Attendance Report</a></li>
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
                                 <li><a href="notification-settings.html">Notifications</a></li>
                                 <li><a href="connected-apps.html">Connected Apps</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Website Settings<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="bussiness-settings.html">Business Settings</a></li>
                                 <li><a href="seo-settings.html">SEO Settings</a></li>
                                 <li><a href="localization-settings.html">Localization</a></li>
                                 <li><a href="prefixes.html">Prefixes</a></li>
                                 <li><a href="preferences.html">Preferences</a></li>
                                 <li><a href="performance-appraisal.html">Appearance</a></li>
                                 <li><a href="language.html">Language</a></li>
                                 <li><a href="authentication-settings.html">Authentication</a></li>
                                 <li><a href="ai-settings.html">AI Settings</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">App Settings<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="salary-settings.html">Salary Settings</a></li>
                                 <li><a href="approval-settings.html">Approval Settings</a></li>
                                 <li><a href="invoice-settings.html">Invoice Settings</a></li>
                                 <li><a href="leave-type.html">Leave Type</a></li>
                                 <li><a href="custom-fields.html">Custom Fields</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">System Settings<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="email-settings.html">Email Settings</a></li>
                                 <li><a href="email-template.html">Email Templates</a></li>
                                 <li><a href="sms-settings.html">SMS Settings</a></li>
                                 <li><a href="sms-template.html">SMS Templates</a></li>
                                 <li><a href="otp-settings.html">OTP</a></li>
                                 <li><a href="gdpr.html">GDPR Cookies</a></li>
                                 <li><a href="maintenance-mode.html">Maintenance Mode</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Financial Settings<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="payment-gateways.html">Payment Gateways</a></li>
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
                                 <li><a href="ban-ip-address.html">Ban IP Address</a></li>
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
                     <li><a href="under-maintenance.html"><span>Under Maintenance</span></a></li>
                     <li><a href="under-construction.html"><span>Under Construction</span></a></li>
                     <li><a href="api-keys.html"><span>API Keys</span></a></li>
                     <li><a href="privacy-policy.html"><span>Privacy Policy</span></a></li>
                     <li><a href="terms-condition.html"><span>Terms & Conditions</span></a></li>
                     <li class="submenu">
                        <a href="#"><span>Content</span> <span class="menu-arrow"></span></a>
                        <ul>
                           <li><a href="pages.html">Pages</a></li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Blogs<span class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="blogs.html">All Blogs</a></li>
                                 <li><a href="blog-categories.html">Categories</a></li>
                                 <li><a href="blog-comments.html">Comments</a></li>
                                 <li><a href="blog-tags.html">Tags</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Locations<span class="menu-arrow"></span></a>
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
                           <li class="submenu"><a href="javascript:void(0);">Forgot Password<span
                                   class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="forgot-password.html">Cover</a></li>
                                 <li><a href="forgot-password-2.html">Illustration</a></li>
                                 <li><a href="forgot-password-3.html">Basic</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Reset Password<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="reset-password.html">Cover</a></li>
                                 <li><a href="reset-password-2.html">Illustration</a></li>
                                 <li><a href="reset-password-3.html">Basic</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Email Verification<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="email-verification.html">Cover</a></li>
                                 <li><a href="email-verification-2.html">Illustration</a></li>
                                 <li><a href="email-verification-3.html">Basic</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">2 Step Verification<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="two-step-verification.html">Cover</a></li>
                                 <li><a href="two-step-verification-2.html">Illustration</a></li>
                                 <li><a href="two-step-verification-3.html">Basic</a></li>
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
                                          <a href="form-basic-inputs.html">Basic Inputs</a>
                                       </li>
                                       <li>
                                          <a href="form-checkbox-radios.html">Checkbox & Radios</a>
                                       </li>
                                       <li>
                                          <a href="form-input-groups.html">Input Groups</a>
                                       </li>
                                       <li>
                                          <a href="form-grid-gutters.html">Grid & Gutters</a>
                                       </li>
                                       <li>
                                          <a href="form-select.html">Form Select</a>
                                       </li>
                                       <li>
                                          <a href="form-mask.html">Input Masks</a>
                                       </li>
                                       <li>
                                          <a href="form-fileupload.html">File Uploads</a>
                                       </li>
                                    </ul>
                                 </li>
                                 <li class="submenu submenu-two">
                                    <a href="javascript:void(0);">Layouts <span
                                            class="menu-arrow inside-submenu"></span>
                                    </a>
                                    <ul>
                                       <li>
                                          <a href="form-horizontal.html">Horizontal Form</a>
                                       </li>
                                       <li>
                                          <a href="form-vertical.html">Vertical Form</a>
                                       </li>
                                       <li>
                                          <a href="form-floating-labels.html">Floating Labels</a>
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
                                    <a href="icon-fontawesome.html">Fontawesome Icons</a>
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
                                 <li><a href="javascript:void(0);">Multilevel 2.1</a></li>
                                 <li class="submenu submenu-two submenu-three">
                                    <a href="javascript:void(0);">Multilevel 2.2<span
                                            class="menu-arrow inside-submenu inside-submenu-two"></span></a>
                                    <ul>
                                       <li><a href="javascript:void(0);">Multilevel 2.2.1</a></li>
                                       <li><a href="javascript:void(0);">Multilevel 2.2.2</a></li>
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
            <div class="d-xl-flex align-items-center d-none">
               <a href="#" class="me-3 avatar avatar-sm">
                  <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-07.jpg" alt="profile" class="rounded-circle">
               </a>
               <a href="#" class="btn btn-icon btn-sm rounded-circle mode-toggle">
                  <i class="ti ti-sun"></i>
               </a>
            </div>
         </div>
      </div>
   </div>
   <!-- /Horizontal Menu -->

   <!-- Two Col Sidebar -->
   <div class="two-col-sidebar" id="two-col-sidebar">
      <div class="sidebar sidebar-twocol">
         <div class="twocol-mini">
            <a href="index.html" class="logo-small">
               <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg" alt="Logo">
            </a>
            <div class="sidebar-left slimscroll">
               <div class="nav flex-column align-items-center nav-pills" id="sidebar-tabs" role="tablist"
                    aria-orientation="vertical">
                  <a href="#" class="nav-link " title="Dashboard" data-bs-toggle="tab"
                     data-bs-target="#dashboard">
                     <i class="ti ti-smart-home"></i>
                  </a>
                  <a href="#" class="nav-link " title="Apps" data-bs-toggle="tab"
                     data-bs-target="#application">
                     <i class="ti ti-layout-grid-add"></i>
                  </a>
                  <a href="#" class="nav-link " title="Super Admin" data-bs-toggle="tab"
                     data-bs-target="#super-admin">
                     <i class="ti ti-user-star"></i>
                  </a>
                  <a href="#" class="nav-link " title="Layout" data-bs-toggle="tab"
                     data-bs-target="#layout">
                     <i class="ti ti-layout-board-split"></i>
                  </a>
                  <a href="#" class="nav-link " title="Projects" data-bs-toggle="tab"
                     data-bs-target="#projects">
                     <i class="ti ti-users-group"></i>
                  </a>
                  <a href="#" class="nav-link " title="Crm" data-bs-toggle="tab" data-bs-target="#crm">
                     <i class="ti ti-user-shield"></i>
                  </a>
                  <a href="#" class="nav-link " title="Hrm" data-bs-toggle="tab" data-bs-target="#hrm">
                     <i class="ti ti-user"></i>
                  </a>
                  <a href="#" class="nav-link " title="Finance" data-bs-toggle="tab" data-bs-target="#finance">
                     <i class="ti ti-shopping-cart-dollar"></i>
                  </a>
                  <a href="#" class="nav-link active" title="Administration" data-bs-toggle="tab"
                     data-bs-target="#administration">
                     <i class="ti ti-cash"></i>
                  </a>
                  <a href="#" class="nav-link" title="Content" data-bs-toggle="tab" data-bs-target="#content">
                     <i class="ti ti-license"></i>
                  </a>
                  <a href="#" class="nav-link" title="Pages" data-bs-toggle="tab" data-bs-target="#pages">
                     <i class="ti ti-page-break"></i>
                  </a>
                  <a href="#" class="nav-link" title="Authentication" data-bs-toggle="tab"
                     data-bs-target="#authentication">
                     <i class="ti ti-lock-check"></i>
                  </a>
                  <a href="#" class="nav-link " title="UI Elements" data-bs-toggle="tab"
                     data-bs-target="#ui-elements">
                     <i class="ti ti-ux-circle"></i>
                  </a>
                  <a href="#" class="nav-link" title="Extras" data-bs-toggle="tab" data-bs-target="#extras">
                     <i class="ti ti-vector-triangle"></i>
                  </a>
               </div>
            </div>
         </div>
         <div class="sidebar-right">
            <div class="sidebar-logo mb-4">
               <a href="index.html" class="logo logo-normal">
                  <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="Logo">
               </a>
               <a href="index.html" class="dark-logo">
                  <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="Logo">
               </a>
            </div>
            <div class="sidebar-scroll">
               <h6 class="mb-3">Welcome to SmartHR</h6>
               <div class="text-center rounded bg-light p-3 mb-4">
                  <div class="avatar avatar-lg online mb-3">
                     <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg" alt="Img" class="img-fluid rounded-circle">
                  </div>
                  <h6 class="fs-12 fw-normal mb-1">Adrian Herman</h6>
                  <p class="fs-10">System Admin</p>
               </div>
               <div class="tab-content" id="v-pills-tabContent">
                  <div class="tab-pane fade" id="dashboard">
                     <ul>
                        <li class="menu-title"><span>MAIN MENU</span></li>
                        <li><a href="index.html">Admin Dashboard</a></li>
                        <li><a href="employee-dashboard.html">Employee Dashboard</a></li>
                        <li><a href="deals-dashboard.html">Deals Dashboard</a></li>
                        <li><a href="leads-dashboard.html">Leads Dashboard</a></li>
                     </ul>
                  </div>
                  <div class="tab-pane fade" id="application">
                     <ul>
                        <li class="menu-title"><span>APPLICATION</span></li>
                        <li><a href="chat.html">Chat</a></li>
                        <li><a href="voice-call.html">Voice Call</a></li>
                        <li><a href="video-call.html">Video Call</a></li>
                        <li><a href="outgoing-call.html">Outgoing Call</a></li>
                        <li><a href="incoming-call.html">Incoming Call</a></li>
                        <li><a href="call-history.html">Call History</a></li>
                        <li><a href="calendar.html">Calendar</a></li>
                        <li><a href="email.html">Email</a></li>
                        <li><a href="todo.html">To Do</a></li>
                        <li><a href="notes.html">Notes</a></li>
                        <li><a href="social-feed.html">Social Feed</a></li>
                        <li><a href="file-manager.html">File Manager</a></li>
                        <li><a href="kanban-view.html">Kanban</a></li>
                        <li><a href="invoices.html">Invoices</a></li>
                     </ul>
                  </div>
                  <div class="tab-pane fade" id="super-admin">
                     <ul>
                        <li class="menu-title"><span>SUPER ADMIN</span></li>
                        <li><a href="dashboard.html">Dashboard</a></li>
                        <li><a href="companies.html">Companies</a></li>
                        <li><a href="subscription.html">Subscriptions</a></li>
                        <li><a href="packages.html">Packages</a></li>
                        <li><a href="domain.html">Domain</a></li>
                        <li><a href="purchase-transaction.html">Purchase Transaction</a></li>
                     </ul>
                  </div>
                  <div class="tab-pane fade " id="layout">
                     <ul>
                        <li class="menu-title"><span>LAYOUT</span></li>
                        <li><a href="layout-horizontal.html"><span>Horizontal</span></a></li>
                        <li><a href="layout-detached.html"><span>Detached</span></a></li>
                        <li><a href="layout-modern.html"><span>Modern</span></a></li>
                        <li><a href="layout-two-column.html"><span>Two Column </span></a></li>
                        <li><a href="layout-hovered.html"><span>Hovered</span></a></li>
                        <li><a href="layout-box.html"><span>Boxed</span></a></li>
                        <li><a href="layout-horizontal-single.html"><span>Horizontal Single</span></a></li>
                        <li><a href="layout-horizontal-overlay.html"><span>Horizontal Overlay</span></a>
                        </li>
                        <li><a href="layout-horizontal-box.html"><span>Horizontal Box</span></a></li>
                        <li><a href="layout-horizontal-sidemenu.html"><span>Menu Aside</span></a></li>
                        <li><a href="layout-vertical-transparent.html"><span>Transparent</span></a></li>
                        <li><a href="layout-without-header.html"><span>Without Header</span></a></li>
                        <li><a href="layout-rtl.html"><span>RTL</span></a></li>
                        <li><a href="layout-dark.html"><span>Dark</span></a></li>
                     </ul>
                  </div>
                  <div class="tab-pane fade" id="projects">
                     <ul>
                        <li class="menu-title"><span>PROJECTS</span></li>
                        <li><a href="clients-grid.html" >Clients</a></li>
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
                     </ul>
                  </div>
                  <div class="tab-pane fade" id="crm">
                     <ul>
                        <li class="menu-title"><span>CRM</span></li>
                        <li><a href="contacts-grid.html"><span>Contacts</span></a></li>
                        <li><a href="companies-grid.html"><span>Companies</span></a></li>
                        <li><a href="deals-grid.html"><span>Deals</span></a></li>
                        <li><a href="leads-grid.html"><span>Leads</span></a></li>
                        <li><a href="pipeline.html"><span>Pipeline</span></a></li>
                        <li><a href="analytics.html"><span>Analytics</span></a></li>
                        <li><a href="activity.html"><span>Activities</span></a></li>
                     </ul>
                  </div>
                  <div class="tab-pane fade" id="hrm">
                     <ul>
                        <li class="menu-title"><span>HRM</span></li>
                        <li class="submenu">
                           <a href="javascript:void(0);"><span>Employees</span>
                              <span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="employees.html" >Employee Lists</a></li>
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
                              <li class="submenu submenu-two">
                                 <a href="javascript:void(0);">Leaves<span
                                         class="menu-arrow inside-submenu"></span></a>
                                 <ul>
                                    <li><a href="leaves.html">Leaves (Admin)</a></li>
                                    <li><a href="leaves-employee.html">Leave (Employee)</a></li>
                                    <li><a href="leave-settings.html">Leave Settings</a></li>
                                 </ul>
                              </li>
                              <li><a href="attendance-admin.html">Attendance (Admin)</a></li>
                              <li><a href="attendance-employee.html">Attendance (Employee)</a></li>
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
                              <li><a href="performance-indicator.html">Performance Indicator</a></li>
                              <li><a href="performance-review.html">Performance Review</a></li>
                              <li><a href="performance-appraisal.html">Performance Appraisal</a></li>
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
                        <li><a href="resignation.html"><span>Resignation</span></a></li>
                        <li><a href="termination.html"><span>Termination</span></a></li>
                     </ul>
                  </div>
                  <div class="tab-pane fade" id="finance">
                     <ul>
                        <li class="menu-title"><span>FINANCE & ACCOUNTS</span></li>
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
                     </ul>
                  </div>
                  <div class="tab-pane fade show active" id="administration">
                     <ul>
                        <li class="menu-title"><span>ADMINISTRATION</span></li>
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
                              <li><a href="roles-permissions.html">Roles & Permissions</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);" class="active subdrop"><span>Reports</span>
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
                              <li><a href="${pageContext.request.contextPath}/admin/attendance-report" class="active">Attendance Report</a></li>
                              <li><a href="leave-report.html">Leave Report</a></li>
                              <li><a href="daily-report.html">Daily Report</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              General Settings
                              <span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="profile-settings.html">Profile</a></li>
                              <li><a href="security-settings.html">Security</a></li>
                              <li><a href="notification-settings.html">Notifications</a></li>
                              <li><a href="connected-apps.html">Connected Apps</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              Website Settings
                              <span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="bussiness-settings.html">Business Settings</a></li>
                              <li><a href="seo-settings.html">SEO Settings</a></li>
                              <li><a href="localization-settings.html">Localization</a></li>
                              <li><a href="prefixes.html">Prefixes</a></li>
                              <li><a href="preferences.html">Preferences</a></li>
                              <li><a href="performance-appraisal.html">Appearance</a></li>
                              <li><a href="language.html">Language</a></li>
                              <li><a href="authentication-settings.html">Authentication</a></li>
                              <li><a href="ai-settings.html">AI Settings</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">App Settings<span class="menu-arrow"></span></a>
                           <ul>
                              <li><a href="salary-settings.html">Salary Settings</a></li>
                              <li><a href="approval-settings.html">Approval Settings</a></li>
                              <li><a href="invoice-settings.html">Invoice Settings</a></li>
                              <li><a href="leave-type.html">Leave Type</a></li>
                              <li><a href="custom-fields.html">Custom Fields</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              System Settings
                              <span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="email-settings.html">Email Settings</a></li>
                              <li><a href="email-template.html">Email Templates</a></li>
                              <li><a href="sms-settings.html">SMS Settings</a></li>
                              <li><a href="sms-template.html">SMS Templates</a></li>
                              <li><a href="otp-settings.html">OTP</a></li>
                              <li><a href="gdpr.html">GDPR Cookies</a></li>
                              <li><a href="maintenance-mode.html">Maintenance Mode</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              Financial Settings
                              <span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="payment-gateways.html">Payment Gateways</a></li>
                              <li><a href="tax-rates.html">Tax Rate</a></li>
                              <li><a href="currencies.html">Currencies</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">Other Settings<span class="menu-arrow"></span></a>
                           <ul>
                              <li><a href="custom-css.html">Custom CSS</a></li>
                              <li><a href="custom-js.html">Custom JS</a></li>
                              <li><a href="cronjob.html">Cronjob</a></li>
                              <li><a href="storage-settings.html">Storage</a></li>
                              <li><a href="ban-ip-address.html">Ban IP Address</a></li>
                              <li><a href="backup.html">Backup</a></li>
                              <li><a href="clear-cache.html">Clear Cache</a></li>
                           </ul>
                        </li>
                     </ul>
                  </div>
                  <div class="tab-pane fade" id="content">
                     <ul>
                        <li class="menu-title"><span>CONTENT</span></li>
                        <li><a href="pages.html">Pages</a></li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              Blogs
                              <span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="blogs.html">All Blogs</a></li>
                              <li><a href="blog-categories.html">Categories</a></li>
                              <li><a href="blog-comments.html">Comments</a></li>
                              <li><a href="blog-tags.html">Blog Tags</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              Locations
                              <span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="countries.html">Countries</a></li>
                              <li><a href="states.html">States</a></li>
                              <li><a href="cities.html">Cities</a></li>
                           </ul>
                        </li>
                        <li><a href="testimonials.html">Testimonials</a></li>
                        <li><a href="faq.html">FAQ’S</a></li>
                     </ul>
                  </div>
                  <div class="tab-pane fade" id="pages">
                     <ul>
                        <li class="menu-title"><span>PAGES</span></li>
                        <li><a href="starter.html"><span>Starter</span></a></li>
                        <li><a href="profile.html"><span>Profile</span></a></li>
                        <li><a href="gallery.html"><span>Gallery</span></a></li>
                        <li><a href="search-result.html"><span>Search Results</span></a></li>
                        <li><a href="timeline.html"><span>Timeline</span></a></li>
                        <li><a href="pricing.html"><span>Pricing</span></a></li>
                        <li><a href="coming-soon.html"><span>Coming Soon</span></a></li>
                        <li><a href="under-maintenance.html"><span>Under Maintenance</span></a></li>
                        <li><a href="under-construction.html"><span>Under Construction</span></a></li>
                        <li><a href="api-keys.html"><span>API Keys</span></a></li>
                        <li><a href="privacy-policy.html"><span>Privacy Policy</span></a></li>
                        <li><a href="terms-condition.html"><span>Terms & Conditions</span></a></li>
                     </ul>
                  </div>
                  <div class="tab-pane fade" id="authentication">
                     <ul>
                        <li class="menu-title"><span>AUTHENTICATION</span></li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              Login<span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="login.html">Cover</a></li>
                              <li><a href="login-2.html">Illustration</a></li>
                              <li><a href="login-3.html">Basic</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              Register<span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="register.html">Cover</a></li>
                              <li><a href="register-2.html">Illustration</a></li>
                              <li><a href="register-3.html">Basic</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              Forgot Password<span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="forgot-password.html">Cover</a></li>
                              <li><a href="forgot-password-2.html">Illustration</a></li>
                              <li><a href="forgot-password-3.html">Basic</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              Reset Password<span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="reset-password.html">Cover</a></li>
                              <li><a href="reset-password-2.html">Illustration</a></li>
                              <li><a href="reset-password-3.html">Basic</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              Email Verification<span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="email-verification.html">Cover</a></li>
                              <li><a href="email-verification-2.html">Illustration</a></li>
                              <li><a href="email-verification-3.html">Basic</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">
                              2 Step Verification<span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="two-step-verification.html">Cover</a></li>
                              <li><a href="two-step-verification-2.html">Illustration</a></li>
                              <li><a href="two-step-verification-3.html">Basic</a></li>
                           </ul>
                        </li>
                        <li><a href="lock-screen.html">Lock Screen</a></li>
                        <li><a href="error-404.html">404 Error</a></li>
                        <li><a href="error-500.html">500 Error</a></li>
                     </ul>
                  </div>
                  <div class="tab-pane fade" id="ui-elements">
                     <ul>
                        <li class="menu-title"><span>UI INTERFACE</span></li>
                        <li class="submenu">
                           <a href="javascript:void(0);">Base UI<span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li><a href="ui-alerts.html">Alerts</a></li>
                              <li><a href="ui-accordion.html">Accordion</a></li>
                              <li><a href="ui-avatar.html">Avatar</a></li>
                              <li><a href="ui-badges.html">Badges</a></li>
                              <li><a href="ui-borders.html">Border</a></li>
                              <li><a href="ui-buttons.html">Buttons</a></li>
                              <li><a href="ui-buttons-group.html">Button Group</a></li>
                              <li><a href="ui-breadcrumb.html">Breadcrumb</a></li>
                              <li><a href="ui-cards.html">Card</a></li>
                              <li><a href="ui-carousel.html">Carousel</a></li>
                              <li><a href="ui-colors.html">Colors</a></li>
                              <li><a href="ui-dropdowns.html">Dropdowns</a></li>
                              <li><a href="ui-grid.html">Grid</a></li>
                              <li><a href="ui-images.html">Images</a></li>
                              <li><a href="ui-lightbox.html">Lightbox</a></li>
                              <li><a href="ui-media.html">Media</a></li>
                              <li><a href="ui-modals.html">Modals</a></li>
                              <li><a href="ui-offcanvas.html">Offcanvas</a></li>
                              <li><a href="ui-pagination.html">Pagination</a></li>
                              <li><a href="ui-popovers.html">Popovers</a></li>
                              <li><a href="ui-progress.html">Progress</a></li>
                              <li><a href="ui-placeholders.html">Placeholders</a></li>
                              <li><a href="ui-spinner.html">Spinner</a></li>
                              <li><a href="ui-sweetalerts.html">Sweet Alerts</a></li>
                              <li><a href="ui-nav-tabs.html">Tabs</a></li>
                              <li><a href="ui-toasts.html">Toasts</a></li>
                              <li><a href="ui-tooltips.html">Tooltips</a></li>
                              <li><a href="ui-typography.html">Typography</a></li>
                              <li><a href="ui-video.html">Video</a></li>
                              <li><a href="ui-sortable.html">Sortable</a></li>
                              <li><a href="ui-swiperjs.html">Swiperjs</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);"> Advanced UI <span class="menu-arrow"></span> </a>
                           <ul>
                              <li><a href="ui-ribbon.html">Ribbon</a></li>
                              <li><a href="ui-clipboard.html">Clipboard</a></li>
                              <li><a href="ui-drag-drop.html">Drag & Drop</a></li>
                              <li><a href="ui-rangeslider.html">Range Slider</a></li>
                              <li><a href="ui-rating.html">Rating</a></li>
                              <li><a href="ui-text-editor.html">Text Editor</a></li>
                              <li><a href="ui-counter.html">Counter</a></li>
                              <li><a href="ui-scrollbar.html">Scrollbar</a></li>
                              <li><a href="ui-stickynote.html">Sticky Note</a></li>
                              <li><a href="ui-timeline.html">Timeline</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);"> Forms <span class="menu-arrow"></span>
                           </a>
                           <ul>
                              <li class="submenu submenu-two">
                                 <a href="javascript:void(0);">Form Elements<span
                                         class="menu-arrow inside-submenu"></span></a>
                                 <ul>
                                    <li><a href="form-basic-inputs.html">Basic Inputs</a></li>
                                    <li><a href="form-checkbox-radios.html">Checkbox & Radios</a></li>
                                    <li><a href="form-input-groups.html">Input Groups</a></li>
                                    <li><a href="form-grid-gutters.html">Grid & Gutters</a></li>
                                    <li><a href="form-select.html">Form Select</a></li>
                                    <li><a href="form-mask.html">Input Masks</a></li>
                                    <li><a href="form-fileupload.html">File Uploads</a></li>
                                 </ul>
                              </li>
                              <li class="submenu submenu-two">
                                 <a href="javascript:void(0);">Layouts<span
                                         class="menu-arrow inside-submenu"></span></a>
                                 <ul>
                                    <li><a href="form-horizontal.html">Horizontal Form</a></li>
                                    <li><a href="form-vertical.html">Vertical Form</a></li>
                                    <li><a href="form-floating-labels.html">Floating Labels</a></li>
                                 </ul>
                              </li>
                              <li><a href="form-validation.html">Form Validation</a></li>
                              <li><a href="form-select2.html">Select2</a></li>
                              <li><a href="form-wizard.html">Form Wizard</a></li>
                              <li><a href="form-pickers.html">Form Picker</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">Tables <span class="menu-arrow"></span></a>
                           <ul>
                              <li><a href="tables-basic.html">Basic Tables </a></li>
                              <li><a href="data-tables.html">Data Table </a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">Charts<span class="menu-arrow"></span> </a>
                           <ul>
                              <li><a href="chart-apex.html">Apex Charts</a></li>
                              <li><a href="chart-c3.html">Chart C3</a></li>
                              <li><a href="chart-js.html">Chart Js</a></li>
                              <li><a href="chart-morris.html">Morris Charts</a></li>
                              <li><a href="chart-flot.html">Flot Charts</a></li>
                              <li><a href="chart-peity.html">Peity Charts</a></li>
                           </ul>
                        </li>
                        <li class="submenu">
                           <a href="javascript:void(0);">Icons<span class="menu-arrow"></span> </a>
                           <ul>
                              <li><a href="icon-fontawesome.html">Fontawesome Icons</a></li>
                              <li><a href="icon-tabler.html">Tabler Icons</a></li>
                              <li><a href="icon-bootstrap.html">Bootstrap Icons</a></li>
                              <li><a href="icon-remix.html">Remix Icons</a></li>
                              <li><a href="icon-feather.html">Feather Icons</a></li>
                              <li><a href="icon-ionic.html">Ionic Icons</a></li>
                              <li><a href="icon-material.html">Material Icons</a></li>
                              <li><a href="icon-pe7.html">Pe7 Icons</a></li>
                              <li><a href="icon-simpleline.html">Simpleline Icons</a></li>
                              <li><a href="icon-themify.html">Themify Icons</a></li>
                              <li><a href="icon-weather.html">Weather Icons</a></li>
                              <li><a href="icon-typicon.html">Typicon Icons</a></li>
                              <li><a href="icon-flag.html">Flag Icons</a></li>

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
                  </div>
                  <div class="tab-pane fade" id="extras">
                     <ul>
                        <li class="menu-title"><span>EXTRAS</span></li>
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
                                    <li><a href="javascript:void(0);">Multilevel 2.1</a></li>
                                    <li class="submenu submenu-two submenu-three">
                                       <a href="javascript:void(0);">Multilevel 2.2<span
                                               class="menu-arrow inside-submenu inside-submenu-two"></span></a>
                                       <ul>
                                          <li><a href="javascript:void(0);">Multilevel 2.2.1</a></li>
                                          <li><a href="javascript:void(0);">Multilevel 2.2.2</a></li>
                                       </ul>
                                    </li>
                                 </ul>
                              </li>
                              <li><a href="javascript:void(0);">Multilevel 3</a></li>
                           </ul>
                        </li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- /Two Col Sidebar -->

   <!-- Stacked Sidebar -->
   <div class="stacked-sidebar" id="stacked-sidebar">
      <div class="sidebar sidebar-stacked" style="display: flex !important;">
         <div class="stacked-mini">
            <a href="index.html" class="logo-small">
               <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg" alt="Logo">
            </a>
            <div class="sidebar-left slimscroll">
               <div class="d-flex align-items-center flex-column">
                  <div class="mb-1 notification-item">
                     <a href="#" class="btn btn-menubar position-relative">
                        <i class="ti ti-bell"></i>
                        <span class="notification-status-dot"></span>
                     </a>
                  </div>
                  <div class="mb-1">
                     <a href="#" class="btn btn-menubar btnFullscreen">
                        <i class="ti ti-maximize"></i>
                     </a>
                  </div>
                  <div class="mb-1">
                     <a href="calendar.html" class="btn btn-menubar">
                        <i class="ti ti-layout-grid-remove"></i>
                     </a>
                  </div>
                  <div class="mb-1">
                     <a href="chat.html" class="btn btn-menubar position-relative">
                        <i class="ti ti-brand-hipchat"></i>
                        <span
                                class="badge bg-info rounded-pill d-flex align-items-center justify-content-center header-badge">5</span>
                     </a>
                  </div>
                  <div class="mb-1">
                     <a href="email.html" class="btn btn-menubar">
                        <i class="ti ti-mail"></i>
                     </a>
                  </div>
               </div>
            </div>
         </div>
         <div class="sidebar-right d-flex justify-content-between flex-column">
            <div class="sidebar-scroll">
               <h6 class="mb-3">Welcome to SmartHR</h6>
               <div class="sidebar-profile text-center rounded bg-light p-3 mb-4">
                  <div class="avatar avatar-lg online mb-3">
                     <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg" alt="Img" class="img-fluid rounded-circle">
                  </div>
                  <h6 class="fs-12 fw-normal mb-1">Adrian Herman</h6>
                  <p class="fs-10">System Admin</p>
               </div>
               <div class="stack-menu">
                  <div class="nav flex-column align-items-center nav-pills" role="tablist"
                       aria-orientation="vertical">
                     <div class="row g-2">
                        <div class="col-6">
                           <a href="#menu-dashboard" role="tab" class="nav-link " title="Dashboard"
                              data-bs-toggle="tab" data-bs-target="#menu-dashboard" aria-selected="true">
                              <span><i class="ti ti-smart-home"></i></span>
                              <p>Dashboard</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-application" role="tab" class="nav-link " title="Apps"
                              data-bs-toggle="tab" data-bs-target="#menu-application"
                              aria-selected="false">
                              <span><i class="ti ti-layout-grid-add"></i></span>
                              <p>Applications</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-superadmin" role="tab" class="nav-link " title="Apps"
                              data-bs-toggle="tab" data-bs-target="#menu-superadmin"
                              aria-selected="false">
                              <span><i class="ti ti-user-star"></i></span>
                              <p>Super Admin</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-layout" role="tab" class="nav-link " title="Layout"
                              data-bs-toggle="tab" data-bs-target="#menu-layout" aria-selected="false">
                              <span><i class="ti ti-layout-board-split"></i></span>
                              <p>Layouts</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-project" role="tab" class="nav-link " title="Projects"
                              data-bs-toggle="tab" data-bs-target="#menu-project" aria-selected="false">
                              <span><i class="ti ti-folder"></i></span>
                              <p>Projects</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-crm" role="tab" class="nav-link " title="CRM" data-bs-toggle="tab"
                              data-bs-target="#menu-crm" aria-selected="false">
                              <span><i class="ti ti-user-shield"></i></span>
                              <p>Crm</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-hrm" role="tab" class="nav-link " title="HRM" data-bs-toggle="tab"
                              data-bs-target="#menu-hrm" aria-selected="false">
                              <span><i class="ti ti-users"></i></span>
                              <p>Hrm</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-finance" role="tab" class="nav-link " title="Finance & Accounts"
                              data-bs-toggle="tab" data-bs-target="#menu-finance" aria-selected="false">
                              <span><i class="ti ti-shopping-cart-dollar"></i></span>
                              <p>Finance & Accounts</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-administration" role="tab" class="nav-link active"
                              title="Administration" data-bs-toggle="tab"
                              data-bs-target="#menu-administration" aria-selected="false">
                              <span><i class="ti ti-cash"></i></span>
                              <p>Administration</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-content" role="tab" class="nav-link" title="Content"
                              data-bs-toggle="tab" data-bs-target="#menu-content" aria-selected="false">
                              <span><i class="ti ti-license"></i></span>
                              <p>Contents</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-pages" role="tab" class="nav-link" title="Pages"
                              data-bs-toggle="tab" data-bs-target="#menu-pages" aria-selected="false">
                              <span><i class="ti ti-page-break"></i></span>
                              <p>Pages</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-authentication" role="tab" class="nav-link"
                              title="Authentication" data-bs-toggle="tab"
                              data-bs-target="#menu-authentication" aria-selected="false">
                              <span><i class="ti ti-lock-check"></i></span>
                              <p>Authentication</p>
                           </a>
                        </div>
                        <div class="col-6">
                           <a href="#menu-ui-elements" role="tab" class="nav-link" title="UI Elements"
                              data-bs-toggle="tab" data-bs-target="#menu-ui-elements"
                              aria-selected="false">
                              <span><i class="ti ti-ux-circle"></i></span>
                              <p>Basic UI</p>
                           </a>
                        </div>
                     </div>
                  </div>
                  <div class="tab-content">
                     <div class="tab-pane fade" id="menu-dashboard">
                        <ul class="stack-submenu">
                           <li><a href="index.html">Admin Dashboard</a></li>
                           <li><a href="employee-dashboard.html">Employee Dashboard</a></li>
                           <li><a href="deals-dashboard.html">Deals Dashboard</a></li>
                           <li><a href="leads-dashboard.html">Leads Dashboard</a></li>
                        </ul>
                     </div>
                     <div class="tab-pane fade" id="menu-superadmin">
                        <ul class="stack-submenu">
                           <li><a href="dashboard.html">Dashboard</a></li>
                           <li><a href="companies.html">Companies</a></li>
                           <li><a href="subscription.html">Subscriptions</a></li>
                           <li><a href="packages.html">Packages</a></li>
                           <li><a href="domain.html">Domain</a></li>
                           <li><a href="purchase-transaction.html">Purchase Transaction</a></li>
                        </ul>
                     </div>
                     <div class="tab-pane fade" id="menu-application">
                        <ul class="stack-submenu">
                           <li><a href="chat.html">Chat</a></li>
                           <li class="submenu submenu-two">
                              <a href="call.html">Calls<span class="menu-arrow inside-submenu"></span></a>
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
                     </div>
                     <div class="tab-pane fade" id="menu-layout">
                        <ul class="stack-submenu">
                           <li><a href="layout-horizontal.html">Horizontal</a></li>
                           <li><a href="layout-detached.html">Detached</a></li>
                           <li><a href="layout-modern.html">Modern</a></li>
                           <li><a href="layout-two-column.html">Two Column</a></li>
                           <li><a href="layout-hovered.html">Hovered</a></li>
                           <li><a href="layout-box.html">Boxed</a></li>
                           <li><a href="layout-horizontal-single.html">Horizontal Single</a></li>
                           <li><a href="layout-horizontal-overlay.html">Horizontal Overlay</a></li>
                           <li><a href="layout-horizontal-box.html">Horizontal Box</a></li>
                           <li><a href="layout-horizontal-sidemenu.html">Menu Aside</a></li>
                           <li><a href="layout-vertical-transparent.html">Transparent</a></li>
                           <li><a href="layout-without-header.html">Without Header</a></li>
                           <li><a href="layout-rtl.html">RTL</a></li>
                           <li><a href="layout-dark.html">Dark</a></li>
                        </ul>
                     </div>
                     <div class="tab-pane fade" id="menu-project">
                        <ul class="stack-submenu">
                           <li><a href="clients-grid.html"><span>Clients</span></a></li>
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
                        </ul>
                     </div>
                     <div class="tab-pane fade" id="menu-crm">
                        <ul class="stack-submenu">
                           <li><a href="contacts-grid.html"><span>Contacts</span></a></li>
                           <li><a href="companies-grid.html"><span>Companies</span></a></li>
                           <li><a href="deals-grid.html"><span>Deals</span></a></li>
                           <li><a href="leads-grid.html"><span>Leads</span></a></li>
                           <li><a href="pipeline.html"><span>Pipeline</span></a></li>
                           <li><a href="analytics.html"><span>Analytics</span></a></li>
                           <li><a href="activity.html"><span>Activities</span></a></li>
                        </ul>
                     </div>
                     <div class="tab-pane fade" id="menu-hrm">
                        <ul class="stack-submenu">
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
                              <a href="javascript:void(0);" ><span>Attendance</span>
                                 <span class="menu-arrow"></span>
                              </a>
                              <ul>
                                 <li class="submenu submenu-two">
                                    <a href="javascript:void(0);">Leaves<span
                                            class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                       <li><a href="leaves.html">Leaves (Admin)</a></li>
                                       <li><a href="leaves-employee.html">Leave (Employee)</a></li>
                                       <li><a href="leave-settings.html">Leave Settings</a></li>
                                    </ul>
                                 </li>
                                 <li><a href="attendance-admin.html">Attendance (Admin)</a></li>
                                 <li><a href="attendance-employee.html">Attendance (Employee)</a></li>
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
                                 <li><a href="performance-indicator.html">Performance Indicator</a></li>
                                 <li><a href="performance-review.html">Performance Review</a></li>
                                 <li><a href="performance-appraisal.html">Performance Appraisal</a></li>
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
                           <li><a href="resignation.html"><span>Resignation</span></a></li>
                           <li><a href="termination.html"><span>Termination</span></a></li>
                        </ul>
                     </div>
                     <div class="tab-pane fade" id="menu-finance">
                        <ul class="stack-submenu">
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
                        </ul>
                     </div>
                     <div class="tab-pane fade show active" id="menu-administration">
                        <ul class="stack-submenu">
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
                                 <li><a href="roles-permissions.html">Roles & Permissions</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);" class="active subdrop"><span>Reports</span>
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
                                 <li><a href="${pageContext.request.contextPath}/admin/attendance-report" class="active">Attendance Report</a></li>
                                 <li><a href="leave-report.html">Leave Report</a></li>
                                 <li><a href="daily-report.html">Daily Report</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">
                                 General Settings
                                 <span class="menu-arrow"></span>
                              </a>
                              <ul>
                                 <li><a href="profile-settings.html">Profile</a></li>
                                 <li><a href="security-settings.html">Security</a></li>
                                 <li><a href="notification-settings.html">Notifications</a></li>
                                 <li><a href="connected-apps.html">Connected Apps</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">
                                 Website Settings
                                 <span class="menu-arrow"></span>
                              </a>
                              <ul>
                                 <li><a href="bussiness-settings.html">Business Settings</a></li>
                                 <li><a href="seo-settings.html">SEO Settings</a></li>
                                 <li><a href="localization-settings.html">Localization</a></li>
                                 <li><a href="prefixes.html">Prefixes</a></li>
                                 <li><a href="preferences.html">Preferences</a></li>
                                 <li><a href="performance-appraisal.html">Appearance</a></li>
                                 <li><a href="language.html">Language</a></li>
                                 <li><a href="authentication-settings.html">Authentication</a></li>
                                 <li><a href="ai-settings.html">AI Settings</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">App Settings<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="salary-settings.html">Salary Settings</a></li>
                                 <li><a href="approval-settings.html">Approval Settings</a></li>
                                 <li><a href="invoice-settings.html">Invoice Settings</a></li>
                                 <li><a href="leave-type.html">Leave Type</a></li>
                                 <li><a href="custom-fields.html">Custom Fields</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">
                                 System Settings
                                 <span class="menu-arrow"></span>
                              </a>
                              <ul>
                                 <li><a href="email-settings.html">Email Settings</a></li>
                                 <li><a href="email-template.html">Email Templates</a></li>
                                 <li><a href="sms-settings.html">SMS Settings</a></li>
                                 <li><a href="sms-template.html">SMS Templates</a></li>
                                 <li><a href="otp-settings.html">OTP</a></li>
                                 <li><a href="gdpr.html">GDPR Cookies</a></li>
                                 <li><a href="maintenance-mode.html">Maintenance Mode</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">
                                 Financial Settings
                                 <span class="menu-arrow"></span>
                              </a>
                              <ul>
                                 <li><a href="payment-gateways.html">Payment Gateways</a></li>
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
                                 <li><a href="ban-ip-address.html">Ban IP Address</a></li>
                                 <li><a href="backup.html">Backup</a></li>
                                 <li><a href="clear-cache.html">Clear Cache</a></li>
                              </ul>
                           </li>
                        </ul>
                     </div>
                     <div class="tab-pane fade" id="menu-content">
                        <ul class="stack-submenu">
                           <li class="submenu">
                              <a href="javascript:void(0);">Blogs<span class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="blogs.html">All Blogs</a></li>
                                 <li><a href="blog-categories.html">Categories</a></li>
                                 <li><a href="blog-comments.html">Comments</a></li>
                                 <li><a href="blog-tags.html">Tags</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Locations<span class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="countries.html">Countries</a></li>
                                 <li><a href="states.html">States</a></li>
                                 <li><a href="cities.html">Cities</a></li>
                              </ul>
                           </li>
                           <li><a href="testimonials.html">Testimonials</a></li>
                           <li><a href="faq.html">FAQ’S</a></li>
                        </ul>
                     </div>
                     <div class="tab-pane fade" id="menu-pages">
                        <ul class="stack-submenu">
                           <li><a href="starter.html">Starter</a></li>
                           <li><a href="profile.html">Profile</a></li>
                           <li><a href="profile-settings.html">Profile Settings</a></li>
                           <li><a href="gallery.html">Gallery</a></li>
                           <li><a href="search-result.html">Search Results</a></li>
                           <li><a href="timeline.html">Timeline</a></li>
                           <li><a href="pricing.html">Pricing</a></li>
                           <li><a href="coming-soon.html">Coming Soon</a></li>
                           <li><a href="under-maintenance.html">Under Maintenance</a></li>
                           <li><a href="under-construction.html">Under Construction</a></li>
                           <li><a href="api-keys.html">API Keys</a></li>
                           <li><a href="privacy-policy.html">Privacy Policy</a></li>
                           <li><a href="terms-condition.html">Terms & Conditions</a></li>
                        </ul>
                     </div>
                     <div class="tab-pane fade" id="menu-authentication">
                        <ul class="stack-submenu">
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
                           <li class="submenu">
                              <a href="javascript:void(0);">Reset Password<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="reset-password.html">Cover</a></li>
                                 <li><a href="reset-password-2.html">Illustration</a></li>
                                 <li><a href="reset-password-3.html">Basic</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Email Verification<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="email-verification.html">Cover</a></li>
                                 <li><a href="email-verification-2.html">Illustration</a></li>
                                 <li><a href="email-verification-3.html">Basic</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">2 Step Verification<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="two-step-verification.html">Cover</a></li>
                                 <li><a href="two-step-verification-2.html">Illustration</a></li>
                                 <li><a href="two-step-verification-3.html">Basic</a></li>
                              </ul>
                           </li>
                           <li><a href="lock-screen.html">Lock Screen</a></li>
                           <li><a href="error-404.html">404 Error</a></li>
                           <li><a href="error-500.html">500 Error</a></li>
                        </ul>
                     </div>
                     <div class="tab-pane fade" id="menu-ui-elements">
                        <ul class="stack-submenu">
                           <li class="submenu">
                              <a href="javascript:void(0);">Base UI<span class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="ui-alerts.html">Alerts</a></li>
                                 <li><a href="ui-accordion.html">Accordion</a></li>
                                 <li><a href="ui-avatar.html">Avatar</a></li>
                                 <li><a href="ui-badges.html">Badges</a></li>
                                 <li><a href="ui-borders.html">Border</a></li>
                                 <li><a href="ui-buttons.html">Buttons</a></li>
                                 <li><a href="ui-buttons-group.html">Button Group</a></li>
                                 <li><a href="ui-breadcrumb.html">Breadcrumb</a></li>
                                 <li><a href="ui-cards.html">Card</a></li>
                                 <li><a href="ui-carousel.html">Carousel</a></li>
                                 <li><a href="ui-colors.html">Colors</a></li>
                                 <li><a href="ui-dropdowns.html">Dropdowns</a></li>
                                 <li><a href="ui-grid.html">Grid</a></li>
                                 <li><a href="ui-images.html">Images</a></li>
                                 <li><a href="ui-lightbox.html">Lightbox</a></li>
                                 <li><a href="ui-media.html">Media</a></li>
                                 <li><a href="ui-modals.html">Modals</a></li>
                                 <li><a href="ui-offcanvas.html">Offcanvas</a></li>
                                 <li><a href="ui-pagination.html">Pagination</a></li>
                                 <li><a href="ui-popovers.html">Popovers</a></li>
                                 <li><a href="ui-progress.html">Progress</a></li>
                                 <li><a href="ui-placeholders.html">Placeholders</a></li>
                                 <li><a href="ui-spinner.html">Spinner</a></li>
                                 <li><a href="ui-sweetalerts.html">Sweet Alerts</a></li>
                                 <li><a href="ui-nav-tabs.html">Tabs</a></li>
                                 <li><a href="ui-toasts.html">Toasts</a></li>
                                 <li><a href="ui-tooltips.html">Tooltips</a></li>
                                 <li><a href="ui-typography.html">Typography</a></li>
                                 <li><a href="ui-video.html">Video</a></li>
                                 <li><a href="ui-sortable.html">Sortable</a></li>
                                 <li><a href="ui-swiperjs.html">Swiperjs</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);"> Advanced UI<span
                                      class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="ui-ribbon.html">Ribbon</a></li>
                                 <li><a href="ui-clipboard.html">Clipboard</a></li>
                                 <li><a href="ui-drag-drop.html">Drag & Drop</a></li>
                                 <li><a href="ui-rangeslider.html">Range Slider</a></li>
                                 <li><a href="ui-rating.html">Rating</a></li>
                                 <li><a href="ui-text-editor.html">Text Editor</a></li>
                                 <li><a href="ui-counter.html">Counter</a></li>
                                 <li><a href="ui-scrollbar.html">Scrollbar</a></li>
                                 <li><a href="ui-stickynote.html">Sticky Note</a></li>
                                 <li><a href="ui-timeline.html">Timeline</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Forms<span class="menu-arrow"></span> </a>
                              <ul>
                                 <li class="submenu submenu-two">
                                    <a href="javascript:void(0);">Form Elements<span
                                            class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                       <li><a href="form-basic-inputs.html">Basic Inputs</a></li>
                                       <li><a href="form-checkbox-radios.html">Checkbox & Radios</a>
                                       </li>
                                       <li><a href="form-input-groups.html">Input Groups</a></li>
                                       <li><a href="form-grid-gutters.html">Grid & Gutters</a></li>
                                       <li><a href="form-select.html">Form Select</a></li>
                                       <li><a href="form-mask.html">Input Masks</a></li>
                                       <li><a href="form-fileupload.html">File Uploads</a></li>

                                    </ul>
                                 </li>
                                 <li class="submenu submenu-two">
                                    <a href="javascript:void(0);">Layouts<span
                                            class="menu-arrow inside-submenu"></span></a>
                                    <ul>
                                       <li><a href="form-horizontal.html">Horizontal Form</a></li>
                                       <li><a href="form-vertical.html">Vertical Form</a></li>
                                       <li><a href="form-floating-labels.html">Floating Labels</a></li>
                                    </ul>
                                 </li>
                                 <li><a href="form-validation.html">Form Validation</a></li>
                                 <li><a href="form-select2.html">Select2</a></li>
                                 <li><a href="form-wizard.html">Form Wizard</a></li>
                                 <li><a href="form-pickers.html">Form Picker</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Tables<span class="menu-arrow"></span></a>
                              <ul>
                                 <li><a href="tables-basic.html">Basic Tables </a></li>
                                 <li><a href="data-tables.html">Data Table </a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Charts<span class="menu-arrow"></span> </a>
                              <ul>
                                 <li><a href="chart-apex.html">Apex Charts</a></li>
                                 <li><a href="chart-c3.html">Chart C3</a></li>
                                 <li><a href="chart-js.html">Chart Js</a></li>
                                 <li><a href="chart-morris.html">Morris Charts</a></li>
                                 <li><a href="chart-flot.html">Flot Charts</a></li>
                                 <li><a href="chart-peity.html">Peity Charts</a></li>
                              </ul>
                           </li>
                           <li class="submenu">
                              <a href="javascript:void(0);">Icons<span class="menu-arrow"></span> </a>
                              <ul>
                                 <li><a href="icon-fontawesome.html">Fontawesome Icons</a></li>
                                 <li><a href="icon-tabler.html">Tabler Icons</a></li>
                                 <li><a href="icon-bootstrap.html">Bootstrap Icons</a></li>
                                 <li><a href="icon-remix.html">Remix Icons</a></li>
                                 <li><a href="icon-feather.html">Feather Icons</a></li>
                                 <li><a href="icon-ionic.html">Ionic Icons</a></li>
                                 <li><a href="icon-material.html">Material Icons</a></li>
                                 <li><a href="icon-pe7.html">Pe7 Icons</a></li>
                                 <li><a href="icon-simpleline.html">Simpleline Icons</a></li>
                                 <li><a href="icon-themify.html">Themify Icons</a></li>
                                 <li><a href="icon-weather.html">Weather Icons</a></li>
                                 <li><a href="icon-typicon.html">Typicon Icons</a></li>
                                 <li><a href="icon-flag.html">Flag Icons</a></li>
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
                     </div>
                  </div>
               </div>
            </div>
            <div class="p-3">
               <a href="javascript:void(0);" class="d-flex align-items-center fs-12 mb-3">Documentation</a>
               <a href="javascript:void(0);" class="d-flex align-items-center fs-12">Change Log<span
                       class="badge bg-pink badge-xs text-white fs-10 ms-2">v4.0.2</span></a>
            </div>
         </div>
      </div>
   </div>
   <!-- /Stacked Sidebar -->

   <!-- Page Wrapper -->
   <div class="page-wrapper">
      <div class="content">

         <!-- Breadcrumb -->
         <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
               <h2 class="mb-1">Attendance Report</h2>
               <nav>
                  <ol class="breadcrumb mb-0">
                     <li class="breadcrumb-item">
                        <a href="${pageContext.request.contextPath}/Admin/dashboard"><i class="ti ti-smart-home"></i></a>
                     </li>
                     <li class="breadcrumb-item">
                        HR
                     </li>
                     <li class="breadcrumb-item active" aria-current="page">Attendance Report</li>
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
                           <a href="javascript:void(0);" id="attendanceExportPdf" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
                        </li>
                        <li>
                           <a href="javascript:void(0);" id="attendanceExportExcel" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
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
                           <div class="d-flex align-items-center overflow-hidden mb-2">
                              <div class="attendence-icon">
                                 <span><i class="ti ti-calendar text-primary"></i></span>
                              </div>
                              <div class="ms-2 overflow-hidden">
                                 <p class="fs-12 fw-normal mb-1 text-truncate">Total Working Days</p>
                                 <h4>${workingDays}</h4>
                              </div>
                           </div>
                           <div class="attendance-report-bar mb-2">
                              <div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="height: 5px;">
                                 <div class="progress-bar bg-success" style="width: 85%"></div>
                              </div>
                           </div>
                           <div>
                              <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last month</p>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- /Total Companies -->

                  <!-- Total Companies -->
                  <div class="col-lg-6 col-md-6 d-flex">
                     <div class="card flex-fill">
                        <div class="card-body">
                           <div class="d-flex align-items-center overflow-hidden mb-2">
                              <div class="attendence-icon">
                                 <span><i class="ti ti-calendar text-info"></i></span>
                              </div>
                              <div class="ms-2 overflow-hidden">
                                 <p class="fs-12 fw-normal mb-1 text-truncate">Total Leave Taken</p>
                                 <h4>${leaveTaken}</h4>
                              </div>
                           </div>
                           <div class="attendance-report-bar mb-2">
                              <div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="height: 5px;">
                                 <div class="progress-bar bg-success" style="width: 85%"></div>
                              </div>
                           </div>
                           <div>
                              <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last month</p>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- /Total Companies -->

                  <!-- Inactive Companies -->
                  <div class="col-lg-6 col-md-6 d-flex">
                     <div class="card flex-fill">
                        <div class="card-body">
                           <div class="d-flex align-items-center overflow-hidden mb-2">
                              <div class="attendence-icon">
                                 <span><i class="ti ti-calendar text-pink"></i></span>
                              </div>
                              <div class="ms-2 overflow-hidden">
                                 <p class="fs-12 fw-normal mb-1 text-truncate">Total Holidays</p>
                                 <h4>${holidays}</h4>
                              </div>
                           </div>
                           <div class="attendance-report-bar mb-2">
                              <div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="height: 5px;">
                                 <div class="progress-bar bg-success" style="width: 85%"></div>
                              </div>
                           </div>
                           <div>
                              <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last month</p>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- /Inactive Companies -->

                  <!-- Company Location -->
                  <div class="col-lg-6 col-md-6 d-flex">
                     <div class="card flex-fill">
                        <div class="card-body">
                           <div class="d-flex align-items-center overflow-hidden mb-2">
                              <div class="attendence-icon">
                                 <span><i class="ti ti-calendar text-warning"></i></span>
                              </div>
                              <div class="ms-2 overflow-hidden">
                                 <p class="fs-12 fw-normal mb-1 text-truncate">Total Halfdays</p>
                                 <h4><c:out value="${halfDayCount}" default="0"/></h4>
                              </div>
                           </div>
                           <div class="attendance-report-bar mb-2">
                              <div class="progress" role="progressbar" aria-label="Success example" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="height: 5px;">
                                 <div class="progress-bar bg-success" style="width: 85%"></div>
                              </div>
                           </div>
                           <div>
                              <p class="fs-12 fw-normal d-flex align-items-center text-truncate"><span class="text-success fs-12 d-flex align-items-center me-1"><i class="ti ti-arrow-wave-right-up me-1"></i>+20.01%</span>from last month</p>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- /Company Location -->
               </div>
            </div>
            <div class="col-xl-6">
               <div class="card">
                  <div class="card-header border-0 pb-0">
                     <div class="d-flex flex-wrap justify-content-between align-items-center">
                        <div class="d-flex align-items-center ">
                           <span class="me-2"><i class="ti ti-chart-line text-danger"></i></span>
                           <h5>Attendance  </h5>
                        </div>
                        <div class="dropdown">
                           <a href="javascript:void(0);" class="dropdown-toggle btn btn-sm fs-12 btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                              This Year
                           </a>
                           <ul class="dropdown-menu  dropdown-menu-end p-2">
                              <li>
                                 <a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-year-option" data-year="2024">2024</a>
                              </li>
                              <li>
                                 <a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-year-option" data-year="2023">2023</a>
                              </li>
                              <li>
                                 <a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-year-option" data-year="2022">2022</a>
                              </li>
                           </ul>
                        </div>
                     </div>
                  </div>
                  <div class="card-body py-0 px-2">
                     <div id="attendance-report"> </div>
                  </div>
               </div>
            </div>
         </div>

         <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
               <h5>Employee Attendance</h5>
               <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                  <div class="me-3">
                     <div class="input-icon-end position-relative">
                        <input type="text" id="attendanceDateRange" class="form-control date-range bookingrange" placeholder="dd/mm/yyyy - dd/mm/yyyy">
                        <span class="input-icon-addon">
                               <i class="ti ti-chevron-down"></i>
                            </span>
                     </div>
                  </div>
                  <div class="dropdown me-3">
                     <a href="javascript:void(0);" id="attendanceStatusButton" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                        Select Status
                     </a>
                     <ul class="dropdown-menu  dropdown-menu-end p-3">
                        <li>
                           <a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-status-option" data-status="Present">Present</a>
                        </li>
                        <li>
                           <a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-status-option" data-status="Absent">Absent</a>
                        </li>
                        <li>
                           <a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-status-option" data-status="Half Day">Half Day</a>
                        </li>
                     </ul>
                  </div>
                  <div class="dropdown">
                     <a href="javascript:void(0);" id="attendanceSortButton" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                        Sort By : Last 7 Days
                     </a>
                     <ul class="dropdown-menu  dropdown-menu-end p-3">
                        <li>
                           <a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-sort-option" data-sort="recent">Recently Added</a>
                        </li>
                        <li>
                           <a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-sort-option" data-sort="asc">Ascending</a>
                        </li>
                        <li>
                           <a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-sort-option" data-sort="desc">Desending</a>
                        </li>
                        <li>
                           <a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-sort-option" data-sort="month">Last Month</a>
                        </li>
                        <li>
                           <a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-sort-option" data-sort="7days">Last 7 Days</a>
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
                        <th>Name</th>
                        <th>Date</th>
                        <th>Check In</th>
                        <th>Status</th>
                        <th>Check Out</th>
                        <th>Break</th>
                        <th>Late</th>
                        <th>Overtime</th>
                        <th>Production Hours</th>
                     </tr>
                     </thead>
                     <tbody>
                     <c:choose>
                        <c:when test="${not empty attendanceList}">
                           <c:forEach var="attendance" items="${attendanceList}">
                              <tr>
                                 <td>
                                    <div class="d-flex align-items-center">
                        <span class="avatar avatar-md">
                            <img src="${pageContext.request.contextPath}/assets/img/users/user-01.jpg"
                                 class="img-fluid rounded-circle" alt="Employee">
                        </span>
                                       <div class="ms-2">
                                          <p class="text-dark mb-0">
                                                ${attendance.firstName} ${attendance.lastName}
                                          </p>
                                          <span class="fs-12">${attendance.email}</span>
                                       </div>
                                    </div>
                                 </td>

                                 <td>
                                    <c:choose>
                                       <c:when test="${not empty attendance.date}">
                                          ${attendance.date}
                                       </c:when>
                                       <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                 </td>

                                 <td>
                                    <c:choose>
                                       <c:when test="${not empty attendance.checkIn}">
                                          ${attendance.checkIn}
                                       </c:when>
                                       <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                 </td>

                                 <td>
                                    <c:choose>
                                       <c:when test="${attendance.status eq 'Present'}">
                            <span class="badge badge-soft-success d-inline-flex align-items-center badge-xs">
                                <i class="ti ti-point-filled me-1"></i>${attendance.status}
                            </span>
                                       </c:when>
                                       <c:when test="${attendance.status eq 'Absent'}">
                            <span class="badge badge-soft-danger d-inline-flex align-items-center badge-xs">
                                <i class="ti ti-point-filled me-1"></i>${attendance.status}
                            </span>
                                       </c:when>
                                       <c:when test="${attendance.status eq 'Half Day'}">
                            <span class="badge badge-soft-warning d-inline-flex align-items-center badge-xs">
                                <i class="ti ti-point-filled me-1"></i>${attendance.status}
                            </span>
                                       </c:when>
                                       <c:when test="${attendance.status eq 'Leave'}">
                            <span class="badge badge-soft-info d-inline-flex align-items-center badge-xs">
                                <i class="ti ti-point-filled me-1"></i>${attendance.status}
                            </span>
                                       </c:when>
                                       <c:when test="${attendance.status eq 'Holiday'}">
                            <span class="badge badge-soft-primary d-inline-flex align-items-center badge-xs">
                                <i class="ti ti-point-filled me-1"></i>${attendance.status}
                            </span>
                                       </c:when>
                                       <c:otherwise>
                            <span class="badge badge-soft-secondary d-inline-flex align-items-center badge-xs">
                                <i class="ti ti-point-filled me-1"></i>${attendance.status}
                            </span>
                                       </c:otherwise>
                                    </c:choose>
                                 </td>

                                 <td>
                                    <c:choose>
                                       <c:when test="${not empty attendance.checkOut}">
                                          ${attendance.checkOut}
                                       </c:when>
                                       <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                 </td>

                                 <td>
                                    <c:choose>
                                       <c:when test="${not empty attendance.breakHours}">
                                          ${attendance.breakHours}
                                       </c:when>
                                       <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                 </td>

                                 <td>
                                    <c:choose>
                                       <c:when test="${not empty attendance.late}">
                                          ${attendance.late}
                                       </c:when>
                                       <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                 </td>

                                 <td>
                                    <c:choose>
                                       <c:when test="${not empty attendance.overtimeHours}">
                                          ${attendance.overtimeHours}
                                       </c:when>
                                       <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                 </td>

                                 <td>
                                    <c:choose>
                                       <c:when test="${not empty attendance.productionHours}">
                            <span class="badge badge-success d-inline-flex align-items-center badge-sm">
                                <i class="ti ti-clock-hour-11 me-1"></i>${attendance.productionHours}
                            </span>
                                       </c:when>
                                       <c:otherwise>-</c:otherwise>
                                    </c:choose>
                                 </td>
                              </tr>
                           </c:forEach>
                        </c:when>

                        <c:otherwise>
                           <tr>
                              <td colspan="9" class="text-center py-4">
                                 No attendance records found.
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
      if (typeof jQuery === "undefined" || !jQuery.fn.DataTable) return;

      var $ = jQuery;
      var tableElement = document.querySelector("table.datatable");
      if (!tableElement) return;

      var table = $.fn.dataTable.isDataTable(tableElement)
              ? $(tableElement).DataTable()
              : $(tableElement).DataTable({ pageLength: 10, order: [[1, "desc"]] });

      var selectedStatus = "";
      var startDate = null;
      var endDate = null;

      function parseDate(value) {
         if (!value || typeof moment === "undefined") return null;
         var m = moment(value, ["YYYY-MM-DD", "DD/MM/YYYY", "MM/DD/YYYY"], true);
         return m.isValid() ? m.startOf("day") : null;
      }

      function redraw() {
         table.draw();
      }

      if ($.fn.daterangepicker && $("#attendanceDateRange").length) {
         $("#attendanceDateRange").daterangepicker({
            autoUpdateInput: false,
            locale: { format: "DD/MM/YYYY", cancelLabel: "Clear" }
         });

         $("#attendanceDateRange").on("apply.daterangepicker", function (ev, picker) {
            startDate = picker.startDate.clone().startOf("day");
            endDate = picker.endDate.clone().endOf("day");
            $(this).val(picker.startDate.format("DD/MM/YYYY") + " - " + picker.endDate.format("DD/MM/YYYY"));
            redraw();
         });

         $("#attendanceDateRange").on("cancel.daterangepicker", function () {
            startDate = null;
            endDate = null;
            $(this).val("");
            redraw();
         });
      }

      $(document).on("click", ".attendance-status-option", function (e) {
         e.preventDefault();
         selectedStatus = String($(this).data("status") || "");
         $("#attendanceStatusButton").text(selectedStatus || "Select Status");
         redraw();
      });

      $(document).on("click", ".attendance-sort-option", function (e) {
         e.preventDefault();
         e.stopPropagation();

         var sort = String($(this).data("sort") || "");
         var label = $(this).text().trim();
         $("#attendanceSortButton").text("Sort By : " + label);

         // Clear any date-range filter when a pure sorting option is selected.
         if (sort === "recent" || sort === "asc" || sort === "desc") {
            startDate = null;
            endDate = null;
            $("#attendanceDateRange").val("");
         }

         if (sort === "recent") {
            // Most recent attendance date first.
            table.order([[1, "desc"]]).draw(false);
            return;
         }

         if (sort === "asc") {
            // Attendance date: oldest first.
            table.order([[1, "asc"]]).draw(false);
            return;
         }

         if (sort === "desc") {
            // Attendance date: newest first.
            table.order([[1, "desc"]]).draw(false);
            return;
         }

         if (typeof moment !== "undefined" && (sort === "month" || sort === "7days")) {
            var now = moment().startOf("day");
            if (sort === "month") {
               startDate = now.clone().subtract(1, "month");
            } else {
               startDate = now.clone().subtract(6, "days");
            }
            endDate = now.clone().endOf("day");

            $("#attendanceDateRange").val(
                    startDate.format("DD/MM/YYYY") + " - " + endDate.format("DD/MM/YYYY")
            );

            table.order([[1, "desc"]]).draw(false);
         }
      });

      $.fn.dataTable.ext.search.push(function (settings, data) {
         if (settings.nTable !== tableElement) return true;

         var status = $("<div>").html(data[3] || "").text().trim();
         var date = parseDate((data[1] || "").trim());

         if (selectedStatus && status !== selectedStatus) return false;
         if (startDate && (!date || date.isBefore(startDate, "day"))) return false;
         if (endDate && (!date || date.isAfter(endDate, "day"))) return false;

         return true;
      });

      $("#attendanceExportExcel").on("click", function (e) {
         e.preventDefault();

         var headers = [];
         $(tableElement).find("thead th").each(function () {
            headers.push($(this).text().trim());
         });

         var html = "<table><tr>" +
                 headers.map(function (h) { return "<th>" + $("<div>").text(h).html() + "</th>"; }).join("") +
                 "</tr>";

         table.rows({ search: "applied" }).every(function () {
            var row = this.data();
            html += "<tr>" + row.map(function (cell) {
               return "<td>" + $("<div>").html(cell).text().trim() + "</td>";
            }).join("") + "</tr>";
         });

         html += "</table>";

         var blob = new Blob(["\ufeff", html], { type: "application/vnd.ms-excel" });
         var url = URL.createObjectURL(blob);
         var a = document.createElement("a");
         a.href = url;
         a.download = "attendance-report.xls";
         document.body.appendChild(a);
         a.click();
         a.remove();
         URL.revokeObjectURL(url);
      });

      $("#attendanceExportPdf").on("click", function (e) {
         e.preventDefault();

         var cloned = $(tableElement).clone();
         cloned.find("tbody").empty();

         table.rows({ search: "applied" }).every(function () {
            var row = this.data();
            cloned.find("tbody").append(
                    $("<tr>").html(row.map(function (cell) { return "<td>" + cell + "</td>"; }).join(""))
            );
         });

         var win = window.open("", "_blank", "width=1200,height=800");
         if (!win) return;

         win.document.write(
                 "<html><head><title>Attendance Report</title><style>" +
                 "body{font-family:Arial;padding:20px}h2{text-align:center}" +
                 "table{width:100%;border-collapse:collapse;font-size:12px}" +
                 "th,td{border:1px solid #ccc;padding:7px;text-align:left}" +
                 "th{background:#eee}" +
                 "</style></head><body><h2>Attendance Report</h2>" +
                 cloned.prop("outerHTML") + "</body></html>"
         );
         win.document.close();
         win.focus();
         setTimeout(function () { win.print(); }, 300);
      });

      $(document).on("click", ".attendance-year-option", function (e) {
         e.preventDefault();

         var year = String($(this).data("year"));
         $(this).closest(".dropdown").find(".dropdown-toggle").text(year);

         // Use the selected year on the table; chart is refreshed from the matching rows.
         table.column(1).search("^" + year + "-", true, false).draw();

         var present = 0, absent = 0;
         table.rows({ search: "applied" }).every(function () {
            var status = $("<div>").html((this.data()[3] || "")).text().trim();
            if (status === "Present") present++;
            if (status === "Absent") absent++;
         });

         if (window.attendanceChartInstance) {
            window.attendanceChartInstance.updateSeries([present, absent]);
         }
      });
   });
</script>
<script>
   document.addEventListener("DOMContentLoaded", function () {

      var attendanceChartElement = document.querySelector("#attendance-report");

      if (!attendanceChartElement || typeof ApexCharts === "undefined") {
         return;
      }

      var presentCount = Number("${presentCount}") || 0;
      var absentCount = Number("${absentCount}") || 0;

      var options = {
         series: [
            presentCount,
            absentCount
         ],
         chart: {
            type: "donut",
            height: 300
         },
         labels: [
            "Present",
            "Absent"
         ],
         legend: {
            position: "bottom"
         },
         dataLabels: {
            enabled: true
         },
         responsive: [{
            breakpoint: 576,
            options: {
               chart: {
                  height: 260
               }
            }
         }]
      };

      attendanceChartElement.innerHTML = "";
      window.attendanceChartInstance = new ApexCharts(attendanceChartElement, options);
      window.attendanceChartInstance.render();
   });
</script>

</body>

</html>

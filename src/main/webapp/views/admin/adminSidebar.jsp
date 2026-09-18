<%-- Sidebar extracted from the existing dashboard. Menu/content kept unchanged. --%>

<style>
    <style>
        /* =========================
           HRMS SIDEBAR / DASHBOARD FIX
           ========================= */

        .sidebar {
            height: 100vh !important;
            overflow-y: auto !important;
            overflow-x: hidden !important;
            scrollbar-width: thin;
            scrollbar-color: #cfd4dc transparent;
        }

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

        .sidebar-menu {
            height: auto !important;
            overflow: visible !important;
            padding-bottom: 20px;
        }

        /* Remove browser default bullets/indentation */
        .sidebar-menu ul {
            list-style: none !important;
            margin: 0 !important;
            padding: 0 !important;
        }

        .sidebar-menu li {
            list-style: none !important;
        }

        /* Main menu links */
        .sidebar-menu > ul > li > a {
            display: flex;
            align-items: center;
            min-height: 44px;
            margin: 2px 8px;
            border-radius: 6px;
            transition: all .2s ease;
        }

        .sidebar-menu > ul > li > a:hover {
            background: #f3f6fb;
        }

        .sidebar-menu > ul > li.active > a {
            background: #fff4ec;
            color: #f97316;
        }

        .sidebar-menu > ul > li.active > a i {
            color: #f97316;
        }

        /* All submenu levels stay hidden until their parent is active */
        .sidebar-menu li.submenu > ul {
            display: none !important;
            width: 100%;
            background: transparent;
        }

        .sidebar-menu li.submenu.active > ul {
            display: block !important;
        }

        .sidebar-menu li.submenu > a {
            cursor: pointer;
        }

        .sidebar-menu li.submenu > a .menu-arrow {
            margin-left: auto;
            transition: transform .2s ease;
        }

        .sidebar-menu li.submenu.active > a .menu-arrow {
            transform: rotate(90deg);
        }

        /* First-level submenu items */
        .sidebar-menu li.submenu > ul > li > a {
            display: flex;
            align-items: center;
            min-height: 38px;
            margin: 1px 8px;
            padding: 7px 15px 7px 48px !important;
            border-radius: 5px;
            font-size: 13px;
            transition: all .2s ease;
        }

        .sidebar-menu li.submenu > ul > li > a:hover {
            background: #f6f8fb;
            color: #0d6efd;
        }

        /* Nested submenu */
        .sidebar-menu li.submenu > ul > li.submenu > a {
            padding-left: 48px !important;
        }

        .sidebar-menu li.submenu > ul > li.submenu > ul > li > a {
            padding-left: 68px !important;
            font-size: 12.5px;
        }

        /* Menu title */
        .sidebar-menu .menu-title {
            padding: 18px 20px 8px !important;
        }

        .sidebar-menu .menu-title span {
            font-size: 10px;
            font-weight: 700;
            letter-spacing: .7px;
            color: #98a2b3;
        }

        /* HR action links */
        .sidebar-menu > ul > li > a[href*="/promotion"] i {
            color: #7c3aed;
        }

        .sidebar-menu > ul > li > a[href*="/resignation"] i {
            color: #f97316;
        }

        .sidebar-menu > ul > li > a[href*="/termination"] i {
            color: #ef4444;
        }

        .sidebar-menu > ul > li > a[href*="/promotion"]:hover {
            background: #f4efff;
        }

        .sidebar-menu > ul > li > a[href*="/resignation"]:hover {
            background: #fff5eb;
        }

        .sidebar-menu > ul > li > a[href*="/termination"]:hover {
            background: #fff0f0;
        }

        /* Profile */
        .modern-profile .user-profile {
            border: 1px solid #edf0f5;
            box-shadow: 0 3px 12px rgba(16, 24, 40, .04);
        }

        .modern-profile .avatar-lg img {
            object-fit: cover;
        }
        @media (max-width: 991px) {
            .sidebar {
                height: 100vh !important;
            }
        }

        @media (max-width: 767px) {
            .page-wrapper .card {
                border-radius: 8px;
            }

            .sidebar-menu > ul > li > a {
                margin-left: 5px;
                margin-right: 5px;
            }
        }
</style>

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
                            <a href="${pageContext.request.contextPath}/admin/leave-report">
                                <span>Leave Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/payslip-report">
                                <i class="ti ti-file-invoice"></i>
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

               <!-- EXPERIENCE -->
               <li>
                   <a href="${pageContext.request.contextPath}/experience">
                       <i class="ti ti-briefcase"></i>
                       <span>Experience</span>
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
                <!-- TICKETS -->
                <li class="submenu">
                    <a href="javascript:void(0);">
                        <i class="ti ti-ticket"></i>
                        <span>Tickets</span>
                        <span class="menu-arrow"></span>
                    </a>
                    <ul>
                        <li>
                            <a href="${pageContext.request.contextPath}/admin/tickets?action=add">
                                <span>Create Ticket</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/tickets?action=my">
                                <span>My Tickets</span>
                            </a>
                        </li>

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/tickets?action=list">
                                <span>All Tickets</span>
                            </a>
                        </li>
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

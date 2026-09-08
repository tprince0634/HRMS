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
            <li>
                <a href="javascript:void(0);">
                    <i class="ti ti-users"></i>
                    <span>Employees</span>
                </a>
            </li>

            <!-- ATTENDANCE -->
            <li class="submenu">

                <a href="javascript:void(0);">
                    <i class="ti ti-calendar-check"></i>
                    <span>Attendance</span>
                    <span class="menu-arrow"></span>
                </a>

                <ul>

                    <li>
                        <a href="javascript:void(0);">
                            <span>Leaves</span>
                        </a>
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
            <li>
                <a href="javascript:void(0);">
                    <i class="ti ti-chart-line"></i>
                    <span>Performance &amp; Goal</span>
                </a>
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
            <li>
                <a href="javascript:void(0);">
                    <i class="ti ti-trending-up"></i>
                    <span>Promotions</span>
                </a>
            </li>

            <!-- RESIGNATION -->
            <li>
                <a href="javascript:void(0);">
                    <i class="ti ti-logout-2"></i>
                    <span>Resignation</span>
                </a>
            </li>

            <!-- TERMINATION -->
            <li>
                <a href="javascript:void(0);">
                    <i class="ti ti-user-x"></i>
                    <span>Termination</span>
                </a>
            </li>

            <!-- HELP & SUPPORT -->
            <li>
                <a href="javascript:void(0);">
                    <i class="ti ti-headset"></i>
                    <span>Help &amp; Supports</span>
                </a>
            </li>

            <!-- TICKETS -->
            <li>
                <a href="javascript:void(0);">
                    <i class="ti ti-ticket"></i>
                    <span>Tickets</span>
                </a>
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
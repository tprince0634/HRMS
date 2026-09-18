<!-- SIDEBAR -->
<div class="sidebar" id="sidebar">

    <!-- SIDEBAR LOGO / HEADER -->
    <div class="sidebar-logo">
        <a href="${pageContext.request.contextPath}/Admin/dashboard" class="logo logo-normal">
            <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                 alt="HRMS Logo">
        </a>

        <a href="${pageContext.request.contextPath}/Admin/dashboard" class="logo-small">
            <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg"
                 alt="HRMS Logo">
        </a>

        <a href="${pageContext.request.contextPath}/Admin/dashboard" class="dark-logo">
            <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                 alt="HRMS Logo">
        </a>
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
            <a href="${pageContext.request.contextPath}/logout">
                <i class="ti ti-logout"></i>
                <span>Logout</span>
            </a>
        </li>

    </ul>

</div>

</div>


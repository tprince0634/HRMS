
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="HRMS Dashboard">
    <meta name="keywords" content="HRMS, Human Resource Management System, Dashboard">
    <meta name="author" content="HRMS Team">
    <meta name="robots" content="noindex, nofollow">
    <title>HRMS Dashboard</title>

    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>
<body>


<div class="main-wrapper">

    <div id="global-loader" style="display: none;">
        <div class="page-loader"></div>
    </div>
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


        <div class="modern-profile p-3 pb-0">

            <div class="text-center rounded bg-light p-3 mb-4 user-profile">

                <div class="avatar avatar-lg online mb-3">

                    <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg"
                         alt="Profile"
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


        <!-- Sidebar Menu -->
        <div class="sidebar-menu">

            <ul>

                <li class="menu-title">
                    <span>MAIN MENU</span>
                </li>


                <!-- Dashboard -->
                <li class="active">

                    <a href="${pageContext.request.contextPath}/admin/dashboard">

                        <i class="ti ti-smart-home"></i>

                        <span>Employee Dashboard</span>

                    </a>

                </li>


                <!-- Employees -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-users"></i>

                        <span>Employees</span>

                    </a>

                </li>


                <!-- Attendance -->
                <li class="submenu">
                    <a href="javascript:void(0);">
                        <i class="ti ti-file-time"></i>
                        <span>Attendance</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>
                        <!-- Employee Attendance Link -->
                        <li>
                            <a href="${pageContext.request.contextPath}/employee/attendance">
                                <span>Attendance (Employee)</span>
                            </a>
                        </li>

                        <!-- Leaves Nested Submenu -->
                        <li class="submenu">
                            <a href="javascript:void(0);">
                                <span>Leaves</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <!-- Apply Leaves -->
                                <li>
                                    <a href="${pageContext.request.contextPath}/employee/leaves">
                                        <span>Apply Leaves</span>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>


                <!-- Payroll -->
                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-cash"></i>

                        <span>Payroll</span>

                        <span class="menu-arrow"></span>

                    </a>


                    <ul>

                        <!-- Payslips -->
                        <li>

                            <a href="javascript:void(0);">

                                <span>Payslips</span>

                            </a>

                        </li>

                    </ul>

                </li>


                <!-- Calendar -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-calendar-event"></i>

                        <span>Calendar</span>

                    </a>

                </li>


                <!-- Performance -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-chart-line"></i>

                        <span>Performance</span>

                    </a>

                </li>


                <!-- Documents -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-file-text"></i>

                        <span>Documents</span>

                    </a>
                    <ul>

                        <!-- Documents -->
                        <li>

                            <a href="javascript:void(0);">

                                <span>Company Slips</span>

                            </a>

                        </li>
                        <li>

                            <a href="${pageContext.request.contextPath}/documentList">

                                <span>My Documents</span>

                            </a>

                        </li>
                        <li>

                            <a href="${pageContext.request.contextPath}/uploadFile">

                                <span>Upload Documents</span>

                            </a>

                        </li>



                    </ul>
                </li>


                <!-- Help & Support -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-headset"></i>

                        <span>Help &amp; Support</span>

                    </a>

                </li>


                <!-- Tickets -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-ticket"></i>

                        <span>Tickets</span>

                    </a>

                </li>


                <!-- Logout -->
                <li class="mt-2">

                    <a href="javascript:void(0);">

                        <i class="ti ti-logout"></i>

                        <span>Logout</span>

                    </a>

                </li>

            </ul>

        </div>
        <!-- /Sidebar Menu -->

    </div>
</div>
<!-- Page Wrapper -->
<!-- Page Wrapper -->
<div class="page-wrapper">
    <div class="content">

        <!-- Breadcrumb -->
        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Leaves</h2>
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="index.html"><i class="ti ti-smart-home"></i></a>
                        </li>
                        <li class="breadcrumb-item">
                            Employee
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">Leaves</li>
                    </ol>
                </nav>
            </div>
            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">

                <div class="mb-2">
                    <a href="#" data-bs-toggle="modal" data-bs-target="#add_leaves" class="btn btn-primary d-flex align-items-center"><i class="ti ti-circle-plus me-2"></i>Add Leave</a>
                </div>
                <div class="head-icons ms-2">
                    <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                        <i class="ti ti-chevrons-up"></i>
                    </a>
                </div>
            </div>
        </div>
        <!-- /Breadcrumb -->

        <!-- Leaves Info -->
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-black-le">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="text-start">
                                <p class="mb-1">Annual Leaves</p>
                                <h4>05</h4>
                            </div>
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-2">
                                            <span class="avatar avatar-md d-flex">
                                                <i class="ti ti-calendar-event fs-32"></i>
                                            </span>
                                </div>
                            </div>
                        </div>
                        <span class="badge bg-secondary-transparent">Remaining Leaves : 07</span>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-blue-le">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="text-start">
                                <p class="mb-1">Medical Leaves</p>
                                <h4>11</h4>
                            </div>
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-2">
                                            <span class="avatar avatar-md d-flex">
                                                <i class="ti ti-vaccine fs-32"></i>
                                            </span>
                                </div>
                            </div>
                        </div>
                        <span class="badge bg-info-transparent">Remaining Leaves : 01</span>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-purple-le">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="text-start">
                                <p class="mb-1">Casual Leaves</p>
                                <h4>02</h4>
                            </div>
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-2">
                                            <span class="avatar avatar-md d-flex">
                                                <i class="ti ti-hexagon-letter-c fs-32"></i>
                                            </span>
                                </div>
                            </div>
                        </div>
                        <span class="badge bg-transparent-purple">Remaining Leaves : 10</span>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-pink-le">
                    <div class="card-body">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="text-start">
                                <p class="mb-1">Other Leaves</p>
                                <h4>07</h4>
                            </div>
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-2">
                                            <span class="avatar avatar-md d-flex">
                                                <i class="ti ti-hexagonal-prism-plus fs-32"></i>
                                            </span>
                                </div>
                            </div>
                        </div>
                        <span class="badge bg-pink-transparent">Remaining Leaves : 05</span>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Leaves Info -->

        <!-- Leaves list -->
        <div class="card">
            <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                <div class="d-flex">
                    <h5 class="me-2">Leave List</h5>
                    <span class="badge bg-primary-transparent me-2">Total Leaves : 48</span>
                    <span class="badge bg-secondary-transparent">Total Remaining Leaves : 23</span>
                </div>
                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                    <div class="me-3">
                        <div class="input-icon-end position-relative">
                            <input type="text" class="form-control date-range bookingrange" placeholder="dd/mm/yyyy - dd/mm/yyyy">
                            <span class="input-icon-addon">
										<i class="ti ti-chevron-down"></i>
									</span>
                        </div>
                    </div>
                    <div class="dropdown me-3">
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-sm btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                            Leave Type
                        </a>
                        <ul class="dropdown-menu  dropdown-menu-end p-3">
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Medical Leave</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Casual Leave</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Annual Leave</a>
                            </li>
                        </ul>
                    </div>
                    <div class="dropdown me-3">
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-sm btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                            Approved By
                        </a>
                        <ul class="dropdown-menu  dropdown-menu-end p-3">
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Doglas Martini</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Warren Morales</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Doglas Martini</a>
                            </li>
                        </ul>
                    </div>
                    <div class="dropdown me-3">
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-sm btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                            Select Status
                        </a>
                        <ul class="dropdown-menu  dropdown-menu-end p-3">
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1 d-flex justify-content-start align-items-center"><span class="rounded-circle bg-transparent-success d-flex justify-content-center align-items-center me-2"><i class="ti ti-point-filled text-success"></i></span>Approved</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1 d-flex justify-content-start align-items-center"><span class="rounded-circle bg-transparent-danger d-flex justify-content-center align-items-center me-2"><i class="ti ti-point-filled text-danger"></i></span>Declined</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1 d-flex justify-content-start align-items-center"><span class="rounded-circle bg-transparent-purple d-flex justify-content-center align-items-center me-2"><i class="ti ti-point-filled text-purple"></i></span>New</a>
                            </li>
                        </ul>
                    </div>
                    <div class="dropdown">
                        <a href="javascript:void(0);" class="dropdown-toggle btn btn-sm btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                            Sort By : Last 7 Days
                        </a>
                        <ul class="dropdown-menu  dropdown-menu-end p-3">
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Recently Added</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Ascending</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Desending</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Last Month</a>
                            </li>
                            <li>
                                <a href="javascript:void(0);" class="dropdown-item rounded-1">Last 7 Days</a>
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
                            <th >
                              LeaveId
                            </th>
                            <th>Leave Type</th>
                            <th>From</th>
                            <th>Reason</th>
                            <th>To</th>
                            <th>No of Days</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                              LeaveID
                            </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <p class="fs-14 fw-medium d-flex align-items-center mb-0">Medical Leave</p>
                                    <a href="#" class="ms-2" data-bs-toggle="tooltip" data-bs-placement="right" data-bs-title="I am currently experiencing a fever and
                                                feeling unwell.">
                                        <i class="ti ti-info-circle text-info"></i>
                                    </a>
                                </div>
                            </td>
                            <td>
                                14 Jan 2024
                            </td>
                            <td>
                              Reason
                            </td>
                            <td>
                                15 Jan 2024
                            </td>
                            <td>
                                2 Days
                            </td>
                            <td>
                               Approved
                            </td>

                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- /Leaves list -->

    </div>
    <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
        <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
        <p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
    </div>
</div>
<!-- /Page Wrapper -->

<!-- Add Leaves -->
<div class="modal fade" id="add_leaves">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Leave</h4>
                <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                    <i class="ti ti-x"></i>
                </button>
            </div>

            <form action="${pageContext.request.contextPath}/employee/leave" method="POST">
                <input type="hidden" name="action" value="add" />
                <input type="hidden" name="userId" value="${sessionScope.user.id}" />

                <div class="modal-body pb-0">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Leave Type</label>
                                <!-- Uses valid IDs matching masterleavetypes -->
                                <select class="select form-select" name="leaveTypeId" required>
                                    <option value="">Select Leave Type</option>
                                    <option value="4">Paid Leave</option>
                                    <option value="5">Sick Leave</option>
                                    <option value="6">Casual Leave (CL)</option>
                                    <option value="7">Medical Leave (ML)</option>
                                    <option value="8">Unpaid Leave</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">From</label>
                                <div class="input-icon-end position-relative">
                                    <input type="datetime-local" class="form-control" id="startDate" name="startDate" required />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">To</label>
                                <div class="input-icon-end position-relative">
                                    <input type="datetime-local" class="form-control" id="endDate" name="endDate" required />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Number of Days</label>
                                <input type="number" class="form-control" id="numberOfDays" name="numberOfDays" min="1" readonly required />
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Reason</label>
                                <textarea class="form-control" name="reason" rows="3" required></textarea>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add Leave</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- /Add Leaves -->


</div>



<!-- Scripts -->
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
<script src="${pageContext.request.contextPath}/assets/js/live-clock.js"></script>

<!-- Date Calculation Script -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const startDateInput = document.getElementById("startDate");
        const endDateInput = document.getElementById("endDate");
        const numberOfDaysInput = document.getElementById("numberOfDays");

        function calculateLeaveDays() {
            const startVal = startDateInput.value;
            const endVal = endDateInput.value;

            if (startVal && endVal) {
                const start = new Date(startVal);
                const end = new Date(endVal);

                if (end >= start) {
                    // Difference in milliseconds
                    const diffTime = Math.abs(end - start);
                    // Convert to days (1 day = 24 * 60 * 60 * 1000 ms)
                    let diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));

                    // If same-day start and end, count as 1 full day minimum
                    if (diffDays === 0) {
                        diffDays = 1;
                    }

                    numberOfDaysInput.value = diffDays;
                } else {
                    numberOfDaysInput.value = "";
                }
            } else {
                numberOfDaysInput.value = "";
            }
        }

        startDateInput.addEventListener("change", calculateLeaveDays);
        endDateInput.addEventListener("change", calculateLeaveDays);
    });
</script>
</body>

</html>
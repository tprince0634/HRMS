<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <title>Employee Report</title>

    <%-- Existing project head CSS include --%>
    <jsp:include page="/views/layouts/title-meta.jsp" />
    <jsp:include page="/views/layouts/head-css.jsp" />

    <!-- Bootstrap Tagsinput CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">

</head>

<body>

<div id="global-loader" style="display: none;">
    <div class="page-loader"></div>
</div>

<div class="main-wrapper">

    <%-- Sidebar / Menu --%>
    <jsp:include page="/views/layouts/menu.jsp" />


    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <div class="content">


            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">Employee Report</h2>

                    <nav>
                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin-dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                            </li>

                            <li class="breadcrumb-item">
                                HR
                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">
                                Employee Report
                            </li>

                        </ol>
                    </nav>

                </div>


                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

                    <div class="mb-2">

                        <div class="dropdown">

                            <a href="javascript:void(0);"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">

                                <i class="ti ti-file-export me-1"></i>
                                Export

                            </a>

                            <ul class="dropdown-menu dropdown-menu-end p-3">

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1">

                                        <i class="ti ti-file-type-pdf me-1"></i>
                                        Export as PDF

                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1">

                                        <i class="ti ti-file-type-xls me-1"></i>
                                        Export as Excel

                                    </a>
                                </li>

                            </ul>

                        </div>

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


            <!-- ========================= -->
            <!-- STATISTICS + GRAPH -->
            <!-- ========================= -->

            <div class="row">


                <!-- Statistics -->
                <div class="col-xl-6 d-flex">

                    <div class="row flex-fill">


                        <!-- Total Employee -->
                        <div class="col-lg-6 col-md-6 d-flex">

                            <div class="card flex-fill">

                                <div class="card-body">

                                    <div class="overflow-hidden d-flex mb-2 align-items-center">

                                        <span class="me-2">

                                            <img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-icon.svg"
                                                 alt="Employee"
                                                 class="img-fluid">

                                        </span>

                                        <div>

                                            <p class="fs-14 fw-normal mb-1 text-truncate">
                                                Total Employee
                                            </p>

                                            <h5>
                                                ${totalEmployees}
                                            </h5>

                                        </div>

                                    </div>

                                    <div>

                                        <p class="fs-12 fw-normal d-flex align-items-center text-truncate">

                                            <span class="text-success fs-12 d-flex align-items-center me-1">

                                                <i class="ti ti-arrow-wave-right-up me-1"></i>

                                                Total

                                            </span>

                                            Employees

                                        </p>

                                    </div>

                                </div>

                            </div>

                        </div>
                        <!-- /Total Employee -->


                        <!-- Active Employee -->
                        <div class="col-lg-6 col-md-6 d-flex">

                            <div class="card flex-fill">

                                <div class="card-body">

                                    <div class="overflow-hidden d-flex mb-2 align-items-center">

                                        <span class="me-2">

                                            <img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-success.svg"
                                                 alt="Active Employee"
                                                 class="img-fluid">

                                        </span>

                                        <div>

                                            <p class="fs-14 fw-normal mb-1 text-truncate">
                                                Active Employee
                                            </p>

                                            <h5>
                                                ${activeEmployees}
                                            </h5>

                                        </div>

                                    </div>

                                    <div>

                                        <p class="fs-12 fw-normal d-flex align-items-center text-truncate">

                                            <span class="text-success fs-12 d-flex align-items-center me-1">

                                                <i class="ti ti-arrow-wave-right-up me-1"></i>

                                                Active

                                            </span>

                                            Employees

                                        </p>

                                    </div>

                                </div>

                            </div>

                        </div>
                        <!-- /Active Employee -->


                        <!-- Total Departments -->
                        <div class="col-lg-6 col-md-6 d-flex">

                            <div class="card flex-fill">

                                <div class="card-body">

                                    <div class="overflow-hidden d-flex mb-2 align-items-center">

                                        <span class="me-2">

                                            <img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-info.svg"
                                                 alt="Departments"
                                                 class="img-fluid">

                                        </span>

                                        <div>

                                            <p class="fs-14 fw-normal mb-1 text-truncate">
                                                Departments
                                            </p>

                                            <h5>
                                                ${totalDepartments}
                                            </h5>

                                        </div>

                                    </div>

                                    <div>

                                        <p class="fs-12 fw-normal d-flex align-items-center text-truncate">

                                            <span class="text-primary fs-12 d-flex align-items-center me-1">

                                                <i class="ti ti-building me-1"></i>

                                                Total

                                            </span>

                                            Departments

                                        </p>

                                    </div>

                                </div>

                            </div>

                        </div>
                        <!-- /Total Departments -->


                        <!-- Inactive Employee -->
                        <div class="col-lg-6 col-md-6 d-flex">

                            <div class="card flex-fill">

                                <div class="card-body">

                                    <div class="overflow-hidden d-flex mb-2 align-items-center">

                                        <span class="me-2">

                                            <img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-danger.svg"
                                                 alt="Inactive Employee"
                                                 class="img-fluid">

                                        </span>

                                        <div>

                                            <p class="fs-14 fw-normal mb-1 text-truncate">
                                                Inactive Employee
                                            </p>

                                            <h5>
                                                ${inactiveEmployees}
                                            </h5>

                                        </div>

                                    </div>

                                    <div>

                                        <p class="fs-12 fw-normal d-flex align-items-center text-truncate">

                                            <span class="text-danger fs-12 d-flex align-items-center me-1">

                                                <i class="ti ti-user-off me-1"></i>

                                                Inactive

                                            </span>

                                            Employees

                                        </p>

                                    </div>

                                </div>

                            </div>

                        </div>
                        <!-- /Inactive Employee -->

                    </div>

                </div>


                <!-- Employee Graph -->
                <div class="col-xl-6 d-flex">

                    <div class="card flex-fill">

                        <div class="card-header border-0 pb-0">

                            <div class="d-flex flex-wrap justify-content-between align-items-center row-gap-2">

                                <div class="d-flex align-items-center">

                                    <span class="me-2">
                                        <i class="ti ti-chart-bar text-danger"></i>
                                    </span>

                                    <h5>Employee</h5>

                                </div>


                                <div class="d-flex align-items-center">

                                    <p class="d-inline-flex align-items-center me-3 mb-0">

                                        <i class="ti ti-square-filled fs-12 text-success me-2"></i>

                                        Active Employees

                                    </p>

                                    <p class="d-inline-flex align-items-center">

                                        <i class="ti ti-square-filled fs-12 text-gray-1 me-2"></i>

                                        Inactive Employees

                                    </p>

                                </div>


                                <div class="dropdown">

                                    <a href="javascript:void(0);"
                                       class="dropdown-toggle btn btn-sm fs-12 btn-white d-inline-flex align-items-center"
                                       data-bs-toggle="dropdown">

                                        This Year

                                    </a>

                                    <ul class="dropdown-menu dropdown-menu-end p-2">

                                        <li>
                                            <a href="javascript:void(0);"
                                               class="dropdown-item rounded-1">
                                                2026
                                            </a>
                                        </li>

                                        <li>
                                            <a href="javascript:void(0);"
                                               class="dropdown-item rounded-1">
                                                2025
                                            </a>
                                        </li>

                                        <li>
                                            <a href="javascript:void(0);"
                                               class="dropdown-item rounded-1">
                                                2024
                                            </a>
                                        </li>

                                    </ul>

                                </div>

                            </div>

                        </div>


                        <div class="card-body py-0">

                            <div id="employee-reports"></div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- ========================= -->
            <!-- EMPLOYEE TABLE -->
            <!-- ========================= -->

            <div class="card">

                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">

                    <h5>Employees List</h5>


                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">


                        <!-- Search -->
                        <div class="me-3">

                            <div class="input-icon-end position-relative">

                                <input type="text"
                                       id="employeeSearch"
                                       class="form-control"
                                       placeholder="Search employee...">

                                <span class="input-icon-addon">

                                    <i class="ti ti-search"></i>

                                </span>

                            </div>

                        </div>


                        <!-- Department -->
                        <div class="dropdown me-3">

                            <a href="javascript:void(0);"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">

                                Designation

                            </a>

                            <ul class="dropdown-menu dropdown-menu-end p-3">

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1">
                                        All
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1">
                                        Developer
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1">
                                        Manager
                                    </a>
                                </li>

                            </ul>

                        </div>


                        <!-- Status -->
                        <div class="dropdown me-3">

                            <a href="javascript:void(0);"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">

                                Select Status

                            </a>

                            <ul class="dropdown-menu dropdown-menu-end p-3">

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1">
                                        Active
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1">
                                        Inactive
                                    </a>
                                </li>

                            </ul>

                        </div>


                        <!-- Sort -->
                        <div class="dropdown">

                            <a href="javascript:void(0);"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">

                                Sort By : Recently Added

                            </a>

                            <ul class="dropdown-menu dropdown-menu-end p-3">

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1">
                                        Recently Added
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1">
                                        Ascending
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1">
                                        Descending
                                    </a>
                                </li>

                            </ul>

                        </div>

                    </div>

                </div>


                <!-- TABLE -->
                <div class="card-body p-0">

                    <div class="custom-datatable-filter table-responsive">

                        <table class="table datatable"
                               id="employeeTable">

                            <thead class="thead-light">

                            <tr>

                                <th>Emp ID</th>

                                <th>Name</th>

                                <th>Email</th>

                                <th>Department</th>

                                <th>Phone</th>

                                <th>Joining Date</th>

                                <th>Status</th>

                            </tr>

                            </thead>


                            <tbody>

                            <c:choose>

                                <%-- No employees --%>
                                <c:when test="${empty employees}">

                                    <tr>

                                        <td colspan="7"
                                            class="text-center py-4">

                                            No employees found.

                                        </td>

                                    </tr>

                                </c:when>


                                <%-- Employee list --%>
                                <c:otherwise>

                                    <c:forEach var="employee"
                                               items="${employees}">

                                        <tr>

                                            <!-- Employee ID -->
                                            <td>

                                                <a href="javascript:void(0);"
                                                   class="link-default">

                                                    Emp-${employee.employeeId}

                                                </a>

                                            </td>


                                            <!-- Name -->
                                            <td>

                                                <div class="d-flex align-items-center">

                                                    <a href="javascript:void(0);"
                                                       class="avatar avatar-md">

                                                        <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg"
                                                             class="img-fluid rounded-circle"
                                                             alt="Employee">

                                                    </a>


                                                    <div class="ms-2">

                                                        <p class="text-dark mb-0">

                                                            <a href="javascript:void(0);">

                                                                ${employee.firstName}
                                                                ${employee.lastName}

                                                            </a>

                                                        </p>

                                                        <span class="fs-12">

                                                            ${employee.designation}

                                                        </span>

                                                    </div>

                                                </div>

                                            </td>


                                            <!-- Email -->
                                            <td>

                                                ${employee.email}

                                            </td>


                                            <!-- Department -->
                                            <td>

                                                ${employee.department}

                                            </td>


                                            <!-- Phone -->
                                            <td>

                                                ${employee.phoneNumber}

                                            </td>


                                            <!-- Joining Date -->
                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty employee.dateOfJoining}">

                                                        ${employee.dateOfJoining.dayOfMonth}
                                                        ${employee.dateOfJoining.month}
                                                        ${employee.dateOfJoining.year}

                                                    </c:when>

                                                    <c:otherwise>

                                                        -

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- Status -->
                                            <td>

                                                <c:choose>

                                                    <c:when test="${employee.status eq 'Active'}">

                                                        <span class="badge badge-success d-inline-flex align-items-center badge-xs">

                                                            <i class="ti ti-point-filled me-1"></i>

                                                            Active

                                                        </span>

                                                    </c:when>


                                                    <c:otherwise>

                                                        <span class="badge badge-danger d-inline-flex align-items-center badge-sm">

                                                            <i class="ti ti-point-filled me-1"></i>

                                                            ${employee.status}

                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>

                                        </tr>

                                    </c:forEach>

                                </c:otherwise>

                            </c:choose>

                            </tbody>

                        </table>

                    </div>

                </div>

            </div>


        </div>


        <!-- Footer -->
        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

            <p class="mb-0">
                2014 - 2025 &copy; SmartHR.
            </p>

            <p>
                Designed &amp; Developed By
                <a href="javascript:void(0);"
                   class="text-primary">
                    Dreams
                </a>
            </p>

        </div>


    </div>
    <!-- /Page Wrapper -->


</div>
<!-- /main-wrapper -->


<!-- JAVASCRIPT -->

<jsp:include page="/views/layouts/vendor-scripts.jsp" />

<!-- Bootstrap Tagsinput JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>


<!-- ========================= -->
<!-- EMPLOYEE REPORT JAVASCRIPT -->
<!-- ========================= -->

<script>

    /*
     * Employee statistics
     */
    const totalEmployees = ${totalEmployees};
    const activeEmployees = ${activeEmployees};
    const inactiveEmployees = ${inactiveEmployees};


    /*
     * Search
     */
    document.getElementById("employeeSearch")
        .addEventListener("keyup", function () {

            const searchValue =
                this.value.toLowerCase();

            const rows =
                document.querySelectorAll(
                    "#employeeTable tbody tr"
                );

            rows.forEach(function (row) {

                const rowText =
                    row.innerText.toLowerCase();

                if (rowText.includes(searchValue)) {

                    row.style.display = "";

                } else {

                    row.style.display = "none";

                }

            });

        });


</script>


</body>

</html>
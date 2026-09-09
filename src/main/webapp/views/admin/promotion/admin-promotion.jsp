
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="SmartHR Promotion">
    <meta name="robots" content="noindex, nofollow">
    <title>SmartHR - Promotion</title>

    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>

<div class="main-wrapper">

    <!-- ================= HEADER ================= -->

    <div class="header">
        <div class="main-header">

            <div class="header-left">

                <a href="${pageContext.request.contextPath}/index.jsp"
                   class="logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                         alt="Logo">

                </a>

                <a href="${pageContext.request.contextPath}/index.jsp"
                   class="dark-logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                         alt="Logo">

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

                    </div>

                    <div class="d-flex align-items-center">

                        <a href="javascript:void(0);"
                           class="btn btn-menubar me-1">

                            <i class="ti ti-maximize"></i>

                        </a>

                        <a href="javascript:void(0);"
                           class="btn btn-menubar me-1">

                            <i class="ti ti-mail"></i>

                        </a>

                        <a href="javascript:void(0);"
                           class="btn btn-menubar me-1">

                            <i class="ti ti-bell"></i>

                        </a>

                        <a href="javascript:void(0);"
                           class="avatar avatar-sm">

                            <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-07.jpg"
                                 class="rounded-circle"
                                 alt="profile">

                        </a>

                    </div>

                </div>

            </div>

        </div>
    </div>

    <!-- ================= SIDEBAR ================= -->

    <div class="sidebar" id="sidebar">

        <div class="sidebar-inner slimscroll">

            <div id="sidebar-menu"
                 class="sidebar-menu">

                <ul>

                    <li class="menu-title">
                        <span>MAIN MENU</span>
                    </li>

                    <li>

                        <a href="${pageContext.request.contextPath}/admin-dashboard">

                            <i class="ti ti-layout-dashboard"></i>

                            <span>Dashboard</span>

                        </a>

                    </li>

                    <li class="menu-title">
                        <span>HRM</span>
                    </li>

                    <li>

                        <a href="${pageContext.request.contextPath}/employees">

                            <i class="ti ti-users"></i>

                            <span>Employees</span>

                        </a>

                    </li>

                    <li>

                        <a href="${pageContext.request.contextPath}/holidays">

                            <i class="ti ti-calendar-event"></i>

                            <span>Holidays</span>

                        </a>

                    </li>

                    <li>

                        <a href="javascript:void(0);">

                            <i class="ti ti-school"></i>

                            <span>Performance</span>

                            <span class="menu-arrow"></span>

                        </a>

                    </li>

                    <li class="active">

                        <a href="${pageContext.request.contextPath}/promotion">

                            <i class="ti ti-speakerphone"></i>

                            <span>Promotion</span>

                        </a>

                    </li>

                    <li>

                        <a href="${pageContext.request.contextPath}/resignation">

                            <i class="ti ti-user-x"></i>

                            <span>Resignation</span>

                        </a>

                    </li>

                    <li>

                        <a href="${pageContext.request.contextPath}/termination">

                            <i class="ti ti-user-off"></i>

                            <span>Termination</span>

                        </a>

                    </li>

                </ul>

            </div>

        </div>

    </div>

    <!-- ================= PAGE WRAPPER ================= -->

    <div class="page-wrapper">

        <div class="content">

            <!-- ================= BREADCRUMB ================= -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">
                        Promotion
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin-dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>

                            <li class="breadcrumb-item">
                                Performance
                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Promotion

                            </li>

                        </ol>

                    </nav>

                </div>

                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

                    <div class="mb-2">

                        <a href="#"
                           class="btn btn-primary d-flex align-items-center"
                           data-bs-toggle="modal"
                           data-bs-target="#new_promotion">

                            <i class="ti ti-circle-plus me-2"></i>

                            Add Promotion

                        </a>

                    </div>

                    <div class="head-icons ms-2">

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

            <!-- ================= SUCCESS MESSAGE ================= -->

            <c:if test="${not empty sessionScope.successMessage}">

                <div class="alert alert-success alert-dismissible fade show"
                     role="alert">

                    ${sessionScope.successMessage}

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

                <c:remove var="successMessage"
                          scope="session"/>

            </c:if>

            <!-- ================= ERROR MESSAGE ================= -->

            <c:if test="${not empty sessionScope.errorMessage}">

                <div class="alert alert-danger alert-dismissible fade show"
                     role="alert">

                    ${sessionScope.errorMessage}

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

                <c:remove var="errorMessage"
                          scope="session"/>

            </c:if>

            <!-- ================= PROMOTION LIST ================= -->

            <div class="row">

                <div class="col-sm-12">

                    <div class="card">

                        <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">

                            <h5 class="d-flex align-items-center">
                                Promotion List
                            </h5>

                            <div class="d-flex align-items-center flex-wrap row-gap-3">

                                <div class="input-icon position-relative me-2">

                                    <span class="input-icon-addon">

                                        <i class="ti ti-calendar"></i>

                                    </span>

                                    <input type="text"
                                           class="form-control date-range bookingrange"
                                           placeholder="dd-mm-yyyy - dd-mm-yyyy">

                                </div>

                                <div class="dropdown">

                                    <a href="javascript:void(0);"
                                       class="dropdown-toggle btn btn-white d-inline-flex align-items-center fs-12"
                                       data-bs-toggle="dropdown">

                                        <p class="fs-12 d-inline-flex me-1 mb-0">
                                            Sort By :
                                        </p>

                                        Last 7 Days

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

                        <div class="card-body p-0">

                            <div class="table-responsive">

                                <table class="table datatable">

                                    <thead class="thead-light">

                                    <tr>

                                        <th>

                                            <div class="form-check form-check-md">

                                                <input class="form-check-input"
                                                       type="checkbox"
                                                       id="select-all">

                                            </div>

                                        </th>

                                        <th>Promoted Employee</th>

                                        <th>Department</th>

                                        <th>Designation From</th>

                                        <th>Designation To</th>

                                        <th>Promotion Date</th>

                                        <th></th>

                                    </tr>

                                    </thead>

                                    <tbody>

                                    <c:choose>

                                        <c:when test="${not empty promotions}">

                                            <c:forEach var="promotion"
                                                       items="${promotions}">

                                                <tr>

                                                    <td>

                                                        <div class="form-check form-check-md">

                                                            <input class="form-check-input"
                                                                   type="checkbox"
                                                                   name="selectedPromotion"
                                                                   value="${promotion.promotionId}">

                                                        </div>

                                                    </td>

                                                    <td>

                                                        <div class="d-flex align-items-center">

                                                            <a href="javascript:void(0);"
                                                               class="avatar avatar-md me-2">

                                                                <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg"
                                                                     class="rounded-circle"
                                                                     alt="user">

                                                            </a>

                                                            <h6 class="fw-medium mb-0">

                                                                <c:choose>

                                                                    <c:when test="${not empty userMap[promotion.userId]}">

                                                                        ${userMap[promotion.userId].name}

                                                                    </c:when>

                                                                    <c:otherwise>

                                                                        User #${promotion.userId}

                                                                    </c:otherwise>

                                                                </c:choose>

                                                            </h6>

                                                        </div>

                                                    </td>

                                                    <td>

                                                        <c:choose>

                                                            <c:when test="${not empty userMap[promotion.userId].department}">

                                                                ${userMap[promotion.userId].department}

                                                            </c:when>

                                                            <c:otherwise>

                                                                -

                                                            </c:otherwise>

                                                        </c:choose>

                                                    </td>

                                                    <td>
                                                        ${promotion.designationFrom}
                                                    </td>

                                                    <td>
                                                        ${promotion.designationTo}
                                                    </td>

                                                    <td>

                                                        <c:if test="${not empty promotion.date}">

                                                            ${promotion.date.dayOfMonth}-${promotion.date.monthValue}-${promotion.date.year}

                                                        </c:if>

                                                    </td>

                                                    <td>

                                                        <div class="action-icon d-inline-flex">

                                                            <a href="${pageContext.request.contextPath}/promotion?action=edit&id=${promotion.promotionId}"
                                                               class="me-2"
                                                               title="Edit">

                                                                <i class="ti ti-edit"></i>

                                                            </a>

                                                            <a href="#"
                                                               title="Delete"
                                                               data-bs-toggle="modal"
                                                               data-bs-target="#delete_modal"
                                                               data-id="${promotion.promotionId}">

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

                                                    No promotion records found.

                                                </td>

                                            </tr>

                                        </c:otherwise>

                                    </c:choose>

                                    </tbody>

                                </table>

                            </div>

                        </div>

                        <div class="card-footer d-flex align-items-center justify-content-between">

                            <div>

                                Showing

                                <strong>
                                    ${empty promotions ? 0 : promotions.size()}
                                </strong>

                                entries

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

        <!-- ================= FOOTER ================= -->

        <div class="footer d-sm-flex align-items-center justify-content-between bg-white border-top p-3">

            <p class="mb-0">
                2014 - 2025 &copy; SmartHR.
            </p>

            <p>

                Designed &amp; Developed By

                <a href="#"
                   class="text-primary">
                    Dreams
                </a>

            </p>

        </div>

    </div>

    <!-- ================= ADD PROMOTION MODAL ================= -->

    <div class="modal fade"
         id="new_promotion">

        <div class="modal-dialog modal-dialog-centered modal-md">

            <div class="modal-content">

                <div class="modal-header">

                    <h4 class="modal-title">
                        Add Promotion
                    </h4>

                    <button type="button"
                            class="btn-close custom-btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close">

                        <i class="ti ti-x"></i>

                    </button>

                </div>

                <form action="${pageContext.request.contextPath}/promotion"
                      method="post">

                    <input type="hidden"
                           name="action"
                           value="add">

                    <div class="modal-body pb-0">

                        <div class="row">

                            <!-- Employee -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Promotion For
                                    </label>

                                    <select class="select form-control"
                                            name="userId"
                                            required>

                                        <option value="">
                                            Select
                                        </option>

                                        <c:choose>

                                            <c:when test="${not empty employees}">

                                                <c:forEach var="employee"
                                                           items="${employees}">

                                                    <option value="${employee.userId}">

                                                        ${employee.firstName}
                                                        ${employee.lastName}

                                                    </option>

                                                </c:forEach>

                                            </c:when>

                                            <c:otherwise>

                                                <c:forEach var="promotion"
                                                           items="${promotions}">

                                                    <option value="${promotion.userId}">

                                                        User #${promotion.userId}

                                                    </option>

                                                </c:forEach>

                                            </c:otherwise>

                                        </c:choose>

                                    </select>

                                </div>

                            </div>

                            <!-- Designation From -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Designation From
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           name="designationFrom"
                                           required>

                                </div>

                            </div>

                            <!-- Designation To -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Designation To
                                    </label>

                                    <input type="text"
                                           class="form-control"
                                           name="designationTo"
                                           required>

                                </div>

                            </div>

                            <!-- Promotion Date -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Promotion Date
                                    </label>

                                    <div class="input-icon-end position-relative">

                                        <input type="text"
                                               name="date"
                                               class="form-control datetimepicker"
                                               placeholder="dd-mm-yyyy"
                                               autocomplete="off"
                                               required>

                                        <span class="input-icon-addon">

                                            <i class="ti ti-calendar text-gray-7"></i>

                                        </span>

                                    </div>

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

                            Add Promotion

                        </button>

                    </div>

                </form>

            </div>

        </div>

    </div>

    <!-- ================= EDIT PROMOTION MODAL ================= -->

    <c:if test="${not empty editPromotion}">

        <div class="modal fade"
             id="edit_promotion">

            <div class="modal-dialog modal-dialog-centered modal-md">

                <div class="modal-content">

                    <div class="modal-header">

                        <h4 class="modal-title">
                            Edit Promotion
                        </h4>

                        <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">

                            <i class="ti ti-x"></i>

                        </button>

                    </div>

                    <form action="${pageContext.request.contextPath}/promotion"
                          method="post">

                        <input type="hidden"
                               name="action"
                               value="update">

                        <input type="hidden"
                               name="promotionId"
                               value="${editPromotion.promotionId}">

                        <div class="modal-body pb-0">

                            <div class="row">

                                <!-- Employee -->

                                <div class="col-md-12">

                                    <div class="mb-3">

                                        <label class="form-label">
                                            Promotion For
                                        </label>

                                        <select class="select form-control"
                                                name="userId"
                                                required>

                                            <option value="">
                                                Select
                                            </option>

                                            <c:choose>

                                                <c:when test="${not empty employees}">

                                                    <c:forEach var="employee"
                                                               items="${employees}">

                                                        <option value="${employee.userId}"
                                                                <c:if test="${employee.userId == editPromotion.userId}">
                                                                    selected
                                                                </c:if>>

                                                            ${employee.firstName}
                                                            ${employee.lastName}

                                                        </option>

                                                    </c:forEach>

                                                </c:when>

                                                <c:otherwise>

                                                    <option value="${editPromotion.userId}"
                                                            selected>

                                                        User #${editPromotion.userId}

                                                    </option>

                                                </c:otherwise>

                                            </c:choose>

                                        </select>

                                    </div>

                                </div>

                                <!-- Designation From -->

                                <div class="col-md-12">

                                    <div class="mb-3">

                                        <label class="form-label">
                                            Designation From
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="designationFrom"
                                               value="${editPromotion.designationFrom}"
                                               required>

                                    </div>

                                </div>

                                <!-- Designation To -->

                                <div class="col-md-12">

                                    <div class="mb-3">

                                        <label class="form-label">
                                            Designation To
                                        </label>

                                        <input type="text"
                                               class="form-control"
                                               name="designationTo"
                                               value="${editPromotion.designationTo}"
                                               required>

                                    </div>

                                </div>

                                <!-- Promotion Date -->

                                <div class="col-md-12">

                                    <div class="mb-3">

                                        <label class="form-label">
                                            Promotion Date
                                        </label>

                                        <div class="input-icon-end position-relative">

                                            <input type="text"
                                                   name="date"
                                                   class="form-control datetimepicker"
                                                   value="${editPromotion.date.dayOfMonth}-${editPromotion.date.monthValue}-${editPromotion.date.year}"
                                                   placeholder="dd-mm-yyyy"
                                                   autocomplete="off"
                                                   required>

                                            <span class="input-icon-addon">

                                                <i class="ti ti-calendar text-gray-7"></i>

                                            </span>

                                        </div>

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

        <script>

            document.addEventListener("DOMContentLoaded", function () {

                var modalElement =
                    document.getElementById("edit_promotion");

                if (modalElement) {

                    new bootstrap.Modal(modalElement).show();

                }

            });

        </script>

    </c:if>

    <!-- ================= DELETE MODAL ================= -->

    <div class="modal fade"
         id="delete_modal">

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

                        You want to delete this promotion.
                        This can't be undone once you delete.

                    </p>

                    <div class="d-flex justify-content-center">

                        <button type="button"
                                class="btn btn-light me-3"
                                data-bs-dismiss="modal">

                            Cancel

                        </button>

                        <form action="${pageContext.request.contextPath}/promotion"
                              method="post"
                              id="deletePromotionForm">

                            <input type="hidden"
                                   name="action"
                                   value="delete">

                            <input type="hidden"
                                   name="promotionId"
                                   id="deletePromotionId">

                            <button type="submit"
                                    class="btn btn-danger">

                                Yes, Delete

                            </button>

                        </form>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<!-- ================= JAVASCRIPT ================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/moment/moment.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<script>

    $(document).ready(function () {

        /*
         * Promotion Date Picker
         *
         * Format:
         * dd-mm-yyyy
         *
         * Example:
         * 24-09-2026
         */

        if ($.fn.datetimepicker) {

            $('.datetimepicker').datetimepicker({
                format: 'DD-MM-YYYY',
                useCurrent: false,
                icons: {
                    time: 'ti ti-clock',
                    date: 'ti ti-calendar',
                    up: 'ti ti-chevron-up',
                    down: 'ti ti-chevron-down',
                    previous: 'ti ti-chevron-left',
                    next: 'ti ti-chevron-right',
                    today: 'ti ti-calendar-event',
                    clear: 'ti ti-trash',
                    close: 'ti ti-x'
                }
            });

        }

        /*
         * Delete Promotion
         */

        document
            .querySelectorAll('[data-bs-target="#delete_modal"]')
            .forEach(function (button) {

                button.addEventListener("click", function () {

                    document.getElementById("deletePromotionId").value =
                        button.getAttribute("data-id");

                });

            });

        /*
         * Select All Promotions
         */

        var selectAll =
            document.getElementById("select-all");

        if (selectAll) {

            selectAll.addEventListener("change", function () {

                document
                    .querySelectorAll('input[name="selectedPromotion"]')
                    .forEach(function (checkbox) {

                        checkbox.checked =
                            selectAll.checked;

                    });

            });

        }

    });

</script>

</body>
</html>


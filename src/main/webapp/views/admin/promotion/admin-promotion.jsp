<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description"
          content="SmartHR Promotion">

    <meta name="robots"
          content="noindex, nofollow">

    <title>SmartHR - Promotion</title>


    <!-- FAVICON -->

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">


    <!-- THEME -->

    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>


    <!-- BOOTSTRAP -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">


    <!-- ICONS -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">


    <!-- DATE PICKER -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">


    <!-- DATATABLE -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">


    <!-- SELECT2 -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">


    <!-- MAIN CSS -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

</head>


<body>


<div class="main-wrapper">


    <!-- =========================================================
         HEADER
    ========================================================== -->

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



    <!-- =========================================================
         SIDEBAR
    ========================================================== -->

    <%@ include file="../adminSidebar.jsp" %>

<div class="page-wrapper">


        <div class="content">


            <!-- PAGE HEADER -->

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



            <!-- SUCCESS -->

            <c:if test="${not empty sessionScope.successMessage}">

                <div class="alert alert-success alert-dismissible fade show"
                     role="alert">

                    <c:out value="${sessionScope.successMessage}"/>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

                <c:remove var="successMessage"
                          scope="session"/>

            </c:if>



            <!-- ERROR -->

            <c:if test="${not empty sessionScope.errorMessage}">

                <div class="alert alert-danger alert-dismissible fade show"
                     role="alert">

                    <c:out value="${sessionScope.errorMessage}"/>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

                <c:remove var="errorMessage"
                          scope="session"/>

            </c:if>



            <!-- EMPLOYEE ERROR -->

            <c:if test="${not empty employeeLoadError}">

                <div class="alert alert-warning alert-dismissible fade show"
                     role="alert">

                    <c:out value="${employeeLoadError}"/>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

            </c:if>



            <!-- DESIGNATION ERROR -->

            <c:if test="${not empty designationLoadError}">

                <div class="alert alert-warning alert-dismissible fade show"
                     role="alert">

                    <c:out value="${designationLoadError}"/>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

            </c:if>



            <!-- =================================================
                 PROMOTION LIST
            ================================================== -->

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


                                        <span class="promotion-sort-label">

                                            Last 7 Days

                                        </span>

                                    </a>


                                    <ul class="dropdown-menu dropdown-menu-end p-3">


                                        <li>

                                            <a href="javascript:void(0);"
                                               class="dropdown-item rounded-1 promotion-sort"
                                               data-sort="date-desc">

                                                Last 7 Days

                                            </a>

                                        </li>


                                        <li>

                                            <a href="javascript:void(0);"
                                               class="dropdown-item rounded-1 promotion-sort"
                                               data-sort="recent">

                                                Recently Added

                                            </a>

                                        </li>


                                        <li>

                                            <a href="javascript:void(0);"
                                               class="dropdown-item rounded-1 promotion-sort"
                                               data-sort="asc">

                                                Ascending

                                            </a>

                                        </li>


                                        <li>

                                            <a href="javascript:void(0);"
                                               class="dropdown-item rounded-1 promotion-sort"
                                               data-sort="desc">

                                                Descending

                                            </a>

                                        </li>


                                    </ul>

                                </div>

                            </div>

                        </div>



                        <div class="card-body p-0">

                            <div class="table-responsive">


                                <table class="table datatable"
                                       id="promotionTable">


                                    <thead class="thead-light">


                                    <tr>


                                        <th>

                                            <div class="form-check form-check-md">

                                                <input class="form-check-input"
                                                       type="checkbox"
                                                       id="select-all">

                                            </div>

                                        </th>


                                        <th>
                                            Promoted Employee
                                        </th>


                                        <th>
                                            Department
                                        </th>


                                        <th>
                                            Designation From
                                        </th>


                                        <th>
                                            Designation To
                                        </th>


                                        <th>
                                            Promotion Date
                                        </th>


                                        <th></th>


                                    </tr>

                                    </thead>



                                    <tbody>


                                    <c:choose>


                                        <c:when test="${not empty promotions}">


                                            <c:forEach var="promotion"
                                                       items="${promotions}">


                                                <tr>


                                                    <!-- CHECKBOX -->

                                                    <td>

                                                        <div class="form-check form-check-md">

                                                            <input class="form-check-input"
                                                                   type="checkbox"
                                                                   name="selectedPromotion"
                                                                   value="${promotion.promotionId}">

                                                        </div>

                                                    </td>



                                                    <!-- EMPLOYEE -->

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

                                                                        <c:out value="${userMap[promotion.userId]}"/>

                                                                    </c:when>


                                                                    <c:otherwise>

                                                                        User #${promotion.userId}

                                                                    </c:otherwise>

                                                                </c:choose>


                                                            </h6>

                                                        </div>

                                                    </td>



                                                    <!-- DEPARTMENT -->

                                                    <td>

                                                        <c:choose>

                                                            <c:when test="${not empty departmentMap[promotion.userId]}">

                                                                <c:out value="${departmentMap[promotion.userId]}"/>

                                                            </c:when>


                                                            <c:otherwise>

                                                                -

                                                            </c:otherwise>

                                                        </c:choose>

                                                    </td>



                                                    <!-- DESIGNATION FROM -->

                                                    <td>

                                                        <c:out value="${promotion.designationFrom}"/>

                                                    </td>



                                                    <!-- DESIGNATION TO -->

                                                    <td>

                                                        <c:out value="${promotion.designationTo}"/>

                                                    </td>



                                                    <!-- DATE -->

                                                    <td>

                                                        <c:if test="${not empty promotion.date}">

                                                            ${promotion.date.dayOfMonth}-${promotion.date.monthValue}-${promotion.date.year}

                                                        </c:if>

                                                    </td>



                                                    <!-- ACTION -->

                                                    <td>

                                                        <div class="action-icon d-inline-flex">


                                                            <!-- EDIT -->

                                                            <a href="${pageContext.request.contextPath}/promotion?action=edit&id=${promotion.promotionId}"
                                                               class="me-2"
                                                               title="Edit">

                                                                <i class="ti ti-edit"></i>

                                                            </a>


                                                            <!-- DELETE -->

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



        <!-- FOOTER -->

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



    <!-- =========================================================
         ADD PROMOTION MODAL
    ========================================================== -->

    <div class="modal fade"
         id="new_promotion"
         tabindex="-1">

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


                            <!-- EMPLOYEE -->

                            <div class="col-md-12">

                                <div class="mb-3">


                                    <label class="form-label">

                                        Promotion For

                                    </label>


                                    <select class="select form-control promotion-select"
                                            name="userId"
                                            required>


                                        <option value="">

                                            Select Employee

                                        </option>


                                        <c:forEach var="entry"
                                                   items="${userMap}">


                                            <option value="${entry.key}">

                                                <c:out value="${entry.value}"/>

                                            </option>


                                        </c:forEach>


                                    </select>

                                </div>

                            </div>



                            <!-- =================================================
                                 DESIGNATION FROM
                            ================================================== -->

                            <div class="col-md-12">

                                <div class="mb-3">


                                    <label class="form-label">

                                        Designation From

                                    </label>


                                    <select class="select form-control promotion-select"
                                            name="designationFrom"
                                            required>


                                        <option value="">

                                            Select Designation

                                        </option>


                                        <c:forEach var="designation"
                                                   items="${designations}">


                                            <option value="${designation.name}">

                                                <c:out value="${designation.name}"/>

                                            </option>


                                        </c:forEach>


                                    </select>

                                </div>

                            </div>



                            <!-- =================================================
                                 DESIGNATION TO
                            ================================================== -->

                            <div class="col-md-12">

                                <div class="mb-3">


                                    <label class="form-label">

                                        Designation To

                                    </label>


                                    <select class="select form-control promotion-select"
                                            name="designationTo"
                                            required>


                                        <option value="">

                                            Select Designation

                                        </option>


                                        <c:forEach var="designation"
                                                   items="${designations}">


                                            <option value="${designation.name}">

                                                <c:out value="${designation.name}"/>

                                            </option>


                                        </c:forEach>


                                    </select>

                                </div>

                            </div>



                            <!-- =================================================
                                 PROMOTION DATE
                            ================================================== -->

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



    <!-- =========================================================
         EDIT PROMOTION MODAL
    ========================================================== -->

    <c:if test="${not empty editPromotion}">


        <div class="modal fade"
             id="edit_promotion"
             tabindex="-1">


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


                                <!-- EMPLOYEE -->

                                <div class="col-md-12">

                                    <div class="mb-3">


                                        <label class="form-label">

                                            Promotion For

                                        </label>


                                        <select class="select form-control promotion-select"
                                                name="userId"
                                                required>


                                            <option value="">

                                                Select Employee

                                            </option>


                                            <c:forEach var="entry"
                                                       items="${userMap}">


                                                <option value="${entry.key}"

                                                    <c:if test="${entry.key == editPromotion.userId}">

                                                        selected

                                                    </c:if>>

                                                    <c:out value="${entry.value}"/>

                                                </option>


                                            </c:forEach>


                                        </select>

                                    </div>

                                </div>



                                <!-- =================================================
                                     DESIGNATION FROM
                                ================================================== -->

                                <div class="col-md-12">

                                    <div class="mb-3">


                                        <label class="form-label">

                                            Designation From

                                        </label>


                                        <select class="select form-control promotion-select"
                                                name="designationFrom"
                                                required>


                                            <option value="">

                                                Select Designation

                                            </option>


                                            <c:forEach var="designation"
                                                       items="${designations}">


                                                <option value="${designation.name}"

                                                    <c:if test="${designation.name == editPromotion.designationFrom}">

                                                        selected

                                                    </c:if>>

                                                    <c:out value="${designation.name}"/>

                                                </option>


                                            </c:forEach>


                                        </select>

                                    </div>

                                </div>



                                <!-- =================================================
                                     DESIGNATION TO
                                ================================================== -->

                                <div class="col-md-12">

                                    <div class="mb-3">


                                        <label class="form-label">

                                            Designation To

                                        </label>


                                        <select class="select form-control promotion-select"
                                                name="designationTo"
                                                required>


                                            <option value="">

                                                Select Designation

                                            </option>


                                            <c:forEach var="designation"
                                                       items="${designations}">


                                                <option value="${designation.name}"

                                                    <c:if test="${designation.name == editPromotion.designationTo}">

                                                        selected

                                                    </c:if>>

                                                    <c:out value="${designation.name}"/>

                                                </option>


                                            </c:forEach>


                                        </select>

                                    </div>

                                </div>



                                <!-- PROMOTION DATE -->

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


        <!-- AUTO OPEN EDIT MODAL -->

        <script>

            document.addEventListener(
                "DOMContentLoaded",
                function () {

                    var modalElement =
                        document.getElementById(
                            "edit_promotion"
                        );


                    if (modalElement) {

                        var editModal =
                            new bootstrap.Modal(
                                modalElement
                            );

                        editModal.show();

                    }

                }
            );

        </script>


    </c:if>



    <!-- =========================================================
         DELETE MODAL
    ========================================================== -->

    <div class="modal fade"
         id="delete_modal"
         tabindex="-1">


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



<!-- =========================================================
     JAVASCRIPT
========================================================== -->


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


    /* =========================================================
       SELECT2
    ========================================================== */

    if ($.fn.select2) {

        $('.promotion-select').each(function () {

            var $select = $(this);

            /*
             * Destroy existing Select2 if already initialized
             */
            if ($select.hasClass("select2-hidden-accessible")) {

                $select.select2('destroy');

            }

            $select.select2({

                width: '100%',

                dropdownParent:
                    $select.closest('.modal')

            });

        });

    }



    /* =========================================================
       PROMOTION DATE PICKER
    ========================================================== */

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



    /* =========================================================
       DATATABLE
    ========================================================== */

    var promotionTable = null;


    if ($.fn.DataTable) {


        if (
            $.fn.dataTable.isDataTable(
                '#promotionTable'
            )
        ) {

            promotionTable =
                $('#promotionTable').DataTable();

        }

        else {

            promotionTable =
                $('#promotionTable').DataTable({

                    pageLength: 10,

                    lengthMenu: [

                        [10, 25, 50, 100],

                        [10, 25, 50, 100]

                    ],

                    order: [

                        [5, 'desc']

                    ],

                    columnDefs: [

                        {
                            orderable: false,
                            targets: [0, 6]
                        }

                    ]

                });

        }

    }



    /* =========================================================
       DATE RANGE FILTER
    ========================================================== */

    var filterStart = null;

    var filterEnd = null;


    if ($.fn.daterangepicker) {


        $('.bookingrange').daterangepicker({

            autoUpdateInput: true,

            startDate:
                moment().subtract(
                    6,
                    'days'
                ),

            endDate:
                moment(),

            locale: {

                format: 'MM/DD/YYYY',

                separator: ' - ',

                cancelLabel: 'Clear'

            }

        },


        function (start, end) {

            filterStart =
                start.clone().startOf('day');

            filterEnd =
                end.clone().endOf('day');


            if (promotionTable) {

                promotionTable.draw();

            }

        });


        /*
         * Initial last 7 days
         */
        filterStart =
            moment()
                .subtract(6, 'days')
                .startOf('day');


        filterEnd =
            moment()
                .endOf('day');

    }



    /* =========================================================
       DATATABLE CUSTOM DATE FILTER
    ========================================================== */

    $.fn.dataTable.ext.search.push(

        function (
            settings,
            data
        ) {


            if (!promotionTable) {

                return true;

            }


            if (
                settings.nTable !==
                document.getElementById(
                    'promotionTable'
                )
            ) {

                return true;

            }


            if (
                !filterStart ||
                !filterEnd
            ) {

                return true;

            }


            var dateText =
                $('<div>')
                    .html(data[5] || '')
                    .text()
                    .trim();


            if (!dateText) {

                return false;

            }


            var promotionDate =
                moment(

                    dateText,

                    [
                        'D-M-YYYY',
                        'DD-MM-YYYY',
                        'D-MM-YYYY',
                        'DD-M-YYYY'
                    ],

                    true

                );


            if (!promotionDate.isValid()) {

                return false;

            }


            promotionDate.startOf('day');


            return (

                promotionDate.valueOf()
                    >= filterStart.valueOf()

                &&

                promotionDate.valueOf()
                    <= filterEnd.valueOf()

            );

        }

    );



    /* =========================================================
       SORT DROPDOWN
    ========================================================== */

    $('.promotion-sort').on(
        'click',
        function () {


            if (!promotionTable) {

                return;

            }


            var sortType =
                $(this).data('sort');


            var label =
                $(this).text().trim();


            if (sortType === 'asc') {


                /*
                 * Oldest -> Newest
                 */
                promotionTable
                    .order([5, 'asc'])
                    .draw();

            }


            else if (sortType === 'desc') {


                /*
                 * Newest -> Oldest
                 */
                promotionTable
                    .order([5, 'desc'])
                    .draw();

            }


            else if (sortType === 'recent') {


                promotionTable
                    .order([5, 'desc'])
                    .draw();

            }


            else {


                /*
                 * Last 7 Days
                 */

                filterStart =
                    moment()
                        .subtract(
                            6,
                            'days'
                        )
                        .startOf('day');


                filterEnd =
                    moment()
                        .endOf('day');


                if ($.fn.daterangepicker) {


                    var rangePicker =
                        $('.bookingrange')
                            .data(
                                'daterangepicker'
                            );


                    if (rangePicker) {

                        rangePicker
                            .setStartDate(
                                filterStart
                            );


                        rangePicker
                            .setEndDate(
                                filterEnd
                            );

                    }

                }


                promotionTable
                    .order([5, 'desc'])
                    .draw();

            }


            $('.promotion-sort-label')
                .text(label);

        }

    );



    /* =========================================================
       DELETE PROMOTION
    ========================================================== */

    document
        .querySelectorAll(
            '[data-bs-target="#delete_modal"]'
        )
        .forEach(
            function (button) {


                button.addEventListener(
                    "click",
                    function () {


                        var promotionId =
                            button.getAttribute(
                                "data-id"
                            );


                        document.getElementById(
                            "deletePromotionId"
                        ).value =
                            promotionId;

                    }
                );

            }
        );



    /* =========================================================
       SELECT ALL
    ========================================================== */

    var selectAll =
        document.getElementById(
            "select-all"
        );


    if (selectAll) {


        selectAll.addEventListener(
            "change",
            function () {


                document
                    .querySelectorAll(
                        'input[name="selectedPromotion"]'
                    )
                    .forEach(
                        function (checkbox) {


                            checkbox.checked =
                                selectAll.checked;

                        }
                    );

            }
        );

    }


});

</script>


</body>

</html>

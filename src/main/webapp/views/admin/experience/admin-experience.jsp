<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn"
           uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Experience - HRMS</title>


    <!-- =========================================================
         BOOTSTRAP
         ========================================================= -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">


    <!-- =========================================================
         TABLER ICONS
         ========================================================= -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.min.css">


    <!-- =========================================================
         SELECT2
         ========================================================= -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">


    <!-- =========================================================
         DATATABLE
         ========================================================= -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">


    <!-- =========================================================
         DATEPICKER
         ========================================================= -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">


    <!-- =========================================================
         THEME
         ========================================================= -->

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">


    <style>



        /* =====================================================
           PAGE
           ===================================================== */

        .page-header {

            padding: 25px 30px 10px;
        }


        .content-area {

            padding: 10px 30px 30px;
        }


        .card {

            border: 1px solid #e5e7eb;

            box-shadow: 0 2px 10px rgba(0,0,0,0.03);
        }


        /* =====================================================
           PRIMARY BUTTON
           ===================================================== */

        .btn-primary {

            background: #ff5b1f;

            border-color: #ff5b1f;
        }


        .btn-primary:hover {

            background: #e64e15;

            border-color: #e64e15;
        }


        /* =====================================================
           STATUS
           ===================================================== */

        .status-active {

            display: inline-block;

            padding: 5px 12px;

            border-radius: 20px;

            background: #dcfce7;

            color: #15803d;

            font-size: 12px;

            font-weight: 600;
        }


        .status-completed {

            display: inline-block;

            padding: 5px 12px;

            border-radius: 20px;

            background: #e5e7eb;

            color: #475467;

            font-size: 12px;

            font-weight: 600;
        }


        /* =====================================================
           EMPLOYEE AVATAR
           ===================================================== */

        .employee-avatar {

            width: 38px;

            height: 38px;

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #fff1eb;

            color: #ff5b1f;

            font-weight: 600;
        }


        /* =====================================================
           SELECT2
           ===================================================== */

        .select2-container {

            width: 100% !important;
        }


        .select2-container .select2-selection--single {

            height: 38px;

            border: 1px solid #d0d5dd;

            border-radius: 6px;
        }


        .select2-container
        .select2-selection--single
        .select2-selection__rendered {

            line-height: 38px;

            padding-left: 12px;
        }


        .select2-container
        .select2-selection--single
        .select2-selection__arrow {

            height: 38px;
        }


        /* =====================================================
           MOBILE
           ===================================================== */

        }

    </style>

</head>


<body>


<!-- =========================================================
     SIDEBAR
     ========================================================= -->

<%@ include file="../adminSidebar.jsp" %>

<!-- =========================================================
     MAIN
     ========================================================= -->

<div class="page-wrapper">


    <!-- =====================================================
         HEADER
         ===================================================== -->

    <div class="page-header">

        <div class="d-md-flex
                    align-items-center
                    justify-content-between">


            <div>

                <h2 class="mb-1">

                    Experience

                </h2>


                <nav>

                    <ol class="breadcrumb mb-0">

                        <li class="breadcrumb-item">

                            <a href="${pageContext.request.contextPath}/admin-dashboard">

                                Home

                            </a>

                        </li>


                        <li class="breadcrumb-item active">

                            Experience

                        </li>

                    </ol>

                </nav>

            </div>


            <div>

                <button type="button"
                        class="btn btn-primary"
                        data-bs-toggle="modal"
                        data-bs-target="#new_experience">

                    <i class="ti ti-plus me-1"></i>

                    Add Experience

                </button>

            </div>

        </div>

    </div>



    <!-- =====================================================
         CONTENT
         ===================================================== -->

    <div class="content-area">


        <!-- =================================================
             SUCCESS
             ================================================= -->

        <c:if test="${not empty sessionScope.successMessage}">

            <div class="alert alert-success alert-dismissible fade show">

                <i class="ti ti-check me-2"></i>

                <c:out value="${sessionScope.successMessage}"/>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="alert">
                </button>

            </div>

            <c:remove var="successMessage"
                      scope="session"/>

        </c:if>



        <!-- =================================================
             ERROR
             ================================================= -->

        <c:if test="${not empty sessionScope.errorMessage}">

            <div class="alert alert-danger alert-dismissible fade show">

                <i class="ti ti-alert-circle me-2"></i>

                <c:out value="${sessionScope.errorMessage}"/>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="alert">
                </button>

            </div>

            <c:remove var="errorMessage"
                      scope="session"/>

        </c:if>



        <!-- =================================================
             EXPERIENCE LIST
             ================================================= -->

        <div class="card">

            <div class="card-header">

                <div>

                    <h5 class="mb-1">

                        Experience List

                    </h5>


                    <p class="text-muted mb-0">

                        Manage employee work experience

                    </p>

                </div>

            </div>


            <div class="card-body">

                <div class="table-responsive">

                    <table id="experienceTable"
                           class="table table-hover align-middle">

                        <thead>

                        <tr>

                            <th width="50">
                                #
                            </th>

                            <th>
                                Employee
                            </th>

                            <th>
                                Designation
                            </th>

                            <th>
                                Company
                            </th>

                            <th>
                                From Date
                            </th>

                            <th>
                                To Date
                            </th>

                            <th>
                                Status
                            </th>

                            <th class="text-end">
                                Action
                            </th>

                        </tr>

                        </thead>


                        <tbody>


                        <c:choose>

                            <c:when test="${not empty experiences}">


                                <c:forEach var="experience"
                                           items="${experiences}"
                                           varStatus="status">


                                    <tr>


                                        <!-- NUMBER -->

                                        <td>

                                            ${status.index + 1}

                                        </td>



                                        <!-- EMPLOYEE -->

                                        <td>

                                            <c:set var="employeeFound"
                                                     value="false"/>


                                            <c:forEach var="employee"
                                                       items="${employees}">

                                                <c:if test="${employee.userId == experience.userId}">

                                                    <div class="d-flex align-items-center">


                                                        <div class="employee-avatar me-2">

                                                            <c:choose>

                                                                <c:when test="${not empty employee.firstName}">

                                                                    ${fn:substring(employee.firstName,0,1)}

                                                                </c:when>

                                                                <c:otherwise>

                                                                    U

                                                                </c:otherwise>

                                                            </c:choose>

                                                        </div>


                                                        <div>

                                                            <h6 class="mb-0 fw-medium">

                                                                <c:out value="${employee.firstName}"/>

                                                                <c:if test="${not empty employee.lastName}">

                                                                    <c:out value=" ${employee.lastName}"/>

                                                                </c:if>

                                                            </h6>


                                                            <small class="text-muted">

                                                                <c:out value="${employee.departmentName}"/>

                                                            </small>

                                                        </div>

                                                    </div>


                                                    <c:set var="employeeFound"
                                                             value="true"/>

                                                </c:if>

                                            </c:forEach>


                                            <c:if test="${not employeeFound}">

                                                <span class="text-muted">

                                                    Employee #${experience.userId}

                                                </span>

                                            </c:if>

                                        </td>



                                        <!-- DESIGNATION -->

                                        <td>

                                            <c:out value="${experience.designationName}"/>

                                        </td>



                                        <!-- COMPANY -->

                                        <td>

                                            <c:out value="${experience.companyName}"/>

                                        </td>



                                        <!-- FROM DATE -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${not empty experience.fromDate}">

                                                    ${fn:substring(experience.fromDate,0,10)}

                                                </c:when>

                                                <c:otherwise>

                                                    -

                                                </c:otherwise>

                                            </c:choose>

                                        </td>



                                        <!-- TO DATE -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${not empty experience.toDate}">

                                                    ${fn:substring(experience.toDate,0,10)}

                                                </c:when>

                                                <c:otherwise>

                                                    -

                                                </c:otherwise>

                                            </c:choose>

                                        </td>



                                        <!-- STATUS -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${empty experience.toDate}">

                                                    <span class="status-active">

                                                        Active

                                                    </span>

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="status-completed">

                                                        Completed

                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>



                                        <!-- ACTION -->

                                        <td class="text-end">

                                            <div class="d-inline-flex">


                                                <!-- EDIT -->

                                                <a href="javascript:void(0);"

                                                   class="me-3 edit-experience"

                                                   data-bs-toggle="modal"

                                                   data-bs-target="#edit_experience"

                                                   data-id="${experience.experienceId}"

                                                   data-user-id="${experience.userId}"

                                                   data-designation="${fn:escapeXml(experience.designationName)}"

                                                   data-company="${fn:escapeXml(experience.companyName)}"

                                                   data-from-date="${not empty experience.fromDate ? fn:substring(experience.fromDate,0,10) : ''}"

                                                   data-to-date="${not empty experience.toDate ? fn:substring(experience.toDate,0,10) : ''}">

                                                    <i class="ti ti-edit text-primary"></i>

                                                </a>



                                                <!-- DELETE -->

                                                <a href="javascript:void(0);"

                                                   class="delete-experience"

                                                   data-bs-toggle="modal"

                                                   data-bs-target="#delete_experience"

                                                   data-id="${experience.experienceId}">

                                                    <i class="ti ti-trash text-danger"></i>

                                                </a>

                                            </div>

                                        </td>


                                    </tr>


                                </c:forEach>


                            </c:when>


                            <c:otherwise>

                                <tr>

                                    <td colspan="8"
                                        class="text-center py-5">

                                        <i class="ti ti-briefcase-off fs-1 text-muted"></i>


                                        <h6 class="mt-3">

                                            No experience records found.

                                        </h6>


                                        <p class="text-muted">

                                            Add employee experience using the button above.

                                        </p>

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



<!-- =========================================================
     ADD EXPERIENCE MODAL
     ========================================================= -->

<div class="modal fade"
     id="new_experience"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg">

        <div class="modal-content">


            <div class="modal-header">

                <h5 class="modal-title">

                    Add Experience

                </h5>


                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <form method="post"
                  action="${pageContext.request.contextPath}/experience">


                <input type="hidden"
                       name="action"
                       value="add">


                <div class="modal-body">

                    <div class="row">


                        <!-- EMPLOYEE -->

                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">

                                    Employee

                                    <span class="text-danger">*</span>

                                </label>


                                <select name="userId"
                                        id="addUserId"
                                        class="form-control select2"
                                        required>

                                    <option value="">

                                        Select Employee

                                    </option>


                                    <c:forEach var="employee"
                                               items="${employees}">

                                        <option value="${employee.userId}">

                                            <c:out value="${employee.firstName}"/>

                                            <c:if test="${not empty employee.lastName}">

                                                <c:out value=" ${employee.lastName}"/>

                                            </c:if>

                                            -

                                            <c:out value="${employee.departmentName}"/>

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>

                        </div>



                        <!-- DESIGNATION -->

                        <div class="col-md-6">

                            <div class="mb-3">

                                <label class="form-label">

                                    Designation

                                    <span class="text-danger">*</span>

                                </label>


                                <select name="designationName"
                                        id="addDesignation"
                                        class="form-control select2"
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



                        <!-- COMPANY -->

                        <div class="col-md-6">

                            <div class="mb-3">

                                <label class="form-label">

                                    Company Name

                                    <span class="text-danger">*</span>

                                </label>


                                <input type="text"

                                       name="companyName"

                                       class="form-control"

                                       placeholder="Enter company name"

                                       maxlength="100"

                                       required>

                            </div>

                        </div>



                        <!-- FROM DATE -->

                        <div class="col-md-6">

                            <div class="mb-3">

                                <label class="form-label">

                                    From Date

                                    <span class="text-danger">*</span>

                                </label>


                                <div class="input-icon-end position-relative">

                                    <input type="text"

                                           name="fromDate"

                                           class="form-control datetimepicker"

                                           placeholder="dd/mm/yyyy"

                                           autocomplete="off"

                                           required>


                                    <span class="input-icon-addon">

                                        <i class="ti ti-calendar"></i>

                                    </span>

                                </div>

                            </div>

                        </div>



                        <!-- TO DATE -->

                        <div class="col-md-6">

                            <div class="mb-3">

                                <label class="form-label">

                                    To Date

                                    <span class="text-danger">*</span>

                                </label>


                                <div class="input-icon-end position-relative">

                                    <input type="text"

                                           name="toDate"

                                           class="form-control datetimepicker"

                                           placeholder="dd/mm/yyyy"

                                           autocomplete="off"

                                           required>


                                    <span class="input-icon-addon">

                                        <i class="ti ti-calendar"></i>

                                    </span>

                                </div>

                            </div>

                        </div>


                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <button type="submit"
                            class="btn btn-primary">

                        <i class="ti ti-check me-1"></i>

                        Add Experience

                    </button>

                </div>


            </form>

        </div>

    </div>

</div>



<!-- =========================================================
     EDIT EXPERIENCE MODAL
     ========================================================= -->

<div class="modal fade"
     id="edit_experience"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-lg">

        <div class="modal-content">


            <div class="modal-header">

                <h5 class="modal-title">

                    Edit Experience

                </h5>


                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <form method="post"
                  action="${pageContext.request.contextPath}/experience">


                <input type="hidden"
                       name="action"
                       value="update">


                <input type="hidden"
                       name="experienceId"
                       id="editExperienceId">


                <div class="modal-body">

                    <div class="row">


                        <!-- EMPLOYEE -->

                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">

                                    Employee

                                    <span class="text-danger">*</span>

                                </label>


                                <select name="userId"
                                        id="editUserId"
                                        class="form-control select2"
                                        required>

                                    <option value="">

                                        Select Employee

                                    </option>


                                    <c:forEach var="employee"
                                               items="${employees}">

                                        <option value="${employee.userId}">

                                            <c:out value="${employee.firstName}"/>

                                            <c:if test="${not empty employee.lastName}">

                                                <c:out value=" ${employee.lastName}"/>

                                            </c:if>

                                            -

                                            <c:out value="${employee.departmentName}"/>

                                        </option>

                                    </c:forEach>

                                </select>

                            </div>

                        </div>



                        <!-- DESIGNATION -->

                        <div class="col-md-6">

                            <div class="mb-3">

                                <label class="form-label">

                                    Designation

                                    <span class="text-danger">*</span>

                                </label>


                                <select name="designationName"
                                        id="editDesignation"
                                        class="form-control select2"
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



                        <!-- COMPANY -->

                        <div class="col-md-6">

                            <div class="mb-3">

                                <label class="form-label">

                                    Company Name

                                    <span class="text-danger">*</span>

                                </label>


                                <input type="text"

                                       name="companyName"

                                       id="editCompany"

                                       class="form-control"

                                       maxlength="100"

                                       required>

                            </div>

                        </div>



                        <!-- FROM DATE -->

                        <div class="col-md-6">

                            <div class="mb-3">

                                <label class="form-label">

                                    From Date

                                    <span class="text-danger">*</span>

                                </label>


                                <div class="input-icon-end position-relative">

                                    <input type="text"

                                           name="fromDate"

                                           id="editFromDate"

                                           class="form-control datetimepicker"

                                           placeholder="dd/mm/yyyy"

                                           autocomplete="off"

                                           required>


                                    <span class="input-icon-addon">

                                        <i class="ti ti-calendar"></i>

                                    </span>

                                </div>

                            </div>

                        </div>



                        <!-- TO DATE -->

                        <div class="col-md-6">

                            <div class="mb-3">

                                <label class="form-label">

                                    To Date

                                    <span class="text-danger">*</span>

                                </label>


                                <div class="input-icon-end position-relative">

                                    <input type="text"

                                           name="toDate"

                                           id="editToDate"

                                           class="form-control datetimepicker"

                                           placeholder="dd/mm/yyyy"

                                           autocomplete="off"

                                           required>


                                    <span class="input-icon-addon">

                                        <i class="ti ti-calendar"></i>

                                    </span>

                                </div>

                            </div>

                        </div>


                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <button type="submit"
                            class="btn btn-primary">

                        <i class="ti ti-check me-1"></i>

                        Update Experience

                    </button>

                </div>


            </form>

        </div>

    </div>

</div>



<!-- =========================================================
     DELETE MODAL
     ========================================================= -->

<div class="modal fade"
     id="delete_experience"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-sm">

        <div class="modal-content">


            <div class="modal-header">

                <h5 class="modal-title">

                    Delete Experience

                </h5>


                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <form method="post"
                  action="${pageContext.request.contextPath}/experience">


                <input type="hidden"
                       name="action"
                       value="delete">


                <input type="hidden"
                       name="experienceId"
                       id="deleteExperienceId">


                <div class="modal-body text-center">

                    <div class="mb-3">

                        <i class="ti ti-trash"
                           style="font-size:50px;color:#dc3545;">
                        </i>

                    </div>


                    <h5>

                        Are you sure?

                    </h5>


                    <p class="text-muted mb-0">

                        Do you really want to delete
                        this experience record?

                    </p>

                </div>


                <div class="modal-footer justify-content-center">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <button type="submit"
                            class="btn btn-danger">

                        Delete

                    </button>

                </div>


            </form>

        </div>

    </div>

</div>



<!-- =========================================================
     JAVASCRIPT
     ========================================================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/moment/moment.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>



<script>

$(document).ready(function () {


    /* =========================================================
       SELECT2
       ========================================================= */

    $('.select2').each(function () {

        var modal = $(this).closest('.modal');

        $(this).select2({

            width: '100%',

            dropdownParent:
                modal.length
                    ? modal
                    : $(document.body)

        });

    });



    /* =========================================================
       DATATABLE
       ========================================================= */

    $('#experienceTable').DataTable({

        pageLength: 10,

        ordering: true,

        searching: true,

        lengthChange: true,

        language: {

            search: "",

            searchPlaceholder:
                "Search experience..."

        }

    });



    /* =========================================================
       DATE PICKER
       ========================================================= */

    if ($.fn.datetimepicker) {

        $('.datetimepicker').datetimepicker({

            format: 'DD/MM/YYYY',

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
       EDIT EXPERIENCE
       ========================================================= */

    $('.edit-experience').on('click', function () {


        var experienceId =
            $(this).attr('data-id');


        var userId =
            $(this).attr('data-user-id');


        var designation =
            $(this).attr('data-designation');


        var company =
            $(this).attr('data-company');


        var fromDate =
            $(this).attr('data-from-date');


        var toDate =
            $(this).attr('data-to-date');



        /* -----------------------------------------------------
           ID
           ----------------------------------------------------- */

        $('#editExperienceId')
            .val(experienceId || '');



        /* -----------------------------------------------------
           EMPLOYEE
           ----------------------------------------------------- */

        $('#editUserId')
            .val(userId || '')
            .trigger('change');



        /* -----------------------------------------------------
           DESIGNATION
           ----------------------------------------------------- */

        $('#editDesignation')
            .val(designation || '')
            .trigger('change');



        /* -----------------------------------------------------
           COMPANY
           ----------------------------------------------------- */

        $('#editCompany')
            .val(company || '');



        /* -----------------------------------------------------
           DATE
           ----------------------------------------------------- */

        $('#editFromDate')
            .val(formatDateForInput(fromDate));


        $('#editToDate')
            .val(formatDateForInput(toDate));

    });



    /* =========================================================
       DELETE EXPERIENCE
       ========================================================= */

    $('.delete-experience').on('click', function () {


        var experienceId =
            $(this).attr('data-id');


        $('#deleteExperienceId')
            .val(experienceId || '');

    });



    /* =========================================================
       DATE FORMAT
       ========================================================= */

    function formatDateForInput(value) {


        if (!value) {

            return '';

        }


        /*
         * Database:
         * 2026-09-11
         *
         * Input:
         * 11/09/2026
         */


        var parts =
            value.split('-');


        if (parts.length !== 3) {

            return value;

        }


        return parts[2]
            + '/'
            + parts[1]
            + '/'
            + parts[0];

    }

});

</script>


</body>

</html>

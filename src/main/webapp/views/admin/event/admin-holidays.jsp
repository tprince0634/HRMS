<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<!DOCTYPE html>
<html lang="en">

<head>

    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="HRMS - Holidays">
    <meta name="keywords" content="HRMS, Holidays, Events">
    <meta name="author" content="HRMS">

    <title>Holidays - HRMS</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <!-- Tabler Icon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.min.css">

    <!-- Feather CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/feather.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<!-- Main Wrapper -->
<div class="main-wrapper">

    <!-- Header -->
    <div class="header">

        <div class="main-header">

            <div class="header-left">
                <a href="${pageContext.request.contextPath}/admin-dashboard" class="logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                         alt="Logo">
                </a>

                <a href="${pageContext.request.contextPath}/admin-dashboard" class="logo-small">
                    <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg"
                         alt="Logo">
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

                    <div class="d-flex align-items-center">

                        <div class="me-2">
                            <span class="fw-medium">HRMS</span>
                        </div>

                    </div>

                </div>
            </div>

        </div>

    </div>
    <!-- /Header -->


    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">

        <div class="sidebar-inner slimscroll">

            <div id="sidebar-menu" class="sidebar-menu">

                <ul>

                    <li>
                        <a href="${pageContext.request.contextPath}/admin-dashboard">
                            <i class="ti ti-layout-dashboard"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>

                    <li class="submenu-open">
                        <h6 class="submenu-hdr">HRMS</h6>

                        <ul>

                            <li class="active">
                                <a href="${pageContext.request.contextPath}/admin/events">
                                    <i class="ti ti-calendar-event"></i>
                                    <span>Holidays</span>
                                </a>
                            </li>

                        </ul>

                    </li>

                </ul>

            </div>

        </div>

    </div>
    <!-- /Sidebar -->


    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <div class="content">

            <!-- Page Header -->
            <div class="page-header">

                <div class="row align-items-center">

                    <div class="col">

                        <h4 class="page-title">
                            Holidays
                        </h4>

                        <ul class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin-dashboard">
                                    Home
                                </a>
                            </li>

                            <li class="breadcrumb-item active">
                                Holidays
                            </li>
                        </ul>

                    </div>

                    <div class="col-auto">

                        <button type="button"
                                class="btn btn-primary"
                                data-bs-toggle="modal"
                                data-bs-target="#add_holiday">

                            <i class="ti ti-circle-plus me-1"></i>
                            Add Holiday

                        </button>

                    </div>

                </div>

            </div>
            <!-- /Page Header -->


            <!-- Error Message -->
            <c:if test="${not empty errorMessage}">

                <div class="alert alert-danger alert-dismissible fade show"
                     role="alert">

                    <c:out value="${errorMessage}"/>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

            </c:if>


            <!-- Success Message -->
            <c:if test="${not empty successMessage}">

                <div class="alert alert-success alert-dismissible fade show"
                     role="alert">

                    <c:out value="${successMessage}"/>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

            </c:if>


            <!-- Holidays List -->
            <div class="card">

                <div class="card-header">

                    <div class="row align-items-center">

                        <div class="col-sm-6">
                            <h5 class="card-title">
                                Holiday List
                            </h5>
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
                                               id="selectAll">
                                    </div>
                                </th>

                                <th>Title</th>

                                <th>Date</th>

                                <th>Event Type</th>

                                <th>Status</th>

                                <th>Action</th>

                            </tr>

                            </thead>


                            <tbody>

                            <c:choose>

                                <c:when test="${empty events}">

                                    <tr>

                                        <td colspan="6"
                                            class="text-center">

                                            No events found

                                        </td>

                                    </tr>

                                </c:when>


                                <c:otherwise>

                                    <c:forEach var="event"
                                               items="${events}">

                                        <tr>

                                            <!-- Checkbox -->
                                            <td>

                                                <div class="form-check form-check-md">

                                                    <input class="form-check-input event-checkbox"
                                                           type="checkbox"
                                                           value="${event.id}">

                                                </div>

                                            </td>


                                            <!-- Title -->
                                            <td>

                                                <h6 class="fw-medium mb-0">

                                                    <c:out value="${event.title}"/>

                                                </h6>

                                            </td>


                                            <!-- Date -->
                                            <td>

                                                <c:out value="${event.date}"/>

                                            </td>


                                            <!-- Event Type -->
                                            <td>

                                                <c:out value="${event.eventTypeId}"/>

                                            </td>


                                            <!-- Status -->
                                            <td>

                                                <c:choose>

                                                    <c:when test="${event.status == 'Active'}">

                                                        <span class="badge badge-success d-inline-flex align-items-center badge-sm">

                                                            <i class="ti ti-point-filled me-1"></i>

                                                            <c:out value="${event.status}"/>

                                                        </span>

                                                    </c:when>


                                                    <c:otherwise>

                                                        <span class="badge badge-danger d-inline-flex align-items-center badge-sm">

                                                            <i class="ti ti-point-filled me-1"></i>

                                                            <c:out value="${event.status}"/>

                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- Action -->
                                            <td>

                                                <div class="action-icon d-inline-flex">

                                                    <!-- Edit -->
                                                    <a href="${pageContext.request.contextPath}/admin/events?action=edit&id=${event.id}"
                                                       class="me-2">

                                                        <i class="ti ti-edit"></i>

                                                    </a>


                                                    <!-- Delete -->
                                                    <a href="javascript:void(0);"
                                                       class="delete-event-btn"
                                                       data-id="${event.id}"
                                                       data-bs-toggle="modal"
                                                       data-bs-target="#delete_modal">

                                                        <i class="ti ti-trash"></i>

                                                    </a>

                                                </div>

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
            <!-- /Holidays List -->

        </div>

    </div>
    <!-- /Page Wrapper -->

</div>
<!-- /Main Wrapper -->


<!-- ========================= -->
<!-- Add Holiday Modal -->
<!-- ========================= -->

<div class="modal fade"
     id="add_holiday"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-md">

        <div class="modal-content">

            <div class="modal-header">

                <h4 class="modal-title">
                    Add Holiday
                </h4>

                <button type="button"
                        class="btn-close custom-btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">

                    <i class="ti ti-x"></i>

                </button>

            </div>


            <form action="${pageContext.request.contextPath}/admin/events"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="add">


                <div class="modal-body pb-0">

                    <div class="row">

                        <!-- Title -->
                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">
                                    Title
                                </label>

                                <input type="text"
                                       name="title"
                                       class="form-control"
                                       required>

                            </div>

                        </div>


                        <!-- Date -->
                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">
                                    Date
                                </label>

                                <div class="input-icon-end position-relative">

                                    <input type="text"
                                           name="date"
                                           class="form-control datetimepicker"
                                           required>

                                    <span class="input-icon-addon">

                                        <i class="ti ti-calendar text-gray-7"></i>

                                    </span>

                                </div>

                            </div>

                        </div>


                        <!-- Event Type -->
                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">
                                    Event Type ID
                                </label>

                                <input type="number"
                                       name="eventTypeId"
                                       class="form-control"
                                       min="1"
                                       required>

                            </div>

                        </div>


                        <!-- Status -->
                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">
                                    Status
                                </label>

                                <select name="status"
                                        class="select"
                                        required>

                                    <option value="Active">
                                        Active
                                    </option>

                                    <option value="Inactive">
                                        Inactive
                                    </option>

                                </select>

                            </div>

                        </div>

                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light me-2"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>

                    <button type="submit"
                            class="btn btn-primary">

                        Add Holiday

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>
<!-- /Add Holiday Modal -->


<!-- ========================= -->
<!-- Edit Holiday Modal -->
<!-- ========================= -->

<div class="modal fade"
     id="edit_holiday"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered modal-md">

        <div class="modal-content">

            <div class="modal-header">

                <h4 class="modal-title">
                    Edit Holiday
                </h4>

                <button type="button"
                        class="btn-close custom-btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">

                    <i class="ti ti-x"></i>

                </button>

            </div>


            <form action="${pageContext.request.contextPath}/admin/events"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="update">


                <input type="hidden"
                       name="id"
                       value="${event.id}">


                <div class="modal-body pb-0">

                    <div class="row">

                        <!-- Title -->
                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">
                                    Title
                                </label>

                                <input type="text"
                                       name="title"
                                       class="form-control"
                                       value="<c:out value='${event.title}'/>"
                                       required>

                            </div>

                        </div>


                        <!-- Date -->
                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">
                                    Date
                                </label>

                                <div class="input-icon-end position-relative">

                                    <input type="text"
                                           name="date"
                                           class="form-control datetimepicker"
                                           value="<c:out value='${event.date}'/>"
                                           required>

                                    <span class="input-icon-addon">

                                        <i class="ti ti-calendar text-gray-7"></i>

                                    </span>

                                </div>

                            </div>

                        </div>


                        <!-- Event Type -->
                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">
                                    Event Type ID
                                </label>

                                <input type="number"
                                       name="eventTypeId"
                                       class="form-control"
                                       min="1"
                                       value="${event.eventTypeId}"
                                       required>

                            </div>

                        </div>


                        <!-- Status -->
                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">
                                    Status
                                </label>

                                <select name="status"
                                        class="select"
                                        required>

                                    <option value="Active"
                                            ${event.status == 'Active' ? 'selected' : ''}>
                                        Active
                                    </option>

                                    <option value="Inactive"
                                            ${event.status == 'Inactive' ? 'selected' : ''}>
                                        Inactive
                                    </option>

                                </select>

                            </div>

                        </div>

                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light me-2"
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
<!-- /Edit Holiday Modal -->


<!-- ========================= -->
<!-- Delete Holiday Modal -->
<!-- ========================= -->

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

                    You want to delete this event?
                    This can't be undone.

                </p>


                <div class="d-flex justify-content-center">

                    <button type="button"
                            class="btn btn-light me-3"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <a href="#"
                       id="confirmDeleteButton"
                       class="btn btn-danger">

                        Yes, Delete

                    </a>

                </div>

            </div>

        </div>

    </div>

</div>
<!-- /Delete Holiday Modal -->


<!-- ========================= -->
<!-- JavaScript -->
<!-- ========================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<!-- ========================= -->
<!-- Dynamic Edit Modal -->
<!-- ========================= -->

<c:if test="${not empty event}">

    <script>

        document.addEventListener("DOMContentLoaded", function () {

            var editModalElement =
                document.getElementById("edit_holiday");

            if (editModalElement) {

                var editModal =
                    new bootstrap.Modal(editModalElement);

                editModal.show();

            }

        });

    </script>

</c:if>


<!-- ========================= -->
<!-- Dynamic Delete Modal -->
<!-- ========================= -->

<script>

    document.addEventListener("DOMContentLoaded", function () {

        const deleteButtons =
            document.querySelectorAll(".delete-event-btn");

        const confirmDeleteButton =
            document.getElementById("confirmDeleteButton");


        deleteButtons.forEach(function (button) {

            button.addEventListener("click", function () {

                const eventId =
                    this.getAttribute("data-id");


                const deleteUrl =
                    "${pageContext.request.contextPath}/admin/events?action=delete&id="
                    + eventId;


                confirmDeleteButton.setAttribute(
                    "href",
                    deleteUrl
                );

            });

        });

    });

</script>


<!-- ========================= -->
<!-- Select All -->
<!-- ========================= -->

<script>

    document.addEventListener("DOMContentLoaded", function () {

        const selectAll =
            document.getElementById("selectAll");

        const checkboxes =
            document.querySelectorAll(".event-checkbox");


        if (selectAll) {

            selectAll.addEventListener("change", function () {

                checkboxes.forEach(function (checkbox) {

                    checkbox.checked =
                        selectAll.checked;

                });

            });

        }

    });

</script>


</body>
</html>

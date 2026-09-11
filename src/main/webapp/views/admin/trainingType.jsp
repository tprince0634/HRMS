<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
    String trainingTypeUrl =
            request.getContextPath() + "/training-type";

    java.util.List<models.Trainers.TrainingType> trainingTypes =
            (java.util.List<models.Trainers.TrainingType>)
                    request.getAttribute("trainingTypes");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Training Type</title>


    <!-- ===================================================== -->
    <!-- BOOTSTRAP -->
    <!-- ===================================================== -->

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">


    <!-- ===================================================== -->
    <!-- FEATHER -->
    <!-- ===================================================== -->

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/plugins/icons/feather/feather.css">


    <!-- ===================================================== -->
    <!-- TABLER -->
    <!-- ===================================================== -->

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/plugins/tabler-icons/tabler-icons.css">


    <!-- ===================================================== -->
    <!-- FONT AWESOME -->
    <!-- ===================================================== -->

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/plugins/fontawesome/css/all.min.css">


    <!-- ===================================================== -->
    <!-- DATATABLES -->
    <!-- ===================================================== -->

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/dataTables.bootstrap5.min.css">


    <!-- ===================================================== -->
    <!-- MAIN CSS -->
    <!-- ===================================================== -->

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/style.css">


    <!-- ===================================================== -->
    <!-- SIDEBAR SCROLL -->
    <!-- ===================================================== -->

    <style>

        .sidebar {
            height: 100vh !important;
            overflow-y: auto !important;
            overflow-x: hidden !important;
        }

        .sidebar-menu {
            height: auto !important;
            overflow: visible !important;
        }

        .sidebar::-webkit-scrollbar {
            width: 5px;
        }

        .sidebar::-webkit-scrollbar-thumb {
            background: #ccc;
            border-radius: 10px;
        }

        .sidebar-menu li.submenu > ul {
            display: none !important;
        }

        .sidebar-menu li.submenu.active > ul {
            display: block !important;
        }

        .sidebar-menu li.submenu > a .menu-arrow {
            transition: transform 0.2s ease;
        }

        .sidebar-menu li.submenu.active > a .menu-arrow {
            transform: rotate(90deg);
        }

    </style>

</head>


<body>

<div class="main-wrapper">


    <!-- ===================================================== -->
    <!-- HEADER -->
    <!-- ===================================================== -->

    <%@ include file="adminHeader.jsp" %>


    <!-- ===================================================== -->
    <!-- SIDEBAR -->
    <!-- ===================================================== -->

    <%@ include file="adminSidebar.jsp" %>


    <!-- ===================================================== -->
    <!-- PAGE WRAPPER -->
    <!-- ===================================================== -->

    <div class="page-wrapper">

        <div class="content">


            <!-- ================================================= -->
            <!-- BREADCRUMB -->
            <!-- ================================================= -->

            <div class="d-md-flex d-block align-items-center
                        justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">
                        Training Type
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">

                                <a href="<%= request.getContextPath() %>/Admin/dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>

                            <li class="breadcrumb-item">
                                Training
                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Training Type

                            </li>

                        </ol>

                    </nav>

                </div>


                <!-- ================================================= -->
                <!-- ADD TRAINING TYPE -->
                <!-- ================================================= -->

                <div class="d-flex my-xl-auto right-content
                            align-items-center flex-wrap">

                    <div class="mb-2">

                        <a href="<%= request.getContextPath() %>/training-type/add"
                           class="btn btn-primary d-flex align-items-center">

                            <i class="ti ti-circle-plus me-2"></i>

                            Add Training Type

                        </a>

                    </div>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- TRAINING TYPE CARD -->
            <!-- ================================================= -->

            <div class="card">


                <!-- ================================================= -->
                <!-- CARD HEADER -->
                <!-- ================================================= -->

                <div class="card-header d-flex align-items-center
                            justify-content-between flex-wrap row-gap-3">

                    <h5 class="mb-0">
                        Training Type List
                    </h5>


                    <!-- ================================================= -->
                    <!-- SORT -->
                    <!-- ================================================= -->

                    <div class="d-flex my-xl-auto right-content
                                align-items-center flex-wrap row-gap-3">

                        <div class="dropdown">

                            <button type="button"
                                    id="sortDropdown"
                                    class="dropdown-toggle btn btn-white
                                           d-inline-flex align-items-center"
                                    data-bs-toggle="dropdown">

                                Sort By : Recently Added

                            </button>


                            <ul class="dropdown-menu dropdown-menu-end p-3">

                                <li>

                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1"
                                       id="sortRecent">

                                        Recently Added

                                    </a>

                                </li>


                                <li>

                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1"
                                       id="sortAscending">

                                        Ascending

                                    </a>

                                </li>


                                <li>

                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1"
                                       id="sortDescending">

                                        Descending

                                    </a>

                                </li>

                            </ul>

                        </div>

                    </div>

                </div>


                <!-- ================================================= -->
                <!-- TABLE -->
                <!-- ================================================= -->

                <div class="card-body p-0">

                    <div class="custom-datatable-filter table-responsive">

                        <table class="table datatable">

                            <thead class="thead-light">

                            <tr>


                                <!-- CHECKBOX -->

                                <th class="no-sort">

                                    <div class="form-check form-check-md">

                                        <input class="form-check-input"
                                               type="checkbox"
                                               id="select-all">

                                    </div>

                                </th>


                                <!-- ID -->

                                <th>
                                    ID
                                </th>


                                <!-- TRAINING TYPE -->

                                <th>
                                    Type
                                </th>


                                <!-- DESCRIPTION -->

                                <th>
                                    Description
                                </th>


                                <!-- STATUS -->

                                <th>
                                    Status
                                </th>


                                <!-- ACTION -->

                                <th class="no-sort">
                                    Action
                                </th>

                            </tr>

                            </thead>


                            <tbody>


                            <%

                                if (trainingTypes != null &&
                                        !trainingTypes.isEmpty()) {

                                    for (models.Trainers.TrainingType trainingType
                                            : trainingTypes) {

                            %>


                            <tr>


                                <!-- ================================================= -->
                                <!-- CHECKBOX -->
                                <!-- ================================================= -->

                                <td>

                                    <div class="form-check form-check-md">

                                        <input class="form-check-input"
                                               type="checkbox">

                                    </div>

                                </td>


                                <!-- ================================================= -->
                                <!-- ID -->
                                <!-- ================================================= -->

                                <td>

                                    <%= trainingType.getTrainingTypeId() %>

                                </td>


                                <!-- ================================================= -->
                                <!-- TYPE -->
                                <!-- ================================================= -->

                                <td>

                                    <%= trainingType.getTrainingTypeName() %>

                                </td>


                                <!-- ================================================= -->
                                <!-- DESCRIPTION -->
                                <!-- ================================================= -->

                                <td>

                                    <%= trainingType.getDescription() %>

                                </td>


                                <!-- ================================================= -->
                                <!-- STATUS -->
                                <!-- ================================================= -->

                                <td>

                                    <%

                                        if ("Active".equalsIgnoreCase(
                                                trainingType.getStatus())) {

                                    %>


                                    <span class="badge badge-success
                                                 d-inline-flex align-items-center
                                                 badge-xs">

                                        <i class="ti ti-point-filled me-1"></i>

                                        Active

                                    </span>


                                    <%

                                    } else {

                                    %>


                                    <span class="badge badge-danger
                                                 d-inline-flex align-items-center
                                                 badge-xs">

                                        <i class="ti ti-point-filled me-1"></i>

                                        <%= trainingType.getStatus() %>

                                    </span>


                                    <%

                                        }

                                    %>

                                </td>


                                <!-- ================================================= -->
                                <!-- ACTION -->
                                <!-- ================================================= -->

                                <td>

                                    <div class="d-flex align-items-center">


                                        <!-- EDIT -->

                                        <a href="javascript:void(0);"
                                           class="btn btn-sm btn-primary me-2"
                                           data-bs-toggle="modal"
                                           data-bs-target="#edit_training_type_<%= trainingType.getTrainingTypeId() %>">

                                            <i class="ti ti-edit me-1"></i>

                                            Edit

                                        </a>


                                        <!-- DELETE -->

                                        <a href="javascript:void(0);"
                                           class="btn btn-sm btn-danger"
                                           data-bs-toggle="modal"
                                           data-bs-target="#delete_training_type_<%= trainingType.getTrainingTypeId() %>">

                                            <i class="ti ti-trash me-1"></i>

                                            Delete

                                        </a>

                                    </div>

                                </td>

                            </tr>


                            <%

                                }

                            } else {

                            %>


                            <tr>

                                <td colspan="6"
                                    class="text-center py-4">

                                    No Training Types Found

                                </td>

                            </tr>


                            <%

                                }

                            %>


                            </tbody>

                        </table>

                    </div>

                </div>

            </div>

        </div>


        <!-- ===================================================== -->
        <!-- FOOTER -->
        <!-- ===================================================== -->

        <div class="footer d-sm-flex align-items-center
                    justify-content-between border-top bg-white p-3">

            <p class="mb-0">
                HRMS
            </p>

            <p class="mb-0">
                Human Resource Management System
            </p>

        </div>

    </div>

</div>


<!-- ========================================================= -->
<!-- EDIT MODALS -->
<!-- ========================================================= -->

<%

    if (trainingTypes != null) {

        for (models.Trainers.TrainingType trainingType
                : trainingTypes) {

%>


<div class="modal fade"
     id="edit_training_type_<%= trainingType.getTrainingTypeId() %>"
     tabindex="-1"
     aria-hidden="true">


    <div class="modal-dialog modal-dialog-centered modal-md">

        <div class="modal-content">


            <!-- ================================================= -->
            <!-- MODAL HEADER -->
            <!-- ================================================= -->

            <div class="modal-header">

                <h4 class="modal-title">
                    Edit Training Type
                </h4>


                <button type="button"
                        class="btn-close custom-btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">

                    <i class="ti ti-x"></i>

                </button>

            </div>


            <!-- ================================================= -->
            <!-- EDIT FORM -->
            <!-- ================================================= -->

            <form action="<%= trainingTypeUrl %>"
                  method="post">


                <input type="hidden"
                       name="action"
                       value="update">


                <input type="hidden"
                       name="trainingTypeId"
                       value="<%= trainingType.getTrainingTypeId() %>">


                <div class="modal-body pb-0">

                    <div class="row">


                        <!-- ================================================= -->
                        <!-- TRAINING TYPE NAME -->
                        <!-- ================================================= -->

                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">

                                    Type

                                </label>


                                <input type="text"
                                       name="trainingTypeName"
                                       class="form-control"
                                       value="<%= trainingType.getTrainingTypeName() %>"
                                       required>

                            </div>

                        </div>


                        <!-- ================================================= -->
                        <!-- DESCRIPTION -->
                        <!-- ================================================= -->

                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">

                                    Description

                                </label>


                                <textarea name="description"
                                          class="form-control"
                                          rows="4"
                                          required><%= trainingType.getDescription() %></textarea>

                            </div>

                        </div>


                        <!-- ================================================= -->
                        <!-- STATUS -->
                        <!-- ================================================= -->

                        <div class="col-md-12">

                            <div class="mb-3">

                                <label class="form-label">

                                    Status

                                </label>


                                <select name="status"
                                        class="form-select"
                                        required>


                                    <option value="Active"
                                            <%= "Active".equalsIgnoreCase(
                                                    trainingType.getStatus())
                                                    ? "selected" : "" %>>

                                        Active

                                    </option>


                                    <option value="InActive"
                                            <%= "InActive".equalsIgnoreCase(
                                                    trainingType.getStatus())
                                                    ? "selected" : "" %>>

                                        InActive

                                    </option>


                                </select>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- ================================================= -->
                <!-- MODAL FOOTER -->
                <!-- ================================================= -->

                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light me-2"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <button type="submit"
                            class="btn btn-primary">

                        <i class="ti ti-device-floppy me-1"></i>

                        Save Changes

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>


<%

        }

    }

%>


<!-- ========================================================= -->
<!-- DELETE MODALS -->
<!-- ========================================================= -->

<%

    if (trainingTypes != null) {

        for (models.Trainers.TrainingType trainingType
                : trainingTypes) {

%>


<div class="modal fade"
     id="delete_training_type_<%= trainingType.getTrainingTypeId() %>"
     tabindex="-1"
     aria-hidden="true">


    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">


            <div class="modal-body text-center">


                <!-- ================================================= -->
                <!-- DELETE ICON -->
                <!-- ================================================= -->

                <span class="avatar avatar-xl
                             bg-transparent-danger
                             text-danger mb-3">

                    <i class="ti ti-trash-x fs-36"></i>

                </span>


                <!-- ================================================= -->
                <!-- TITLE -->
                <!-- ================================================= -->

                <h4 class="mb-1">

                    Confirm Delete

                </h4>


                <!-- ================================================= -->
                <!-- MESSAGE -->
                <!-- ================================================= -->

                <p class="mb-3">

                    You want to delete

                    <strong>

                        <%= trainingType.getTrainingTypeName() %>

                    </strong>.

                    This can't be undone once you delete.

                </p>


                <!-- ================================================= -->
                <!-- BUTTONS -->
                <!-- ================================================= -->

                <div class="d-flex justify-content-center">


                    <!-- CANCEL -->

                    <button type="button"
                            class="btn btn-light me-3"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <!-- DELETE FORM -->

                    <form action="<%= trainingTypeUrl %>"
                          method="post"
                          class="d-inline">


                        <input type="hidden"
                               name="action"
                               value="delete">


                        <input type="hidden"
                               name="trainingTypeId"
                               value="<%= trainingType.getTrainingTypeId() %>">


                        <button type="submit"
                                class="btn btn-danger">

                            <i class="ti ti-trash me-1"></i>

                            Yes, Delete

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>


<%

        }

    }

%>


<!-- ========================================================= -->
<!-- JAVASCRIPT -->
<!-- ========================================================= -->


<script src="<%= request.getContextPath() %>/assets/js/jquery-3.7.1.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/feather.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/jquery.slimscroll.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/jquery.dataTables.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/script.js"></script>


<!-- ========================================================= -->
<!-- DATATABLE + SORT -->
<!-- ========================================================= -->

<script>

    $(document).ready(function () {


        // =====================================================
        // GET DATATABLE
        // =====================================================

        var table = $('.datatable').DataTable();


        // =====================================================
        // ROWS PER PAGE = 5
        // =====================================================

        var lengthSelect =
            $('.dataTables_length select');


        if (lengthSelect.find('option[value="5"]').length === 0) {

            lengthSelect.prepend(
                '<option value="5">5</option>'
            );

        }


        lengthSelect.val('5');


        table.page.len(5).draw();


        // =====================================================
        // RECENTLY ADDED
        // =====================================================

        $('#sortRecent').on('click', function () {

            table.order([1, 'desc']).draw();

            $('#sortDropdown').text(
                'Sort By : Recently Added'
            );

        });


        // =====================================================
        // ASCENDING
        // =====================================================

        $('#sortAscending').on('click', function () {

            table.order([2, 'asc']).draw();

            $('#sortDropdown').text(
                'Sort By : Ascending'
            );

        });


        // =====================================================
        // DESCENDING
        // =====================================================

        $('#sortDescending').on('click', function () {

            table.order([2, 'desc']).draw();

            $('#sortDropdown').text(
                'Sort By : Descending'
            );

        });


        // =====================================================
        // SELECT ALL
        // =====================================================

        $('#select-all').on('change', function () {

            $('.datatable tbody input[type="checkbox"]')
                .prop(
                    'checked',
                    this.checked
                );

        });


        // =====================================================
        // UPDATE SELECT ALL CHECKBOX
        // =====================================================

        $('.datatable tbody').on(
            'change',
            'input[type="checkbox"]',
            function () {

                var total =
                    $('.datatable tbody input[type="checkbox"]').length;

                var checked =
                    $('.datatable tbody input[type="checkbox"]:checked').length;

                $('#select-all').prop(
                    'checked',
                    total > 0 && total === checked
                );

            }
        );

    });

</script>


<!-- ========================================================= -->
<!-- SIDEBAR -->
<!-- ========================================================= -->

<script>

    (function () {

        function initHRMSSidebar() {

            var sidebar =
                document.querySelector('.sidebar-menu');

            if (!sidebar) {
                return;
            }


            sidebar.addEventListener(
                'click',
                function (event) {

                    var link =
                        event.target.closest(
                            'li.submenu > a'
                        );


                    if (!link ||
                        !sidebar.contains(link)) {

                        return;

                    }


                    event.preventDefault();

                    event.stopPropagation();


                    var currentItem =
                        link.parentElement;

                    var parentList =
                        currentItem.parentElement;

                    var isOpen =
                        currentItem.classList.contains(
                            'active'
                        );


                    Array.prototype.forEach.call(
                        parentList.children,
                        function (item) {

                            if (item !== currentItem &&
                                item.classList.contains(
                                    'submenu'
                                )) {

                                item.classList.remove(
                                    'active'
                                );

                            }

                        }
                    );


                    currentItem.classList.toggle(
                        'active',
                        !isOpen
                    );

                }
            );

        }


        if (document.readyState === 'loading') {

            document.addEventListener(
                'DOMContentLoaded',
                initHRMSSidebar
            );

        } else {

            initHRMSSidebar();

        }

    })();

</script>


</body>

</html>
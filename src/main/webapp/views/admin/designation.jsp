<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.model.Designation" %>

<%
    String contextPath = request.getContextPath();

    List<Designation> designations =
            (List<Designation>) request.getAttribute("designations");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Designations - Pulse360</title>


    <!-- Bootstrap -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">


    <!-- Bootstrap Icons -->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <style>

        * {
            box-sizing: border-box;
        }


        html,
        body {
            margin: 0;
            padding: 0;
            width: 100%;
            min-height: 100%;
        }


        body {
            background: #f7f7f8;
            font-family: Arial, Helvetica, sans-serif;
            color: #333;
        }


        /* =====================================================
           MAIN PAGE
           ===================================================== */

        .main {
            width: 100%;
            min-height: 100vh;
        }


        /* =====================================================
           TOP BAR
           ===================================================== */

        .topbar {
            width: 100%;
            height: 70px;

            background: #ffffff;

            border-bottom: 1px solid #eeeeee;

            display: flex;
            align-items: center;

            padding: 0 30px;
        }


        .search-box {
            width: 390px;
            height: 58px;

            border: 1px solid #e5e5e5;

            border-radius: 7px;

            padding: 0 18px;

            font-size: 16px;

            outline: none;
        }


        .search-box:focus {
            border-color: #ff6b00;
        }


        /* =====================================================
           CONTENT
           ===================================================== */

        .content {
            width: 100%;

            padding: 45px 55px;
        }


        /* =====================================================
           PAGE HEADER
           ===================================================== */

        .page-header {

            display: flex;

            align-items: center;

            justify-content: space-between;

            margin-bottom: 30px;
        }


        .page-title {

            margin: 0;

            font-size: 36px;

            font-weight: 600;

            color: #202020;
        }


        .breadcrumb {

            margin-top: 10px;

            margin-bottom: 0;

            font-size: 16px;

            color: #333;
        }


        .breadcrumb i {

            font-size: 15px;

            color: #444;
        }


        /* =====================================================
           BUTTONS
           ===================================================== */

        .btn-orange {

            background: #ff6b00;

            color: #ffffff;

            border: 1px solid #ff6b00;

            border-radius: 8px;

            padding: 11px 18px;

            font-size: 16px;

            font-weight: 500;
        }


        .btn-orange:hover {

            background: #e85f00;

            border-color: #e85f00;

            color: #ffffff;
        }


        .export-btn {

            background: #ffffff;

            border: 1px solid #dddddd;

            border-radius: 8px;

            padding: 11px 18px;

            font-size: 16px;

            color: #222;
        }


        .export-btn:hover {

            background: #f5f5f5;
        }


        /* =====================================================
           CARD
           ===================================================== */

        .card-custom {

            width: 100%;

            background: #ffffff;

            border: 1px solid #e8e8e8;

            border-radius: 9px;

            overflow: hidden;
        }


        .card-title {

            padding: 27px 28px;

            font-size: 22px;

            font-weight: 600;

            color: #222;

            border-bottom: 1px solid #eeeeee;
        }


        /* =====================================================
           FILTER AREA
           ===================================================== */

        .filters {

            padding: 18px 25px;

            display: flex;

            justify-content: space-between;

            align-items: center;

            gap: 20px;

            background: #ffffff;
        }


        .entries-area {

            display: flex;

            align-items: center;

            gap: 9px;

            font-size: 16px;
        }


        .entries-area strong {

            font-weight: 600;
        }


        .page-size {

            width: 90px;

            height: 48px;

            border-radius: 7px;

            font-size: 16px;
        }


        .search-area {

            display: flex;

            align-items: center;

            gap: 10px;

            font-size: 16px;
        }


        .table-search {

            width: 285px;

            height: 48px;

            border: 1px solid #dddddd;

            border-radius: 7px;

            padding: 0 15px;

            font-size: 16px;

            outline: none;
        }


        .table-search:focus {

            border-color: #ff6b00;
        }


        /* =====================================================
           TABLE
           ===================================================== */

        .table-container {

            width: 100%;

            overflow-x: auto;
        }


        .designation-table {

            width: 100%;

            min-width: 950px;

            margin: 0;
        }


        .designation-table thead th {

            background: #e9ecef;

            color: #202020;

            padding: 17px 25px;

            font-size: 16px;

            font-weight: 600;

            white-space: nowrap;

            border-bottom: 1px solid #dddddd;
        }


        .designation-table tbody td {

            padding: 19px 25px;

            font-size: 16px;

            color: #222;

            vertical-align: middle;

            border-bottom: 1px solid #eeeeee;

            white-space: nowrap;
        }


        .designation-table tbody tr:last-child td {

            border-bottom: none;
        }


        .designation-table tbody tr:hover {

            background: #fafafa;
        }


        /* =====================================================
           STATUS
           ===================================================== */

        .status {

            display: inline-block;

            padding: 7px 13px;

            border-radius: 5px;

            font-size: 13px;

            font-weight: 600;

            min-width: 75px;

            text-align: center;
        }


        .status-active {

            background: #20c76b;

            color: #ffffff;
        }


        .status-inactive {

            background: #ef233c;

            color: #ffffff;
        }


        /* =====================================================
           ACTION BUTTON
           ===================================================== */

        .edit-btn {

            width: 40px;

            height: 40px;

            border: none;

            border-radius: 6px;

            background: #f7f7f7;

            color: #222;

            margin-right: 5px;

            cursor: pointer;
        }


        .edit-btn:hover {

            background: #eeeeee;
        }


        .delete-btn {

            width: 40px;

            height: 40px;

            border: none;

            background: transparent;

            color: #333;

            cursor: pointer;
        }


        .delete-btn:hover {

            color: #ff6b00;
        }


        /* =====================================================
           PAGINATION
           ===================================================== */

        .pagination-area {

            padding: 20px 25px;

            border-top: 1px solid #eeeeee;

            display: flex;

            justify-content: space-between;

            align-items: center;

            gap: 20px;

            flex-wrap: wrap;
        }


        #paginationInfo {

            font-size: 15px;

            color: #555;
        }


        .pagination-buttons {

            display: flex;

            align-items: center;

            gap: 5px;
        }


        .pagination-buttons button {

            min-width: 38px;

            height: 38px;

            padding: 0 10px;

            border: 1px solid #dddddd;

            background: #ffffff;

            color: #333;

            border-radius: 5px;

            cursor: pointer;

            font-size: 14px;
        }


        .pagination-buttons button:hover:not(:disabled) {

            background: #f5f5f5;
        }


        .pagination-buttons button.active-page {

            background: #ff6b00;

            border-color: #ff6b00;

            color: #ffffff;
        }


        .pagination-buttons button:disabled {

            opacity: 0.45;

            cursor: not-allowed;
        }


        /* =====================================================
           EMPTY ROW
           ===================================================== */

        .empty-row {

            text-align: center !important;

            padding: 40px !important;

            color: #888 !important;
        }


        /* =====================================================
           MODAL
           ===================================================== */

        .modal-content {

            border: none;

            border-radius: 9px;

            overflow: hidden;
        }


        .modal-header {

            padding: 20px 24px;

            border-bottom: 1px solid #eeeeee;
        }


        .modal-title {

            font-size: 21px;

            font-weight: 600;
        }


        .modal-body {

            padding: 25px 24px 10px;
        }


        .modal-footer {

            padding: 18px 24px;

            border-top: 1px solid #eeeeee;
        }


        .form-label {

            font-weight: 600;

            margin-bottom: 8px;
        }


        .form-control,
        .form-select {

            height: 46px;

            border-radius: 6px;
        }


        .form-control:focus,
        .form-select:focus {

            border-color: #ff6b00;

            box-shadow: 0 0 0 0.15rem rgba(255, 107, 0, 0.12);
        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

        @media (max-width: 992px) {

            .content {

                padding: 30px 25px;
            }

            .page-header {

                align-items: flex-start;

                gap: 20px;
            }

            .filters {

                flex-direction: column;

                align-items: flex-start;
            }

            .search-area {

                width: 100%;
            }

            .table-search {

                width: 100%;
            }
        }


        @media (max-width: 768px) {

            .topbar {

                padding: 0 15px;
            }

            .search-box {

                width: 100%;
            }

            .content {

                padding: 25px 15px;
            }

            .page-header {

                flex-direction: column;
            }

            .page-title {

                font-size: 29px;
            }

            .pagination-area {

                align-items: flex-start;

                flex-direction: column;
            }
        }

    </style>

</head>


<body>


<div class="main">


    <!-- =====================================================
         TOP BAR
         ===================================================== -->

    <div class="topbar">

        <input
                type="text"
                class="search-box"
                placeholder="Search in Pulse360">

    </div>


    <!-- =====================================================
         CONTENT
         ===================================================== -->

    <div class="content">


        <!-- =================================================
             PAGE HEADER
             ================================================= -->

        <div class="page-header">


            <div>

                <h1 class="page-title">
                    Designations
                </h1>


                <div class="breadcrumb">

                    <i class="bi bi-house"></i>

                    <span class="mx-2">/</span>

                    Employee

                    <span class="mx-2">/</span>

                    Designations

                </div>

            </div>


            <div class="d-flex gap-2">


                <!-- EXPORT -->

                <div class="dropdown">

                    <button
                            type="button"
                            class="export-btn dropdown-toggle"
                            data-bs-toggle="dropdown"
                            aria-expanded="false">

                        <i class="bi bi-file-earmark-arrow-down"></i>
                        Export

                    </button>

                    <ul class="dropdown-menu">

                        <li>
                            <a class="dropdown-item"
                               href="javascript:void(0)"
                               onclick="exportDesignationCSV()">

                                <i class="bi bi-filetype-csv me-2"></i>
                                Export CSV

                            </a>
                        </li>

                        <li>
                            <a class="dropdown-item"
                               href="javascript:void(0)"
                               onclick="window.print()">

                                <i class="bi bi-file-earmark-pdf me-2"></i>
                                Print / PDF

                            </a>
                        </li>

                    </ul>

                </div>


                <!-- ADD -->

                <button
                        type="button"
                        class="btn-orange"

                        data-bs-toggle="modal"
                        data-bs-target="#add_designation">

                    <i class="bi bi-plus-circle me-1"></i>

                    Add Designation

                </button>

            </div>

        </div>


        <!-- =================================================
             DESIGNATION CARD
             ================================================= -->

        <div class="card-custom">


            <!-- CARD TITLE -->

            <div class="card-title">

                Designation List

            </div>


            <!-- =================================================
                 FILTERS
                 ================================================= -->

            <div class="filters">


                <div class="entries-area">

                    <strong>
                        Show
                    </strong>


                    <select
                            id="pageSize"
                            class="form-select page-size"
                            onchange="changePageSize()">

                        <option value="5">
                            5
                        </option>

                        <option value="10">
                            10
                        </option>

                        <option value="25">
                            25
                        </option>

                        <option value="50">
                            50
                        </option>

                    </select>


                    <span>
                        entries
                    </span>

                </div>


                <div class="search-area">

                    <label>
                        Search:
                    </label>


                    <input
                            type="text"
                            id="designationSearch"
                            class="table-search"
                            placeholder="Search designations..."
                            oninput="searchDesignations()">

                </div>

            </div>


            <!-- =================================================
                 TABLE
                 ================================================= -->

            <div class="table-container">


                <table class="table designation-table">


                    <thead>

                    <tr>

                        <th>
                            Id
                        </th>

                        <th>
                            Designation Name
                        </th>

                        <th>
                            Department Id
                        </th>

                        <th>
                            NoOfEmployee
                        </th>

                        <th>
                            Status
                        </th>

                        <th>
                            CreatedBy
                        </th>

                        <th>
                            ModifiedBy
                        </th>

                        <th>
                            Action
                        </th>

                    </tr>

                    </thead>


                    <tbody id="designationTable">


                    <%
                        if (designations != null &&
                                !designations.isEmpty()) {

                            for (Designation designation :
                                    designations) {
                    %>


                    <tr>


                        <!-- ID -->

                        <td>
                            <%= designation.getDesignationId() %>
                        </td>


                        <!-- NAME -->

                        <td>
                            <%= designation.getName() %>
                        </td>


                        <!-- DEPARTMENT ID -->

                        <td>
                            <%= designation.getDepartmentId() %>
                        </td>


                        <!-- NO OF EMPLOYEE -->

                        <td>

                            <%= designation.getNoOfEmployee() != null
                                    ? designation.getNoOfEmployee()
                                    : 0 %>

                        </td>


                        <!-- STATUS -->

                        <td>

                            <%
                                if ("Active".equalsIgnoreCase(
                                        designation.getStatus())) {
                            %>

                            <span class="status status-active">
                                    ● Active
                                </span>

                            <%
                            } else {
                            %>

                            <span class="status status-inactive">
                                    ● Inactive
                                </span>

                            <%
                                }
                            %>

                        </td>


                        <!-- CREATED BY -->

                        <td>

                            <%= designation.getCreatedBy() != null
                                    ? designation.getCreatedBy()
                                    : "null" %>

                        </td>


                        <!-- MODIFIED BY -->

                        <td>

                            <%= designation.getModifiedBy() != null
                                    ? designation.getModifiedBy()
                                    : "null" %>

                        </td>


                        <!-- ACTION -->

                        <td>


                            <!-- EDIT -->

                            <button
                                    type="button"
                                    class="edit-btn"

                                    data-bs-toggle="modal"
                                    data-bs-target="#edit_designation"

                                    data-id="<%= designation.getDesignationId() %>"

                                    data-name="<%= designation.getName() %>"

                                    data-department="<%= designation.getDepartmentId() %>"

                                    data-status="<%= designation.getStatus() %>"

                                    onclick="editDesignation(this)">

                                <i class="bi bi-pencil"></i>

                            </button>


                            <!-- DELETE -->

                            <form
                                    action="<%= contextPath %>/Employee/AddDesignation"
                                    method="post"
                                    style="display:inline;">

                                <input
                                        type="hidden"
                                        name="action"
                                        value="delete">


                                <input
                                        type="hidden"
                                        name="designationId"
                                        value="<%= designation.getDesignationId() %>">


                                <button
                                        type="submit"
                                        class="delete-btn"

                                        onclick="return confirm('Are you sure you want to delete this designation?');">

                                    <i class="bi bi-trash"></i>

                                </button>

                            </form>


                        </td>


                    </tr>


                    <%
                        }

                    } else {
                    %>


                    <tr>

                        <td
                                colspan="8"
                                class="empty-row">

                            No designations found.

                        </td>

                    </tr>


                    <%
                        }
                    %>


                    </tbody>

                </table>

            </div>


            <!-- =================================================
                 PAGINATION
                 ================================================= -->

            <div class="pagination-area">


                <span id="paginationInfo">

                    Showing 0 to 0 of 0 entries

                </span>


                <div
                        id="paginationButtons"
                        class="pagination-buttons">
                </div>

            </div>


        </div>

    </div>

</div>


<!-- =========================================================
     ADD DESIGNATION MODAL
     ========================================================= -->

<div
        class="modal fade"
        id="add_designation"
        tabindex="-1"
        aria-hidden="true">


    <div class="modal-dialog modal-dialog-centered">


        <div class="modal-content">


            <!-- HEADER -->

            <div class="modal-header">

                <h5 class="modal-title">
                    Add Designation
                </h5>


                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <!-- FORM -->

            <form
                    action="<%= contextPath %>/Employee/AddDesignation"
                    method="post">


                <input
                        type="hidden"
                        name="action"
                        value="add">


                <div class="modal-body">


                    <!-- NAME -->

                    <div class="mb-3">

                        <label class="form-label">
                            Designation Name
                        </label>


                        <input
                                type="text"
                                name="name"
                                class="form-control"
                                placeholder="Enter designation name"
                                required>

                    </div>


                    <!-- DEPARTMENT ID -->

                    <div class="mb-3">

                        <label class="form-label">
                            Department ID
                        </label>


                        <input
                                type="number"
                                name="departmentId"
                                class="form-control"
                                placeholder="Enter department ID"
                                min="1"
                                required>

                    </div>


                    <!-- STATUS -->

                    <div class="mb-3">

                        <label class="form-label">
                            Status
                        </label>


                        <select
                                name="status"
                                class="form-select"
                                required>

                            <option value="">
                                Select
                            </option>

                            <option value="Active">
                                Active
                            </option>

                            <option value="Inactive">
                                Inactive
                            </option>

                        </select>

                    </div>

                </div>


                <!-- FOOTER -->

                <div class="modal-footer">


                    <button
                            type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <button
                            type="submit"
                            class="btn btn-primary">

                        Add Designation

                    </button>

                </div>


            </form>

        </div>

    </div>

</div>


<!-- =========================================================
     EDIT DESIGNATION MODAL
     ========================================================= -->

<div
        class="modal fade"
        id="edit_designation"
        tabindex="-1"
        aria-hidden="true">


    <div class="modal-dialog modal-dialog-centered">


        <div class="modal-content">


            <!-- HEADER -->

            <div class="modal-header">

                <h5 class="modal-title">
                    Edit Designation
                </h5>


                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <!-- FORM -->

            <form
                    action="<%= contextPath %>/Employee/AddDesignation"
                    method="post">


                <input
                        type="hidden"
                        name="action"
                        value="edit">


                <input
                        type="hidden"
                        name="designationId"
                        id="editDesignationId">


                <div class="modal-body">


                    <!-- NAME -->

                    <div class="mb-3">

                        <label class="form-label">
                            Designation Name
                        </label>


                        <input
                                type="text"
                                name="name"
                                id="editDesignationName"
                                class="form-control"
                                required>

                    </div>


                    <!-- DEPARTMENT ID -->

                    <div class="mb-3">

                        <label class="form-label">
                            Department ID
                        </label>


                        <input
                                type="number"
                                name="departmentId"
                                id="editDepartmentId"
                                class="form-control"
                                min="1"
                                required>

                    </div>


                    <!-- STATUS -->

                    <div class="mb-3">

                        <label class="form-label">
                            Status
                        </label>


                        <select
                                name="status"
                                id="editDesignationStatus"
                                class="form-select"
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


                <!-- FOOTER -->

                <div class="modal-footer">


                    <button
                            type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <button
                            type="submit"
                            class="btn btn-primary">

                        Save

                    </button>

                </div>


            </form>

        </div>

    </div>

</div>


<!-- =========================================================
     BOOTSTRAP JS
     ========================================================= -->

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


<script>

    /* =========================================================
       EDIT DESIGNATION
       ========================================================= */

    function editDesignation(button) {

        document.getElementById(
            "editDesignationId"
        ).value =
            button.getAttribute("data-id");


        document.getElementById(
            "editDesignationName"
        ).value =
            button.getAttribute("data-name");


        document.getElementById(
            "editDepartmentId"
        ).value =
            button.getAttribute("data-department");


        document.getElementById(
            "editDesignationStatus"
        ).value =
            button.getAttribute("data-status");
    }


    /* =========================================================
       PAGINATION VARIABLES
       ========================================================= */

    let currentPage = 1;


    /* =========================================================
       GET ALL TABLE ROWS
       ========================================================= */

    function getRows() {

        return Array.from(
            document.querySelectorAll(
                "#designationTable tr"
            )
        ).filter(function(row) {

            return !row.querySelector(
                ".empty-row"
            );

        });
    }


    /* =========================================================
       GET FILTERED ROWS
       ========================================================= */

    function getFilteredRows() {

        const searchInput =
            document.getElementById(
                "designationSearch"
            );


        const search =
            searchInput.value
                .toLowerCase()
                .trim();


        return getRows().filter(
            function(row) {

                return row.innerText
                    .toLowerCase()
                    .includes(search);

            }
        );
    }


    /* =========================================================
       RENDER TABLE
       ========================================================= */

    function renderTable() {

        const pageSize =
            parseInt(
                document.getElementById(
                    "pageSize"
                ).value
            );


        const allRows =
            getRows();


        const filteredRows =
            getFilteredRows();


        /* Hide every row */

        allRows.forEach(
            function(row) {

                row.style.display = "none";

            }
        );


        const total =
            filteredRows.length;


        /* Calculate pages */

        const totalPages =
            Math.max(
                1,
                Math.ceil(
                    total / pageSize
                )
            );


        /* Keep current page valid */

        if (currentPage > totalPages) {

            currentPage = totalPages;
        }


        /* Start */

        const start =
            (currentPage - 1) *
            pageSize;


        /* End */

        const end =
            Math.min(
                start + pageSize,
                total
            );


        /* Show required rows */

        filteredRows
            .slice(start, end)
            .forEach(
                function(row) {

                    row.style.display = "";

                }
            );


        /* Pagination text */

        const paginationInfo =
            document.getElementById(
                "paginationInfo"
            );


        if (total === 0) {

            paginationInfo.innerText =
                "Showing 0 to 0 of 0 entries";

        } else {

            paginationInfo.innerText =
                "Showing " +
                (start + 1) +
                " to " +
                end +
                " of " +
                total +
                " entries";
        }


        /* Render buttons */

        renderPagination(totalPages);
    }


    /* =========================================================
       RENDER PAGINATION BUTTONS
       ========================================================= */

    function renderPagination(totalPages) {

        const container =
            document.getElementById(
                "paginationButtons"
            );


        container.innerHTML = "";


        /* FIRST */

        addPaginationButton(
            container,
            "«",
            1,
            currentPage === 1,
            false
        );


        /* PREVIOUS */

        addPaginationButton(
            container,
            "‹",
            currentPage - 1,
            currentPage === 1,
            false
        );


        /* PAGE NUMBERS */

        let startPage =
            Math.max(
                1,
                currentPage - 2
            );


        let endPage =
            Math.min(
                totalPages,
                startPage + 4
            );


        if (
            endPage - startPage < 4
        ) {

            startPage =
                Math.max(
                    1,
                    endPage - 4
                );
        }


        for (
            let i = startPage;
            i <= endPage;
            i++
        ) {

            addPaginationButton(
                container,
                i,
                i,
                false,
                i === currentPage
            );
        }


        /* NEXT */

        addPaginationButton(
            container,
            "›",
            currentPage + 1,
            currentPage === totalPages,
            false
        );


        /* LAST */

        addPaginationButton(
            container,
            "»",
            totalPages,
            currentPage === totalPages,
            false
        );
    }


    /* =========================================================
       CREATE PAGINATION BUTTON
       ========================================================= */

    function addPaginationButton(
        container,
        text,
        page,
        disabled,
        active
    ) {

        const button =
            document.createElement(
                "button"
            );


        button.type = "button";


        button.innerText = text;


        button.disabled = disabled;


        if (active) {

            button.classList.add(
                "active-page"
            );
        }


        button.addEventListener(
            "click",
            function() {

                currentPage = page;

                renderTable();

            }
        );


        container.appendChild(button);
    }


    /* =========================================================
       SEARCH
       ========================================================= */

    function searchDesignations() {

        currentPage = 1;

        renderTable();
    }


    /* =========================================================
       PAGE SIZE
       ========================================================= */

    function changePageSize() {

        currentPage = 1;

        renderTable();
    }


    /* =========================================================
       INITIAL LOAD
       ========================================================= */

    document.addEventListener(
        "DOMContentLoaded",
        function() {

            renderTable();

        }
    );



    function exportDesignationCSV() {

        const rows = getFilteredRows();

        if (rows.length === 0) {

            alert("No designations available to export.");
            return;
        }

        let csv = [];

        csv.push([
            "Id",
            "Designation Name",
            "Department Id",
            "NoOfEmployee",
            "Status",
            "CreatedBy",
            "ModifiedBy"
        ].join(","));


        rows.forEach(function(row) {

            const cells =
                row.querySelectorAll("td");

            let data = [];

            for (let i = 0; i < 7; i++) {

                let value =
                    cells[i].innerText
                        .trim()
                        .replace(/,/g, " ");

                data.push(
                    '"' + value + '"'
                );
            }

            csv.push(data.join(","));
        });


        const blob =
            new Blob(
                [csv.join("\n")],
                {
                    type: "text/csv;charset=utf-8;"
                }
            );


        const url =
            URL.createObjectURL(blob);


        const link =
            document.createElement("a");

        link.href = url;

        link.download =
            "designations.csv";

        document.body.appendChild(link);

        link.click();

        document.body.removeChild(link);

        URL.revokeObjectURL(url);
    }
</script>


</body>

</html>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.model.Role" %>

<%
    String contextPath = request.getContextPath();

    List<Role> roles =
            (List<Role>) request.getAttribute("roles");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Roles</title>


    <!-- =====================================================
         BOOTSTRAP
         ===================================================== -->

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">


    <!-- =====================================================
         BOOTSTRAP ICONS
         ===================================================== -->

    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <!-- =====================================================
         CSS
         ===================================================== -->

    <style>

        body {
            margin: 0;
            background: #f7f7f8;
            font-family: Arial, Helvetica, sans-serif;
            color: #333;
        }


        /* =====================================================
           MAIN
           ===================================================== */

        .main {
            min-height: 100vh;
            width: 100%;
        }


        /* =====================================================
           TOP BAR
           ===================================================== */

        .topbar {
            height: 70px;
            background: #ffffff;
            border-bottom: 1px solid #eeeeee;

            display: flex;
            align-items: center;

            padding: 0 30px;
        }


        .search-box {
            width: 300px;

            border: 1px solid #eeeeee;
            border-radius: 6px;

            padding: 10px 15px;

            outline: none;
        }


        .search-box:focus {
            border-color: #ff6b00;
        }


        /* =====================================================
           CONTENT
           ===================================================== */

        .content {
            padding: 45px 50px;
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


        .page-header h1 {
            font-size: 28px;
            font-weight: 600;

            margin: 0;
        }


        .breadcrumb {
            margin-top: 8px;
            font-size: 14px;
        }


        /* =====================================================
           BUTTONS
           ===================================================== */

        .btn-orange {
            background: #ff6b00;
            color: white;
            border: none;
        }


        .btn-orange:hover {
            background: #e85f00;
            color: white;
        }


        /* =====================================================
           CARD
           ===================================================== */

        .card-custom {
            background: white;

            border: 1px solid #eeeeee;
            border-radius: 8px;
        }


        .card-title {
            padding: 25px 22px;

            font-size: 18px;
            font-weight: 600;

            border-bottom: 1px solid #eeeeee;
        }


        /* =====================================================
           FILTERS
           ===================================================== */

        .filters {
            padding: 15px 20px;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }


        /* =====================================================
           TABLE
           ===================================================== */

        table {
            width: 100%;
        }


        thead th {
            background: #e9ecef;

            padding: 14px 20px;

            font-size: 14px;
            font-weight: 600;

            white-space: nowrap;
        }


        tbody td {
            padding: 15px 20px;

            border-bottom: 1px solid #eeeeee;

            font-size: 14px;
        }


        tbody tr:hover {
            background: #fafafa;
        }


        /* =====================================================
           STATUS
           ===================================================== */

        .status {
            display: inline-block;

            padding: 5px 12px;

            border-radius: 4px;

            font-size: 12px;
            font-weight: 600;
        }


        .status-active {
            background: #20c76b;
            color: white;
        }


        .status-inactive {
            background: #ef233c;
            color: white;
        }


        /* =====================================================
           ACTION BUTTON
           ===================================================== */

        .action-btn {
            border: none;
            background: transparent;

            font-size: 17px;

            margin-right: 10px;

            cursor: pointer;
        }


        .edit-btn {
            color: #555;
        }


        .delete-btn {
            color: #555;
        }


        .action-btn:hover {
            color: #ff6b00;
        }


        /* =====================================================
           EMPTY
           ===================================================== */

        .empty-row {
            text-align: center;

            padding: 30px !important;

            color: #888;
        }


        /* =====================================================
           PAGINATION
           ===================================================== */

        .pagination-wrap {
            gap: 6px;
            flex-wrap: wrap;
        }


        .pagination-wrap button {
            min-width: 36px;
        }


        .pagination-wrap button.active-page {
            background: #ff6b00;

            border-color: #ff6b00;

            color: #fff;
        }


        /* =====================================================
           EXPORT DROPDOWN
           ===================================================== */

        .dropdown-item {
            cursor: pointer;
        }


        .dropdown-item:hover {
            background: #f8f9fa;
        }


        /* =====================================================
           PRINT
           ===================================================== */

        @media print {

            body {
                background: white;
            }

            .topbar,
            .page-header button,
            .page-header .dropdown,
            .filters,
            .pagination-wrap,
            .modal {
                display: none !important;
            }

            .content {
                padding: 20px;
            }

            .card-custom {
                border: none;
            }

            .card-title {
                border: none;
            }

            table {
                width: 100%;
            }

        }


        /* =====================================================
           RESPONSIVE
           ===================================================== */

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
                align-items: flex-start;

                gap: 15px;

                flex-direction: column;
            }


            .filters {
                gap: 12px;

                align-items: flex-start;

                flex-direction: column;
            }


            .page-header > div:last-child {
                width: 100%;
            }

        }

    </style>

</head>


<body>


<!-- =====================================================
     MAIN
     ===================================================== -->

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


            <!-- PAGE TITLE -->

            <div>

                <h1>
                    Roles
                </h1>


                <div class="breadcrumb">

                    <span>
                        <i class="bi bi-house"></i>
                    </span>

                    <span class="mx-2">
                        /
                    </span>

                    <span>
                        Employee
                    </span>

                    <span class="mx-2">
                        /
                    </span>

                    <span>
                        Role
                    </span>

                </div>

            </div>


            <!-- =================================================
                 RIGHT BUTTONS
                 ================================================= -->

            <div class="d-flex align-items-center gap-2">


                <!-- =================================================
                     EXPORT DROPDOWN
                     ================================================= -->

                <div class="dropdown">


                    <button
                            type="button"
                            class="btn btn-light border dropdown-toggle"
                            data-bs-toggle="dropdown"
                            aria-expanded="false">

                        <i class="bi bi-file-earmark-arrow-down me-1"></i>

                        Export

                    </button>


                    <ul class="dropdown-menu dropdown-menu-end">


                        <!-- CSV -->

                        <li>

                            <button
                                    type="button"
                                    class="dropdown-item"
                                    onclick="exportRoleCSV()">

                                <i class="bi bi-filetype-csv me-2"></i>

                                Export CSV

                            </button>

                        </li>


                        <!-- PRINT -->

                        <li>

                            <button
                                    type="button"
                                    class="dropdown-item"
                                    onclick="printRoles()">

                                <i class="bi bi-printer me-2"></i>

                                Print

                            </button>

                        </li>


                    </ul>

                </div>


                <!-- =================================================
                     ADD ROLE
                     ================================================= -->

                <button
                        type="button"
                        class="btn btn-orange"
                        data-bs-toggle="modal"
                        data-bs-target="#add_role">

                    <i class="bi bi-plus-circle me-1"></i>

                    Add Role

                </button>


            </div>

        </div>
        <!-- END PAGE HEADER -->


        <!-- =====================================================
             ROLE LIST CARD
             ===================================================== -->

        <div class="card-custom">


            <!-- CARD TITLE -->

            <div class="card-title">

                Role List

            </div>


            <!-- =================================================
                 FILTERS
                 ================================================= -->

            <div class="filters">


                <!-- PAGE SIZE -->

                <div class="d-flex align-items-center gap-2">

                    <label class="mb-0 fw-semibold">
                        Show
                    </label>


                    <select
                            id="pageSize"
                            class="form-select"
                            style="width: 90px;"
                            onchange="changePageSize()">

                        <option value="5" selected>
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


                    <span class="text-muted">
                        entries
                    </span>

                </div>


                <!-- SEARCH -->

                <div class="d-flex align-items-center">

                    <label class="me-2 mb-0">
                        Search:
                    </label>


                    <input
                            type="text"
                            id="roleSearch"
                            class="form-control"
                            style="width: 220px;"
                            placeholder="Search roles..."
                            onkeyup="searchRoles()">

                </div>


            </div>


            <!-- =================================================
                 TABLE
                 ================================================= -->

            <div class="table-responsive">


                <table class="table mb-0">


                    <!-- TABLE HEADER -->

                    <thead>

                    <tr>

                        <th>
                            Id
                        </th>

                        <th>
                            Role Name
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


                    <!-- =================================================
                         TABLE BODY
                         ================================================= -->

                    <tbody id="roleTable">


                    <%
                        if (roles != null && !roles.isEmpty()) {

                            for (Role role : roles) {
                    %>


                    <tr>


                        <!-- ID -->

                        <td>
                            <%= role.getRoleId() %>
                        </td>


                        <!-- ROLE NAME -->

                        <td>
                            <%= role.getRoleName() %>
                        </td>


                        <!-- STATUS -->

                        <td>

                            <%
                                if ("Active".equalsIgnoreCase(role.getStatus())) {
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

                            <%= role.getCreatedBy() != null
                                    ? role.getCreatedBy()
                                    : "null" %>

                        </td>


                        <!-- MODIFIED BY -->

                        <td>

                            <%= role.getModifiedBy() != null
                                    ? role.getModifiedBy()
                                    : "null" %>

                        </td>


                        <!-- ACTION -->

                        <td>


                            <!-- EDIT -->

                            <button
                                    type="button"
                                    class="btn btn-sm btn-light me-1"
                                    data-bs-toggle="modal"
                                    data-bs-target="#edit_role"

                                    data-id="<%= role.getRoleId() %>"

                                    data-name="<%= role.getRoleName() %>"

                                    data-status="<%= role.getStatus() %>"

                                    onclick="editRole(this)">

                                <i class="bi bi-pencil"></i>

                            </button>


                            <!-- DELETE -->

                            <form
                                    action="<%= contextPath %>/Employee/Role"
                                    method="post"
                                    style="display:inline;">


                                <input
                                        type="hidden"
                                        name="action"
                                        value="delete">


                                <input
                                        type="hidden"
                                        name="roleId"
                                        value="<%= role.getRoleId() %>">


                                <button
                                        type="submit"
                                        class="action-btn delete-btn"

                                        onclick="return confirm('Are you sure you want to delete this role?');">

                                    <i class="bi bi-trash"></i>

                                </button>


                            </form>


                        </td>


                    </tr>


                    <%
                        }

                    } else {
                    %>


                    <!-- EMPTY -->

                    <tr>

                        <td
                                colspan="6"
                                class="empty-row">

                            No roles found.

                        </td>

                    </tr>


                    <%
                        }
                    %>


                    </tbody>

                </table>


            </div>


            <!-- =================================================
                 FOOTER
                 ================================================= -->

            <div
                    class="p-3 border-top d-flex justify-content-between align-items-center flex-wrap gap-3">


                <span id="paginationInfo">

                    Showing 0 to 0 of 0 entries

                </span>


                <div
                        class="d-flex pagination-wrap"
                        id="paginationButtons">

                    <!-- Generated by JavaScript -->

                </div>


            </div>


        </div>


    </div>


</div>



<!-- =====================================================
     ADD ROLE MODAL
     ===================================================== -->

<div
        class="modal fade"
        id="add_role"
        tabindex="-1"
        aria-hidden="true">


    <div class="modal-dialog modal-dialog-centered">


        <div class="modal-content">


            <!-- HEADER -->

            <div class="modal-header">

                <h4 class="modal-title">
                    Add Role
                </h4>


                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">

                </button>

            </div>


            <!-- FORM -->

            <form
                    action="<%= contextPath %>/Employee/Role"
                    method="post">


                <input
                        type="hidden"
                        name="action"
                        value="add">


                <!-- BODY -->

                <div class="modal-body pb-0">


                    <!-- ROLE NAME -->

                    <div class="mb-3">

                        <label class="form-label">
                            Role Name
                        </label>


                        <input
                                type="text"
                                name="roleName"
                                class="form-control"
                                placeholder="Enter role name"
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
                            class="btn btn-light me-2"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <button
                            type="submit"
                            class="btn btn-primary">

                        Add Role

                    </button>


                </div>


            </form>


        </div>

    </div>

</div>



<!-- =====================================================
     EDIT ROLE MODAL
     ===================================================== -->

<div
        class="modal fade"
        id="edit_role"
        tabindex="-1"
        aria-hidden="true">


    <div class="modal-dialog modal-dialog-centered">


        <div class="modal-content">


            <!-- HEADER -->

            <div class="modal-header">

                <h4 class="modal-title">
                    Edit Role
                </h4>


                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">

                </button>

            </div>


            <!-- FORM -->

            <form
                    action="<%= contextPath %>/Employee/Role"
                    method="post">


                <!-- ACTION -->

                <input
                        type="hidden"
                        name="action"
                        value="edit">


                <!-- ROLE ID -->

                <input
                        type="hidden"
                        name="roleId"
                        id="editRoleId">


                <!-- BODY -->

                <div class="modal-body pb-0">


                    <!-- ROLE NAME -->

                    <div class="mb-3">

                        <label class="form-label">
                            Role Name
                        </label>


                        <input
                                type="text"
                                name="roleName"
                                id="editRoleName"
                                class="form-control"
                                required>

                    </div>


                    <!-- STATUS -->

                    <div class="mb-3">

                        <label class="form-label">
                            Status
                        </label>


                        <select
                                name="status"
                                id="editRoleStatus"
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
                            class="btn btn-light me-2"
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



<!-- =====================================================
     BOOTSTRAP JS
     ===================================================== -->

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>



<!-- =====================================================
     JAVASCRIPT
     ===================================================== -->

<script>


    /* =====================================================
       EDIT ROLE
       ===================================================== */

    function editRole(button) {

        const roleId =
            button.getAttribute("data-id");

        const roleName =
            button.getAttribute("data-name");

        const status =
            button.getAttribute("data-status");


        document.getElementById("editRoleId").value =
            roleId;


        document.getElementById("editRoleName").value =
            roleName;


        document.getElementById("editRoleStatus").value =
            status;

    }



    /* =====================================================
       SEARCH + PAGINATION
       ===================================================== */

    let currentPage = 1;

    let rowsPerPage = 5;



    /* =====================================================
       GET ROLE ROWS
       ===================================================== */

    function getRoleRows() {

        return Array.from(
            document.querySelectorAll("#roleTable tr")
        ).filter(function(row) {

            return !row.querySelector(".empty-row");

        });

    }



    /* =====================================================
       GET FILTERED ROWS
       ===================================================== */

    function getFilteredRows() {

        const searchInput =
            document.getElementById("roleSearch");


        const filter =
            searchInput.value
                .toLowerCase()
                .trim();


        return getRoleRows().filter(function(row) {

            return row.innerText
                .toLowerCase()
                .includes(filter);

        });

    }



    /* =====================================================
       RENDER TABLE
       ===================================================== */

    function renderTable() {


        rowsPerPage =
            parseInt(
                document.getElementById("pageSize").value
            );


        const allRows =
            getRoleRows();


        const filteredRows =
            getFilteredRows();


        /* HIDE ALL ROWS */

        allRows.forEach(function(row) {

            row.style.display = "none";

        });


        const total =
            filteredRows.length;


        const totalPages =
            Math.max(
                1,
                Math.ceil(total / rowsPerPage)
            );


        /* FIX CURRENT PAGE */

        if (currentPage > totalPages) {

            currentPage = totalPages;

        }


        const start =
            (currentPage - 1) * rowsPerPage;


        const end =
            Math.min(
                start + rowsPerPage,
                total
            );


        /* SHOW CURRENT PAGE */

        filteredRows
            .slice(start, end)
            .forEach(function(row) {

                row.style.display = "";

            });


        /* PAGINATION INFO */

        const info =
            document.getElementById(
                "paginationInfo"
            );


        if (total === 0) {

            info.innerText =
                "Showing 0 to 0 of 0 entries";

        } else {

            info.innerText =
                "Showing "
                + (start + 1)
                + " to "
                + end
                + " of "
                + total
                + " entries";

        }


        /* PAGINATION BUTTONS */

        renderPagination(totalPages);

    }



    /* =====================================================
       RENDER PAGINATION
       ===================================================== */

    function renderPagination(totalPages) {


        const container =
            document.getElementById(
                "paginationButtons"
            );


        container.innerHTML = "";


        /* FIRST */

        const first =
            createPageButton(
                "«",
                1,
                currentPage === 1
            );


        /* PREVIOUS */

        const prev =
            createPageButton(
                "‹",
                currentPage - 1,
                currentPage === 1
            );


        container.appendChild(first);

        container.appendChild(prev);


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


        if (endPage - startPage < 4) {

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


            const btn =
                createPageButton(
                    i,
                    i,
                    false
                );


            if (i === currentPage) {

                btn.classList.add(
                    "active-page"
                );

            }


            container.appendChild(btn);

        }


        /* NEXT */

        const next =
            createPageButton(
                "›",
                currentPage + 1,
                currentPage === totalPages
            );


        /* LAST */

        const last =
            createPageButton(
                "»",
                totalPages,
                currentPage === totalPages
            );


        container.appendChild(next);

        container.appendChild(last);

    }



    /* =====================================================
       CREATE PAGINATION BUTTON
       ===================================================== */

    function createPageButton(
        label,
        page,
        disabled
    ) {


        const btn =
            document.createElement(
                "button"
            );


        btn.type = "button";


        btn.className =
            "btn btn-sm btn-light border";


        btn.innerText =
            label;


        btn.disabled =
            disabled;


        btn.onclick =
            function() {

                currentPage = page;

                renderTable();

            };


        return btn;

    }



    /* =====================================================
       SEARCH ROLES
       ===================================================== */

    function searchRoles() {

        currentPage = 1;

        renderTable();

    }



    /* =====================================================
       CHANGE PAGE SIZE
       ===================================================== */

    function changePageSize() {

        currentPage = 1;

        renderTable();

    }



    /* =====================================================
       EXPORT ROLE CSV
       ===================================================== */

    function exportRoleCSV() {


        const rows =
            getFilteredRows();


        if (rows.length === 0) {

            alert(
                "No roles available to export."
            );

            return;

        }


        let csv = [];


        /* CSV HEADER */

        csv.push(
            [
                "Id",
                "Role Name",
                "Status",
                "CreatedBy",
                "ModifiedBy"
            ].join(",")
        );


        /* CSV DATA */

        rows.forEach(function(row) {


            const cells =
                row.querySelectorAll("td");


            let data = [];


            for (
                let i = 0;
                i < 5;
                i++
            ) {


                let value =
                    cells[i].innerText
                        .trim()
                        .replace(
                            /"/g,
                            '""'
                        );


                data.push(
                    '"' + value + '"'
                );

            }


            csv.push(
                data.join(",")
            );

        });


        /* CREATE CSV FILE */

        const blob =
            new Blob(
                [csv.join("\n")],
                {
                    type:
                        "text/csv;charset=utf-8;"
                }
            );


        const url =
            URL.createObjectURL(blob);


        const link =
            document.createElement("a");


        link.href =
            url;


        link.download =
            "roles.csv";


        document.body.appendChild(
            link
        );


        link.click();


        document.body.removeChild(
            link
        );


        URL.revokeObjectURL(
            url
        );

    }



    /* =====================================================
       PRINT ROLES
       ===================================================== */

    function printRoles() {


        const rows =
            getFilteredRows();


        if (rows.length === 0) {

            alert(
                "No roles available to print."
            );

            return;

        }


        let printWindow =
            window.open(
                "",
                "_blank"
            );


        if (!printWindow) {

            alert(
                "Please allow pop-ups to print."
            );

            return;

        }


        let html = `

            <!DOCTYPE html>

            <html>

            <head>

                <title>
                    Role List
                </title>

                <style>

                    body {
                        font-family:
                            Arial,
                            sans-serif;

                        padding: 30px;
                    }


                    h2 {
                        margin-bottom: 20px;
                    }


                    table {
                        width: 100%;
                        border-collapse:
                            collapse;
                    }


                    th,
                    td {
                        border:
                            1px solid #ccc;

                        padding: 10px;

                        text-align:
                            left;
                    }


                    th {
                        background:
                            #f1f1f1;
                    }

                </style>

            </head>


            <body>

                <h2>
                    Role List
                </h2>


                <table>

                    <thead>

                        <tr>

                            <th>
                                Id
                            </th>

                            <th>
                                Role Name
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

                        </tr>

                    </thead>


                    <tbody>
        `;


        rows.forEach(function(row) {


            const cells =
                row.querySelectorAll("td");


            html += `

                <tr>

                    <td>
                        ${cells[0].innerText}
                    </td>

                    <td>
                        ${cells[1].innerText}
                    </td>

                    <td>
                        ${cells[2].innerText}
                    </td>

                    <td>
                        ${cells[3].innerText}
                    </td>

                    <td>
                        ${cells[4].innerText}
                    </td>

                </tr>

            `;

        });


        html += `

                    </tbody>

                </table>

            </body>

            </html>

        `;


        printWindow.document.write(
            html
        );


        printWindow.document.close();


        printWindow.focus();


        printWindow.print();


        printWindow.close();

    }



    /* =====================================================
       PAGE LOAD
       ===================================================== */

    document.addEventListener(
        "DOMContentLoaded",
        function() {

            renderTable();

        }
    );

</script>


</body>

</html>
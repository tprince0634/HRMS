<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.model.Department" %>

<%
    String contextPath = request.getContextPath();

    List<Department> departments =
            (List<Department>) request.getAttribute("departments");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Departments</title>


    <!-- Bootstrap -->

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">


    <!-- Bootstrap Icons -->

    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <style>

        body {
            margin: 0;
            background: #f7f7f8;
            font-family: Arial, Helvetica, sans-serif;
            color: #333;
        }


        .main {
            min-height: 100vh;
            width: 100%;
        }


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


        .content {
            padding: 45px 50px;
        }


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


        .btn-orange {
            background: #ff6b00;
            color: white;
            border: none;
        }


        .btn-orange:hover {
            background: #e85f00;
            color: white;
        }


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


        .filters {
            padding: 15px 20px;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }


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


        .action-btn {
            border: none;
            background: transparent;

            font-size: 17px;

            margin-right: 10px;

            cursor: pointer;
        }


        .action-btn:hover {
            color: #ff6b00;
        }


        .empty-row {
            text-align: center;

            padding: 30px !important;

            color: #888;
        }


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


        @media (max-width: 768px) {

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


            .search-box {
                width: 100%;
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

                <h1>
                    Departments
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
                        Departments
                    </span>

                </div>

            </div>


            <!-- RIGHT BUTTONS -->

            <div class="d-flex align-items-center gap-2">


                <!-- EXPORT -->

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

                        <li>

                            <button
                                    type="button"
                                    class="dropdown-item"
                                    onclick="exportDepartmentCSV()">

                                <i class="bi bi-filetype-csv me-2"></i>

                                Export CSV

                            </button>

                        </li>


                        <li>

                            <button
                                    type="button"
                                    class="dropdown-item"
                                    onclick="printDepartments()">

                                <i class="bi bi-printer me-2"></i>

                                Print

                            </button>

                        </li>

                    </ul>

                </div>


                <!-- ADD DEPARTMENT -->

                <button
                        type="button"
                        class="btn btn-orange"
                        data-bs-toggle="modal"
                        data-bs-target="#add_department">

                    <i class="bi bi-plus-circle me-1"></i>

                    Add Department

                </button>


            </div>

        </div>


        <!-- =================================================
             DEPARTMENT CARD
             ================================================= -->

        <div class="card-custom">


            <div class="card-title">

                Department List

            </div>


            <!-- FILTER -->

            <div class="filters">


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


                <div class="d-flex align-items-center">

                    <label class="me-2 mb-0">
                        Search:
                    </label>


                    <input
                            type="text"
                            id="departmentSearch"
                            class="form-control"
                            style="width: 220px;"
                            placeholder="Search departments..."
                            onkeyup="searchDepartments()">

                </div>


            </div>


            <!-- =================================================
                 TABLE
                 ================================================= -->

            <div class="table-responsive">


                <table class="table mb-0">


                    <thead>

                    <tr>

                        <th>
                            Id
                        </th>

                        <th>
                            Department Name
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


                    <tbody id="departmentTable">


                    <%
                        if (departments != null &&
                                !departments.isEmpty()) {

                            for (Department department : departments) {
                    %>


                    <tr>


                        <td>
                            <%= department.getDepartmentId() %>
                        </td>


                        <td>
                            <%= department.getName() %>
                        </td>


                        <td>
                            <%= department.getNoOfEmployee() %>
                        </td>


                        <td>

                            <%
                                if ("Active".equalsIgnoreCase(
                                        department.getStatus())) {
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


                        <td>

                            <%= department.getCreatedBy() != null
                                    ? department.getCreatedBy()
                                    : "null" %>

                        </td>


                        <td>

                            <%= department.getModifiedBy() != null
                                    ? department.getModifiedBy()
                                    : "null" %>

                        </td>


                        <td>


                            <!-- EDIT -->

                            <button
                                    type="button"
                                    class="btn btn-sm btn-light me-1"

                                    data-bs-toggle="modal"
                                    data-bs-target="#edit_department"

                                    data-id="<%= department.getDepartmentId() %>"

                                    data-name="<%= department.getName() %>"

                                    data-status="<%= department.getStatus() %>"

                                    onclick="editDepartment(this)">

                                <i class="bi bi-pencil"></i>

                            </button>


                            <!-- DELETE -->

                            <form
                                    action="<%= contextPath %>/Employee/AddDepartment"
                                    method="post"
                                    style="display:inline;">

                                <input
                                        type="hidden"
                                        name="action"
                                        value="delete">


                                <input
                                        type="hidden"
                                        name="departmentId"
                                        value="<%= department.getDepartmentId() %>">


                                <button
                                        type="submit"
                                        class="action-btn"

                                        onclick="return confirm('Are you sure you want to delete this department?');">

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
                                colspan="7"
                                class="empty-row">

                            No departments found.

                        </td>

                    </tr>


                    <%
                        }
                    %>


                    </tbody>

                </table>

            </div>


            <!-- FOOTER -->

            <div
                    class="p-3 border-top d-flex justify-content-between align-items-center flex-wrap gap-3">


                <span id="paginationInfo">

                    Showing 0 to 0 of 0 entries

                </span>


                <div
                        class="d-flex pagination-wrap"
                        id="paginationButtons">

                </div>

            </div>


        </div>

    </div>

</div>



<!-- =====================================================
     ADD DEPARTMENT MODAL
     ===================================================== -->

<div
        class="modal fade"
        id="add_department"
        tabindex="-1"
        aria-hidden="true">


    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">


            <div class="modal-header">

                <h4 class="modal-title">
                    Add Department
                </h4>


                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <form
                    action="<%= contextPath %>/Employee/AddDepartment"
                    method="post">


                <input
                        type="hidden"
                        name="action"
                        value="add">


                <div class="modal-body">


                    <div class="mb-3">

                        <label class="form-label">
                            Department Name
                        </label>


                        <input
                                type="text"
                                name="name"
                                class="form-control"
                                placeholder="Enter department name"
                                required>

                    </div>


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


                <div class="modal-footer">

                    <button
                            type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <button
                            type="submit"
                            class="btn btn-orange">

                        Add Department

                    </button>

                </div>


            </form>

        </div>

    </div>

</div>



<!-- =====================================================
     EDIT DEPARTMENT MODAL
     ===================================================== -->

<div
        class="modal fade"
        id="edit_department"
        tabindex="-1"
        aria-hidden="true">


    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">


            <div class="modal-header">

                <h4 class="modal-title">
                    Edit Department
                </h4>


                <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>


            <form
                    action="<%= contextPath %>/Employee/AddDepartment"
                    method="post">


                <input
                        type="hidden"
                        name="action"
                        value="edit">


                <input
                        type="hidden"
                        name="departmentId"
                        id="editDepartmentId">


                <div class="modal-body">


                    <div class="mb-3">

                        <label class="form-label">
                            Department Name
                        </label>


                        <input
                                type="text"
                                name="name"
                                id="editDepartmentName"
                                class="form-control"
                                required>

                    </div>


                    <div class="mb-3">

                        <label class="form-label">
                            Status
                        </label>


                        <select
                                name="status"
                                id="editDepartmentStatus"
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


                <div class="modal-footer">

                    <button
                            type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <button
                            type="submit"
                            class="btn btn-orange">

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



<script>


    // =====================================================
    // EDIT DEPARTMENT
    // =====================================================

    function editDepartment(button) {

        const departmentId =
            button.getAttribute("data-id");

        const name =
            button.getAttribute("data-name");

        const status =
            button.getAttribute("data-status");


        document.getElementById(
            "editDepartmentId"
        ).value = departmentId;


        document.getElementById(
            "editDepartmentName"
        ).value = name;


        document.getElementById(
            "editDepartmentStatus"
        ).value = status;
    }



    // =====================================================
    // SEARCH + PAGINATION
    // =====================================================

    let currentPage = 1;

    let rowsPerPage = 5;



    function getDepartmentRows() {

        return Array.from(
            document.querySelectorAll(
                "#departmentTable tr"
            )
        ).filter(function(row) {

            return !row.querySelector(
                ".empty-row"
            );

        });
    }



    function getFilteredDepartmentRows() {

        const filter =
            document.getElementById(
                "departmentSearch"
            )
                .value
                .toLowerCase()
                .trim();


        return getDepartmentRows().filter(
            function(row) {

                return row.innerText
                    .toLowerCase()
                    .includes(filter);

            }
        );
    }



    function renderTable() {

        rowsPerPage =
            parseInt(
                document.getElementById(
                    "pageSize"
                ).value
            );


        const allRows =
            getDepartmentRows();


        const filteredRows =
            getFilteredDepartmentRows();


        allRows.forEach(function(row) {

            row.style.display = "none";

        });


        const total =
            filteredRows.length;


        const totalPages =
            Math.max(
                1,
                Math.ceil(
                    total / rowsPerPage
                )
            );


        if (currentPage > totalPages) {

            currentPage = totalPages;
        }


        const start =
            (currentPage - 1)
            * rowsPerPage;


        const end =
            Math.min(
                start + rowsPerPage,
                total
            );


        filteredRows
            .slice(start, end)
            .forEach(function(row) {

                row.style.display = "";

            });


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


        renderPagination(totalPages);
    }



    function renderPagination(totalPages) {

        const container =
            document.getElementById(
                "paginationButtons"
            );


        container.innerHTML = "";


        const first =
            createPageButton(
                "«",
                1,
                currentPage === 1
            );


        const prev =
            createPageButton(
                "‹",
                currentPage - 1,
                currentPage === 1
            );


        container.appendChild(first);

        container.appendChild(prev);


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

            const button =
                createPageButton(
                    i,
                    i,
                    false
                );


            if (i === currentPage) {

                button.classList.add(
                    "active-page"
                );
            }


            container.appendChild(
                button
            );
        }


        const next =
            createPageButton(
                "›",
                currentPage + 1,
                currentPage === totalPages
            );


        const last =
            createPageButton(
                "»",
                totalPages,
                currentPage === totalPages
            );


        container.appendChild(next);

        container.appendChild(last);
    }



    function createPageButton(
        label,
        page,
        disabled
    ) {

        const button =
            document.createElement(
                "button"
            );


        button.type = "button";


        button.className =
            "btn btn-sm btn-light border";


        button.innerText =
            label;


        button.disabled =
            disabled;


        button.onclick =
            function() {

                currentPage = page;

                renderTable();
            };


        return button;
    }



    function searchDepartments() {

        currentPage = 1;

        renderTable();
    }



    function changePageSize() {

        currentPage = 1;

        renderTable();
    }



    // =====================================================
    // EXPORT CSV
    // =====================================================

    function exportDepartmentCSV() {

        const rows =
            getFilteredDepartmentRows();


        if (rows.length === 0) {

            alert(
                "No departments available to export."
            );

            return;
        }


        let csv = [];


        csv.push(
            [
                "Id",
                "Department Name",
                "NoOfEmployee",
                "Status",
                "CreatedBy",
                "ModifiedBy"
            ].join(",")
        );


        rows.forEach(function(row) {

            const cells =
                row.querySelectorAll("td");


            let data = [];


            for (
                let i = 0;
                i < 6;
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


        const blob =
            new Blob(
                [csv.join("\n")],
                {
                    type:
                        "text/csv;charset=utf-8;"
                }
            );


        const url =
            URL.createObjectURL(
                blob
            );


        const link =
            document.createElement("a");


        link.href = url;


        link.download =
            "departments.csv";


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



    // =====================================================
    // PRINT
    // =====================================================

    function printDepartments() {

        const rows =
            getFilteredDepartmentRows();


        if (rows.length === 0) {

            alert(
                "No departments available to print."
            );

            return;
        }


        const printWindow =
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
                    Department List
                </title>

                <style>

                    body {
                        font-family: Arial;
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

                        text-align: left;
                    }

                    th {
                        background: #eee;
                    }

                </style>

            </head>

            <body>

                <h2>
                    Department List
                </h2>

                <table>

                    <thead>

                        <tr>

                            <th>Id</th>

                            <th>Department Name</th>

                            <th>NoOfEmployee</th>

                            <th>Status</th>

                            <th>CreatedBy</th>

                            <th>ModifiedBy</th>

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

                    <td>
                        ${cells[5].innerText}
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



    // =====================================================
    // PAGE LOAD
    // =====================================================

    document.addEventListener(
        "DOMContentLoaded",
        function() {

            renderTable();

        }
    );

</script>


</body>

</html>
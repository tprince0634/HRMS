<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Trainer List | HRMS</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/trainer-list.css">
</head>

<body>
<div class="main-wrapper">

    <%-- Same shared header and sidebar used by every admin page --%>
    <jsp:include page="/views/admin/adminHeader.jsp"/>
    <jsp:include page="/views/admin/adminSidebar.jsp"/>

    <div class="page-wrapper">
        <div class="content">

            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <h3 class="page-title">Trainers</h3>

                        <ul class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    Dashboard
                                </a>
                            </li>
                            <li class="breadcrumb-item">Training</li>
                            <li class="breadcrumb-item active">Trainer List</li>
                        </ul>
                    </div>

                    <div class="col-sm-6 text-sm-end mt-3 mt-sm-0">
                        <a href="${pageContext.request.contextPath}/addTrainer"
                           class="btn btn-add">
                            <i class="ti ti-circle-plus me-1"></i>
                            Add Trainer
                        </a>
                    </div>
                </div>
            </div>

            <div class="card trainer-card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Trainer List</h5>
                </div>

                <div class="card-body">
                    <div class="trainer-toolbar">
                        <label class="mb-0">
                            Rows per page
                            <select id="pageSize">
                                <option value="5">5</option>
                                <option value="10">10</option>
                                <option value="25">25</option>
                            </select>
                        </label>

                        <input id="trainerSearch"
                               type="search"
                               placeholder="Search trainers">
                    </div>

                    <div class="table-responsive">
                        <table class="table trainer-table mb-0"
                               id="trainerTable">

                            <thead>
                            <tr>
                                <th>Trainer ID</th>
                                <th>Trainer Name</th>
                                <th>Role</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Description</th>
                                <th>Status</th>
                                <th class="text-end">Actions</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:choose>
                                <c:when test="${not empty trainers}">
                                    <c:forEach items="${trainers}"
                                               var="trainer">

                                        <tr>
                                            <td>${trainer.trainerId}</td>

                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty trainer.profilePicture}">
                                                        <img src="${pageContext.request.contextPath}/${trainer.profilePicture}"
                                                             alt="${trainer.firstName}"
                                                             class="trainer-avatar">
                                                    </c:when>

                                                    <c:otherwise>
                                                        <span class="avatar avatar-sm bg-light text-primary me-2">
                                                            <i class="ti ti-user"></i>
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>

                                                <span class="trainer-name">
                                                    ${trainer.firstName} ${trainer.lastName}
                                                </span>
                                            </td>

                                            <td>${trainer.role}</td>
                                            <td>${trainer.email}</td>
                                            <td>${trainer.phone}</td>
                                            <td>${trainer.description}</td>

                                            <td>
                                                <c:choose>
                                                    <c:when test="${trainer.status eq 'Active'}">
                                                        <span class="badge status-active">Active</span>
                                                    </c:when>

                                                    <c:otherwise>
                                                        <span class="badge status-inactive">
                                                            ${trainer.status}
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>

                                            <td class="text-end">
                                                <a href="${pageContext.request.contextPath}/editTrainer?id=${trainer.trainerId}"
                                                   class="btn btn-sm btn-outline-primary me-1"
                                                   title="Edit">
                                                    <i class="ti ti-edit"></i>
                                                </a>

                                                <a href="${pageContext.request.contextPath}/deleteTrainer?id=${trainer.trainerId}"
                                                   class="btn btn-sm btn-outline-danger"
                                                   title="Delete"
                                                   onclick="return confirm('Delete this trainer?');">
                                                    <i class="ti ti-trash"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>

                                <c:otherwise>
                                    <tr>
                                        <td colspan="8" class="empty">
                                            No trainers found.
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>

                    <div class="d-flex justify-content-between align-items-center pt-3">
                        <span id="tableInfo"></span>
                        <ul class="pagination" id="pagination"></ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
            <p class="mb-0">2025 - 2026 &copy; HRMS.</p>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script>
    (function () {
        var table = document.getElementById("trainerTable");
        var search = document.getElementById("trainerSearch");
        var pageSize = document.getElementById("pageSize");
        var tableInfo = document.getElementById("tableInfo");
        var pagination = document.getElementById("pagination");
        var page = 1;

        var rows = Array.prototype.slice.call(table.tBodies[0].rows)
            .filter(function (row) {
                return row.cells.length > 1;
            });

        function renderTable() {
            var searchText = search.value.toLowerCase();

            var filteredRows = rows.filter(function (row) {
                return row.textContent.toLowerCase().includes(searchText);
            });

            var size = Number(pageSize.value);
            var totalPages = Math.max(1, Math.ceil(filteredRows.length / size));

            page = Math.min(page, totalPages);

            rows.forEach(function (row) {
                row.style.display = "none";
            });

            filteredRows
                .slice((page - 1) * size, page * size)
                .forEach(function (row) {
                    row.style.display = "";
                });

            tableInfo.textContent = filteredRows.length === 0
                ? "Showing 0 entries"
                : "Showing " + (((page - 1) * size) + 1)
                + " to " + Math.min(page * size, filteredRows.length)
                + " of " + filteredRows.length + " entries";

            pagination.innerHTML = "";

            for (var i = 1; i <= totalPages; i++) {
                var item = document.createElement("li");

                item.className = "page-item" + (i === page ? " active" : "");
                item.innerHTML =
                    '<button type="button" class="page-link">' + i + '</button>';

                (function (pageNumber) {
                    item.onclick = function () {
                        page = pageNumber;
                        renderTable();
                    };
                })(i);

                pagination.appendChild(item);
            }
        }

        search.addEventListener("input", function () {
            page = 1;
            renderTable();
        });

        pageSize.addEventListener("change", function () {
            page = 1;
            renderTable();
        });

        renderTable();
    })();
</script>
</body>
</html>
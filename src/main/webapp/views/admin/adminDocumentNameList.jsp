<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Document Name List</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f7f7f7;
            color: #202020;
        }

        .main-content {
            margin-left: 240px;
            min-height: 100vh;
        }

        .topbar {
            height: 65px;
            background: #ffffff;
            border-bottom: 1px solid #e5e5e5;
            display: flex;
            align-items: center;
            padding: 0 30px;
        }

        .topbar-search {
            width: 260px;
            height: 38px;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 0 14px;
            outline: none;
        }

        .page-content {
            padding: 30px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .page-header h1 {
            margin: 0 0 8px;
            font-size: 27px;
        }

        .breadcrumb {
            color: #888;
            font-size: 14px;
        }

        .btn-orange {
            background: #f36f21;
            color: #fff;
            text-decoration: none;
            padding: 11px 18px;
            border-radius: 4px;
            font-size: 14px;
        }

        .btn-orange:hover {
            background: #df5e12;
        }

        .card {
            background: #fff;
            border: 1px solid #e5e5e5;
            border-radius: 5px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.05);
        }

        .card-header {
            padding: 18px 20px;
            font-size: 17px;
            font-weight: 600;
            border-bottom: 1px solid #e5e5e5;
        }

        .card-body {
            padding: 20px;
        }

        .list-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            color: #666;
            font-size: 14px;
        }

        .list-top select {
            height: 35px;
            margin: 0 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .search-box {
            width: 250px;
            height: 38px;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 0 12px;
            outline: none;
        }

        .search-box:focus {
            border-color: #f36f21;
        }

        .table-container {
            width: 100%;
            overflow-x: auto;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table th {
            background: #eef0f3;
            padding: 14px;
            text-align: left;
            font-size: 14px;
            font-weight: 600;
            border-bottom: 1px solid #ddd;
        }

        .data-table td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
            font-size: 14px;
        }

        .data-table tbody tr:hover {
            background: #fafafa;
        }

        .action-link {
            text-decoration: none;
            margin-right: 12px;
            font-size: 17px;
            color: #333;
        }

        .delete-link {
            color: #dc3545;
        }

        .empty-message {
            text-align: center;
            padding: 30px !important;
            color: #888;
        }
    </style>
</head>

<body>

<jsp:include page="/partials/sidebar.jspf"/>

<div class="main-content">

    <div class="topbar">
        <input type="text"
               class="topbar-search"
               placeholder="Search in Pulse360">
    </div>

    <div class="page-content">

        <div class="page-header">

            <div>
                <h1>Admin Document Name List</h1>

                <div class="breadcrumb">
                    Home / Admin / Master Documents / Admin Document Name List
                </div>
            </div>

            <a href="${pageContext.request.contextPath}/admin/addAdminDocumentName.jsp"
               class="btn-orange">
                + Add Document
            </a>

        </div>

        <div class="card">

            <div class="card-header">
                Admin Document Name List
            </div>

            <div class="card-body">

                <div class="list-top">

                    <div>
                        Row Per Page

                        <select>
                            <option>5</option>
                            <option>10</option>
                            <option>25</option>
                            <option>50</option>
                        </select>

                        Entries
                    </div>

                    <input type="text"
                           id="searchInput"
                           class="search-box"
                           placeholder="Search">

                </div>

                <div class="table-container">

                    <table class="data-table">

                        <thead>
                        <tr>
                            <th>Document ID</th>
                            <th>Document Name</th>
                            <th>Action</th>
                        </tr>
                        </thead>

                        <tbody id="documentTable">

                        <c:forEach var="document" items="${documents}">

                            <tr>

                                <td>${document.id}</td>

                                <td>${document.docName}</td>

                                <td>

                                    <a class="action-link"
                                       href="${pageContext.request.contextPath}/AdminDocNames?action=edit&id=${document.id}">
                                        ✎
                                    </a>

                                    <a class="action-link delete-link"
                                       href="${pageContext.request.contextPath}/AdminDocNames?action=delete&id=${document.id}"
                                       onclick="return confirm('Are you sure you want to delete this document?');">
                                        🗑
                                    </a>

                                </td>

                            </tr>

                        </c:forEach>

                        <c:if test="${empty documents}">

                            <tr>
                                <td colspan="3" class="empty-message">
                                    No document names found.
                                </td>
                            </tr>

                        </c:if>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </div>

</div>

<script>

    document.getElementById("searchInput").addEventListener("keyup", function () {

        let value = this.value.toLowerCase();

        let rows = document.querySelectorAll("#documentTable tr");

        rows.forEach(function (row) {

            let text = row.innerText.toLowerCase();

            row.style.display = text.includes(value) ? "" : "none";

        });

    });

</script>

</body>
</html>
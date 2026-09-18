<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Document Name List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css">

    <style>
        .list-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
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

        .empty-message {
            text-align: center;
            padding: 25px;
            color: #888;
        }

        .action-link {
            margin-right: 10px;
            text-decoration: none;
            color: #333;
        }

        .delete-link {
            color: #dc3545;
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

                <h1>Employee Document Name List</h1>

                <div class="breadcrumb">
                    Home / Admin / Master Documents / Employee Document Name List
                </div>

            </div>

            <a href="${pageContext.request.contextPath}/employee/addEmployeeDocumentName.jsp"
               class="btn-orange">
                + Add Document
            </a>

        </div>

        <div class="card">

            <div class="card-header">
                Employee Document Name List
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
                                       href="${pageContext.request.contextPath}/EmployeeDocNames?action=edit&id=${document.id}">
                                        ✎
                                    </a>

                                    <a class="action-link delete-link"
                                       href="${pageContext.request.contextPath}/EmployeeDocNames?action=delete&id=${document.id}"
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
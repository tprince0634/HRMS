<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Employee Document Name</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/sidebar.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/document-name.css">
</head>

<body>

<jsp:include page="../sidebar.jsp"/>

<div class="main-content">

    <div class="topbar">
        <input type="text"
               class="topbar-search"
               placeholder="Search in Pulse360">
    </div>

    <div class="page-content">

        <div class="page-header">

            <div>

                <h1>
                    ${document != null ? 'Edit Employee Document Name' : 'Add Employee Document Name'}
                </h1>

                <div class="breadcrumb">
                    Home / Admin / Master Documents /
                    ${document != null ? 'Edit Document Name' : 'Add Employee Document Name'}
                </div>

            </div>

        </div>

        <div class="card">

            <div class="card-header">
                ${document != null ? 'Edit Employee Document Name' : 'Add Employee Document Name'}
            </div>

            <div class="card-body">

                <form action="${pageContext.request.contextPath}/EmployeeDocNames"
                      method="post">

                    <input type="hidden"
                           name="id"
                           value="${document != null ? document.id : ''}">

                    <div class="form-group">

                        <label>Document Name</label>

                        <input type="text"
                               name="docName"
                               class="form-control"
                               placeholder="Enter Document Name"
                               value="${document != null ? document.docName : ''}"
                               required>

                    </div>

                    <button type="submit" class="btn-orange">
                        ${document != null ? 'Update' : 'Add'}
                    </button>

                </form>

            </div>

        </div>

    </div>

</div>

</body>
</html>
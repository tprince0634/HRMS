<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Admin Document Name</title>

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

        .card {
            background: #ffffff;
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
            padding: 25px 20px;
        }

        .form-group {
            margin-bottom: 25px;
            width: 350px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            color: #555;
        }

        .form-control {
            width: 100%;
            height: 42px;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 0 12px;
            font-size: 14px;
            outline: none;
        }

        .form-control:focus {
            border-color: #f36f21;
        }

        .btn-orange {
            display: inline-block;
            background: #f36f21;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 11px 20px;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-orange:hover {
            background: #df5e12;
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
            <h1>
                ${document != null ? 'Edit Admin Document Name' : 'Add Admin Document Name'}
            </h1>

            <div class="breadcrumb">
                Home / Admin / Master Documents /
                ${document != null ? 'Edit Document Name' : 'Add Document Name'}
            </div>
        </div>

        <div class="card">

            <div class="card-header">
                ${document != null ? 'Edit Admin Document Name' : 'Add Admin Document Name'}
            </div>

            <div class="card-body">

                <form action="${pageContext.request.contextPath}/AdminDocNames"
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
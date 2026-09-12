<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

    <title>Event Types - Pulse360</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f5f6f8;
            margin: 0;
            padding: 0;
        }

.add-event-btn {
    display: inline-block;
    margin-left: 10px;
    background: #ff641f;
    color: white;
    text-decoration: none;
    padding: 11px 18px;
    border-radius: 4px;
    font-size: 14px;
}

.add-event-btn:hover {
    background: #e95718;
}
        .page-container {
            padding: 30px;
        }

        .breadcrumb {
            color: #777;
            margin-bottom: 20px;
            font-size: 14px;
        }

        .page-title {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 35px;
        }

        .content {
            display: flex;
            gap: 25px;
            align-items: flex-start;
        }

        .card {
            background: white;
            border-radius: 5px;
            padding: 25px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.08);
        }

        .left-card {
            width: 40%;
        }

        .right-card {
            width: 60%;
        }

        .card-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .form-control {
            width: 100%;
            box-sizing: border-box;
            height: 42px;
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 8px 12px;
            font-size: 14px;
        }

        input[type="color"] {
            width: 45px;
            height: 35px;
            border: none;
            padding: 0;
            cursor: pointer;
        }

        .help-text {
            color: #777;
            font-size: 13px;
            margin-top: 7px;
        }

        .btn {
            background: #ff641f;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 11px 18px;
            font-size: 14px;
            cursor: pointer;
        }

        .btn:hover {
            background: #e95718;
        }

        .table-wrapper {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #e9e9ed;
            text-align: left;
            padding: 13px;
            font-size: 14px;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }

        .color-box {
            width: 34px;
            height: 34px;
            border-radius: 3px;
        }

        .delete-btn {
            color: #555;
            text-decoration: none;
            font-size: 18px;
        }

        .delete-btn:hover {
            color: red;
        }

        .message {
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 4px;
        }

        .error {
            background: #ffe5e5;
            color: #b30000;
        }

        .success {
            background: #e5f8e9;
            color: #16852c;
        }

    </style>

</head>

<body>

<div class="page-container">

    <!-- PAGE TITLE -->

    <div class="page-title">
        Holidays
    </div>

    <!-- BREADCRUMB -->

    <div class="breadcrumb">
        Home / Event / Holidays List
    </div>


    <!-- ERROR MESSAGE -->

    <c:if test="${not empty errorMessage}">

        <div class="message error">
            ${errorMessage}
        </div>

    </c:if>


    <div class="content">

        <!-- ================================= -->
        <!-- ADD EVENT TYPE -->
        <!-- ================================= -->

        <div class="card left-card">

            <div class="card-title">
                <c:choose>

                    <c:when test="${not empty eventType}">
                        Edit Event Type
                    </c:when>

                    <c:otherwise>
                        Add Event Type
                    </c:otherwise>

                </c:choose>
            </div>


            <form method="post"
                  action="${pageContext.request.contextPath}/admin/event-types">

                <c:choose>

                    <c:when test="${not empty eventType}">

                        <input type="hidden"
                               name="action"
                               value="update">

                        <input type="hidden"
                               name="id"
                               value="${eventType.id}">

                    </c:when>

                    <c:otherwise>

                        <input type="hidden"
                               name="action"
                               value="add">

                    </c:otherwise>

                </c:choose>


                <!-- EVENT TYPE NAME -->

                <div class="form-group">

                    <label>
                        Event Type Name
                    </label>

                    <input type="text"
                           name="name"
                           class="form-control"
                           placeholder="Enter event type name"
                           value="${eventType.name}"
                           required>

                </div>


                <!-- COLOR -->

                <div class="form-group">

                    <label>
                        Color
                    </label>

                    <input type="color"
                           name="color"
                           value="${not empty eventType.color ? eventType.color : '#563d7c'}"
                           required>

                    <div class="help-text">
                        Choose a color for this event type
                    </div>

                </div>


                <!-- BUTTON -->

                <button type="submit"
                        class="btn">

                    <c:choose>

                        <c:when test="${not empty eventType}">
                            Update Event Type
                        </c:when>

                        <c:otherwise>
                            Add Event Type
                        </c:otherwise>

                    </c:choose>

                </button>

            </form>

        </div>


        <!-- ================================= -->
        <!-- EXISTING EVENT TYPES -->
        <!-- ================================= -->

        <div class="card right-card">

            <div class="card-title">
                Existing Event Types
            </div>


            <div class="table-wrapper">

                <table>

                    <thead>

                    <tr>
                        <th>Name</th>
                        <th>Color</th>
                        <th>Sample</th>
                        <th>Action</th>
                    </tr>

                    </thead>


                    <tbody>

                    <c:choose>

                        <c:when test="${not empty eventTypes}">

                            <c:forEach var="type"
                                       items="${eventTypes}">

                                <tr>

                                    <!-- NAME -->

                                    <td>
                                        ${type.name}
                                    </td>


                                    <!-- COLOR -->

                                    <td>
                                        ${type.color}
                                    </td>


                                    <!-- SAMPLE -->

                                    <td>

                                        <div class="color-box"
                                             style="background-color: ${type.color};">
                                        </div>

                                    </td>


                                    <!-- ACTION -->

                                    <td>

                                        <a class="delete-btn"
                                           href="${pageContext.request.contextPath}/admin/event-types?action=delete&id=${type.id}"
                                           onclick="return confirm('Are you sure you want to delete this event type?');">

                                            🗑

                                        </a>

                                    </td>

                                </tr>

                            </c:forEach>

                        </c:when>


                        <c:otherwise>

                            <tr>

                                <td colspan="4"
                                    style="text-align:center;">

                                    No Event Types Found

                                </td>

                            </tr>

                        </c:otherwise>

                    </c:choose>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</div>
<a href="${pageContext.request.contextPath}/admin/events?action=add"
   class="add-event-btn">

    Add Event

</a>
</body>
</html>
```
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="HRMS Event Types">
    <title>Event Types - Pulse360</title>

    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    <style>
        .event-type-page .content-card {
            background: #fff;
            border: 1px solid #e9e9e9;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,.04);
        }
        .event-type-page .color-preview {
            width: 36px;
            height: 36px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }
        .event-type-page .action-btn {
            width: 34px;
            height: 34px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 5px;
            text-decoration: none;
            margin-right: 5px;
        }
        .event-type-page .edit-btn { color:#6b7280; background:#f3f4f6; }
        .event-type-page .edit-btn:hover { color:#ff641f; }
        .event-type-page .delete-btn { color:#dc3545; background:#fff1f2; }
        .event-type-page .delete-btn:hover { background:#ffe4e6; }
        .event-type-page .form-control[type=color] { padding: 3px; }
        .event-type-page .page-actions { display:flex; gap:10px; flex-wrap:wrap; }
        .event-type-page .btn-orange { background:#ff641f; border-color:#ff641f; color:#fff; }
        .event-type-page .btn-orange:hover { background:#e95718; border-color:#e95718; color:#fff; }
    </style>
</head>

<body>
<div id="global-loader" style="display:none;"><div class="page-loader"></div></div>

<div class="main-wrapper">

    <!-- HEADER -->
    <div class="header">
        <div class="main-header">
            <div class="header-left">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="SmartHR">
                </a>
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="dark-logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="SmartHR">
                </a>
            </div>

            <a id="mobile_btn" class="mobile_btn" href="#sidebar">
                <span class="bar-icon"><span></span><span></span><span></span></span>
            </a>

            <div class="header-user">
                <div class="nav user-menu nav-list">
                    <div class="me-auto d-flex align-items-center" id="header-search">
                        <a id="toggle_btn" href="javascript:void(0);" class="btn btn-menubar me-1">
                            <i class="ti ti-arrow-bar-to-left"></i>
                        </a>
                        <div class="input-group input-group-flat d-inline-flex me-1">
                            <span class="input-icon-addon"><i class="ti ti-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search in HRMS">
                            <span class="input-group-text"><kbd>CTRL + /</kbd></span>
                        </div>
                    </div>
                    <div class="d-flex align-items-center ms-2">
                        <span class="fw-medium">HRMS</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="../adminSidebar.jsp" %>

    <!-- PAGE WRAPPER -->
    <div class="page-wrapper">
        <div class="content event-type-page">

            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col">
                        <h4 class="page-title mb-1">Event Types</h4>
                        <ul class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">Home</a>
                            </li>
                            <li class="breadcrumb-item">Event</li>
                            <li class="breadcrumb-item active">Event Types</li>
                        </ul>
                    </div>
                    <div class="col-auto">
                        <div class="page-actions">
                            <a href="${pageContext.request.contextPath}/admin/events?action=add" class="btn btn-orange">
                                <i class="ti ti-plus me-1"></i> Add Event
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/events" class="btn btn-light">
                                <i class="ti ti-calendar-event me-1"></i> Back to Events
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <c:out value="${errorMessage}"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <c:if test="${not empty successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <c:out value="${successMessage}"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <div class="row g-4">
                <!-- ADD / EDIT EVENT TYPE -->
                <div class="col-xl-4 col-lg-5">
                    <div class="card content-card mb-0">
                        <div class="card-header">
                            <h5 class="card-title mb-0">
                                <c:choose>
                                    <c:when test="${not empty eventType}">Edit Event Type</c:when>
                                    <c:otherwise>Add Event Type</c:otherwise>
                                </c:choose>
                            </h5>
                        </div>
                        <div class="card-body">
                            <form method="post" action="${pageContext.request.contextPath}/admin/event-types" id="eventTypeForm">
                                <c:choose>
                                    <c:when test="${not empty eventType}">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="id" value="${eventType.id}">
                                    </c:when>
                                    <c:otherwise>
                                        <input type="hidden" name="action" value="add">
                                    </c:otherwise>
                                </c:choose>

                                <div class="mb-3">
                                    <label class="form-label">Event Type Name <span class="text-danger">*</span></label>
                                    <input type="text" name="name" class="form-control"
                                           placeholder="Enter event type name"
                                           value="<c:out value='${eventType.name}'/>" required maxlength="100">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Color <span class="text-danger">*</span></label>
                                    <input type="color" name="color" id="eventTypeColor" class="form-control form-control-color"
                                           value="${not empty eventType.color ? eventType.color : '#563d7c'}" required>
                                    <small class="text-muted">Choose a color for this event type.</small>
                                </div>

                                <div class="d-flex gap-2">
                                    <button type="submit" class="btn btn-orange">
                                        <c:choose>
                                            <c:when test="${not empty eventType}">
                                                <i class="ti ti-device-floppy me-1"></i> Update Event Type
                                            </c:when>
                                            <c:otherwise>
                                                <i class="ti ti-plus me-1"></i> Add Event Type
                                            </c:otherwise>
                                        </c:choose>
                                    </button>

                                    <c:if test="${not empty eventType}">
                                        <a href="${pageContext.request.contextPath}/admin/event-types" class="btn btn-light">Cancel</a>
                                    </c:if>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- EXISTING EVENT TYPES -->
                <div class="col-xl-8 col-lg-7">
                    <div class="card content-card mb-0">
                        <div class="card-header d-flex align-items-center justify-content-between">
                            <h5 class="card-title mb-0">Existing Event Types</h5>
                            <span class="badge bg-light text-dark">${empty eventTypes ? 0 : eventTypes.size()}</span>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-hover mb-0 align-middle">
                                    <thead>
                                    <tr>
                                        <th class="ps-4">Name</th>
                                        <th>Color</th>
                                        <th>Sample</th>
                                        <th class="text-end pe-4">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${not empty eventTypes}">
                                            <c:forEach var="type" items="${eventTypes}">
                                                <tr>
                                                    <td class="ps-4 fw-medium"><c:out value="${type.name}"/></td>
                                                    <td><c:out value="${type.color}"/></td>
                                                    <td>
                                                        <div class="color-preview" style="background-color:<c:out value='${type.color}'/>;"></div>
                                                    </td>
                                                    <td class="text-end pe-4">
                                                        <a href="${pageContext.request.contextPath}/admin/event-types?action=edit&id=${type.id}"
                                                           class="action-btn edit-btn" title="Edit Event Type">
                                                            <i class="ti ti-edit"></i>
                                                        </a>
                                                        <a href="${pageContext.request.contextPath}/admin/event-types?action=delete&id=${type.id}"
                                                           class="action-btn delete-btn delete-event-type"
                                                           title="Delete Event Type"
                                                           data-name="<c:out value='${type.name}'/>">
                                                            <i class="ti ti-trash"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="4" class="text-center py-5 text-muted">No Event Types Found</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<script>
(function () {
    'use strict';

    // Delete confirmation
    document.querySelectorAll('.delete-event-type').forEach(function (button) {
        button.addEventListener('click', function (e) {
            const name = this.getAttribute('data-name') || 'this event type';
            if (!confirm('Are you sure you want to delete "' + name + '"?')) {
                e.preventDefault();
            }
        });
    });

})();
</script>

</body>
</html>

```
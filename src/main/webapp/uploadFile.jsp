```jsp
<%@ page import="java.util.List" %>
<%@ page import="org.example.model.FileUploads" %>

<%
    String contextPath = request.getContextPath();

    List<FileUploads> files =
            (List<FileUploads>) request.getAttribute("files");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width,
                   initial-scale=1.0">

    <title>File Upload</title>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="<%= contextPath %>/assets/css/bootstrap.min.css">

    <!-- Tabler Icons -->
    <link rel="stylesheet"
          href="<%= contextPath %>/assets/plugins/tabler-icons/tabler-icons.css">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="<%= contextPath %>/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="<%= contextPath %>/assets/plugins/fontawesome/css/all.min.css">

    <!-- Main CSS -->
    <link rel="stylesheet"
          href="<%= contextPath %>/assets/css/style.css">

</head>


<body>

<div class="main-wrapper">


    <!-- =====================================================
         HEADER
    ====================================================== -->

    <div class="header">

        <div class="main-header">

            <div class="header-left">

                <a href="<%= contextPath %>/index.jsp"
                   class="logo">

                    <img src="<%= contextPath %>/assets/img/logo.svg"
                         alt="Logo">

                </a>

            </div>


            <div class="header-user">

                <div class="nav user-menu">

                    <div class="me-auto d-flex align-items-center">

                        <div class="input-group input-group-flat">

                            <span class="input-icon-addon">

                                <i class="ti ti-search"></i>

                            </span>

                            <input type="text"
                                   class="form-control"
                                   placeholder="Search in HRMS">

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <!-- =====================================================
         SIDEBAR
    ====================================================== -->

    <div class="sidebar" id="sidebar">

        <div class="sidebar-inner slimscroll">

            <div id="sidebar-menu"
                 class="sidebar-menu">

                <ul>

                    <li class="menu-title">
                        <span>MAIN MENU</span>
                    </li>


                    <li>

                        <a href="<%= contextPath %>/index.jsp">

                            <i class="ti ti-smart-home"></i>

                            <span>Dashboard</span>

                        </a>

                    </li>


                    <li class="submenu">

                        <a href="javascript:void(0);">

                            <i class="ti ti-users"></i>

                            <span>Training</span>

                            <span class="menu-arrow"></span>

                        </a>

                        <ul>

                            <li>
                                <a href="<%= contextPath %>/trainer">
                                    Trainers
                                </a>
                            </li>

                            <li>
                                <a href="<%= contextPath %>/training">
                                    Training List
                                </a>
                            </li>

                            <li>
                                <a href="<%= contextPath %>/trainingType">
                                    Training Type
                                </a>
                            </li>

                        </ul>

                    </li>


                    <li class="active">

                        <a href="<%= contextPath %>/uploadFile">

                            <i class="ti ti-file"></i>

                            <span>Documents</span>

                        </a>

                    </li>

                </ul>

            </div>

        </div>

    </div>


    <!-- =====================================================
         PAGE CONTENT
    ====================================================== -->

    <div class="page-wrapper">

        <div class="content">


            <!-- =================================================
                 PAGE HEADER
            ================================================== -->

            <div class="page-header">

                <div class="row align-items-center">

                    <div class="col">

                        <h3 class="page-title">
                            File Upload
                        </h3>

                        <p class="text-muted mb-0">
                            Upload and manage your documents
                        </p>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 SUCCESS MESSAGE
            ================================================== -->

            <% if ("success".equals(request.getParameter("message"))) { %>

                <div class="alert alert-success alert-dismissible fade show">

                    File uploaded successfully.

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

            <% } %>


            <!-- =================================================
                 ERROR MESSAGE
            ================================================== -->

            <% if ("error".equals(request.getParameter("message"))) { %>

                <div class="alert alert-danger alert-dismissible fade show">

                    File upload failed.

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert">
                    </button>

                </div>

            <% } %>


            <div class="row">


                <!-- =================================================
                     UPLOAD FILE
                ================================================== -->

                <div class="col-lg-5">

                    <div class="card">

                        <div class="card-header">

                            <h5 class="card-title mb-0">

                                Upload File

                            </h5>

                        </div>


                        <div class="card-body">


                            <form action="<%= contextPath %>/uploadFile"
                                  method="post"
                                  enctype="multipart/form-data">


                                <div class="mb-4">

                                    <label class="form-label">

                                        Select File

                                    </label>


                                    <input type="file"
                                           name="file"
                                           class="form-control"
                                           required>


                                    <small class="text-muted">

                                        Maximum file size: 10 MB

                                    </small>

                                </div>


                                <button type="submit"
                                        class="btn btn-primary">

                                    <i class="ti ti-upload me-1"></i>

                                    Upload File

                                </button>

                            </form>

                        </div>

                    </div>

                </div>


                <!-- =================================================
                     FILE INFORMATION
                ================================================== -->

                <div class="col-lg-7">

                    <div class="card">

                        <div class="card-header">

                            <h5 class="card-title mb-0">

                                File Storage

                            </h5>

                        </div>


                        <div class="card-body">

                            <div class="d-flex align-items-center">

                                <div class="avatar avatar-lg bg-primary-transparent me-3">

                                    <i class="ti ti-folder fs-24"></i>

                                </div>


                                <div>

                                    <h6 class="mb-1">

                                        Document Storage

                                    </h6>

                                    <p class="text-muted mb-0">

                                        Upload your HRMS documents
                                        securely.

                                    </p>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- =================================================
                 UPLOADED FILES
            ================================================== -->

            <div class="card mt-4">


                <div class="card-header">

                    <div class="d-flex align-items-center
                                justify-content-between">

                        <h5 class="card-title mb-0">

                            Uploaded Files

                        </h5>


                        <span class="badge bg-primary">

                            <%= files != null ? files.size() : 0 %>
                            Files

                        </span>

                    </div>

                </div>


                <div class="card-body">


                    <% if (files == null || files.isEmpty()) { %>


                        <!-- =========================================
                             NO FILES
                        ========================================== -->

                        <div class="text-center py-5">

                            <div class="avatar avatar-xl
                                        bg-light
                                        mb-3">

                                <i class="ti ti-file-off fs-30"></i>

                            </div>


                            <h6>
                                No files uploaded
                            </h6>


                            <p class="text-muted">

                                Upload your first document
                                using the form above.

                            </p>

                        </div>


                    <% } else { %>


                        <!-- =========================================
                             FILE TABLE
                        ========================================== -->

                        <div class="table-responsive">

                            <table class="table table-hover">

                                <thead>

                                <tr>

                                    <th>
                                        #
                                    </th>

                                    <th>
                                        File Name
                                    </th>

                                    <th>
                                        User ID
                                    </th>

                                    <th>
                                        File Path
                                    </th>

                                    <th class="text-end">
                                        Action
                                    </th>

                                </tr>

                                </thead>


                                <tbody>


                                <%
                                    int count = 1;

                                    for (FileUploads file : files) {
                                %>


                                <tr>

                                    <!-- FILE NUMBER -->

                                    <td>

                                        <%= count++ %>

                                    </td>


                                    <!-- FILE NAME -->

                                    <td>

                                        <div class="d-flex
                                                    align-items-center">

                                            <div class="avatar
                                                        avatar-sm
                                                        bg-primary-transparent
                                                        me-2">

                                                <i class="ti ti-file"></i>

                                            </div>


                                            <span class="fw-medium">

                                                <%= file.getFileName() %>

                                            </span>

                                        </div>

                                    </td>


                                    <!-- USER ID -->

                                    <td>

                                        <%= file.getUserId() %>

                                    </td>


                                    <!-- FILE PATH -->

                                    <td>

                                        <span class="text-muted">

                                            <%= file.getFilePath() %>

                                        </span>

                                    </td>


                                    <!-- ACTION -->

                                    <td class="text-end">


                                        <a href="<%= contextPath %>/downloadFile?id=<%= file.getId() %>"
                                           class="btn btn-sm btn-primary">

                                            <i class="ti ti-download"></i>

                                            Download

                                        </a>


                                        <a href="<%= contextPath %>/deleteFile?id=<%= file.getId() %>"
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this file?');">

                                            <i class="ti ti-trash"></i>

                                            Delete

                                        </a>


                                    </td>

                                </tr>


                                <%
                                    }
                                %>


                                </tbody>

                            </table>

                        </div>


                    <% } %>

                </div>

            </div>


        </div>


        <!-- =====================================================
             FOOTER
        ====================================================== -->

        <div class="footer border-top bg-white p-3">

            <div class="d-flex
                        align-items-center
                        justify-content-between">

                <p class="mb-0">

                    HRMS &copy; 2026

                </p>

                <p class="mb-0">

                    Human Resource Management System

                </p>

            </div>

        </div>

    </div>

</div>


<!-- =========================================================
     JAVASCRIPT
========================================================== -->

<script src="<%= contextPath %>/assets/js/jquery-3.7.1.min.js">
</script>

<script src="<%= contextPath %>/assets/js/feather.min.js">
</script>

<script src="<%= contextPath %>/assets/js/jquery.slimscroll.min.js">
</script>

<script src="<%= contextPath %>/assets/js/bootstrap.bundle.min.js">
</script>

<script src="<%= contextPath %>/assets/js/script.js">
</script>

</body>

</html>
```

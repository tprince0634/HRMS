<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%
    // Get the current page URI segment to handle conditional layout logic
    String uri = request.getRequestURI();
    String pageName = uri.substring(uri.lastIndexOf("/") + 1);

    // Remove extension if present (e.g., "login.jsp" -> "login")
    if (pageName.contains(".")) {
        pageName = pageName.substring(0, pageName.lastIndexOf("."));
    }
%>

<!-- Apple Touch Icon -->
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png">

<!-- Favicon -->
<link rel="icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

<%
    // Check if the current page should SKIP loading the generic layout/theme script
    if (
            !pageName.equals("layout-horizontal") && !pageName.equals("layout-detached") &&
                    !pageName.equals("layout-modern") && !pageName.equals("layout-two-column") &&
                    !pageName.equals("layout-hovered") && !pageName.equals("layout-box") &&
                    !pageName.equals("layout-horizontal-single") && !pageName.equals("layout-horizontal-overlay") &&
                    !pageName.equals("layout-horizontal-box") && !pageName.equals("layout-horizontal-sidemenu") &&
                    !pageName.equals("layout-without-header") && !pageName.equals("layout-rtl") &&
                    !pageName.equals("layout-dark") && !pageName.equals("login") &&
                    !pageName.equals("login-2") && !pageName.equals("login-3") &&
                    !pageName.equals("register") && !pageName.equals("register-2") &&
                    !pageName.equals("register-3") && !pageName.equals("forgot-password") &&
                    !pageName.equals("forgot-password-2") && !pageName.equals("forgot-password-3") &&
                    !pageName.equals("reset-password") && !pageName.equals("reset-password-2") &&
                    !pageName.equals("reset-password-3") && !pageName.equals("email-verification") &&
                    !pageName.equals("email-verification-2") && !pageName.equals("email-verification-3") &&
                    !pageName.equals("two-step-verification") && !pageName.equals("two-step-verification-2") &&
                    !pageName.equals("two-step-verification-3") && !pageName.equals("lock-screen") &&
                    !pageName.equals("error-404") && !pageName.equals("error-500") &&
                    !pageName.equals("layout-horizontal-fullwidth") && !pageName.equals("layout-stacked") &&
                    !pageName.equals("success") && !pageName.equals("success-2") &&
                    !pageName.equals("success-3") && !pageName.equals("coming-soon") &&
                    !pageName.equals("under-maintenance") && !pageName.equals("under-construction")
    ) {
%>
<!-- Theme Script js -->
<script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>
<% } %>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<!-- Feather CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

<!-- Tabler Icon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

<!-- Select2 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

<!-- Fontawesome CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

<!-- Color Picker Css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/themes/nano.min.css">

<!-- Daterangepikcer CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

<!-- Datatable CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">

<!-- Summernote CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/summernote/summernote-lite.min.css">

<!-- Datetimepicker CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

<!-- Main CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

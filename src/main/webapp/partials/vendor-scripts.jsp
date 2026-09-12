<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%
    String pageName = request.getServletPath();

    if (pageName == null || pageName.isEmpty()) {
        pageName = request.getRequestURI();
    }

    int lastSlash = pageName.lastIndexOf('/');
    if (lastSlash >= 0 && lastSlash < pageName.length() - 1) {
        pageName = pageName.substring(lastSlash + 1);
    }

    if ("dashboard".equals(pageName)
            && "/admin/dashboard".equals(request.getServletPath())) {
        pageName = "admin-dashboard";
    }
%>


<%--<!-- jQuery -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>--%>

<%--<!-- Bootstrap Core JS -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>--%>

<%--<!-- Feather Icon JS -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>--%>

<%--<!-- Slimscroll JS -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>--%>

<%--<!-- Summernote JS -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/plugins/summernote/summernote-lite.min.js"></script>--%>

<%--<!-- Color Picker JS -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>--%>

<%--<!-- DataTable JS -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>--%>

<%--<!-- Daterangepicker JS -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>--%>

<%--<!-- Datetimepicker JS -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>--%>

<%--<!-- Select2 JS -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>--%>

<%--<!-- ApexCharts -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/chart-data.js"></script>--%>

<%--<!-- Bootstrap Tagsinput -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>--%>

<%--<!-- Theia Sticky Sidebar -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.min.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/assets/plugins/theia-sticky-sidebar/ResizeSensor.min.js"></script>--%>

<%--<% if ("kanban-view".equals(pageName)) { %>--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/kanban.js"></script>--%>
<%--<% } %>--%>

<%--<!-- Custom JS -->--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>--%>


<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/chart-data.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/chartjs/chart.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/chartjs/chart-data.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/summernote/summernote-lite.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/peity/jquery.peity.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/peity/chart-data.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
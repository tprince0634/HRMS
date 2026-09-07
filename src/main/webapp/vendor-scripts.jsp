<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Safely extract the current page string token for conditional JavaScript asset compilation
    String requestUri = request.getRequestURI();
    String activePage = "";

    if (requestUri != null && requestUri.contains("/")) {
        activePage = requestUri.substring(requestUri.lastIndexOf("/") + 1);
        if (activePage.contains(".")) {
            activePage = activePage.substring(0, activePage.lastIndexOf("."));
        }
    }
%>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<!-- Feather Icon JS -->
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<!-- Slimscroll JS -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<!-- Summernote JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/summernote/summernote-lite.min.js"></script>

<!-- Color Picker JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

<!-- Datatable JS -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<!-- Daterangepikcer JS -->
<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<!-- Datetimepicker JS -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<!-- Select2 JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<!-- Chart JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/chart-data.js"></script>

<!-- Bootstrap Tagsinput JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

<!-- Theiastickysidebar JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/theia-sticky-sidebar/theia-sticky-sidebar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/theia-sticky-sidebar/ResizeSensor.min.js"></script>

<%
    // Conditional script loading for specific viewports (e.g. Kanban)
    if ("kanban-view".equals(activePage)) {
%>
<script src="${pageContext.request.contextPath}/assets/js/kanban.js"></script>
<% } %>

<!-- Custom Layout Script Configurations -->
<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

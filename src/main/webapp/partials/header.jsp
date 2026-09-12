<!-- Header -->
<div class="header">
    <div class="main-header">

        <div class="header-left">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="logo logo-normal">
                <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="HRMS Logo">
            </a>

            <a href="${pageContext.request.contextPath}/admin/dashboard" class="logo logo-white">
                <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="HRMS Logo">
            </a>

            <a href="${pageContext.request.contextPath}/admin/dashboard" class="logo-small">
                <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg" alt="HRMS Logo">
            </a>
        </div>

        <a id="mobile_btn" class="mobile_btn" href="#sidebar">
            <span class="bar-icon">
                <span></span>
                <span></span>
                <span></span>
            </span>
        </a>

        <div class="header-user">
            <div class="nav user-menu nav-list">

                <div class="me-auto d-flex align-items-center" id="header-search">

                    <a id="toggle_btn" href="javascript:void(0);" class="btn btn-menubar me-1">
                        <i class="ti ti-arrow-bar-to-left"></i>
                    </a>

                    <div class="input-group input-group-flat d-inline-flex me-1">
                        <span class="input-icon-addon">
                            <i class="ti ti-search"></i>
                        </span>

                        <input type="text"
                               class="form-control"
                               placeholder="Search in HRMS">

                        <span class="input-group-text">
                            <kbd>CTRL + /</kbd>
                        </span>
                    </div>

                    <a href="javascript:void(0);" class="btn btn-menubar">
                        <i class="ti ti-settings-cog"></i>
                    </a>
                </div>

                <div class="d-flex align-items-center">
                    <div class="dropdown">
                        <a href="javascript:void(0);"
                           class="nav-link dropdown-toggle"
                           data-bs-toggle="dropdown"
                           aria-expanded="false">

                            <span class="user-img">
                                <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg"
                                     alt="Admin"
                                     class="rounded-circle">
                            </span>

                        </a>

                        <div class="dropdown-menu dropdown-menu-end">
                            <a class="dropdown-item" href="javascript:void(0);">
                                <i class="ti ti-user me-2"></i>Profile
                            </a>

                            <a class="dropdown-item" href="javascript:void(0);">
                                <i class="ti ti-settings me-2"></i>Settings
                            </a>

                            <a class="dropdown-item"
                               href="${pageContext.request.contextPath}/logout">
                                <i class="ti ti-logout me-2"></i>Logout
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="mobile-user-menu">
            <a href="javascript:void(0);"
               class="nav-link dropdown-toggle"
               data-bs-toggle="dropdown"
               aria-expanded="false">
                <i class="fa fa-ellipsis-v"></i>
            </a>

            <div class="dropdown-menu dropdown-menu-end">
                <a class="dropdown-item" href="javascript:void(0);">Profile</a>
                <a class="dropdown-item" href="javascript:void(0);">Settings</a>
                <a class="dropdown-item"
                   href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>

    </div>
</div>
<!-- /Header -->


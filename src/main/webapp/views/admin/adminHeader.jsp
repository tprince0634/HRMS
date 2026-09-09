<!-- HEADER -->
<div class="header">

    <div class="main-header">

        <div class="header-left">

            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="logo">

                <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                     alt="HRMS Logo">

            </a>

            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="dark-logo">

                <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                     alt="HRMS Logo">

            </a>

        </div>


        <a id="mobile_btn"
           class="mobile_btn"
           href="#sidebar">

            <span class="bar-icon">
                <span></span>
                <span></span>
                <span></span>
            </span>

        </a>


        <div class="header-user">

            <div class="nav user-menu nav-list">

                <div class="me-auto d-flex align-items-center"
                     id="header-search">

                    <a id="toggle_btn"
                       href="javascript:void(0);"
                       class="btn btn-menubar me-1">

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


                    <a href="javascript:void(0);"
                       class="btn btn-menubar">

                        <i class="ti ti-settings-cog"></i>

                    </a>

                </div>

            </div>

        </div>


        <div class="dropdown mobile-user-menu">

            <a href="javascript:void(0);"
               class="nav-link dropdown-toggle"
               data-bs-toggle="dropdown"
               aria-expanded="false">

                <i class="fa fa-ellipsis-v"></i>

            </a>


            <div class="dropdown-menu dropdown-menu-end">

                <a class="dropdown-item"
                   href="javascript:void(0);">
                    Profile
                </a>

                <a class="dropdown-item"
                   href="javascript:void(0);">
                    Settings
                </a>

                <a class="dropdown-item"
                   href="javascript:void(0);">
                    Logout
                </a>

            </div>

        </div>

    </div>

</div>
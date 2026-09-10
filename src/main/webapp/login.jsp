<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Include Head Components (Replacing PHP Include blocks) -->
    <jsp:include page="partials/title-meta.jsp" />
    <jsp:include page="partials/head-css.jsp" />
</head>
<body class="bg-white">
<!-- Main Wrapper -->
<div class="main-wrapper">

    <div class="container-fuild">
        <div class="w-100 overflow-hidden position-relative flex-wrap d-block vh-100">
            <div class="row">
                <div class="col-lg-5">
                    <div class="login-background position-relative d-lg-flex align-items-center justify-content-center d-none flex-wrap vh-100">
                        <div class="bg-overlay-img">
                            <img src="${pageContext.request.contextPath}/assets/img/bg/bg-01.png" class="bg-1" alt="Img">
                            <img src="${pageContext.request.contextPath}/assets/img/bg/bg-02.png" class="bg-2" alt="Img">
                            <img src="${pageContext.request.contextPath}/assets/img/bg/bg-03.png" class="bg-3" alt="Img">
                        </div>
                        <div class="authentication-card w-100">
                            <div class="authen-overlay-item border w-100">
                                <h1 class="text-white display-1">Empowering people <br> through seamless HR <br> management.</h1>
                                <div class="my-4 mx-auto authen-overlay-img">
                                    <img src="${pageContext.request.contextPath}/assets/img/bg/authentication-bg-01.png" alt="Img">
                                </div>
                                <div>
                                    <p class="text-white fs-20 fw-semibold text-center">Efficiently manage your workforce, streamline <br> operations effortlessly.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-7 col-md-12 col-sm-12">
                    <div class="row justify-content-center align-items-center vh-100 overflow-auto flex-wrap">
                        <div class="col-md-7 mx-auto vh-100">


                            <!-- FORM UPDATE: Changed action to route directly to LoginServlet using POST -->
                            <form action="${pageContext.request.contextPath}/login" method="POST" class="vh-100">
                                <div class="vh-100 d-flex flex-column justify-content-between p-4 pb-0">
                                    <div class=" mx-auto mb-5 text-center">
                                        <img src="${pageContext.request.contextPath}/assets/img/logo.svg" class="img-fluid" alt="Logo">
                                    </div>
                                    <div class="">
                                        <div class="text-center mb-3">
                                            <h2 class="mb-2">Sign In</h2>
                                            <p class="mb-0">Please enter your details to sign in</p>

                                            <!-- Optional: Error message display block if validation fails -->
                                            <% if(request.getAttribute("error") != null) { %>
                                            <p style="color:red;"><%= request.getAttribute("error") %></p>
                                            <% } %>


                                            <%
                                                String errorMessage = (String) request.getAttribute("errorMessage");
                                                if (errorMessage != null) {
                                            %>
                                            <div class="alert alert-danger" role="alert">
                                                <%= errorMessage %>
                                            </div>
                                            <%
                                                }
                                            %>


                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Email Address</label>
                                            <div class="input-group">
                                                <!-- ADDED: name="email" to grab input data in Servlet -->
                                                <input type="text" name="email" value="" class="form-control border-end-0" required>
                                                <span class="input-group-text border-start-0">
                                                        <i class="ti ti-mail"></i>
                                                    </span>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Password</label>
                                            <div class="pass-group">
                                                <!-- ADDED: name="password" to grab input data in Servlet -->
                                                <input type="password" name="password" class="pass-input form-control" required>
                                                <span class="ti toggle-password ti-eye-off"></span>
                                            </div>
                                        </div>

                                        <div class="d-flex align-items-center justify-content-between mb-3">
                                            <div class="d-flex align-items-center">
                                                <div class="form-check form-check-md mb-0">
                                                    <input class="form-check-input" id="remember_me" type="checkbox" name="rememberMe">
                                                    <label for="remember_me" class="form-check-label mt-0">Remember Me</label>
                                                </div>
                                            </div>
                                            <div class="text-end">
                                                <a href="${pageContext.request.contextPath}/forgot-password.jsp" class="link-danger">Forgot Password?</a>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <button type="submit" class="btn btn-primary w-100">Sign In</button>
                                        </div>
                                        <div class="text-center">
                                            <h6 class="fw-normal text-dark mb-0">Don’t have an account?
                                                <a href="${pageContext.request.contextPath}/register.jsp" class="hover-a"> Create Account</a>
                                            </h6>
                                        </div>

                                        <div class="login-or">
                                            <span class="span-or">Or</span>
                                        </div>
                                        <div class="mt-2">
                                            <div class="d-flex align-items-center justify-content-center flex-wrap">
                                                <div class="text-center me-2 flex-fill">
                                                    <a href="javascript:void(0);" class="br-10 p-2 btn btn-info d-flex align-items-center justify-content-center">
                                                        <img class="img-fluid m-1" src="${pageContext.request.contextPath}/assets/img/icons/facebook-logo.svg" alt="Facebook">
                                                    </a>
                                                </div>
                                                <div class="text-center me-2 flex-fill">
                                                    <a href="javascript:void(0);" class="br-10 p-2 btn btn-outline-light border d-flex align-items-center justify-content-center">
                                                        <img class="img-fluid m-1" src="${pageContext.request.contextPath}/assets/img/icons/google-logo.svg" alt="Google">
                                                    </a>
                                                </div>
                                                <div class="text-center flex-fill">
                                                    <a href="javascript:void(0);" class="bg-dark br-10 p-2 btn btn-dark d-flex align-items-center justify-content-center">
                                                        <img class="img-fluid m-1" src="${pageContext.request.contextPath}/assets/img/icons/apple-logo.svg" alt="Apple">
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-5 pb-4 text-center">
                                        <p class="mb-0 text-gray-9">Copyright &copy; 2024 - Smarthr</p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!-- /Main Wrapper -->
<jsp:include page="partials/vendor-scripts.jsp" />
</body>
</html>

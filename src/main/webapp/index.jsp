<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to HRMS</title>

    <!-- Link to your project's Bootstrap framework asset -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .welcome-card {
            background: #ffffff;
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 500px;
            width: 100%;
        }
        .btn-portal {
            background-color: #ff9b44; /* Standard SmartHR theme orange accent color */
            color: white;
            font-weight: 600;
            padding: 0.75rem 2rem;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .btn-portal:hover {
            background-color: #fc831c;
            color: white;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

<div class="welcome-card">
    <!-- Application Branding Logo -->
    <div class="mb-4">
        <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="HRMS Logo" class="img-fluid" style="max-height: 60px;">
    </div>

    <h1 class="fw-bold mb-3">Welcome to SmartHR</h1>
    <p class="text-muted mb-4">
        Efficiently manage your workforce, streamline workspace operations, and empower your corporate ecosystem effortlessly.
    </p>

    <!-- ACTION BUTTON: Safely routes directly to your LoginServlet endpoint -->
    <a href="${pageContext.request.contextPath}/login" class="btn btn-portal w-100 btn-lg shadow-sm">
        Enter Employee Portal
    </a>

    <div class="mt-4 text-center">
        <small class="text-secondary">Copyright &copy; 2024 - SmartHR Ecosystem</small>
    </div>
</div>

</body>
</html>

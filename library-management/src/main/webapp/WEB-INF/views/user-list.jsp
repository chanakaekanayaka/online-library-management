<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Member Directory | SmartLib Admin</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --admin-dark: #0f172a;
            --admin-accent: #6366f1;
            --glass-bg: rgba(255, 255, 255, 0.9);
        }

        body { 
            font-family: 'Plus Jakarta Sans', sans-serif; 
            background-color: #f8fafc; 
            color: #1e293b;
            padding-bottom: 50px;
        }

        /* Modern Header Area */
        .page-header {
            background: var(--admin-dark);
            padding: 60px 0 100px;
            color: white;
            margin-bottom: -60px;
        }

        /* Glass Table Container */
        .table-glass-card {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-radius: 24px;
            padding: 30px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.05);
        }

        /* Custom Table Styling */
        .table { border-collapse: separate; border-spacing: 0 12px; }
        .table thead th { 
            border: none; 
            color: #64748b; 
            font-size: 0.75rem; 
            text-transform: uppercase; 
            letter-spacing: 1px;
            padding: 15px 20px;
        }

        .table tbody tr {
            background: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.02);
            transition: all 0.3s ease;
        }

        .table tbody tr:hover {
            transform: scale(1.01);
            box-shadow: 0 10px 20px rgba(99, 102, 241, 0.1);
            z-index: 10;
        }

        .table td, .table th { 
            padding: 20px; 
            border: none; 
        }

        .table td:first-child { border-radius: 15px 0 0 15px; }
        .table td:last-child { border-radius: 0 15px 15px 0; }

        /* Badge Enhancements */
        .badge-pill {
            padding: 8px 16px;
            border-radius: 50px;
            font-weight: 700;
            font-size: 0.7rem;
            letter-spacing: 0.5px;
        }

        .badge-admin { background: #e0e7ff; color: #4338ca; }
        .badge-regular { background: #f1f5f9; color: #475569; }

        /* Action Buttons */
        .btn-action {
            width: 38px;
            height: 38px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 12px;
            transition: 0.3s;
        }

        .btn-edit { background: #fef3c7; color: #d97706; }
        .btn-edit:hover { background: #d97706; color: white; }
        
        .btn-delete { background: #fee2e2; color: #dc2626; }
        .btn-delete:hover { background: #dc2626; color: white; }

        /* Search & Filter Bar */
        .search-wrapper {
            background: white;
            border-radius: 15px;
            padding: 8px 20px;
            border: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            width: 300px;
        }

        .search-wrapper input { border: none; outline: none; margin-left: 10px; width: 100%; font-size: 0.9rem; }

        .btn-add-new {
            background: var(--admin-accent);
            color: white;
            border-radius: 15px;
            padding: 12px 25px;
            font-weight: 700;
            border: none;
            transition: 0.3s;
        }
        .btn-add-new:hover { transform: translateY(-3px); box-shadow: 0 10px 20px rgba(99, 102, 241, 0.3); color: white; }

    </style>
</head>
<body>

    <header class="page-header">
        <div class="container animate__animated animate__fadeInDown">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h1 class="fw-bold m-0"><i class="bi bi-people-fill me-3"></i>User Directory</h1>
                    <p class="text-white-50 mt-1">Manage and monitor all library system members.</p>
                </div>
                <div class="d-none d-md-block">
                    <a href="/admin/dashboard" class="btn btn-outline-light rounded-pill px-4">
                        <i class="bi bi-speedometer2 me-2"></i> Dashboard
                    </a>
                </div>
            </div>
        </div>
    </header>

    <div class="container pb-5">
        <div class="d-flex flex-wrap justify-content-between align-items-center mb-4 gap-3">
            <div class="search-wrapper shadow-sm animate__animated animate__fadeInLeft">
                <i class="bi bi-search text-muted"></i>
                <input type="text" placeholder="Search members...">
            </div>
            
            <div class="animate__animated animate__fadeInRight">
                <a href="/register" class="btn btn-add-new shadow-sm">
                    <i class="bi bi-plus-lg me-2"></i> Add New Member
                </a>
            </div>
        </div>

        <c:if test="${not empty successMessage}">
            <div class="alert alert-success border-0 shadow-sm rounded-4 p-3 mb-4 animate__animated animate__bounceIn" role="alert">
                <div class="d-flex align-items-center">
                    <i class="bi bi-check-circle-fill fs-4 me-3"></i>
                    <div>
                        <h6 class="mb-0 fw-bold">Success!</h6>
                        <small>${successMessage}</small>
                    </div>
                    <button type="button" class="btn-close ms-auto" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>

        <div class="table-glass-card shadow-sm" data-aos="fade-up">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead>
                        <tr>
                            <th>Member ID</th>
                            <th>Username</th>
                            <th>Email Address</th>
                            <th>Account Type</th>
                            <th class="text-center">Operations</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr class="animate__animated animate__fadeIn">
                                <td>
                                    <span class="text-muted fw-bold">#LIB-00${user.id}</span>
                                </td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img src="https://ui-avatars.com/api/?name=${user.username}&background=random&color=fff&size=32" 
                                             class="rounded-circle me-3 border" alt="Avatar">
                                        <span class="fw-bold">${user.username}</span>
                                    </div>
                                </td>
                                <td>
                                    <span class="text-secondary small">${user.email}</span>
                                </td>
                                <td>
                                    <span class="badge badge-pill ${user.userType == 'ADMIN' ? 'badge-admin' : 'badge-regular'}">
                                        <i class="bi ${user.userType == 'ADMIN' ? 'bi-shield-check' : 'bi-person'} me-1"></i>
                                        ${user.userType}
                                    </span>
                                </td>
                                <td class="text-center">
                                    <div class="d-flex justify-content-center gap-2">
                                        <a href="/editUser/${user.id}" class="btn-action btn-edit" title="Edit User">
                                            <i class="bi bi-pencil-fill"></i>
                                        </a>
                                        <a href="/deleteUser/${user.id}" class="btn-action btn-delete" 
                                           title="Delete User" onclick="return confirm('Confirm user deletion? This cannot be undone.')">
                                            <i class="bi bi-trash3-fill"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="mt-5 text-center">
            <a href="/" class="btn btn-link text-decoration-none text-muted fw-bold">
                <i class="bi bi-house-door me-1"></i> Back to System Home
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({ duration: 1000, once: true });
    </script>
</body>
</html>
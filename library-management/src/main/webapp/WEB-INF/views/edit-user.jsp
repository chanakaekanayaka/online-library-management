<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Member | SmartLib Admin</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;700&display=swap');

        :root {
            --admin-primary: #0f172a;
            --admin-accent: #6366f1;
            --glass-bg: rgba(255, 255, 255, 0.95);
        }

        body { 
            background: #f1f5f9;
            font-family: 'Plus Jakarta Sans', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Animated Background Elements */
        .bg-blob {
            position: fixed;
            width: 400px;
            height: 400px;
            background: var(--admin-accent);
            filter: blur(80px);
            opacity: 0.1;
            z-index: -1;
            border-radius: 50%;
        }

        /* Glassmorphism Card Design */
        .edit-card { 
            border: none; 
            border-radius: 28px; 
            background: var(--glass-bg);
            backdrop-filter: blur(15px);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 950px;
            display: flex;
            overflow: hidden;
            animation: zoomIn 0.5s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        /* Left Side Info Panel */
        .info-panel {
            background: var(--admin-primary);
            color: white;
            padding: 50px;
            width: 40%;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .info-panel i { 
            font-size: 3.5rem; 
            color: var(--admin-accent); 
            margin-bottom: 20px;
            animation: pulse 2s infinite;
        }

        /* Form Styling */
        .form-panel { padding: 50px; width: 60%; }

        .form-label { 
            font-weight: 700; 
            color: #475569; 
            font-size: 0.8rem; 
            text-transform: uppercase; 
            letter-spacing: 0.8px; 
        }

        .form-control { 
            border-radius: 14px; 
            padding: 14px 18px; 
            border: 1.5px solid #e2e8f0; 
            background: #f8fafc;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .form-control:focus { 
            border-color: var(--admin-accent); 
            background: white;
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
            outline: none;
        }

        .readonly-field { background-color: #f1f5f9 !important; cursor: not-allowed; }

        /* Button Styling */
        .btn-update { 
            background: var(--admin-accent); 
            color: white; 
            border: none; 
            padding: 16px; 
            border-radius: 16px; 
            font-weight: 700; 
            transition: 0.4s;
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.3);
        }

        .btn-update:hover { 
            transform: translateY(-4px); 
            box-shadow: 0 20px 25px -5px rgba(99, 102, 241, 0.4);
            color: white;
        }

        .btn-back { 
            border-radius: 16px; 
            padding: 16px; 
            font-weight: 600; 
            color: #64748b; 
            border: 1.5px solid #e2e8f0;
            transition: 0.3s;
        }

        .btn-back:hover { background: #f8fafc; color: var(--admin-primary); }

        @media (max-width: 992px) {
            .edit-card { flex-direction: column; max-width: 500px; }
            .info-panel, .form-panel { width: 100%; padding: 35px; }
        }
    </style>
</head>
<body>

    <div class="bg-blob" style="top: -100px; left: -100px;"></div>
    <div class="bg-blob" style="bottom: -100px; right: -100px;"></div>

    <div class="container d-flex justify-content-center p-3">
        <div class="card edit-card shadow-2xl">
            <div class="info-panel">
                <div class="animate__animated animate__fadeInDown">
                    <i class="bi bi-shield-lock-fill"></i>
                </div>
                <h2 class="fw-bold mb-3">Admin Access</h2>
                <p class="opacity-75 mb-0">You are currently modifying member credentials. Ensure all changes comply with the library data security policy.</p>
                
                <div class="mt-5 pt-4 border-top border-secondary border-opacity-25">
                    <div class="d-flex align-items-center">
                        <div class="small fw-bold text-uppercase opacity-50">Member ID:</div>
                        <div class="ms-2 badge bg-primary">LIB-00${user.id}</div>
                    </div>
                </div>
            </div>

            <div class="form-panel animate__animated animate__fadeIn">
                <h3 class="fw-extrabold text-dark mb-4">Edit User Details</h3>
                
                <form action="/updateUser" method="POST">
                    <input type="hidden" name="id" value="${user.id}">
                    
                    <div class="row">
                        <div class="col-12 mb-4">
                            <label class="form-label">Full Username</label>
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0 text-muted"><i class="bi bi-person"></i></span>
                                <input type="text" name="username" class="form-control border-start-0" value="${user.username}" required>
                            </div>
                        </div>

                        <div class="col-12 mb-4">
                            <label class="form-label">Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0 text-muted"><i class="bi bi-envelope"></i></span>
                                <input type="email" name="email" class="form-control border-start-0" value="${user.email}" required>
                            </div>
                        </div>

                        <div class="col-12 mb-4">
                            <label class="form-label">Account Password</label>
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0 text-muted"><i class="bi bi-key"></i></span>
                                <input type="password" name="password" class="form-control border-start-0" value="${user.password}" required>
                            </div>
                        </div>

                        <div class="col-12 mb-5">
                            <label class="form-label">Assigned User Role</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light border-end-0 text-muted"><i class="bi bi-tags"></i></span>
                                <input type="text" name="userType" class="form-control border-start-0 readonly-field" value="${user.userType}" readonly>
                            </div>
                            <small class="text-muted mt-2 d-block" style="font-size: 0.7rem;">
                                <i class="bi bi-info-circle me-1"></i> Account roles can only be promoted via direct database access for security.
                            </small>
                        </div>
                    </div>

                    <div class="row g-3">
                        <div class="col-sm-8">
                            <button type="submit" class="btn btn-update w-100">
                                <i class="bi bi-cloud-upload me-2"></i>Apply Changes
                            </button>
                        </div>
                        <div class="col-sm-4">
                            <a href="/admin/users" class="btn btn-back w-100 text-decoration-none d-flex align-items-center justify-content-center">
                                Cancel
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
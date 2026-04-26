<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile | SmartLib</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;700&display=swap');

        :root {
            --primary-grad: linear-gradient(135deg, #6366f1 0%, #a855f7 100%);
            --glass-bg: rgba(255, 255, 255, 0.95);
        }

        body { 
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            font-family: 'Plus Jakarta Sans', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .edit-container {
            max-width: 900px;
            margin: auto;
            padding: 20px;
        }

        /* Glassmorphism Card */
        .edit-card { 
            border: none; 
            border-radius: 30px; 
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: row;
            animation: zoomIn 0.6s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        /* Left Branding Panel */
        .brand-panel {
            background: var(--primary-grad);
            width: 35%;
            padding: 40px;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-align: center;
        }

        .brand-panel i { font-size: 4rem; margin-bottom: 20px; }

        /* Form Styling */
        .form-panel { padding: 50px; width: 65%; }

        .form-label { font-weight: 600; color: #475569; font-size: 0.85rem; text-transform: uppercase; letter-spacing: 0.5px; }

        .form-control { 
            border-radius: 12px; 
            padding: 12px 16px; 
            border: 1.5px solid #e2e8f0; 
            background: #f8fafc;
            transition: all 0.3s ease;
        }

        .form-control:focus { 
            border-color: #6366f1; 
            background: white;
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
            outline: none;
        }

        .form-control[readonly] { background-color: #f1f5f9; cursor: not-allowed; }

        /* Button Styling */
        .btn-save { 
            background: var(--primary-grad); 
            color: white; 
            border: none; 
            padding: 14px; 
            border-radius: 14px; 
            font-weight: 700; 
            transition: 0.4s;
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.3);
        }

        .btn-save:hover { 
            transform: translateY(-3px); 
            box-shadow: 0 20px 25px -5px rgba(99, 102, 241, 0.4);
            color: white;
        }

        .btn-cancel { 
            border-radius: 14px; 
            padding: 14px; 
            font-weight: 600; 
            color: #64748b; 
            border: 1.5px solid #e2e8f0;
            transition: 0.3s;
        }

        .btn-cancel:hover { background: #f1f5f9; color: #1e293b; }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            .edit-card { flex-direction: column; }
            .brand-panel { width: 100%; padding: 30px; }
            .form-panel { width: 100%; padding: 30px; }
        }
    </style>
</head>
<body>

    <div class="container edit-container">
        <nav aria-label="breadcrumb" class="mb-4 animate__animated animate__fadeIn">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/" class="text-decoration-none text-muted">Home</a></li>
                <li class="breadcrumb-item"><a href="/profile/${user.id}" class="text-decoration-none text-muted">Profile</a></li>
                <li class="breadcrumb-item active fw-bold text-primary" aria-current="page">Edit Settings</li>
            </ol>
        </nav>

        <div class="card edit-card">
            <div class="brand-panel">
                <div class="animate__animated animate__pulse animate__infinite infinite">
                    <i class="bi bi-person-gear"></i>
                </div>
                <h3 class="fw-bold">Settings</h3>
                <p class="small opacity-75">Update your personal information to keep your profile current.</p>
            </div>

            <div class="form-panel">
                <h2 class="fw-extrabold text-dark mb-4">Edit Profile</h2>
                
                <form action="/updateMyProfile" method="POST">
                    <input type="hidden" name="id" value="${user.id}">
                    
                    <div class="row g-3">
                        <div class="col-md-12 mb-3">
                            <label class="form-label">Display Name</label>
                            <input type="text" name="username" class="form-control" value="${user.username}" required>
                        </div>
                        
                        <div class="col-md-12 mb-3">
                            <label class="form-label">Email Address</label>
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0"><i class="bi bi-envelope text-muted"></i></span>
                                <input type="email" name="email" class="form-control border-start-0" value="${user.email}" required>
                            </div>
                        </div>
                        
                        <div class="col-md-12 mb-3">
                            <label class="form-label">Access Password</label>
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0"><i class="bi bi-shield-lock text-muted"></i></span>
                                <input type="password" name="password" class="form-control border-start-0" value="${user.password}" required>
                            </div>
                        </div>

                        <div class="col-md-12 mb-4">
                            <label class="form-label">Account Role</label>
                            <input type="text" class="form-control" value="${user.userType}" readonly>
                            <div class="form-text small"><i class="bi bi-info-circle me-1"></i>Roles are managed by the System Administrator.</div>
                        </div>
                    </div>

                    <div class="row g-2 pt-3">
                        <div class="col-sm-8">
                            <button type="submit" class="btn btn-save w-100">
                                <i class="bi bi-check2-circle me-2"></i>Apply Changes
                            </button>
                        </div>
                        <div class="col-sm-4">
                            <a href="/profile/${user.id}" class="btn btn-cancel w-100 text-decoration-none d-flex align-items-center justify-content-center">
                                Cancel
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        
        <div class="text-center mt-4 animate__animated animate__fadeInUp animate__delay-1s">
            <p class="text-muted small">&copy; 2026 SmartLib Management System. All rights reserved.</p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
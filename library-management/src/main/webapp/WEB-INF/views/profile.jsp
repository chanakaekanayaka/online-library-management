<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | SmartLib</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-grad: linear-gradient(135deg, #6366f1 0%, #a855f7 100%);
            --glass-bg: rgba(255, 255, 255, 0.9);
            --dark-text: #1e293b;
        }

        body { 
            font-family: 'Plus Jakarta Sans', sans-serif; 
            background: #f8fafc;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            padding: 20px;
        }

        .profile-card {
            border: none;
            border-radius: 30px;
            background: white;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            width: 100%;
            max-width: 500px;
            animation: zoomIn 0.6s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        .profile-header {
            background: var(--primary-grad);
            height: 140px;
            position: relative;
            display: flex;
            justify-content: center;
            align-items: flex-end;
        }

        .avatar-box {
            position: absolute;
            bottom: -40px;
            background: #6366f1;
            color: white;
            width: 100px;
            height: 100px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            font-weight: 800;
            border: 5px solid white;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        }

        .profile-content { padding: 60px 40px 40px; text-align: center; }
        .user-name { color: var(--dark-text); font-weight: 800; font-size: 1.8rem; margin-bottom: 5px; }
        .badge-type { background: rgba(99, 102, 241, 0.1); color: #6366f1; font-weight: 700; padding: 6px 16px; border-radius: 50px; font-size: 0.75rem; letter-spacing: 1px; }
        .info-grid { margin-top: 30px; text-align: left; background: #fdfdfd; border: 1px solid #f1f5f9; border-radius: 20px; padding: 25px; }
        
        .btn-edit { background: var(--primary-grad); border: none; color: white; padding: 14px; border-radius: 16px; font-weight: 700; width: 100%; transition: 0.4s; box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.3); }
        .btn-edit:hover { transform: translateY(-4px); box-shadow: 0 20px 25px -5px rgba(99, 102, 241, 0.4); color: white; }
    </style>
</head>
<body>

    <div class="profile-card">
        <div class="profile-header">
            <div class="avatar-box">NA</div>
        </div>

        <div class="profile-content">
            <h2 class="user-name">${user.username}</h2>
            <span class="badge-type text-uppercase">${user.userType} MEMBER</span>

            <div class="info-grid shadow-sm mb-4">
                <div class="d-flex align-items-center mb-3">
                    <i class="bi bi-person bg-light p-2 rounded-3 me-3 text-primary"></i>
                    <div><p class="mb-0 text-muted small text-uppercase fw-bold">Display Name</p><strong>${user.username}</strong></div>
                </div>
                <div class="d-flex align-items-center mb-3">
                    <i class="bi bi-envelope bg-light p-2 rounded-3 me-3 text-primary"></i>
                    <div><p class="mb-0 text-muted small text-uppercase fw-bold">Email Address</p><strong>${user.email}</strong></div>
                </div>
                <div class="d-flex align-items-center">
                    <i class="bi bi-shield-check bg-light p-2 rounded-3 me-3 text-success"></i>
                    <div><p class="mb-0 text-muted small text-uppercase fw-bold">Status</p><strong class="text-success">Verified & Active</strong></div>
                </div>
            </div>

            <div class="d-grid gap-3">
                <a href="/editMyProfile/${user.id}" class="btn btn-edit d-flex align-items-center justify-content-center text-decoration-none shadow-sm">
                    <i class="bi bi-pencil-square me-2"></i> Edit Account Settings
                </a>
                <a href="/" class="btn btn-outline-secondary border-0 fw-bold py-2 rounded-4">
                    <i class="bi bi-house me-2"></i> Return to Home
                </a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
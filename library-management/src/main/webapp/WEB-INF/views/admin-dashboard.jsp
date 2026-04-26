<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Premium Admin Dashboard | SmartLib</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;800&display=swap');

        :root { 
            --sidebar-width: 280px; 
            --primary-grad: linear-gradient(135deg, #6366f1 0%, #a855f7 100%);
            --sidebar-color: #0f172a;
        }

        body { 
            background-color: #f8fafc; 
            font-family: 'Plus Jakarta Sans', sans-serif;
            overflow-x: hidden;
        }

        /* Sidebar Glassmorphism */
        .sidebar { 
            width: var(--sidebar-width); 
            height: 100vh; 
            position: fixed; 
            background: var(--sidebar-color);
            color: #94a3b8; 
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            z-index: 1000;
        }

        .sidebar .nav-link { 
            color: #94a3b8; 
            padding: 12px 25px; 
            margin: 8px 15px;
            border-radius: 12px;
            display: flex; 
            align-items: center; 
            transition: 0.3s;
        }

        .sidebar .nav-link:hover, .sidebar .nav-link.active { 
            background: rgba(255, 255, 255, 0.1); 
            color: white; 
        }

        .sidebar .nav-link.active {
            background: var(--primary-grad);
            box-shadow: 0 10px 15px -3px rgba(99, 102, 241, 0.4);
        }

        .sidebar .nav-link i { margin-right: 15px; font-size: 1.25rem; }

        /* Main Content */
        .main-content { 
            margin-left: var(--sidebar-width); 
            padding: 40px; 
            transition: 0.3s;
        }

        .stat-card { 
            border: none; 
            border-radius: 24px; 
            background: white;
            box-shadow: 0 4px 20px rgba(0,0,0,0.03); 
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
        }

        .stat-card:hover { 
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.08); 
        }

        .icon-box { 
            width: 55px; 
            height: 55px; 
            border-radius: 16px; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            font-size: 1.6rem;
            margin-bottom: 15px;
        }

        /* Gradient Cards */
        .card-user { background: linear-gradient(135deg, #e0e7ff 0%, #eef2ff 100%); color: #4338ca; }
        .card-book { background: linear-gradient(135deg, #dcfce7 0%, #f0fdf4 100%); color: #15803d; }
        .card-borrow { background: linear-gradient(135deg, #fef3c7 0%, #fffbeb 100%); color: #b45309; }
        .card-alert { background: linear-gradient(135deg, #fee2e2 0%, #fef2f2 100%); color: #b91c1c; }

        /* Tabbed Section */
        .management-container {
            background: white;
            border-radius: 24px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.03);
            border: 1px solid #f1f5f9;
        }

        .nav-tabs { border: none; background: #f8fafc; padding: 5px; border-radius: 15px; display: inline-flex; }
        .nav-tabs .nav-link { 
            border: none; 
            border-radius: 12px; 
            color: #64748b; 
            font-weight: 600; 
            padding: 10px 20px; 
            transition: 0.3s;
        }
        .nav-tabs .nav-link.active { background: white; color: #6366f1; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }

        .user-profile-img {
            width: 45px;
            height: 45px;
            border-radius: 12px;
            object-fit: cover;
            border: 2px solid white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        /* Table Styles */
        .custom-table { border-collapse: separate; border-spacing: 0 8px; }
        .custom-table thead th { border: none; color: #94a3b8; font-size: 0.75rem; text-transform: uppercase; padding: 15px; }
        .custom-table tbody tr { background: #f8fafc; border-radius: 12px; transition: 0.3s; }
        .custom-table tbody tr:hover { transform: scale(1.01); background: #f1f5f9; }
        .custom-table td { padding: 15px; border: none; }
        .custom-table td:first-child { border-radius: 12px 0 0 12px; }
        .custom-table td:last-child { border-radius: 0 12px 12px 0; }

        /* Animations */
        .delay-1 { animation-delay: 0.1s; }
        .delay-2 { animation-delay: 0.2s; }
        .delay-3 { animation-delay: 0.3s; }
        .delay-4 { animation-delay: 0.4s; }
    </style>
</head>
<body>

    <div class="sidebar shadow-lg">
        <div class="p-4 text-center mb-4">
            <div class="d-flex align-items-center justify-content-center mb-2">
                <span class="fs-2 me-2">📚</span>
                <h3 class="fw-bold m-0 text-white">SmartLib</h3>
            </div>
            <span class="badge bg-secondary opacity-75 py-2 px-3 rounded-pill" style="font-size: 0.7rem;">ADMINISTRATION v2.0</span>
        </div>
        
        <nav class="nav flex-column">
            <a class="nav-link active" href="/admin/dashboard"><i class="bi bi-grid-1x2-fill"></i> Dashboard</a>
            <a class="nav-link" href="/admin/users"><i class="bi bi-people-fill"></i> User Management</a>
            <a class="nav-link" href="#"><i class="bi bi-book-half"></i> Book Collection</a>
            <a class="nav-link" href="#"><i class="bi bi-clock-history"></i> Activity Logs</a>
            <a class="nav-link" href="#"><i class="bi bi-gear-fill"></i> Settings</a>
            
            <div class="mt-auto p-3">
                <a class="nav-link text-danger border border-danger border-opacity-25" href="/logout">
                    <i class="bi bi-power"></i> Sign Out
                </a>
            </div>
        </nav>
    </div>

    <main class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-5 animate__animated animate__fadeIn">
            <div>
                <h2 class="fw-bold mb-1 text-dark">Admin Console</h2>
                <p class="text-muted small">Welcome, <span class="text-primary fw-bold">${user.username}</span>. Manage your system efficiently.</p>
            </div>
            <div class="d-flex align-items-center bg-white p-2 rounded-4 shadow-sm border">
                <div class="text-end me-3 d-none d-md-block">
                    <p class="mb-0 fw-bold small text-dark">${user.username}</p>
                    <p class="mb-0 text-muted" style="font-size: 0.75rem;">Root Administrator</p>
                </div>
                <img src="https://ui-avatars.com/api/?name=${user.username}&background=6366f1&color=fff&bold=true" class="user-profile-img" alt="Profile">
            </div>
        </div>

        <div class="row g-4 mb-5">
            <div class="col-md-3 animate__animated animate__fadeInUp delay-1">
                <div class="card stat-card card-user p-4">
                    <div class="icon-box bg-white shadow-sm"><i class="bi bi-people-fill"></i></div>
                    <h6 class="fw-bold opacity-75 small">TOTAL MEMBERS</h6>
                    <h2 class="fw-bold m-0">1,284</h2>
                </div>
            </div>
            <div class="col-md-3 animate__animated animate__fadeInUp delay-2">
                <div class="card stat-card card-book p-4">
                    <div class="icon-box bg-white shadow-sm"><i class="bi bi-journal-bookmark-fill"></i></div>
                    <h6 class="fw-bold opacity-75 small">TOTAL TITLES</h6>
                    <h2 class="fw-bold m-0">4,850</h2>
                </div>
            </div>
            <div class="col-md-3 animate__animated animate__fadeInUp delay-3">
                <div class="card stat-card card-borrow p-4">
                    <div class="icon-box bg-white shadow-sm"><i class="bi bi-arrow-left-right"></i></div>
                    <h6 class="fw-bold opacity-75 small">ISSUED BOOKS</h6>
                    <h2 class="fw-bold m-0">342</h2>
                </div>
            </div>
            <div class="col-md-3 animate__animated animate__fadeInUp delay-4">
                <div class="card stat-card card-alert p-4">
                    <div class="icon-box bg-white shadow-sm"><i class="bi bi-shield-lock-fill"></i></div>
                    <h6 class="fw-bold opacity-75 small">SECURITY LOGS</h6>
                    <h2 class="fw-bold m-0">02</h2>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-lg-8 animate__animated animate__fadeInLeft">
                <div class="management-container">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold m-0 text-dark">Operations Center</h5>
                        <ul class="nav nav-tabs" id="adminTabs" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="borrow-tab" data-bs-toggle="tab" data-bs-target="#borrowContent" type="button" role="tab">Borrowings</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="members-tab" data-bs-toggle="tab" data-bs-target="#membersContent" type="button" role="tab">New Members</button>
                            </li>
                        </ul>
                    </div>

                    <div class="tab-content" id="adminTabsContent">
                        <div class="tab-pane fade show active" id="borrowContent" role="tabpanel">
                            <div class="table-responsive">
                                <table class="table custom-table align-middle">
                                    <thead>
                                        <tr>
                                            <th>Member Name</th>
                                            <th>Book Title</th>
                                            <th>Issue Date</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="fw-bold">Kasun Perera</td>
                                            <td class="text-muted">Introduction to Java</td>
                                            <td class="small">2026-04-20</td>
                                            <td><span class="badge bg-success-subtle text-success border border-success border-opacity-10 px-3">Returned</span></td>
                                        </tr>
                                        <tr>
                                            <td class="fw-bold">Amila Silva</td>
                                            <td class="text-muted">Mastering Python</td>
                                            <td class="small">2026-04-25</td>
                                            <td><span class="badge bg-warning-subtle text-warning border border-warning border-opacity-10 px-3">Pending</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="membersContent" role="tabpanel">
                            <div class="table-responsive">
                                <table class="table custom-table align-middle">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Joined Date</th>
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="fw-bold">Nimali Fernando</td>
                                            <td class="text-muted">nimali@example.com</td>
                                            <td class="small">2026-04-26</td>
                                            <td><span class="badge bg-primary-subtle text-primary border border-primary border-opacity-10 px-3">Active</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 animate__animated animate__fadeInRight">
                <div class="management-container h-100">
                    <h5 class="fw-bold mb-4 text-dark">Admin Utilities</h5>
                    <div class="d-grid gap-3">
                        <a href="/admin/users" class="btn btn-light border-0 py-3 rounded-4 text-start d-flex align-items-center shadow-sm">
                            <i class="bi bi-people-fill text-primary me-3 fs-5"></i>
                            <div><p class="mb-0 fw-bold small text-dark">User Directory</p><small class="text-muted">Manage system users</small></div>
                        </a>
                        <button class="btn btn-light border-0 py-3 rounded-4 text-start d-flex align-items-center shadow-sm">
                            <i class="bi bi-journal-plus text-success me-3 fs-5"></i>
                            <div><p class="mb-0 fw-bold small text-dark">Catalog Entry</p><small class="text-muted">Add a new book</small></div>
                        </button>
                        <button class="btn btn-light border-0 py-3 rounded-4 text-start d-flex align-items-center shadow-sm">
                            <i class="bi bi-file-earmark-pdf-fill text-danger me-3 fs-5"></i>
                            <div><p class="mb-0 fw-bold small text-dark">Monthly Report</p><small class="text-muted">Export system data</small></div>
                        </button>
                        <button class="btn btn-light border-0 py-3 rounded-4 text-start d-flex align-items-center shadow-sm">
                            <i class="bi bi-envelope-check-fill text-warning me-3 fs-5"></i>
                            <div><p class="mb-0 fw-bold small text-dark">Overdue Alerts</p><small class="text-muted">Notify borrowers</small></div>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
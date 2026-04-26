<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SmartLib | Discover the Future of Reading</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;600;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #6366f1;
            --dark-bg: #0f172a;
            --glass-white: rgba(255, 255, 255, 0.85);
        }

        body { 
            font-family: 'Plus Jakarta Sans', sans-serif; 
            background-color: #f8fafc; 
            color: #1e293b;
            overflow-x: hidden;
        }

        /* Blurred Sticky Navbar */
        .navbar {
            background: rgba(15, 23, 42, 0.8) !important;
            backdrop-filter: blur(15px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            transition: 0.4s;
        }

        .navbar-brand { font-size: 1.8rem; letter-spacing: -1px; }

        /* Hero Section with Parallax Overlay */
        .hero-section { 
            height: 90vh;
            background: linear-gradient(rgba(15, 23, 42, 0.7), rgba(15, 23, 42, 0.7)), 
                        url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?auto=format&fit=crop&w=1920&q=80');
            background-attachment: fixed;
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }

        .hero-content { max-width: 850px; }

        .search-container {
            background: var(--glass-white);
            backdrop-filter: blur(10px);
            padding: 8px;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
            margin-top: 40px;
            transition: 0.3s;
        }

        .search-container:focus-within { transform: scale(1.02); box-shadow: 0 25px 50px rgba(0,0,0,0.3); }

        .search-container input {
            border: none;
            background: transparent;
            padding: 15px 25px;
            width: 100%;
            font-weight: 500;
            outline: none;
        }

        .btn-search {
            background: var(--primary-color);
            border-radius: 15px;
            padding: 12px 35px;
            color: white;
            border: none;
            font-weight: 700;
        }

        /* Modern Feature Cards */
        .feature-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 25px;
            padding: 40px 30px;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            height: 100%;
        }

        .feature-card:hover {
            transform: translateY(-15px);
            box-shadow: 0 30px 60px -12px rgba(0,0,0,0.1);
            border-color: var(--primary-color);
        }

        .icon-circle {
            width: 80px;
            height: 80px;
            background: rgba(99, 102, 241, 0.1);
            color: var(--primary-color);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.2rem;
            margin: 0 auto 25px;
            transition: 0.3s;
        }

        .feature-card:hover .icon-circle { background: var(--primary-color); color: white; transform: rotate(10deg); }

        /* Stats Section */
        .stats-bar {
            background: var(--dark-bg);
            color: white;
            padding: 60px 0;
            margin-top: -50px;
            position: relative;
            z-index: 10;
            border-radius: 30px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }

        /* Footer */
        footer {
            background: var(--dark-bg);
            color: #94a3b8;
            padding: 80px 0 30px;
        }

        .footer-link { color: #94a3b8; text-decoration: none; transition: 0.3s; }
        .footer-link:hover { color: var(--primary-color); padding-left: 5px; }

        .btn-scroll-top {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 50px;
            height: 50px;
            background: var(--primary-color);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            z-index: 1000;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top py-3">
        <div class="container">
            <a class="navbar-brand fw-extrabold" href="/">📚 SmartLib</a>
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navContent">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navContent">
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item px-3"><a class="nav-link text-white opacity-75" href="#">Catalogue</a></li>
                    <li class="nav-item px-3"><a class="nav-link text-white opacity-75" href="#">Research</a></li>
                    <li class="nav-item px-3 me-3 text-white-50 small">| &nbsp; Hi, <strong>${user.username}</strong></li>
                    
                    <li class="nav-item dropdown bg-white bg-opacity-10 rounded-pill px-2">
                        <a class="nav-link dropdown-toggle text-white d-flex align-items-center" href="#" data-bs-toggle="dropdown">
                            <i class="bi bi-person-circle fs-4 me-2"></i> Account
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow-xl border-0 mt-3 p-2 rounded-4">
                            <li><a class="dropdown-item py-2 rounded-3" href="/profile/${user.id}"><i class="bi bi-person-fill me-2"></i> My Profile</a></li>
                            <c:if test="${user.userType == 'ADMIN'}">
                                <li><a class="dropdown-item py-2 rounded-3 text-primary fw-bold" href="/admin/dashboard"><i class="bi bi-shield-lock-fill me-2"></i> Admin Panel</a></li>
                            </c:if>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item py-2 rounded-3 text-danger" href="/logout"><i class="bi bi-box-arrow-right me-2"></i> Log Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <header class="hero-section">
        <div class="container hero-content" data-aos="zoom-out" data-aos-duration="1500">
            <h6 class="text-uppercase fw-bold mb-3 tracking-widest text-info">Modern Library Experience</h6>
            <h1 class="display-1 fw-extrabold mb-4 animate__animated animate__fadeInUp">Unlock Worlds of <br><span class="text-info">Knowledge.</span></h1>
            <p class="fs-5 opacity-75 mb-5">Welcome back, ${user.username}! Explore over 5 million digital volumes and research papers at your fingertips.</p>
            
            <div class="search-container d-flex">
                <input type="text" placeholder="Search for titles, authors, or ISBN numbers...">
                <button class="btn btn-search shadow-lg">SEARCH</button>
            </div>
        </div>
    </header>

    <section class="container stats-bar text-center" data-aos="fade-up">
        <div class="row g-4">
            <div class="col-md-4 border-end border-secondary border-opacity-25">
                <h2 class="fw-bold mb-0">5M+</h2>
                <p class="text-muted small text-uppercase mb-0">E-Books & Papers</p>
            </div>
            <div class="col-md-4 border-end border-secondary border-opacity-25">
                <h2 class="fw-bold mb-0">12k+</h2>
                <p class="text-muted small text-uppercase mb-0">Active Members</p>
            </div>
            <div class="col-md-4">
                <h2 class="fw-bold mb-0">24/7</h2>
                <p class="text-muted small text-uppercase mb-0">Digital Access</p>
            </div>
        </div>
    </section>

    <section class="container py-100 mt-5">
        <div class="text-center mb-5" data-aos="fade-up">
            <h2 class="fw-extrabold fs-1">Elevate Your Learning</h2>
            <p class="text-muted">Explore the powerful features built for modern researchers and students.</p>
        </div>
        <div class="row g-4 mb-5">
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                <div class="feature-card text-center">
                    <div class="icon-circle shadow-sm"><i class="bi bi-lightning-charge-fill"></i></div>
                    <h4 class="fw-bold">Instant Borrowing</h4>
                    <p class="text-muted">Reserve any book in seconds and get notified when it's ready for collection.</p>
                </div>
            </div>
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                <div class="feature-card text-center">
                    <div class="icon-circle shadow-sm"><i class="bi bi-clock-history"></i></div>
                    <h4 class="fw-bold">Smart Tracking</h4>
                    <p class="text-muted">Manage your due dates, extension requests, and borrowing history with ease.</p>
                </div>
            </div>
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                <div class="feature-card text-center">
                    <div class="icon-circle shadow-sm"><i class="bi bi-journal-plus"></i></div>
                    <h4 class="fw-bold">Daily Arrivals</h4>
                    <p class="text-muted">New research papers and bestsellers added every 24 hours to our collection.</p>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-4">
                    <h4 class="text-white fw-bold mb-4">📚 SmartLib</h4>
                    <p class="small">The leading digital library management solution for educational institutions. Simplify your reading journey today.</p>
                    <div class="d-flex gap-3 mt-4">
                        <a href="#" class="btn btn-outline-light btn-sm rounded-circle"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="btn btn-outline-light btn-sm rounded-circle"><i class="bi bi-twitter-x"></i></a>
                        <a href="#" class="btn btn-outline-light btn-sm rounded-circle"><i class="bi bi-linkedin"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1">
                    <h6 class="text-white fw-bold mb-4 small text-uppercase">Platform</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="#" class="footer-link small">Browse Catalogue</a></li>
                        <li class="mb-2"><a href="#" class="footer-link small">Digital Archive</a></li>
                        <li class="mb-2"><a href="#" class="footer-link small">Audio Books</a></li>
                    </ul>
                </div>
                <div class="col-lg-2">
                    <h6 class="text-white fw-bold mb-4 small text-uppercase">Support</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="#" class="footer-link small">Help Center</a></li>
                        <li class="mb-2"><a href="#" class="footer-link small">Contact Us</a></li>
                        <li class="mb-2"><a href="#" class="footer-link small">Feedback</a></li>
                    </ul>
                </div>
                <div class="col-lg-3">
                    <h6 class="text-white fw-bold mb-4 small text-uppercase">Newsletter</h6>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control bg-dark border-secondary text-white" placeholder="Email">
                        <button class="btn btn-primary"><i class="bi bi-send"></i></button>
                    </div>
                </div>
            </div>
            <hr class="border-secondary border-opacity-25 my-5">
            <div class="text-center small">
                &copy; 2026 SmartLib SLIIT | Designed for Excellence.
            </div>
        </div>
    </footer>

    <a href="#" class="btn-scroll-top"><i class="bi bi-arrow-up"></i></a>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        // AOS Initialize
        AOS.init();

        // Navbar Transition on Scroll
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('py-2');
                navbar.style.background = 'rgba(15, 23, 42, 0.95)';
            } else {
                navbar.classList.remove('py-2');
                navbar.style.background = 'rgba(15, 23, 42, 0.8)';
            }
        });
    </script>
</body>
</html>
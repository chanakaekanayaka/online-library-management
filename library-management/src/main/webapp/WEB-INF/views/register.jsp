<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account | Smart Library</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #fff; height: 100vh; overflow: hidden; }
        .reg-container { height: 100vh; }
        .form-section { display: flex; align-items: center; justify-content: center; padding: 60px; }
        .reg-card { 
            width: 100%; max-width: 480px; 
            border: 1px solid #f0f0f0; border-radius: 24px; padding: 40px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.03);
        }
        .reg-image {
            background: linear-gradient(rgba(52, 152, 219, 0.1), rgba(52, 152, 219, 0.1)), 
                        url('https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?q=80&w=2000&auto=format&fit=crop');
            background-size: cover; background-position: center; height: 100%;
        }
        .form-control { 
            border-radius: 12px; padding: 12px; border: 1.5px solid #eee; background: #fafafa;
        }
        .form-control:focus { 
            border-color: #2ecc71; background: #fff; box-shadow: 0 0 0 4px rgba(46, 204, 113, 0.1);
        }
        .btn-register { 
            background: #2ecc71; color: white; border: none; padding: 15px; 
            border-radius: 12px; font-weight: 600; transition: 0.3s; 
        }
        .btn-register:hover { background: #27ae60; transform: translateY(-2px); box-shadow: 0 8px 20px rgba(46, 204, 113, 0.2); }
    </style>
</head>
<body>
    <div class="container-fluid p-0 reg-container">
        <div class="row g-0 h-100">
            <div class="col-lg-5 form-section order-2 order-lg-1">
                <div class="reg-card animate__animated animate__fadeInLeft">
                    <div class="mb-4">
                        <h2 class="fw-bold text-dark">Join Our Community</h2>
                        <p class="text-muted small">Create your library account to borrow books and track your history.</p>
                    </div>

                    <form action="/register" method="POST">
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary text-uppercase">Username</label>
                            <input type="text" name="username" class="form-control" placeholder="Choose a handle" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary text-uppercase">Email Address</label>
                            <input type="email" name="email" class="form-control" placeholder="email@domain.com" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label small fw-bold text-secondary text-uppercase">Secure Password</label>
                            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                        </div>
                        <button type="submit" class="btn btn-register w-100">Create My Account</button>
                    </form>

                    <div class="text-center mt-4">
                        <p class="small text-muted">Already have an account? <a href="/login" class="text-success fw-bold text-decoration-none">Log In</a></p>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block p-0 order-1 order-lg-2">
                <div class="reg-image"></div>
            </div>
        </div>
    </div>
</body>
</html>
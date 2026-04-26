<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Login | Smart Library</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; height: 100vh; margin: 0; }
        .login-container { height: 100vh; }
        .login-image {
            background: linear-gradient(rgba(44, 62, 80, 0.4), rgba(44, 62, 80, 0.4)), 
                        url('https://images.unsplash.com/photo-1507842217343-583bb7270b66?q=80&w=2000&auto=format&fit=crop');
            background-size: cover; background-position: center; height: 100%;
        }
        .form-section { display: flex; align-items: center; justify-content: center; background: #ffffff; }
        .login-card { 
            width: 100%; max-width: 420px; padding: 40px;
            border: 1px solid #e0e0e0; border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.05);
            animation: fadeIn 1s; 
        }
        .welcome-title { color: #2c3e50; font-weight: 700; margin-bottom: 10px; }
        
        /* Professional Border Effects for Inputs */
        .form-control { 
            border-radius: 12px; padding: 12px 15px; border: 1.5px solid #eee; 
            transition: all 0.3s ease; background-color: #fdfdfd;
        }
        .form-control:focus { 
            border-color: #3498db; background-color: #fff;
            box-shadow: 0 0 0 4px rgba(52, 152, 219, 0.1); outline: none;
        }
        .btn-signin { 
            background: #2c3e50; color: white; border: none; padding: 14px; 
            border-radius: 12px; font-weight: 600; width: 100%;
            transition: all 0.3s ease; margin-top: 10px;
        }
        .btn-signin:hover { 
            background: #1a252f; transform: translateY(-2px); box-shadow: 0 5px 15px rgba(0,0,0,0.1); 
        }
    </style>
</head>
<body>
    <div class="container-fluid p-0 login-container">
        <div class="row g-0 h-100">
            <div class="col-lg-6 d-none d-lg-block p-0">
                <div class="login-image animate__animated animate__fadeIn"></div>
            </div>
            <div class="col-lg-6 form-section">
                <div class="login-card animate__animated animate__zoomIn">
                    <div class="text-center mb-4">
                        <h2 class="welcome-title">Member Login</h2>
                        <p class="text-muted small">Access your personalized library dashboard.</p>
                    </div>

                    <c:if test="${param.error != null}">
                        <div class="alert alert-danger border-0 small text-center mb-4" role="alert">
                            Invalid username or password.
                        </div>
                    </c:if>

                    <form action="/login" method="POST">
                        <div class="mb-4">
                            <label class="form-label small fw-bold text-secondary">USERNAME</label>
                            <input type="text" name="username" class="form-control" placeholder="Enter your username" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label small fw-bold text-secondary">PASSWORD</label>
                            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                        </div>
                        <button type="submit" class="btn btn-signin">Secure Sign In</button>
                    </form>

                    <div class="text-center mt-4">
                        <p class="small text-muted">Don't have an account? <a href="/register" class="text-primary fw-bold text-decoration-none">Register Now</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
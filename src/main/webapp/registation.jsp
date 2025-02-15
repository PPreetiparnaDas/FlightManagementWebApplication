<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Page</title>
     <%@ include file="include/links.jsp" %>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .register-container {
            max-width: 500px;
            margin: 100px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .register-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }
        .form-control {
            border-radius: 5px;
        }
        .btn-register {
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            width: 100%;
        }
        .btn-register:hover {
            background-color: #218838;
        }
        /*  .footer {
            background: #333;
            color: white;
            padding: 20px 0;
        }
        .footer a {
            color: #ffcc00;
            text-decoration: none;
        } */
    </style>
</head>
<body>
 <%@ include file="include/header.jsp" %>
    <div class="register-container">
        <h2>Register</h2>
        <form>
            <!-- Username Field -->
            <div class="mb-3">
                <label for="uName" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="uName" placeholder="Enter your full name" required>
            </div>
            
            <!-- Email Field -->
            <div class="mb-3">
                <label for="uEmail" class="form-label">Email</label>
                <input type="email" class="form-control" id="uEmail" placeholder="Enter your email" required>
            </div>

            <!-- Password Field -->
            <div class="mb-3">
                <label for="uPass" class="form-label">Password</label>
                <input type="password" class="form-control" id="uPass" placeholder="Enter your password" required>
            </div>

            <!-- Address Field -->
            <div class="mb-3">
                <label for="uAdd" class="form-label">Address</label>
                <textarea class="form-control" id="uAdd" rows="3" placeholder="Enter your address" required></textarea>
            </div>

            <!-- Phone Number Field -->
            <div class="mb-3">
                <label for="uPhone" class="form-label">Phone Number</label>
                <input type="tel" class="form-control" id="uPhone" placeholder="Enter your phone number" required>
            </div>

            <!-- Register Button -->
            <button type="submit" class="btn btn-register">Register</button>
        </form>
    </div>

    <%@ include file="include/footer.jsp" %>
   <%@ include file="include/scripts.jsp" %>
</body>
</html>

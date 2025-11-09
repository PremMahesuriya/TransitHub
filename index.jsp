<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="admin/header.html" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>🚍 TransitHub - Smart Transportation System</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(135deg, #2563eb, #1e3a8a);
      color: white;
      margin: 0;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      text-align: center;
    }
    h1 {
      font-size: 2.5rem;
      margin-bottom: 0.5rem;
    }
    p {
      font-size: 1.2rem;
      margin-bottom: 2rem;
    }
    .btn {
      background: white;
      color: #2563eb;
      padding: 0.8rem 2rem;
      margin: 0.5rem;
      text-decoration: none;
      border-radius: 6px;
      font-weight: bold;
      transition: background 0.3s;
    }
    .btn:hover {
      background: #f0f0f0;
    }
    footer {
      position: absolute;
      bottom: 1rem;
      color: #ddd;
      font-size: 0.9rem;
    }
  </style>
</head>
<body>

  <p>Your integrated public transportation management system</p>

  <div>
    <a href="admin/dashboard.jsp" class="btn">Admin Panel</a>
    <a href="admin/manage_routes.jsp" class="btn">Manage Routes</a>
  </div>

  <footer>&copy; <%= java.time.Year.now() %> TransitHub. All rights reserved.</footer>
</body>
</html>

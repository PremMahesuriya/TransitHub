<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | TransitHub</title>
<link rel="stylesheet" href="admin_style.css">
<script>
async function loadCounts() {
  try {
    const res = await fetch("admin_api.jsp?action=getCounts");
    const data = await res.json();
    document.getElementById("routes").innerText = data.routes;
    document.getElementById("vehicles").innerText = data.vehicles;
    document.getElementById("drivers").innerText = data.drivers;
  } catch (err) {
    console.error("Error loading dashboard:", err);
  }
}
</script>
</head>
<body onload="loadCounts()">

<div class="navbar">
  <h2>🚍 TransitHub Admin Dashboard</h2>
  <header class="main-header">
 

  <nav class="nav-links">
    <a href="dashboard.jsp">Dashboard</a>
    <a href="manage_routes.jsp">Routes</a>
    <a href="../index.jsp">Home</a>
    <a href="#">Logout</a>
  </nav>
</header>
</div>

<div class="container">
  <div class="card">
    <h3>🗺️ Routes</h3>
    <p id="routes">0</p>
  </div>
  <div class="card">
    <h3>🚌 Vehicles</h3>
    <p id="vehicles">0</p>
  </div>
  <div class="card">
    <h3>👨‍✈️ Drivers</h3>
    <p id="drivers">0</p>
  </div>
</div>
<style>
  .main-header {
    background: linear-gradient(90deg, #1e3a8a, #2563eb);
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 40px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.2);
    color: white;
  }

  .logo-container {
    display: flex;
    align-items: center;
    gap: 15px;
  }

  .logo {
    height: 55px;
    width: 55px;
    border-radius: 50%;
    border: 2px solid white;
    object-fit: cover;
  }

  .title {
    font-family: 'Segoe UI', sans-serif;
    font-size: 1.8rem;
    letter-spacing: 1px;
  }

  .nav-links a {
    color: white;
    text-decoration: none;
    margin-left: 25px;
    font-weight: bold;
    transition: 0.3s;
  }

  .nav-links a:hover {
    opacity: 0.8;
  }
</style>

</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="header.html" %>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Routes</title>
<link rel="stylesheet" href="admin_style.css">
<script src="admin.js"></script>
</head>
<body onload="loadRoutes()">
<div class="navbar">
  <h2>Manage Routes</h2>
</div>

<div class="container">
  <h3>🗺️ All Routes</h3>
  <div class="form-inline">
    <input type="text" id="routeName" placeholder="Route Name">
    <input type="text" id="origin" placeholder="Origin">
    <input type="text" id="destination" placeholder="Destination">
    <input type="number" id="distance" placeholder="Distance (km)">
    <button onclick="addRoute()">➕ Add Route</button>
  </div>
  <div id="routeTable"></div>
</div>
</body>
</html>

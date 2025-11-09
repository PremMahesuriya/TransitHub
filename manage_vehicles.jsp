<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../dbconfig.jsp" %>
<%@ include file="header.html" %>
<%
try {
    Connection con = getDBConnection();   // ✅ Now works
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM Route");
    rs.next();
    out.print("Routes: " + rs.getInt(1));
    con.close();
} catch(Exception e) {
    out.print("Error: " + e.getMessage());
}
%>
<html>
<head>
  <meta charset="UTF-8">
<title>Manage Vehicles | TransitHub</title>
<link rel="stylesheet" href="admin_style.css">
<script src="admin.js"></script>
</head>
<body onload="loadVehicles()">
<div class="navbar">
  <h2>Manage Vehicles</h2>
  <a href="dashboard.jsp">← Back</a>
</div>

<div class="container">
  <h3>🚌 Vehicles</h3>
  <div class="form-inline">
    <input type="text" id="vehicleNo" placeholder="Vehicle No">
    <input type="text" id="vehicleType" placeholder="Type (e.g. Bus, MiniBus)">
    <input type="number" id="capacity" placeholder="Capacity">
    <input type="number" id="routeId" placeholder="Route ID">
    <button onclick="addVehicle()">➕ Add Vehicle</button>
  </div>
  <div id="vehicleTable"></div>
</div>
</body>
</html>
    
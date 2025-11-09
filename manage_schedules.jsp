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
<title>Manage Schedules | TransitHub</title>
<link rel="stylesheet" href="admin_style.css">
<script src="admin.js"></script>
</head>
<body onload="loadSchedules()">
<div class="navbar">
  <h2>Manage Schedules</h2>
  <a href="dashboard.jsp">← Back</a>
</div>

<div class="container">
  <h3>📅 Schedules</h3>
  <div class="form-inline">
    <input type="number" id="routeId" placeholder="Route ID">
    <input type="number" id="vehicleId" placeholder="Vehicle ID">
    <input type="number" id="driverId" placeholder="Driver ID">
    <input type="datetime-local" id="departureTime" placeholder="Departure Time">
    <input type="datetime-local" id="arrivalTime" placeholder="Arrival Time">
    <button onclick="addSchedule()">➕ Add Schedule</button>
  </div>
  <div id="scheduleTable"></div>
</div>
</body>
</html>

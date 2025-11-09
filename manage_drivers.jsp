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
<title>Manage Drivers | TransitHub</title>
<link rel="stylesheet" href="admin_style.css">
<script src="admin.js"></script>
</head>
<body onload="loadDrivers()">
<div class="navbar">
  <h2>Manage Drivers</h2>
  <a href="dashboard.jsp">← Back</a>
</div>

<div class="container">
  <h3>👨‍✈️ Drivers</h3>
  <div class="form-inline">
    <input type="text" id="driverName" placeholder="Driver Name">
    <input type="text" id="license" placeholder="License No">
    <input type="text" id="phone" placeholder="Phone">
    <button onclick="addDriver()">➕ Add Driver</button>
  </div>
  <div id="driverTable"></div>
</div>
</body>
</html>

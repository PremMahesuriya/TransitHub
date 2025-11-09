<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<title>Booking Confirmation | TransitHub</title>
<link rel="stylesheet" href="theme.css">
</head>
<body>
<div class="container">
<%
String ticketId = request.getParameter("ticket_id");
if (ticketId != null) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM Ticket WHERE ticket_id=?");
        ps.setInt(1, Integer.parseInt(ticketId));
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
%>
<h2>✅ Booking Confirmed!</h2>
<p><strong>Ticket ID:</strong> <%= rs.getInt("ticket_id") %></p>
<p><strong>Seat No:</strong> <%= rs.getString("seat_no") %></p>
<p><strong>Price:</strong> ₹<%= rs.getDouble("price") %></p>
<p><strong>Status:</strong> <%= rs.getString("payment_status") %></p>
<%
        } else {
            out.println("<p>❌ Ticket not found!</p>");
        }
        con.close();
    } catch(Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    }
} else {
    out.println("<p>No ticket ID provided!</p>");
}
%>
</div>
</body>
</html>

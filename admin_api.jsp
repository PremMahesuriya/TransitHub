<%@ page contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,org.json.simple.*,org.json.simple.parser.*,helper.DB" %>
<%@ include file="header.html" %>

<%
String action = request.getParameter("action");

try (Connection con = helper.DB.getConnection()) {

    if ("getRoutes".equals(action)) {
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM Route");
        JSONArray list = new JSONArray();
        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("route_id", rs.getInt("route_id"));
            obj.put("route_name", rs.getString("route_name"));
            obj.put("origin", rs.getString("origin"));
            obj.put("destination", rs.getString("destination"));
            obj.put("distance_km", rs.getInt("distance_km"));
            list.add(obj);
        }
        out.print(list.toJSONString());
    } else if ("getCounts".equals(action)) {
        JSONObject counts = new JSONObject();
        Statement st = con.createStatement();
        ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM Route");
        rs1.next();
        counts.put("routes", rs1.getInt(1));
        rs1 = st.executeQuery("SELECT COUNT(*) FROM Vehicle");
        rs1.next();
        counts.put("vehicles", rs1.getInt(1));
        rs1 = st.executeQuery("SELECT COUNT(*) FROM Driver");
        rs1.next();
        counts.put("drivers", rs1.getInt(1));
        out.print(counts.toJSONString());
    }
} catch (Exception e) {
    e.printStackTrace();
    out.print("{\"error\":\"" + e.getMessage() + "\"}");
}
%>

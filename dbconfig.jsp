<%@ page import="java.sql.*" %>
<%! 
// Declare a reusable connection method (no class wrapper)
public Connection getDBConnection() throws Exception {
    Class.forName("com.mysql.cj.jdbc.Driver");
    return DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/project?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC", 
        "root", 
        ""
    );
}
%>

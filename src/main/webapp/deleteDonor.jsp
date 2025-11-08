<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>

<%
String id = request.getParameter("id");
try {
    Connection con = ConnectionProvider.getConnection();
    PreparedStatement ps = con.prepareStatement("delete from donor where id=?");
    ps.setString(1, id);
    ps.executeUpdate();

    // redirect korbe oi page e jekhane donor list show kore
    response.sendRedirect("editDeleteList.jsp");


} catch(Exception e) {
    out.println("Error: " + e.getMessage());
}
%>

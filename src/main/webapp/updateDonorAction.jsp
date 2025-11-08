<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>

<%
try{
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String father = request.getParameter("father");
    String mother = request.getParameter("mother");
    String mobilenumber = request.getParameter("mobilenumber");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String bloodgroup = request.getParameter("bloodgroup");
    String address = request.getParameter("address");

    Connection con = ConnectionProvider.getConnection();
    PreparedStatement ps = con.prepareStatement("update donor set name=?, father=?, mother=?, mobilenumber=?, gender=?, email=?, bloodgroup=?, address=? where id=?");
    ps.setString(1, name);
    ps.setString(2, father);
    ps.setString(3, mother);
    ps.setString(4, mobilenumber);
    ps.setString(5, gender);
    ps.setString(6, email);
    ps.setString(7, bloodgroup);
    ps.setString(8, address);
    ps.setInt(9, id);
    ps.executeUpdate();

    response.sendRedirect("editDeleteList.jsp");

}catch(Exception e){
    out.println("Error: "+e.getMessage());
}
%>

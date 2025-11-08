<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%
    try {
        String mobilenumber = request.getParameter("mobilenumber");
        if(mobilenumber != null) {
            Connection con = ConnectionProvider.getConnection();
            Statement st = con.createStatement();
            st.executeUpdate("DELETE FROM bloodrequest WHERE mobilenumber='"+mobilenumber+"'");
        }
        response.sendRedirect("requestForBlood.jsp");
    } catch(Exception e) {
        e.printStackTrace();
        response.sendRedirect("requestForBlood.jsp");
    }
%>

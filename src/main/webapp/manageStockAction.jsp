<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="Project.ConnectionProvider" %>
<%
    try {
        String bloodgroup = request.getParameter("bloodgroup");
        String indec = request.getParameter("indec");
        String unitsStr = request.getParameter("units");

        if (bloodgroup == null || indec == null || unitsStr == null || unitsStr.trim().isEmpty()) {
            response.sendRedirect("manageStock.jsp?msg=invalid");
            return;
        }

        int units = Integer.parseInt(unitsStr);

        Connection con = ConnectionProvider.getConnection();
        Statement st = con.createStatement();

        // Get current units
        ResultSet rs = st.executeQuery("SELECT units FROM stock WHERE bloodgroup='"+bloodgroup+"'");
        int currentUnits = 0;
        if(rs.next()) {
            currentUnits = Integer.parseInt(rs.getString("units"));
        } else {
            // If bloodgroup not exist, insert new row
            st.executeUpdate("INSERT INTO stock (bloodgroup, units) VALUES('"+bloodgroup+"', '"+units+"')");
            response.sendRedirect("manageStock.jsp?msg=valid");
            return;
        }

        int newUnits = currentUnits;
        if("inc".equals(indec)) {
            newUnits = currentUnits + units;
        } else if("dec".equals(indec)) {
            newUnits = currentUnits - units;
            if(newUnits < 0) newUnits = 0; // prevent negative stock
        }

        // Update stock
        st.executeUpdate("UPDATE stock SET units='"+newUnits+"' WHERE bloodgroup='"+bloodgroup+"'");

        response.sendRedirect("manageStock.jsp?msg=valid");

    } catch(Exception e) {
        e.printStackTrace();
        response.sendRedirect("manageStock.jsp?msg=invalid");
    }
%>

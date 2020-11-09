<%-- 
    Document   : customerjsp
    Created on : 29 Nov, 2018, 1:03:44 PM
    Author     : Ritwik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page import="java.sql.*"%>
        <%@ page import="javax.sql.*"%>
        <%
            String Cname=request.getParameter("Cname");
            String Caddress=request.getParameter("Caddress");
            String Cemail=request.getParameter("Cemail");
            
            
            String Cphone=request.getParameter("Cphone");
           
            
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
                    java.sql.Connection con=DriverManager.getConnection
                            ("jdbc:mysql://localhost:3306/kadumane?&useSSL=false","root","rncjeapj1998");
                    
                    
                        CallableStatement calstat=con.prepareCall("{call Customer(?,?,?,?)}");
                        calstat.setString(1,Cname);
                        calstat.setString(2,Caddress);
                        calstat.setString(3,Cemail);
                                             
                        calstat.setString(4,Cphone);
                       
                       
                        
                        ResultSet rs=calstat.executeQuery();
                        con.close();
                        calstat.close();
                       //out.println("your data has been inserted into table.");
                        response.sendRedirect("Reservation.html");
                    
            
            %>
        
    </body>
</html>


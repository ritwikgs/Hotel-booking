<%-- 
    Document   : Reservationjsp
    Created on : 29 Nov, 2018, 1:17:09 PM
    Author     : Ritwik
--%>

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
            String Checkin=request.getParameter("Checkin");
            String Checkout=request.getParameter("Checkout");
            String Noofrooms=request.getParameter("Noofrooms");
            
            
            String Roomtype=request.getParameter("Roomtype");
              String tax=request.getParameter("tax");
              String cost=request.getParameter("cost");
           
               
           
                
           
            
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
                    java.sql.Connection con=DriverManager.getConnection
                            ("jdbc:mysql://localhost:3306/kadumane?useSSL=false","root","rncjeapj1998");
                    
                    
                        CallableStatement calstat=con.prepareCall("{call Reservation(?,?,?,?,?,?,?)}");
                        calstat.setString(1,Checkin);
                        calstat.setString(2,Checkout);
                        calstat.setString(3,Noofrooms);
                                             
                        calstat.setString(4,Roomtype);
                        calstat.setString(5,tax);
                        calstat.setString(6,cost);
                        calstat.setString(7,null);
                        
                        
                       
                       
                        
                        ResultSet rs=calstat.executeQuery();
                        con.close();
                        calstat.close();
                       //out.println("your data has been inserted into table.");
                        response.sendRedirect("Thankyou.html");
                    
            
            %>
        
    </body>
</html>


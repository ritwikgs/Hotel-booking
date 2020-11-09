<%-- 
    Document   : bookings
    Created on : 1 Dec, 2018, 7:39:19 PM
    Author     : Ritwik
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@page import ="java.sql.*"%>
         <%@page import ="javax.sql.*"%>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <style type="text/css">
           body { background-color:#ccccff;background-position-y:120px;background-position-x:90%; background-repeat: no-repeat;background-size:500px 200px;}
         table{border:1; }
         </style>
        <title>Mybookings</title>
        <style>
            h1{
                color: pink;
            }
        </style>
    </head>
    <body>
   
        <h1 style="color:whitesmoke;background-color:darkslateblue;">My Bookings</h1>
        <h2>Booking Details</h2>
         <%
Class.forName("com.mysql.jdbc.Driver").newInstance();
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Kadumane?useSSL=false","root","rncjeapj1998");
    
       String Query="select C.Cname,R.Checkin,R.Checkout,R.Roomtype,R.Totalcost from Customer C,Reservation R";
      
       PreparedStatement psm=con.prepareStatement(Query);
       ResultSet rs=psm.executeQuery();
       %>
       <table>
       <%
       out.println("<tr><th>Cname</th><th>Checkin</th><th>Checkout</th><th>Roomtype</th><th>Totalcost</th></tr>");
       while(rs.next())
       {
           out.println("<tr><td>"+rs.getString("Cname")+"</td><td>"+rs.getString("Checkin")+"</td><td>"+rs.getString("Checkout")+
                   "</td><td>"+rs.getString("Roomtype")+"</td><td>"+rs.getString("Totalcost")+"</td></tr>");
       }
      %>
       </table>
    </body>
</html>


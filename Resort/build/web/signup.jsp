<%-- 
    Document   : signup
    Created on : 10 Nov, 2018, 4:17:49 PM
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
            String firstname=request.getParameter("firstname");
            String lastname=request.getParameter("lastname");
            String email=request.getParameter("email");
            String days=request.getParameter("days");
            String gender=request.getParameter("gender");
            String pno=request.getParameter("phoneno");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String confirmpassword=request.getParameter("confirmpassword");
            
            
            Class.forName("com.mysql.jdbc.Driver").newInstance();
                    java.sql.Connection con=DriverManager.getConnection
                            ("jdbc:mysql://localhost:3306/kadumane?useSSL=false","root","rncjeapj1998");
                    
                    
                        CallableStatement calstat=con.prepareCall("{call brothel(?,?,?,?,?,?,?,?,?)}");
                        calstat.setString(1,firstname);
                        calstat.setString(2,lastname);
                        calstat.setString(3,email);
                        calstat.setString(4,days);
                        calstat.setString(5,gender);
                        calstat.setString(6,pno);
                        calstat.setString(7,username);
                        calstat.setString(8,password);
                        calstat.setString(9,confirmpassword);
                       
                        
                        ResultSet rs=calstat.executeQuery();
                        con.close();
                        calstat.close();
                       //out.println("your data has been inserted into table.");
                        response.sendRedirect("customer.html");
                    
            
            %>
        
    </body>
</html>

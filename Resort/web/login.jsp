<%-- 
    Document   : login
    Created on : 10 Nov, 2018, 4:17:35 PM
    Author     : Ritwik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
            String _username=request.getParameter("username");
            String _password=request.getParameter("password");
            
            if(_username!=null)
            {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection conn=DriverManager.getConnection
                                 ("jdbc:mysql://localhost:3306/kadumane?useSSL=false","root","rncjeapj1998");
                    
                        String Query="select * from signip where username=? and password=?";
                        PreparedStatement psm=conn.prepareStatement(Query);
                        psm.setString(1,_username);
                        psm.setString(2,_password);
                        ResultSet rs=psm.executeQuery();
                        if(rs.next())
                        {
                            //out.println("Hi");
                           response.sendRedirect("customer.html");
                        }
                        else
                        {
                             out.println("Login Failed! Try Again");
                        }    
            }
                       
                        
                     %>
    </body>
</html>

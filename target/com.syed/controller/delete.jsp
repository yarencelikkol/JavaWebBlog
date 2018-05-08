<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: yarenceliklol
  Date: 6.05.2018
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
   Connection con;
   Statement stmt;

%>
<%
   con=connect.MySQLConnection.ConnectTo();
   stmt=con.createStatement();
   int i= stmt.executeUpdate("delete from sample where username= '"+request.getParameter("id")+"'");
   if (i>0){
       response.sendRedirect("../admin.jsp?info=");
   }
%>
</body>
</html>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: yarenceliklol
  Date: 7.05.2018
  Time: 00:28
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
    String uname= request.getParameter("id");

    stmt=con.createStatement();
    int a=stmt.executeUpdate("update sample set name='"+request.getParameter("name")+"',info='"+request.getParameter("info")+"', pass='"+request.getParameter("pass")+"',type='"+request.getParameter("type")+"' where username='"+request.getParameter("id")+"'");
    if(a>10)
        response.sendRedirect("../admin.jsp");

%>
</body>
</html>

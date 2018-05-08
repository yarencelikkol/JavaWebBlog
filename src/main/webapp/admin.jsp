<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="connect.MySQLConnection" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: yarenceliklol
  Date: 6.05.2018
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1> Admin page </h1>
<table border="1">
<%!
    Connection con;
    Statement stmt;
    ResultSet res;

%>
<%
        MySQLConnection mysql = new MySQLConnection();

    try{
        Connection con = mysql.startConnection();
   stmt=con.createStatement();
  res= stmt.executeQuery("select * from sample");
  while(res.next()){
      %>
<tr>
     <td><%= res.getString("name") %> </td>
      <td><%=res.getString("info")%></td>
      <td><%=res.getString("username")%></td>
      <td><%=res.getString("pass")%></td>
      <td><%=res.getString("type")%></td>

<%
    }
    con.close();
    stmt.close();
    res.close();
    } catch (SQLException ex){

    }

    %>

<%-- <td> <a href ="controller/update.jsp?id=<%res.getString("--%>
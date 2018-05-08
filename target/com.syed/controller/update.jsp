<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: yarenceliklol
  Date: 6.05.2018
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> </title>
</head>
<body>
<%!
  Connection con;
  Statement stmt;
  ResultSet res;

%>
<%
    try{


    con=connect.MySQLConnection.ConnectTo();
  String uname= request.getParameter("id");
  String sql="select * from sample where username='"+uname+"'";
  stmt=con.createStatement();
 res=stmt.executeQuery(sql);
 while(res.next()) {


%>
<form action="uptadec.jsp">
       <pre>
         Name:  <input type="text" value="<%=res.getString("name")%>   name="name">
           Description: <textarea name="info" style="height: : 100px; width: 50%;"><%=res.getString("info")%> </textarea>
         User name:    <input disabled="true"  type="text" value="<%=res.getString("username")%>" name="username">
           Password:  <input type="password" value="<%=res.getString("pass")%> name="pass">

         Select type:  <input type="radio" name="type" value="user"> User
           <input type="radio" name="type" value="admin"> Admin
           <input type="hidden" value="<%=res.getString("username")%>" name="id">
           <input type="submit">
       </pre>
</form>
<%
    } }
    catch(Exception ex) {
    System.out.print(ex);
    }

%>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: yarencelikkol
  Date: 6.05.2018
  Time: 21:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userType = null;
    String name;
    String username;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            Cookie c = cookies[i];
            if (c.getName().equals("userType")) {
                userType = c.getValue();
            }
            if (c.getName().equals("name")) {
                name = c.getValue();
            }
            if (c.getName().equals("username")) {
                username = c.getValue();
            }
        }
    }
%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%

    if (!(userType == null)) {
        if (userType.equals("admin")){

%>
<iframe name="ifr" width="100%" height="100%" src="admin.jsp">

        <%

        } else {
             %>
    <iframe name="ifr"  width="100%" height="100%"  src="img/t1.jpg">
            <%
        }
        return;
    }
%>
<form action="loginc" method="post">
    <input type="text" name="username" >
    <input type="password" name="pass">
    <input type="submit">
</form>
</body>
</html>

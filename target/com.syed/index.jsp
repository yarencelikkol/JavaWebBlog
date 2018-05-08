<%--
  Created by IntelliJ IDEA.
  User: yarenceliklol
  Date: 8.05.2018
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String userType = null;
    String name = null;
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

    if (name == null){
    name = "";
    }

%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

</head>
<style>
    header{
        height: 100px;
        background-color: lightpink;
    }
    main {
        height: 500px;
    }
    main iframe{
        height: 500px;
        width: 100%;
        background-color: mediumvioletred;
    }
    footer{
        height: 100px;
        background-color: lightpink;
    }
    table td{
        background-color: aliceblue;
        border-radius: 10px;
        padding: 3px;
        font-size: 25px;
    }
    table td :hover {
        background-color: darkkhaki;
        border-radius: 10px;
    }
    table td a{
        text-decoration: none;
        color: blue;

    }
</style>
<body>

<header>
    <span> <img src="img/logoo.jpg" height="100" width="100" alt="logo" style="float: left; border-radius: 100px;"  > </span>
    <span style="font-size: 30px; font-weight:bold;">
        Its a sample project
    </span>
    <table >

        <tr>
            <td> <a href="index.jsp"> Home <%=name%> </a> </td>
            <td> <a href="login.jsp" target="ifr">Login </a> </td>
            <td> <a href="register.jsp" target="ifr" > Register</a> </td>
            <td> <a href="logout.jsp"> Log out</a> </td>

        </tr>
    </table>

</header>

<main>
<%

    if (!(userType == null)) {
        if (userType.equals("admin")){

            %>
        <iframe name="ifr" src="admin.jsp">

    <%

        } else {
             %>
            <iframe name="ifr" src="img/t1.jpg">
                    <%
        }
        return;
    } else {
        %>
        <iframe name="ifr" src="img/t1.jpg">

        <%
        }
%>
    </iframe>
</main>

<footer>

</footer>



</body>
</html>

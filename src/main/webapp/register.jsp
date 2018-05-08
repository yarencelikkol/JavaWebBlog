
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="/registerc" method="POST">
       <pre>
         Name:  <input type="text" name="name">
           Description: <textarea name="info" style="height: 100px; width: 50%;"> </textarea>
         User name:    <input type="text" name="username">
           Password:  <input type="password" name="pass">
           <input type="submit">
         Select type:  <input type="radio" name="type" value="user"> User
           <input type="radio" name="type" value="admin"> Admin
       </pre>
    </form>
</body>
</html>

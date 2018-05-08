<%--
  Created by IntelliJ IDEA.
  User: yarenceliklol
  Date: 8.05.2018
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%
for (Cookie cookie : request.getCookies()) {
cookie.setValue("");
cookie.setMaxAge(0);
cookie.setPath("/");
response.addCookie(cookie);
}
response.sendRedirect("index.jsp");

%>
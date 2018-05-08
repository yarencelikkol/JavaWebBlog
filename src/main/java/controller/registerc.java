package controller;
import connect.MySQLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

public class registerc extends HttpServlet
{
    Connection con;
    Statement stmt;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String name = req.getParameter("name");
        String info = req.getParameter("info");
        String username = req.getParameter("username");
        String pass = req.getParameter("pass");
        String type = "user"; //req.getParameter("type");
        MySQLConnection mysql = new MySQLConnection();

        boolean isSaved = mysql.registerUser(name, info, username, pass, type);

        if (isSaved) {
            resp.sendRedirect("succesfull.html");
        } else {
            resp.sendRedirect("register.jsp");
        }



    }
}

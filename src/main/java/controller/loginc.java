package controller;
import connect.MySQLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class loginc extends HttpServlet {
    ResultSet res;
    Connection con;
    Statement stmt;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out=resp.getWriter();
        HttpSession s= req.getSession(true);
        MySQLConnection mysql = new MySQLConnection();

        if(s!=null){
            System.out.print("session created");
        }
        else{
            System.out.println("not created");
        }

       con = mysql.startConnection();
        try  {
             stmt = con.createStatement();
            String query = String.format("Select * from sample where username = '%s' and pass = '%s';", req.getParameter("username"), req.getParameter("pass"));
            res=stmt.executeQuery(query);
             ArrayList arr1= new ArrayList();
             ArrayList arr=new ArrayList();
            System.out.print("select query execute edildi.");
            String type = "";
            if (res!=null){
                System.out.print("res not null");

                while(res.next()){

                arr.add(res.getString("name"));
                arr.add(res.getString("info"));
                arr.add(res.getString("username"));
                arr.add(res.getString("pass"));
                type = res.getString("type");

                Cookie userType = new Cookie("userType", type);
                resp.addCookie(userType);

                Cookie name = new Cookie("name", res.getString("name"));
                resp.addCookie(name);

                Cookie username = new Cookie("username", res.getString("username"));
                resp.addCookie(username);

                arr.add(type);
                arr1.add(arr);
                System.out.print(arr1);
             }
                 if (type.equals("user")){
                     System.out.print("user login");
                     resp.sendRedirect("succesfull.html");
                 }
                 else {
                     System.out.print("admin login");
                     resp.sendRedirect("admin.jsp");
                 }
                System.out.print("set attribute öncesi");
                s.setAttribute("userdata", arr1);
                System.out.print("set attribute sonrası");
            }
        else {
                System.out.print("res null");
                resp.sendRedirect("login.jsp");
             }
        }
        catch (SQLException ex) {
                System.out.print(ex.getLocalizedMessage());
        } finally {
            close();
        }

    }
    private void close(){
        try {
            if(res!=null) res.close();
            if(stmt!=null) stmt.close();
            if(con!=null) con.close();
        } catch(Exception e){}
    }
}
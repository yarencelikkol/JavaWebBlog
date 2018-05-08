package connect;
import java.sql.*;

public class MySQLConnection {

    private  String jdbcDriverStr = "com.mysql.jdbc.Driver";
    private  String jdbcURL = "jdbc:mysql://localhost:3306/JavaWebBlog";
    private  String localHostUser = "root";
    private  String localHostPassword = "silayaren";

    private Connection connection;
    private Statement statement;
    private ResultSet resultSet;



    public Connection startConnection(){
        System.out.print("connection deneniyor.");
        try {
            Class.forName(jdbcDriverStr);
            connection = DriverManager.getConnection(jdbcURL,localHostUser,localHostPassword);
            System.out.print("connection başarılı.");
            return  connection;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return  null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }


    public boolean registerUser(String name, String info, String username, String pass, String type){
        startConnection();
        try {
            statement = connection.createStatement();
            String query = String.format("INSERT INTO sample values ('%s','%s','%s','%s','%s');",name,info,username,pass,type);

            int i= statement.executeUpdate(query);
            System.out.print("query execute edildi.");
            if(i>0) {
                System.out.print("query succesfull.");
                return true;
            } else {
                System.out.print("query fail.");
                return false;
            }
        }
        catch (SQLException ex){
            System.out.print(ex.getLocalizedMessage());
            return false;

        } finally {
            close();
        }
    }

    private void close(){
        try {
            if (resultSet!=null) resultSet.close();
            if(statement!=null) statement.close();
            if(connection!=null) connection.close();
        } catch(Exception e){}
    }
}

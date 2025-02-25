package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection createConnection(){
        Connection conn = null;
        String driver = "org.apache.derby.jdbc.ClientDriver";//Java db driver
        String url = "jdbc:derby://localhost:1527/UnicarDB";//Java db
        String dbUser = "afif", dbPassword = "123";
    
        try {
            try {
                Class.forName(driver);
            }
            catch (ClassNotFoundException e){
                e.printStackTrace();
            }
            //connect to db
            conn = DriverManager.getConnection(url, dbUser, dbPassword);
            System.out.println("Printing connection object " + conn);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
}

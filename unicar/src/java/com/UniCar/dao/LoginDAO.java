package com.UniCar.dao;

import com.UniCar.bean.LoginBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import util.DBConnection;

public class LoginDAO {

    public LoginDAO() {
    }
    
    public Connection con = DBConnection.createConnection();
    
    public String authenticateUser(LoginBean loginBean){
    String username = loginBean.getUsername(); //keeping user entered value
    String passpassword = loginBean.getpassPassword();//in temporary variable
    String login_role = loginBean.getLogin_role();
    
    Connection con = null;
    Statement stmt = null;
    ResultSet resultSet = null;
    
    try {
        con = DBConnection.createConnection();//establishing connection
        stmt = con.createStatement(); //stmt used to write queries
        String sql; //sql select stmt
        sql = "select * from Login where username = '"+username+
        "' and passpassword = '"+passpassword+"' and login_role = '"+login_role+"'";
        
        resultSet = stmt.executeQuery(sql);// execute query
        if (resultSet.next()) { //record found (enter username & password
            return "SUCCESS"; //match with value in db
        }
    }
    catch (SQLException e){
        e.printStackTrace();
    }
        return "Invalid user credentials"; //Just returning appropriate message otherwise
    }
    
    public void addLogin(LoginBean bean){
        int id = bean.getUser_Id();
        String username = bean.getUsername();
        String password = bean.getpassPassword();
        String role = bean.getLogin_role();
        String sql = "insert into Login (user_id, username, passpassword, login_role)"
                + " values (?,?,?,?)";
        PreparedStatement ps;
        try {
            //create preparestatement
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, username);
            ps.setString(3, password);
            ps.setString(4, role);
            ps.executeUpdate();
            con.close();            
        }
        catch (Exception ex){
            System.out.println(ex);
        }
    }
    
    public LoginBean getLogin(int id){
        try {
            String sql = "select * from Login where login_id = " + id;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            int login_id = rs.getInt("login_id");
            int user_id = rs.getInt("user_id");
            String username = rs.getString("username");
            String password = rs.getString("password");
            String role = rs.getString("login_role");
            LoginBean login = new LoginBean(login_id, user_id, username, password, role);
            con.close();
            return login;
        }
        catch (Exception ex){
            System.out.println(ex);
        }
        return null;
    }
    
    public int getUserID(String username, String login_role){
        try {
            String sql = "select * from Login where username = '" + username + "' AND login_role = '" + login_role + "'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            int user_id = rs.getInt("user_id");
            con.close();
            return user_id;
        }
        catch (Exception ex){
            System.out.println(ex);
        }
        return 0;
    }
    
    
    public void updateLogin(LoginBean bean){
        int id = bean.getUser_Id();
        String username = bean.getUsername();
        String password = bean.getpassPassword();
        String role = bean.getLogin_role();
        String sql = "update Login set username=?, passpassword=?, login_role=?"
                + " where login_id = " + id;
        PreparedStatement ps;
        try {
            //create preparestatement
            ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, role);
            ps.executeUpdate();
            con.close();            
        }
        catch (Exception ex){
            System.out.println(ex);
        }
    }
    
    public void deleteLogin(int Login_id){
        String sql = "delete from Login where login_id = " + Login_id;
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
        }
        catch (Exception ex){
            System.out.println(ex);
        }
    }
    
    public void deleteLoginPassenger(int passid){
        String sql = "delete from Login where user_id = " + passid + " and login_role = 'passenger'";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
        }
        catch (Exception ex){
            System.out.println(ex);
        }
    }
    
    public void deleteLoginDriver(int driver_id){
        String sql = "delete from Login where user_id = " + driver_id + " and login_role = 'driver'";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            con.close();
        }
        catch (Exception ex){
            System.out.println(ex);
        }
    }
}

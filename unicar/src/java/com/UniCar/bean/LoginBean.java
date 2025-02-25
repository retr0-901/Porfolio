package com.UniCar.bean;

public class LoginBean {
    private int login_id;
    private int user_id;
    private String username;
    private String passpassword;
    private String login_role;

    public LoginBean() {
    }

    public LoginBean(int login_id, int user_id, String username, String passpassword, String login_role) {
        this.login_id = login_id;
        this.user_id = user_id;
        this.username = username;
        this.passpassword = passpassword;
        this.login_role = login_role;
    }

    public int getLogin_id() {
        return login_id;
    }

    public int getUser_Id() {
        return user_id;
    }

    public String getUsername() {
        return username;
    }

    public String getpassPassword() {
        return passpassword;
    }

    public String getLogin_role() {
        return login_role;
    }

    public void setLogin_id(int login_id) {
        this.login_id = login_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String passpassword) {
        this.passpassword = passpassword;
    }

    public void setLogin_role(String login_role) {
        this.login_role = login_role;
    }
}

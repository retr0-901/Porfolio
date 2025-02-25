package com.UniCar.controller;

import com.UniCar.bean.LoginBean;
import com.UniCar.dao.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    
    public LoginServlet() {}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        LoginBean loginBean = new LoginBean(); //creating object LoginBean
        
        // get username & password from Login.jsp page
        String username = request.getParameter("username");
        String passpassword = request.getParameter("passpassword");
        String login_role = request.getParameter("login_role");
        
        LoginDAO logindao2 = new LoginDAO();
        int userid = logindao2.getUserID(username, login_role);
        String usrid = Integer.toString(userid);
        
        //loginBean.setUser_id(usr_id);
        loginBean.setUsername(username); //setting the username and password
        loginBean.setPassword(passpassword); //through the loginBean object
        loginBean.setLogin_role(login_role);
        LoginDAO loginDao = new LoginDAO(); //creating object for LoginDao, this class
        //cotains main logic for user authentication
        String userValidate = loginDao.authenticateUser(loginBean); //Calling authenticateUser function
        if(userValidate.equals("SUCCESS")) //If function returns success string then user will be
        { //rooted to index.jsp            
            
            HttpSession session=request.getSession(); //to register session
            session.setAttribute("session_username",username); // to set the attribute to the session
            session.setAttribute("session_userid",usrid);
            session.setAttribute("session_role",login_role);
            //request.getRequestDispatcher("/index.jsp").forward( request, response);//RequestDispatcher is used
            //to redirect to Home.jsp page
            RequestDispatcher rd = request.getRequestDispatcher ("index.jsp"); //RequestDispatcher is used
            rd.forward(request, response); //to redirect to index.jsp page
        }
        else
        {
            request.setAttribute("errMessage", userValidate);//returns Invalid user credentials (fail login)
            RequestDispatcher rd = request.getRequestDispatcher ("/login.jsp"); //RequestDispatcher is used
            rd.forward(request, response); //to redirect to Login.jsp page
        }
    }
}
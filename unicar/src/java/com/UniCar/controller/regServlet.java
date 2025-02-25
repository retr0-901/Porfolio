/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.UniCar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adam
 */
public class regServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Your servlet logic here
    // Forward the request to the JSP
    RequestDispatcher dispatcher = request.getRequestDispatcher("/sRegPage.jsp");
    dispatcher.forward(request, response);
}
    
   


//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Dah register bro</title>");            
//            out.println("</head>");
//            out.println("<body>");
////            out.println("<h1>DAH REGISTER DAH " + request.getContextPath() + "</h1>");
//            out.println("<h1>DAH REGISTER DAH</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//      
    

        
    }

   



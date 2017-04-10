/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Function.UserFunc;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TungVoDoi
 */
public class CheckUsernamelServlet extends HttpServlet {

    UserFunc use=new UserFunc();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(use.ckeckusername(("username"))){
            response.getWriter().write("<img src=\"images/not-available.png\" />");
        }else{
            response.getWriter().write("<img src=\"images/available.png\" />");
        }
        System.out.println(request.getParameter("user_dangki"));
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Function.UserFunc;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TungVoDoi
 */
public class CheckEmailServlet extends HttpServlet {

    UserFunc use = new UserFunc();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        String email = request.getParameter("email_dangki");
//        String emailPattern = "/^([a-zA-Z0-9_\\.\\-])+\\@(([a-zA-Z0-9\\-])+\\.)+([a-zA-Z0-9]{2,4})+$/";
//        Pattern regex = Pattern.compile(emailPattern);
//        Matcher matcher = regex.matcher(email);
//        if (matcher.find()) {
//            response.getWriter().write("Email k đúng định dạng");
//        }else
        
        if (use.ckeckemail(request.getParameter("email_dangki"))) {
            response.getWriter().write("Email đã tồn tại");
        } else {
            response.getWriter().write("<img src=\"images/available.png\" />");
        }
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.FeedbackEntity;
import Function.FeedbackFunc;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TungVoDoi
 */
public class FeedbackServlet extends HttpServlet {

    FeedbackFunc fb = new FeedbackFunc();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command=request.getParameter("command");
        String url="";
        switch(command){
            case "delete":
                String feedid=request.getParameter("feedid");
                fb.deleteFeedback(Integer.parseInt(feedid));
                url="/java/admin/ql-feedback.jsp";
                break;
        }
        response.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("utf-8");
            response.setCharacterEncoding("utf-8");
            String command = request.getParameter("command");
            String content = request.getParameter("txtcontent");
            String productId = request.getParameter("productId");
            String userid = request.getParameter("userid");
            String url = "";
            switch (command) {
                case "post":
                    System.out.println(productId + "-" + content + "-" + userid);
                    FeedbackEntity fbe = new FeedbackEntity();
                    fbe.setCusid(Integer.parseInt(userid));
                    fbe.setProid(Integer.parseInt(productId));
                    fbe.setContent(content);
                    fb.insertFeedback(fbe);
                    url = "/java/product-title.jsp?productId=" + productId;
                    break;
                case "update":
                    String status = request.getParameter("status");
                    String feedid = request.getParameter("feedid");
                    if (fb.updateFeedback(Integer.parseInt(status), Integer.parseInt(feedid))) {
                        url="/java/admin/ql-feedback.jsp";
                        System.out.println("thanh cong");
                    } else {
                        System.out.println("that bai");
                        url="/java/admin/ql-feedback.jsp";
                    }
                    break;
            }
            response.sendRedirect(url);
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

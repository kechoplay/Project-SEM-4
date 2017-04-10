/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.UserEntity;
import Function.UserFunc;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tools.MD5;

/**
 *
 * @author TungVoDoi
 */
public class UserServlet extends HttpServlet {

    UserFunc user = new UserFunc();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        System.out.println(command);
        String url = "";
        try {
            switch (command) {
                case "delete":
                    System.out.println(user.countUserByFeedback(Integer.parseInt(request.getParameter("cus_id"))));
                    if (user.countUserByFeedback(Integer.parseInt(request.getParameter("cus_id"))) > 0
                            || user.countUserByOrder(Integer.parseInt(request.getParameter("cus_id"))) > 0
                            || Integer.parseInt(request.getParameter("cus_id")) == 2) {
                        out.println("Ban k the xoa tai khoan nay");
                        out.flush();
                        return;
                    } else {
                        user.delete(Integer.parseInt(request.getParameter("cus_id")));
                        url = "/java/admin/ql-customer.jsp";
                        System.out.println("thanh cong");
                    }
                    break;
            }
        } catch (Exception ex) {

        }
        response.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");

        String url = "";
        System.out.println(command);
        System.out.println(request.getParameter("cus_id"));
        UserEntity us = new UserEntity();
        HttpSession session = request.getSession();
        String error = "";
        switch (command) {
            case "dangki":
                try {
                    String username = request.getParameter("user_dangki");
                    String pass = request.getParameter("pass_dangki");
                    String repass = request.getParameter("repass_dangki");
                    String fullname = request.getParameter("fullname_dangki");
                    String email = request.getParameter("email_dangki");
                    String mobile = request.getParameter("mobile_dangki");
                    String address = request.getParameter("address_dangki");
                    us.setUsername(username);
                    us.setPassword(MD5.encryption(pass));
                    us.setFullname(fullname);
                    us.setEmail(email);
                    us.setAddress(address);
                    us.setMobile(mobile);
                    if ((user.getListUserByName(username).size() > 0) || username.equalsIgnoreCase("")) {
                        out.println("Ban hay nhap lai ten dang nhap");
                        out.flush();
                        return;
                    } else {
                        user.insert(us);
                        url = "/java/login.jsp";
                    }
                } catch (Exception ex) {

                }
                break;
            case "dangnhap":
                us = user.login(request.getParameter("user_dangnhap"), MD5.encryption(request.getParameter("pass_dangnhap")));
                if (us != null) {
                    if (us.getLevel() == 2) {
                        session.setAttribute("user", us);
                        url = "/java/index.jsp";
                    } else {
                        session.setAttribute("user", us);
                        url = "/java/admin/index.jsp";
                    }
                } else {
                    out.println("Ten dang nhap hoac mat khau khong dung");
                    out.flush();
                    return;
                }
                break;
//            case "update":
//                try {
//                    if (user.getListUserByName(request.getParameter("name")).size() > 0) {
//                        out.println("Ten dang nhap da ton tai");
//                        out.flush();
//                        return;
//                    } else if (user.update(request.getParameter("name"), request.getParameter("fullname"), request.getParameter("email"),
//                            request.getParameter("address"), request.getParameter("mobile"), Integer.parseInt(request.getParameter("level")),
//                            Integer.parseInt(request.getParameter("userid")))) {
//                        url = "/java/admin/ql-customer.jsp";
//                        System.out.println("Thanh cong");
//                    } else {
//                        out.println("That bai");
//                        out.flush();
//                        return;
//                    }
//                } catch (Exception ex) {
//                    ex.getMessage();
//                }
//                break;
            case "insertadmin":
                us.setUsername(request.getParameter("name"));
                us.setPassword(MD5.encryption(request.getParameter("pass")));
                us.setFullname(request.getParameter("fullname"));
                us.setEmail(request.getParameter("email"));
                us.setAddress(request.getParameter("address"));
                us.setMobile(request.getParameter("mobile"));
                us.setLevel(Integer.parseInt(request.getParameter("level")));
                if ((user.getListUserByName(request.getParameter("name")).size() > 0) || request.getParameter("name").equalsIgnoreCase("")) {
                    out.println("Ten dang nhap da ton tai");
                    out.flush();
                    return;
                } else if (user.insertadmin(us)) {
                    url = "/java/admin/ql-customer.jsp";
                    System.out.println("thanh cong");
                } else {
                    System.out.println("that bai");
                }

                break;
            case "capnhat":
                try {
                    if (user.getListUserByName(request.getParameter("name")).size() > 0) {
                        out.println("Ten dang nhap da ton tai");
                        out.flush();
                        return;
                    } else if (user.update2(request.getParameter("fullname2"), request.getParameter("email2"),
                            request.getParameter("address2"), request.getParameter("mobile2"), Integer.parseInt(request.getParameter("id")))) {
                        url = "/java/account.jsp";
                        System.out.println("Thanh cong");
                    } else {
                        System.out.println("that bai");
                    }
                } catch (Exception ex) {
                    ex.getMessage();
                }
                break;
            case "change":
                us = (UserEntity) session.getAttribute("user");
                String oldpass = us.getPassword();
                System.out.println(oldpass);
                try {
                    if (MD5.encryption(request.getParameter("old")).equals(oldpass)) {
                        if (request.getParameter("new").equals(request.getParameter("renew"))) {
                            if (user.updatepass(MD5.encryption(request.getParameter("new")), Integer.parseInt(request.getParameter("id")))) {
                                session.invalidate();
                                url = "/java/login.jsp";
                                System.out.println("Thanh cong");
                            } else {
                                out.println("That bai");
                                out.flush();
                                return;
                            }
                        } else {
                            out.println("mat khau k giong nhau");
                            out.flush();
                            return;
                        }
                    } else {
                        out.println("sai mat khau cu");
                        out.flush();
                        return;
                    }
                } catch (Exception ex) {
                    ex.getMessage();
                }
                break;
        }
        request.setAttribute("error", error);
        response.sendRedirect(url);
    }

//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
//        response.setCharacterEncoding("utf-8");
//        String command = request.getParameter("command");
//        String username = request.getParameter("user_dangki");
//        String pass = request.getParameter("pass_dangki");
//        String repass = request.getParameter("repass_dangki");
//        String fullname = request.getParameter("fullname_dangki");
//        String email = request.getParameter("email_dangki");
//        String mobile = request.getParameter("mobile_dangki");
//        String address = request.getParameter("address_dangki");
//        String userdn = request.getParameter("user_dangnhap");
//        String passdn = request.getParameter("pass_dangnhap");
//        String url = "";
//        UserEntity us = new UserEntity();
//        HttpSession session = request.getSession();
//        us.setUsername(username);
//        us.setPassword(MD5.encryption(pass));
//        us.setFullname(fullname);
//        us.setEmail(email);
//        us.setAddress(address);
//        us.setMobile(mobile);
//        if(command.equalsIgnoreCase("dangki")){
//                if (user.getListUserByName(username).size() > 0) {
//                    response.getWriter().write("Khong the dang ki");
//                } else {
//                    response.getWriter().write("Co the dang ki");
//                    if (user.insert(us)) {
//                        response.getWriter().write("Thanh cong");
//                    } else {
//                        response.getWriter().write("Co lois");
//                    }
//                }
//        
//        }
//    }
}

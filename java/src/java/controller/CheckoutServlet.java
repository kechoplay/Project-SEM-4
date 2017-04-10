/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.BillDetailEntity;
import Entity.BillEntity;
import Entity.CartEntity;
import Entity.ItemEntity;
import Entity.UserEntity;
import Function.BillDetailFunc;
import Function.BillFunc;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TungVoDoi
 */
public class CheckoutServlet extends HttpServlet {

    private final BillFunc billfunc = new BillFunc();
    private final BillDetailFunc billdetailfunc = new BillDetailFunc();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String payment = request.getParameter("payment");
        String address = request.getParameter("address");
        int billid = 0;
        HttpSession session = request.getSession();
        CartEntity cart = (CartEntity) session.getAttribute("cart");
        UserEntity user = (UserEntity) session.getAttribute("user");
        try {
            if (cart.countItem() > 0) {
                BillEntity bill = new BillEntity();
                bill.setUserId(user.getUserId());
                bill.setTotal(cart.totalCart());
                bill.setPayment(payment);
                bill.setAddress(address);
                bill.setDate(new Timestamp(new Date().getTime()));
                System.out.println(user.getUserId() + "-" + user.getUsername());
                billfunc.insert(bill);
                for (BillEntity b : billfunc.getLastId()) {
                    billid = b.getBillId();
                }
                System.out.println(billid);
                for (Map.Entry<Integer, ItemEntity> list : cart.getCartItem().entrySet()) {

                    billdetailfunc.insertBillDetail(new BillDetailEntity(billid, list.getValue().getProduct().getPro_id(),
                            list.getValue().getProduct().getPro_price(), list.getValue().getQuantity()));
                }
                cart = new CartEntity();
                session.setAttribute("cart", cart);
            } else {
                out.println("hay mmua hang de dc thanh toan");
                out.flush();
                return;
            }
        } catch (Exception ex) {

        }
        response.sendRedirect("/java/index.jsp");
    }

}

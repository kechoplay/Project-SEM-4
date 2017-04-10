/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.CartEntity;
import Entity.ItemEntity;
import Entity.ProductEntity;
import Function.ProductFunc;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
public class CartServlet extends HttpServlet {

    private final ProductFunc product = new ProductFunc();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String command = request.getParameter("command");
        CartEntity cart = (CartEntity) session.getAttribute("cart");
        System.out.println(command);
        Map<String, String> messages = new HashMap<String, String>();
        request.setAttribute("messages", messages);
        try {

            switch (command) {
                case "plus":
                    String productId = request.getParameter("productId");
                    Integer idproduct = Integer.parseInt(productId);
                    ProductEntity pro = product.getProduct(idproduct);
                    if (cart.getCartItem().containsKey(idproduct)) {
                        cart.plusToCart(idproduct, new ItemEntity(pro, cart.getCartItem().get(idproduct).getQuantity()));
                    } else {
                        cart.plusToCart(idproduct, new ItemEntity(pro, 1));
                    }
                    break;
                case "remove":
                    productId = request.getParameter("productId");
                    idproduct = Integer.parseInt(productId);
                    cart.removeToCart(idproduct);
                    break;
                case "sub":
                    String proId[] = request.getParameterValues("productId");
                    String quan[] = request.getParameterValues("sl");

                    for (int i = 0; i < proId.length; i++) {
                        System.out.println(proId[i]);
                        System.out.println(quan[i]);
                        pro = product.getProduct(Integer.parseInt(proId[i]));
                        cart.subToCart(Integer.parseInt(proId[i]), new ItemEntity(pro,
                                cart.getCartItem().get(Integer.parseInt(proId[i])).getQuantity()),
                                Integer.parseInt(quan[i]));

                    }
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        session.setAttribute("cart", cart);
        response.sendRedirect("/java/cart.jsp");
    }

}

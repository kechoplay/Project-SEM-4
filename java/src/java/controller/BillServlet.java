/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.BillEntity;
import Function.BillDetailFunc;
import Function.BillFunc;
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
public class BillServlet extends HttpServlet {

    BillFunc billFunc = new BillFunc();
    BillDetailFunc billdetailfunc = new BillDetailFunc();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        String billid = request.getParameter("billid");
        String url = "";
        switch (command) {
            case "delete":
                billFunc.deleteBill(Integer.parseInt(billid));
                billdetailfunc.deleteBill(Integer.parseInt(billid));
                url = "/java/admin/ql-bill.jsp";
                break;
        }
        response.sendRedirect(url);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String command = request.getParameter("command");
        String billid = request.getParameter("billid");
        String status = request.getParameter("status");
        System.out.println(billid + "-" + status + "-" + command);
        String url = "";
        int billstatus = Integer.parseInt(request.getParameter("billstatus"));
        switch (command) {
            case "update":
                System.out.println(billid + "-" + status + "-" + billstatus);
                if (billstatus == 0 || billstatus == 1) {
                    billFunc.updatebill(Integer.parseInt(status), Integer.parseInt(billid));
                    url = "/java/admin/ql-bill.jsp";
                } else {
                    out.println("k the update hoa hon da dc xu li");
                    out.flush();
                    return;
                }
                break;
        }
        response.sendRedirect(url);
    }

}

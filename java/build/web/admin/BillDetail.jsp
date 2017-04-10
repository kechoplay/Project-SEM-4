
<%@page import="Entity.BillDetailEntity"%>
<%@page import="Function.BillDetailFunc"%>
<%@page import="Entity.BillEntity"%>
<%@page import="Function.BillFunc"%>
<%@page import="Entity.UserEntity"%>
<%@page import="Entity.CategoryEntity"%>
<%@page import="Function.CategoryFunc"%>
<%@page import="Entity.ProductEntity"%>
<%@page import="Function.ProductFunc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Quản lý đơn hàng</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>

        <link href="${root}/mycss.css" rel='stylesheet' type='text/css' />

        <!-- Bootstrap Core CSS -->
        <link href="${root}/css/bootstrap.min.css" rel='stylesheet' type='text/css' />

        <!-- Custom CSS -->
        <link href="${root}/css/sb-admin.css" rel='stylesheet' type='text/css' />

        <!-- Morris Charts CSS -->
        <link href="${root}/css/plugins/morris.css" rel='stylesheet' type='text/css' />

        <!-- Custom Fonts -->
        <link href="${root}/font-awesome-4.7.0/css/font-awesome.min.css" rel='stylesheet' type='text/css' />

        <style>
            th,td{
                border: 1px thin black;
                padding: 5px;
            }
        </style>

    </head>
    <body>
        <%
            BillFunc billfunc = new BillFunc();
            BillDetailFunc billdetailfunc = new BillDetailFunc();
            String billid = null;
            if (request.getParameter("billid") != null) {
                billid = request.getParameter("billid");
            }
            
            UserEntity users = null;
            if (session.getAttribute("user") != null) {
                users = (UserEntity) session.getAttribute("user");
                
            }
            if ((users != null) && (users.getLevel() == 1)) {
        %>
        <div id="wrapper">

            <jsp:include page="header.jsp"></jsp:include>

                <div id="page-wrapper">

                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">
                                    Quản lý đơn hàng
                                </h1>
                                <ol class="breadcrumb">
                                    <li>
                                        <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                                    </li>
                                    <li class="active">
                                        <i class="fa fa-bar-chart-o"></i> Quản lý đơn hàng
                                    </li>
                                </ol>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                            <%
                                if (request.getParameter("billid") != null) {
                            %>

                            <p><h2 style="text-align:center;">Chi tiết hóa đơn</h2></p>
                            <%
                                for (BillEntity bill : billfunc.getListBillbyID(Integer.parseInt(billid))) {
                            %>
                            Tên khách hàng:<span><%=bill.getUsname()%></span><br>
                            Địa chỉ:<span><%=bill.getAddress()%></span><br>
                            Điện thoại:<span><%=bill.getMobile()%></span><br>



                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Tên mặt hàng</th>
                                        <th>Số lượng</th>
                                        <th>Đơn giá</th>
                                        <th>Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (BillDetailEntity billdetail : billdetailfunc.getBillDetail(Integer.parseInt(billid))) {
                                    %>
                                    <tr>

                                        <td><%=billdetail.getProname()%></td>
                                        <td><%=billdetail.getQuantity()%></td>
                                        <td><%=billdetail.getPrice()%></td>
                                        <td><%=billdetail.getQuantity() * billdetail.getPrice()%></td>

                                    </tr>
                                    <% }%>
                                    <tr>
                                        <td colspan="3">Tổng tiền</td>
                                        <td><%=bill.getTotal()%></td>
                                        <% } %>
                                    </tr>
                                </tbody>
                            </table>
                            <%
                            } else {
                            %>
                            <h3>Khong co du lieu</h3>
                            <% } %>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script src="${root}/js/jquery-3.1.0.min.js"></script>
        <script src="${root}/js/myjs.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${root}/js/bootstrap.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <%
            } else {
                response.sendRedirect("/java/404.jsp");
            }
        %>
    </body>
</html>

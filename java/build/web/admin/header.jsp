<%-- 
    Document   : header
    Created on : Feb 2, 2017, 10:20:39 PM
    Author     : TungVoDoi
--%>

<%@page import="Entity.UserEntity"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    UserEntity users = null;
    if ((session.getAttribute("user") != null)) {
        users = (UserEntity) session.getAttribute("user");
    }
%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="index.jsp">Admintrator</a>
    </div>
    <!-- Top Menu Items -->
    <ul class="nav navbar-right top-nav">
        <li class="dropdown">
            <%if (users != null) {%>
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> 
                <%=users.getUsername()%>
                <b class="caret"></b></a>
                <%
                    }
                %>
            <ul class="dropdown-menu">
                <li>
                    <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="/java/LogoutServlet"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                </li>
            </ul>
        </li>
    </ul>
    <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
    <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav side-nav">
            <li>
                <a href="index.jsp" ><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-bar-chart-o"></i> Quản lý hãng xe <i class="fa fa-fw fa-caret-down"></i></a>
                <ul id="demo" class="collapse">
                    <li>
                        <a href="ql-category.jsp">Hãng xe</a>
                    </li>
                    <li>
                        <a href="add-category.jsp">Thêm mới</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#demo1"><i class="fa fa-fw fa-bar-chart-o"></i> Quản lý sản phẩm <i class="fa fa-fw fa-caret-down"></i></a>
                <ul id="demo1" class="collapse">
                    <li>
                        <a href="ql-product.jsp">Sản phẩm</a>
                    </li>
                    <li>
                        <a href="add-product.jsp">Thêm mới</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="fa fa-fw fa-bar-chart-o"></i> Quản lý khách hàng <i class="fa fa-fw fa-caret-down"></i></a>
                <ul id="demo2" class="collapse">
                    <li>
                        <a href="ql-customer.jsp">Khách hàng</a>
                    </li>
                    <li>
                        <a href="add-customer.jsp">Thêm mới</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#demo3"><i class="fa fa-fw fa-bar-chart-o"></i> Quản lý đơn hàng <i class="fa fa-fw fa-caret-down"></i></a>
                <ul id="demo3" class="collapse">
                    <li>
                        <a href="ql-bill.jsp">Đơn hàng</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;" data-toggle="collapse" data-target="#demo4"><i class="fa fa-fw fa-bar-chart-o"></i> Quản lý bình luận <i class="fa fa-fw fa-caret-down"></i></a>
                <ul id="demo4" class="collapse">
                    <li>
                        <a href="ql-feedback.jsp">Bình luận</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>
            </li>
        </ul>
    </div>
    <!-- /.navbar-collapse -->
</nav>


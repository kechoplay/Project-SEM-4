<%-- 
    Document   : header
    Created on : Jan 17, 2017, 1:06:05 PM
    Author     : TungVoDoi
--%>

<%@page import="Entity.UserEntity"%>
<%@page import="Entity.CategoryEntity"%>
<%@page import="Function.CategoryFunc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    CategoryFunc cate = new CategoryFunc();
    UserEntity users = null;
    if (session.getAttribute("user") != null) {
        users = (UserEntity) session.getAttribute("user");
    }
%>

<header  data-spy="affix" data-offset-top="1" class="clearfix">
    <section class="toolbar">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 left_bar">
                    <ul class="left-none">
                        <%if (users != null) {%>
                        <li>
                            <a href=""><i class="fa fa-user"></i><%=users.getUsername()%></a>
                        </li>
                        <li>
                            <a href="/java/LogoutServlet"><i class="fa fa-sign-out"></i>Log out</a>
                        </li>
                        <%} else {%>
                        <li>
                            <a href="login.jsp"><i class="fa fa-sign-in"></i> Login</a>
                        </li>
                        <li>
                            <a href="signup.jsp"><i class="fa fa-user-plus"></i> Sign Up</a>
                        </li>
                        <%}%>
                        <li>
                            <form method="get" action="/java/product.jsp" >
                                <i class="fa fa-search"></i>
                                <input type="hidden" value="search" name="command">
                                <input type="search" placeholder="Search" name="searchtext" class="search_box">

                            </form>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-6 ">
                    <ul class="right-none pull-right company_info">
                        <li>
                            <a href="tel:18005670123"><i class="fa fa-phone"></i> 1-800-567-0123</a>
                        </li>
                        <li class="address">
                            <a href="">
                                <i class="fa fa-map-marker"></i> 
                                107 Sunset Blvd., Beverly Hills, CA  90210
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="toolbar_shadow"></div>
    </section>
    <div class="bottom-header" >
        <div class="container">
            <nav class="navbar navbar-default" role="navigation">
                <div class="container-fluid"> 
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> 
                            <span class="sr-only">Toggle navigation</span> 
                            <span class="icon-bar"></span> <span class="icon-bar"></span> 
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="">
                            <span class="logo">
                                <span class="primary_text">Automotive</span> 
                                <span class="secondary_text">Template</span>

                            </span>
                        </a> 
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav pull-right">
                            <li><a href="index.jsp">Home</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    Sản phẩm 
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="product.jsp">Tất cả sản phẩm</a></li>
                                        <%
                                            for (CategoryEntity c : cate.getListCategory()) {
                                        %>
                                    <li><a href="product.jsp?category_id=<%=c.getCategory_id()%>"><%=c.getCategory_name()%></a></li>
                                        <%
                                            }
                                        %>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Giới thiệu <b class="caret"></b></a>
                            </li>
                            <li><a href="">Liên hệ</a></li>                                                                       
                            <li><a href="cart.jsp">Giỏ hàng</a></li>   
                                <%if (users != null) {%>
                            <li><a href="account.jsp">Account</a></li>                                                                       
                                <% }%>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse --> 
                </div>
                <!-- /.container-fluid --> 
            </nav>
        </div>
        <div class="header_shadow"></div>
    </div>
</header>


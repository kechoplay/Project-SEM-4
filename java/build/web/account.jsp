<%@page import="Function.UserFunc"%>
<%@page import="Entity.UserEntity"%>
<%@page import="Entity.ItemEntity"%>
<%@page import="java.util.Map"%>
<%@page import="Entity.CartEntity"%>
<%@page import="Entity.CategoryEntity"%>
<%@page import="Function.CategoryFunc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" href="images/favicon.ico">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Yellowtail%7COpen%20Sans%3A400%2C300%2C600%2C700%2C800" media="screen" />
        <!-- Custom styles for this template -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="css/jquery.bxslider.css" type="text/css" media="screen" />
        <link href="css/jquery.fancybox.css" rel="stylesheet">
        <link href="css/jquery.selectbox.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/mobile.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/settings.css" media="screen" />
        <link href="css/animate.min.css" rel="stylesheet">
        <link href="css/ts.css" type="text/css" rel="stylesheet">
        <link rel="stylesheet" href="mycss.css" type="text/css"/>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jquery.themepunch.tools.min.js"></script>
        <script type="text/javascript" src="js/jquery.themepunch.revolution.min.js"></script>
        <script type="text/javascript" src="js/wow.min.js"></script>
    </head>

    <body>
        <%
            CartEntity cart = (CartEntity) session.getAttribute("cart");
            UserFunc userfunc = new UserFunc();
            if (cart == null) {
                cart = new CartEntity();
                session.setAttribute("cart", cart);
            }
            String name=null;
            UserEntity users = null;
            if (session.getAttribute("user") != null) {
                users = (UserEntity) session.getAttribute("user");
                name=users.getUsername();
            }
            if (users != null) {
                
        %>
        <!--Header Start-->
        <jsp:include page="header.jsp"></jsp:include>
            <!--Header End-->
        <jsp:include page="banner.jsp"></jsp:include>
            <!--#secondary-banner ends-->
            <div class="message-shadow"></div>
            <div class="clearfix"></div>
            <div class="wrapper">
                <div class="contents clearfix">
                    <div id="aside">
                        <div id="nav">
                            <h2>Tùy chọn</h2>
                            <ul>
                                <li><a href="account.jsp">Thông tin tài khoản</a></li>
                                <li><a href="changpass.jsp">Đổi mật khẩu</a></li>
                                <li><a href="checkcart.jsp">Thông tin đơn hàng</a></li>
                            </ul>
                        </div>
                    </div>

                    <div id="products" style="margin-bottom: 30px;">
                        <h1 class="title">Thông tin cá nhân</h1>
                    <%
                        for (UserEntity user : userfunc.getListUserByName(name)) {
                    %>
                    <form action="/java/UserServlet" method="post">
                        <div><input type="hidden" name="id" value="<%=user.getUserId() %>" ></div>
                        <div class="form-group" style="height: 63px;">
                            <div style="display: inline-block; max-width: 100%; margin-bottom: 5px; font-weight: 700;">Tên đăng nhập</div>
                            <input type="text" class="form-control" id="username" disabled name="username2" value="<%=user.getUsername()%>" placeholder="Input field" required="">
                        </div>
                        <div class="form-group" style="height: 63px;">
                            <div style="display: inline-block; max-width: 100%; margin-bottom: 5px; font-weight: 700;">Mật khẩu</div>
                            <input type="password" class="form-control" disabled="" value="<%=user.getPassword()%>" placeholder="Input field">
                        </div>
                        <div class="form-group" style="height: 63px;">
                            <div style="display: inline-block; max-width: 100%; margin-bottom: 5px; font-weight: 700;">Tên đầy đủ</div>
                            <input type="text" class="form-control" id="fullname" name="fullname2" value="<%=user.getFullname()%>" placeholder="Input field" required="">
                        </div>
                        <div class="form-group" style="height: 63px;">
                            <div style="display: inline-block; max-width: 100%; margin-bottom: 5px; font-weight: 700;">Email</div>
                            <input type="email" class="form-control" id="email" name="email2" value="<%=user.getEmail()%>" placeholder="Input field" required="">
                        </div>
                        <div class="form-group" style="height: 63px;">
                            <div style="display: inline-block; max-width: 100%; margin-bottom: 5px; font-weight: 700;">Địa chỉ</div>
                            <input type="text" class="form-control" id="address" name="address2" value="<%=user.getAddress()%>" placeholder="Input field" required="">
                        </div>
                        <div class="form-group" style="height: 63px;">
                            <div style="display: inline-block; max-width: 100%; margin-bottom: 5px; font-weight: 700;">Số điện thoại</div>
                            <input type="text" class="form-control" id="mobile" name="mobile2" value="<%=user.getMobile()%>" placeholder="Input field" required="">
                        </div>
                        <input type="hidden" value="capnhat" name="command">
                        <button type="submit" class="btn btn-primary" name="account">Cập nhật</button>
                    </form>
                    <%
                        }
                    %>
                </div>
            </div>
        </div>

        <!--content ends-->
        <jsp:include page="footer.jsp"></jsp:include>

            <script src="js/retina.js"></script> 
            <script type="text/javascript" src="js/jquery.parallax.js"></script> 
            <script type="text/javascript" src="js/jquery.inview.min.js"></script> 
            <script src="js/main.js"></script> 
            <script type="text/javascript" src="js/jquery.fancybox.js"></script> 
            <script src="js/modernizr.custom.js"></script> 
            <script defer src="js/jquery.flexslider.js"></script> 
            <script src="js/jquery.bxslider.js" type="text/javascript"></script> 
            <script src="js/jquery.selectbox-0.2.js" type="text/javascript"></script> 
            <script type="text/javascript" src="js/jquery.mousewheel.js"></script> 
            <script type="text/javascript" src="js/jquery.easing.js"></script>
        <%
            } else {
                response.sendRedirect("/java/404.jsp");
            }
        %>
    </body>
</html>

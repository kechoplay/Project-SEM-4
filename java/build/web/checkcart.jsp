<%@page import="Function.BillDetailFunc"%>
<%@page import="Function.BillFunc"%>
<%@page import="Entity.BillDetailEntity"%>
<%@page import="Entity.BillEntity"%>
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
            BillFunc billfunc = new BillFunc();
            BillDetailFunc billdetailfunc = new BillDetailFunc();
            String billid = null;
            if (request.getParameter("billid") != null) {
                billid = request.getParameter("billid");
            }
            UserEntity users = null;
            int cusid = 0;
            if (session.getAttribute("user") != null) {
                users = (UserEntity) session.getAttribute("user");
                cusid = (users.getUserId());
            }
            if ((users != null)) {
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
                        <h1 class="title">Thông tin đơn hàng</h1>

                        <div class="row">
                            <div class="col-lg-12">


                                <p><h4>Chi tiết hóa đơn</h4></p>

                                Tên khách hàng:<span><%=users.getFullname()%></span><br>
                            Địa chỉ:<span><%=users.getAddress()%></span><br>
                            Điện thoại:<span><%=users.getMobile()%></span><br>

                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                    <th>Ngày mua</th>
                                    <th>Tên mặt hàng</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Thành tiền</th>
                                    <th>Trạng thái</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        for (BillEntity bill : billfunc.getListBillbyCusId(cusid)) {
                                            for (BillDetailEntity billdetail : billdetailfunc.getBillDetail(bill.getBillId())) {
                                    %>
                                    <tr>
                                    <td><%=bill.getDate()%></td>
                                    <td><%=billdetail.getProname()%></td>
                                    <td><%=billdetail.getQuantity()%></td>
                                    <td><%=billdetail.getPrice()%></td>
                                    <td><%=billdetail.getPrice() * billdetail.getQuantity()%></td>
                                    <td>
                                        <% if (bill.getStatus() == 0) { %>
                                        Chưa xử lý
                                        <% } else if (bill.getStatus() == 1) { %>
                                        Đang xử lý
                                        <% } else { %>
                                        Đã xử lý
                                        <% } %>
                                    </td>
                                    <%
                                        }
                                    %>
                                    </tr>

                                    <tr>
                                        <% } %>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>
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

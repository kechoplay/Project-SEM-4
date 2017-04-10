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
            UserEntity users = (UserEntity) session.getAttribute("user");
            if (users == null) {
                response.sendRedirect("/java/login.jsp");
            }
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
                    <h1 class="title">Check out</h1>
                    <div class="info">
                        <form action="/java/CheckoutServlet" method="POST">
                            <div class="row">
                                <div class="col-xs-6 form-group">
                                    <span>Address</span>
                                    <input type="text" class="form-control" name="address" required placeholder="Input field">
                                </div>
                                <div class="col-xs-6 form-group">
                                    <span>Payment</span>
                                    <select name="payment" class="form-control">
                                        <option value="Bank transfer">Bank transfer</option>
                                        <option value="Live">Live</option>
                                    </select>
                                </div>
                            </div>                        
                            <button type="submit">Submit</button>
                        </form>
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
    </body>
</html>

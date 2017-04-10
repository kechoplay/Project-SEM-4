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
        <script type="text/javascript">
            function confirm_query() {
                if (window.confirm('Bạn có muốn xóa không?')) {
                    return true;
                } else {
                    return false;
                }
            }
            function validate(e) {
                if (
                        (e.keyCode >= 48 && e.keyCode <= 57 && !e.shiftKey) ||
                        e.keyCode === 8
                        )
                {
                    return true;
                }
                return false;
            }
//e.keyCode >= 96 && e.keyCode <= 105
        </script>
    </head>

    <body>
        <%
            CartEntity cart = (CartEntity) session.getAttribute("cart");
            if (cart == null) {
                cart = new CartEntity();
                session.setAttribute("cart", cart);
            }
        %>
        <!--Header Start-->
        <jsp:include page="header.jsp"></jsp:include>
            <!--Header End-->
        <jsp:include page="banner.jsp"></jsp:include>
            <!--#secondary-banner ends-->
            <div class="message-shadow"></div>
            <div class="clearfix"></div>
        <section class="content">
            <div class="container" style="margin-top: 50px;">
                <div class="row">
                    <div class="col-xs-2"></div>
                    <div class="col-xs-8">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <h5><span class="glyphicon glyphicon-shopping-cart"></span> Shopping Cart</h5>
                                        </div>
                                        <div class="col-xs-6">
                                            <a href="product.jsp"><button type="button" class="btn btn-primary btn-sm btn-block">
                                                    <span class="glyphicon glyphicon-share-alt"></span> Continue shopping
                                                </button></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span class="error">${messages.sl}</span>
                        <form method="POST" action="/java/CartServlet?command=sub" onsubmit="return checkNumber()" name="spcart">
                            <div class="panel-body">
                                <%
                                    for (Map.Entry<Integer, ItemEntity> list : cart.getCartItem().entrySet()) {
                                %>
                                <div class="row">

                                    <div class="col-xs-2"><img width="120px" class="img-responsive" src="ImageCar/<%=list.getValue().getProduct().getPro_image()%>">
                                    </div>
                                    <div class="col-xs-4">
                                        <h5 class="product-name"><strong><%=list.getValue().getProduct().getPro_name()%></strong></h5>
                                        <input type="hidden" name="productId" value="<%=list.getValue().getProduct().getPro_id()%>"/>
                                    </div>
                                    <div class="col-xs-6">
                                        <div class="col-xs-6 text-right">
                                            <h6><strong><%=list.getValue().getProduct().getPro_price()%> <span class="text-muted">x</span></strong></h6>
                                        </div>
                                        <div class="col-xs-4">
                                            <input type="text" class="form-control input-sm" onkeydown="return validate(event)" name="sl" value="<%=list.getValue().getQuantity()%>">
                                        </div>
                                        <div class="col-xs-2">
                                            <a onclick="return confirm_query()" href="/java/CartServlet?command=remove&productId=<%=list.getValue().getProduct().getPro_id()%>"><button type="button" class="btn btn-link btn-xs">
                                                    <span class="glyphicon glyphicon-trash"> </span>
                                                </button></a>
                                        </div>
                                    </div>
                                </div>
                                <hr>
                                <% }%>
                                <div class="row">
                                    <div class="text-center">
                                        <div class="col-xs-9">
                                            <h6 class="text-right">Added items?</h6>
                                        </div>
                                        <div class="col-xs-3">
                                            <input type="hidden" name="command" value="sub">
                                            <button type="submit" class="btn btn-default btn-sm btn-block">
                                                Update cart
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form>
                        <div class="panel-footer">
                            <div class="row text-center">
                                <div class="col-xs-9">
                                    <h4 class="text-right">Total: <strong>$ <%=cart.totalCart()%></strong></h4>
                                </div>
                                <div class="col-xs-3">
                                    <a href="checkout.jsp"><button type="button" class="btn btn-success btn-block">
                                            Checkout
                                        </button></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-2"></div>
            </div>
        </div>
        <!--container ends--> 
    </section>
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

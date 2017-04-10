<%@page import="Entity.CartEntity"%>
<%@page import="Function.ProductFunc"%>
<%@page import="Entity.ProductEntity"%>
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
            CategoryFunc cate = new CategoryFunc();
            ProductFunc product = new ProductFunc();
            String categoryID = "";
            String searchtext = "";
            if (request.getParameter("category_id") != null) {
                categoryID = (request.getParameter("category_id"));
            }
            if (request.getParameter("searchtext") != null) {
                searchtext = request.getParameter("searchtext");
            }
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

            <div class="wrapper">
                <div class="contents clearfix">
                    <div id="aside">
                        <div id="nav">
                            <h2>Danh mục xe</h2>
                            <ul>
                                <li><a href="product.jsp">Tất cả sản phẩm</a></li>
                                <%
                                    for (CategoryEntity c : cate.getListCategory()) {
                                %>
                            <li><a href="product.jsp?category_id=<%=c.getCategory_id()%>"><%=c.getCategory_name()%></a></li>
                                <%
                                    }
                                %>
                        </ul>
                    </div>
                </div>
                <%
                    if (request.getParameter("command") != null) {
                        if (request.getParameter("searchtext") != null) {
                %>
                <div id="products">
                    <h1 class="title">Search for : <%=searchtext%></h1>
                    <div id="list-product">
                        <%
                            for (ProductEntity p : product.getListProductByName(searchtext)) {

                        %>
                        <div class="product">
                            <div class="image">
                                <a href="product-title.jsp?productId=<%=p.getPro_id()%>"><img src="ImageCar/<%=p.getPro_image()%>" class="img-detai" alt=""></a>
                                <p class="price">$<%=p.getPro_price()%></p>
                            </div>
                            <div class="des">
                                <div class="name"><%=p.getPro_name()%></div>
                                <div class="button">
                                    <a class="action left" href="/java/CartServlet?command=plus&productId=<%=p.getPro_id()%>">
                                        <i class="fa fa-shopping-cart"></i>
                                        &nbsp;Chọn xe
                                    </a>
                                    <a class="action right" href="product-title.jsp?productId=<%=p.getPro_id()%>">
                                        <i class="fa fa-eye"></i>
                                        &nbsp;Chi tiết
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <%
                    } else {
                    %>
                    <h3>Khong co san pham nao</h3>
                    <%
                        }
                    %>
                </div>
                <%
                } else if (request.getParameter("category_id") != null) {
                %>
                <div id="products">
                    <%
                        for (CategoryEntity c : cate.getListCategoryByCategory(Integer.parseInt(categoryID))) {
                    %>
                    <h1 class="title"><%=c.getCategory_name()%></h1>
                    <%
                        }
                    %>
                    <div id="list-product">
                        <%
                            for (ProductEntity p : product.getListProductByCategory(Integer.parseInt(categoryID))) {
                                if (product.countProductByCategory(Integer.parseInt(categoryID)) > 0) {

                        %>
                        <div class="product">
                            <div class="image">
                                <a href="product-title.jsp?productId=<%=p.getPro_id()%>"><img src="ImageCar/<%=p.getPro_image()%>" class="img-detai" alt=""></a>
                                <p class="price">$<%=p.getPro_price()%></p>
                            </div>
                            <div class="des">
                                <div class="name"><%=p.getPro_name()%></div>
                                <div class="button">
                                    <a class="action left" href="/java/CartServlet?command=plus&productId=<%=p.getPro_id()%>">
                                        <i class="fa fa-shopping-cart"></i>
                                        &nbsp;Chọn xe
                                    </a>
                                    <a class="action right" href="product-title.jsp?productId=<%=p.getPro_id()%>">
                                        <i class="fa fa-eye"></i>
                                        &nbsp;Chi tiết
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%
                        } else if (product.countProductByCategory(Integer.parseInt(categoryID)) == 0) {
                        %>
                        <h2>Không có sản phẩm</h2>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <%
                } else {
                %>
                <div id="products">
                    <h1 class="title">Tất cả sản phẩm</h1>
                    <div id="list-product">
                        <%
                            for (ProductEntity p : product.getListProduct()) {

                        %>
                        <div class="product">
                            <div class="image">
                                <a href="product-title.jsp?productId=<%=p.getPro_id()%>"><img src="ImageCar/<%=p.getPro_image()%>" class="img-detai" alt=""></a>
                                <p class="price">$<%=p.getPro_price()%></p>
                            </div>
                            <div class="des">
                                <div class="name"><%=p.getPro_name()%></div>
                                <div class="button">
                                    <a class="action left" href="/java/CartServlet?command=plus&productId=<%=p.getPro_id()%>">
                                        <i class="fa fa-shopping-cart"></i>
                                        &nbsp;Chọn xe
                                    </a>
                                    <a class="action right" href="product-title.jsp?productId=<%=p.getPro_id()%>">
                                        <i class="fa fa-eye"></i>
                                        &nbsp;Chi tiết
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
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
    </body>
</html>

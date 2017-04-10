<%@page import="Entity.FeedbackEntity"%>
<%@page import="Function.FeedbackFunc"%>
<%@page import="Entity.UserEntity"%>
<%@page import="Entity.ProductEntity"%>
<%@page import="Function.ProductFunc"%>
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
        <style>
            #danhgia{
                float: left;
                width: 100%;
                padding-left: 20px;
            }
            .thumbnail {
                width:50px;	
                padding:0px;
            }
            .panel {
                position: relative;
                width: 675px;
            }
            .panel>.panel-heading:after,.panel>.panel-heading:before{
                position:absolute;
                top:11px;left:-16px;
                right:100%;
                width:0;
                height:0;
                display:block;
                content:" ";
                border-color:transparent;
                border-style:solid solid outset;
                pointer-events:none;
            }
            .panel>.panel-heading:after{
                border-width:7px;
                border-right-color:#f7f7f7;
                margin-top:1px;
                margin-left:2px;
            }
            .panel>.panel-heading:before{
                border-right-color:#ddd;
                border-width:8px;
            }
            .col-sm-5{
                width: 705px;
            }
            .col-sm-12{
                width: 838px;
            }
            .containers {
                width: 838px;
                margin-left: 0px;
            }
            #txtarea{
                width: 100%;
                float: left;
            }
            .panel-body form button {
                border: medium none;
                color: #fff;
                float: right;
                font-family: Lato;
                font-size: 14px;
                letter-spacing: 0.3px;
                margin-right: 9px;
                margin-top: 9px;
                padding: 6px 15px;
            }
        </style>
    </head>

    <body>
        <%
            FeedbackFunc fbf = new FeedbackFunc();
            ProductFunc func = new ProductFunc();
            ProductEntity ent = new ProductEntity();
            String proid = "";
            if (request.getParameter("productId") != null) {
                proid = request.getParameter("productId");
                ent = func.getProduct(Integer.parseInt(proid));
            }
            UserEntity users = null;
            if (session.getAttribute("user") != null) {
                users = (UserEntity) session.getAttribute("user");
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
            <div class="container">
                <div class="inner-page inventory-listing">
                    <div class="inventory-heading margin-bottom-10 clearfix">
                        <div class="row">
                            <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
                                <h2><%=ent.getPro_name()%></h2>
                            <span class="margin-top-10">Our template platform will maximize the exposure of your inventory online</span> </div>
                        <div class="col-lg-2 col-md-2 col-sm-2 text-right">
                            <h2>$ <%=ent.getPro_price()%></h2>
                            <em>Plus Taxes & Licensing</em> </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 left-content padding-left-none"> 
                        <!--OPEN OF SLIDER-->
                        <div class="listing-slider">
                            <section class="slider home-banner">
                                <div class="flexslider" id="home-slider-canvas">
                                    <ul class="slides">
                                        <li data-thumb="ImageCar/<%=ent.getPro_image()%>"> <img src="ImageCar/<%=ent.getPro_image()%>" width="1000px" alt="" data-full-image="ImageCar/<%=ent.getPro_image()%>" /> </li>
                                        <!--                                            <li data-thumb="images/boxster4_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster4_slide.jpg" alt="" data-full-image="images/boxster4.jpg" /> </li>
                                                                                    <li data-thumb="images/boxster5_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster5_slide.jpg" alt="" data-full-image="images/boxster5.jpg" /> </li>
                                                                                    <li data-thumb="images/boxster8_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster8_slide.jpg" alt="" data-full-image="images/boxster8.jpg" /> </li>
                                                                                    <li data-thumb="images/boxster10_slide.jpg"><img src="http://demo.themesuite.com/automotive/images/boxster10_slide.jpg" alt="" data-full-image="images/boxster10.jpg" /> </li>
                                                                                     full 
                                                                                    <li data-thumb="images/boxster2_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster2_slide.jpg" alt="" data-full-image="images/boxster2.jpg" /> </li>
                                                                                    <li data-thumb="images/boxster3_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster3_slide.jpg" alt="" data-full-image="images/boxster3.jpg" /> </li>
                                                                                    <li data-thumb="images/boxster6_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster6_slide.jpg" alt="" data-full-image="images/boxster6.jpg" /> </li>
                                                                                    <li data-thumb="images/boxster7_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster7_slide.jpg" alt="" data-full-image="images/boxster7.jpg" /> </li>
                                                                                    <li data-thumb="images/boxster9_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster9_slide.jpg" alt="" data-full-image="images/boxster9.jpg" /> </li>
                                                                                    <li data-thumb="images/boxster11_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster11_slide.jpg" alt="" data-full-image="images/boxster11.jpg" /> </li>
                                                                                    <li data-thumb="images/boxster12_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster12_slide.jpg" alt="" data-full-image="images/boxster12.jpg" /> </li>
                                                                                    <li data-thumb="images/boxster13_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster13_slide.jpg" alt="" data-full-image="images/boxster13.jpg" /> </li>
                                                                                    <li data-thumb="images/boxster14_slide.jpg"> <img src="http://demo.themesuite.com/automotive/images/boxster14_slide.jpg" alt="" data-full-image="images/boxster14.jpg" /> </li>-->
                                    </ul>
                                </div>
                            </section>
                            <!--                                <section class="home-slider-thumbs">
                                                                <div class="flexslider" id="home-slider-thumbs">
                                                                    <ul class="slides">
                                                                        <li data-thumb="images/thumbnail1.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail1.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail2.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail2.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail3.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail3.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail4.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail4.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail5.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail5.jpg" alt="" /></a> </li>
                                                                         full 
                                                                        <li data-thumb="images/thumbnail6.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail6.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail7.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail7.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail8.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail8.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail9.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail9.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail10.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail10.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail11.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail11.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail12.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail12.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail13.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail13.jpg" alt="" /></a> </li>
                                                                        <li data-thumb="images/thumbnail14.jpg"> <a href="#"><img src="http://demo.themesuite.com/automotive/images/thumbnail14.jpg" alt="" /></a> </li>
                                                                    </ul>
                                                                </div>
                                                            </section>-->
                        </div>
                        <!--CLOSE OF SLIDER--> 
                        <!--Slider End-->
                        <div class="clearfix"></div>
                        <div class="bs-example bs-example-tabs example-tabs margin-top-50">
                            <ul id="myTab" class="nav nav-tabs">
                                <li class="active"><a href="#vehicle" data-toggle="tab">Vehicle Overview</a></li>
                                <li><a href="#technical" data-toggle="tab">Technical Specifications</a></li>
                            </ul>
                            <div id="myTabContent" class="tab-content margin-top-15 margin-bottom-20">
                                <div class="tab-pane fade in active" id="vehicle">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec luctus tincidunt aliquam. Aliquam gravida massa at sem vulputate 
                                        interdum et vel eros. Maecenas eros enim, tincidunt vel turpis vel, dapibus tempus nulla. Donec vel nulla dui. Pellentesque sed ante 
                                        sed ligula hendrerit condimentum. Suspendisse rhoncus fringilla ipsum quis porta. Morbi tincidunt viverra pharetra.</p>
                                    <p>Vestibulum vel mauris et odio lobortis laoreet eget eu magna. Proin mauris erat, luctus at nulla ut, lobortis mattis magna. Morbi 
                                        a arcu lacus. Maecenas tristique velit vitae nisi consectetur, in mattis diam sodales. Mauris sagittis sem mattis justo bibendum, a 
                                        eleifend dolor facilisis. Mauris nec pharetra tortor, ac aliquam felis. Nunc pretium erat sed quam consectetur fringilla.</p>
                                    <p>Aliquam ultricies nunc porta metus interdum mollis. Donec porttitor libero augue, vehicula tincidunt lectus placerat a. Sed 
                                        tincidunt dolor non sem dictum dignissim. Nulla vulputate orci felis, ac ornare purus ultricies a. Fusce euismod magna orci, 
                                        sit amet aliquam turpis dignissim ac. In at tortor at ligula pharetra sollicitudin. Sed tincidunt, purus eget laoreet elementum, 
                                        felis est pharetra ante, tincidunt feugiat libero enim sed risus.</p>
                                    <p>Sed at leo sit amet mi bibendum aliquam. Interdum et malesuada fames ac ante ipsum primis in faucibus. Praesent cursus varius odio, 
                                        non faucibus dui. Nunc vehicula lectus sed velit suscipit aliquam vitae eu ipsum. Curabitur hendrerit magna a quam semper, at tristique 
                                        mauris gravida. Donec consequat elementum lorem, ac luctus ligula. Quisque viverra fringilla mi vel aliquam. Class aptent taciti sociosqu
                                        ad litora torquent per conubia nostra, per inceptos himenaeos. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                </div>

                                <div class="tab-pane fade" id="technical">
                                    <table class="technical">
                                        <thead>
                                            <tr>
                                            <th>Engine</th>
                                            <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                            <td>Layout / number of cylinders</td>
                                            <td>6</td>
                                            </tr>
                                            <tr>
                                            <td>Displacement</td>
                                            <td>3.4 l</td>
                                            </tr>
                                            <tr>
                                            <td>Engine Layout</td>
                                            <td>Mid-engine</td>
                                            </tr>
                                            <tr>
                                            <td>Horespower</td>
                                            <td>315 hp</td>
                                            </tr>
                                            <tr>
                                            <td>@ rpm</td>
                                            <td>6,700 rpm</td>
                                            </tr>
                                            <tr>
                                            <td>Torque</td>
                                            <td>266 lb.-ft.</td>
                                            </tr>
                                            <tr>
                                            <td>Compression ratio</td>
                                            <td>12.5 : 1</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table class="technical">
                                        <thead>
                                            <tr>
                                            <th>Performance</th>
                                            <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                            <td>Top Track Speed</td>
                                            <td>173 mph</td>
                                            </tr>
                                            <tr>
                                            <td>0 - 60 mph</td>
                                            <td>4.8 s</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table class="technical">
                                        <thead>
                                            <tr>
                                            <th>Transmission</th>
                                            <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                            <td>Manual Gearbox</td>
                                            <td>6-speed with dual-mass flywheel and self-adjusting clutch</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table class="technical">
                                        <thead>
                                            <tr>
                                            <th>Fuel consumption</th>
                                            <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                            <td>City (estimate)</td>
                                            <td>20</td>
                                            </tr>
                                            <tr>
                                            <td>Highway (estimate)</td>
                                            <td>28</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table class="technical">
                                        <thead>
                                            <tr>
                                            <th>Body</th>
                                            <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                            <td>Length</td>
                                            <td>172.2 in.</td>
                                            </tr>
                                            <tr>
                                            <td>Width</td>
                                            <td>70.9 in.</td>
                                            </tr>
                                            <tr>
                                            <td>Height</td>
                                            <td>50.4 in.</td>
                                            </tr>
                                            <tr>
                                            <td>Wheelbase</td>
                                            <td>97.4 in.</td>
                                            </tr>
                                            <tr>
                                            <td>Maximum payload</td>
                                            <td>739 lbs</td>
                                            </tr>
                                            <tr>
                                            <td>Curb weight</td>
                                            <td>2910 lbs</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <table class="technical">
                                        <thead>
                                            <tr>
                                            <th>Capacities</th>
                                            <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                            <td>Luggage compartment volume</td>
                                            <td>5.3 cu. ft. (front) / 4.6 cu. ft. (rear)</td>
                                            </tr>
                                            <tr>
                                            <td>Fuel Tank Capacity</td>
                                            <td>16.9 gal.</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>                            
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-4 right-content padding-right-none">
                        <div class="side-content">
                            <div class="car-info margin-bottom-50">
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                            <td>Body Style:</td>
                                            <td>Convertible</td>
                                            </tr>
                                            <tr>
                                            <td>ENGINE:</td>
                                            <td>3.4L Mid-Engine V6</td>
                                            </tr>
                                            <tr>
                                            <td>TRANSMISSION:</td>
                                            <td>6-speed Manual</td>
                                            </tr>
                                            <tr>
                                            <td>DRIVETRAIN:</td>
                                            <td>Rear Wheel Drive</td>
                                            </tr>
                                            <tr>
                                            <td>EXTERIOR:</td>
                                            <td>Lime Gold Metallic</td>
                                            </tr>
                                            <tr>
                                            <td>INTERIOR:</td>
                                            <td>Agate Grey</td>
                                            </tr>
                                            <tr>
                                            <td>MILES:</td>
                                            <td>12</td>
                                            </tr>
                                            <tr>
                                            <td>DOORS:</td>
                                            <td>2</td>
                                            </tr>
                                            <tr>
                                            <td>PASSENGERS:</td>
                                            <td>2</td>
                                            </tr>
                                            <tr>
                                            <td>STOCK #:</td>
                                            <td>16115</td>
                                            </tr>
                                            <tr>
                                            <td>VIN #:</td>
                                            <td>WP0AB2E81EK190171</td>
                                            </tr>
                                            <tr>
                                            <td>FUEL MILEAGE:</td>
                                            <td>20 City / 28 Hwy</td>
                                            </tr>
                                            <tr>
                                            <td>FUEL TYPE:</td>
                                            <td>Gasoline</td>
                                            </tr>
                                            <tr>
                                            <td>CONDITION:</td>
                                            <td>Brand New</td>
                                            </tr>
                                            <tr>
                                            <td>OWNERS:</td>
                                            <td>N/A</td>
                                            </tr>
                                            <tr>
                                            <td>WARRANTY:</td>
                                            <td>3 Years Limited</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="clearfix"></div>

                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="recent-vehicles-wrap">
                    <div id="danhgia">
                        <div class="containers">
                            <div class="row">
                                <div class="col-sm-8">
                                    <h4>User Comment Example</h4>
                                </div>
                            </div>
                            <%
                                if (users != null) {
                            %>
                            <div class="row">
                                <div class="col-sm-1">
                                    <div class="thumbnail">
                                        <img class="img-responsive user-photo" src="images/avatar_2x.png">
                                    </div>
                                </div>
                                <div class="col-sm-7">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <strong></strong>
                                        </div>
                                        <div class="panel-body" style="padding-bottom: 9px;">
                                            <form method="POST" action="/java/FeedbackServlet?productId=<%=ent.getPro_id()%>&userid=<%=users.getUserId()%>">
                                                <textarea id="txtarea" name="txtcontent"></textarea>
                                                <input type="hidden" name="command" value="post">
                                                <button type="submit" name="submit_name" class="btn btn-success green">Post</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                }
                                for (FeedbackEntity fbe : fbf.getListFeedbackById(ent.getPro_id())) {
                            %>
                            <div class="row">
                                <div class="col-sm-1">
                                    <div class="thumbnail">
                                        <img class="img-responsive user-photo" src="images/avatar_2x.png">
                                    </div><!-- /thumbnail -->
                                </div><!-- /col-sm-1 -->
                                <div class="col-sm-5">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <strong><%=fbe.getName()%></strong> <span class="text-muted">commented at <%=fbe.getDate()%></span>
                                        </div>
                                        <div class="panel-body">
                                            <%=fbe.getContent()%>
                                        </div><!-- /panel-body -->
                                    </div><!-- /panel panel-default -->
                                </div><!-- /col-sm-5 -->
                            </div><!-- /row -->
                            <%
                                }
                            %>
                        </div><!-- /container -->
                    </div>
                </div>
                <div class="clearfix"></div>
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

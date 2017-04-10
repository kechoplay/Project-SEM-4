<%@page import="Entity.UserEntity"%>
<%@page import="Entity.ProductEntity"%>
<%@page import="Function.ProductFunc"%>
<%@page import="Entity.CategoryEntity"%>
<%@page import="Function.CategoryFunc"%>
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

        <title>Thêm Khách hàng</title>

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

        <script type="text/javascript">
            function checkValidate() {
                var email = document.forms["register"]["email"];
                var pass = document.forms["register"]["pass"];
                var repass = document.forms["register"]["repass"];
                var mobile = document.forms["register"]["mobile"];
                var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                var filterpass = /^[A-Z]{1}[a-zA-Z0-9]{6,32}$/;
                var filtermobile = /^[0-9]/;
                if (!filter.test(email.value)) {
                    alert('Hay nhap dia chi email hop le.\nExample@gmail.com');
                    email.focus;
                    return false;
                } else if (pass.value != repass.value) {
                    alert("Ban hay nhap dung password");
                    repass.focus;
                    return false;
                } else if (!filterpass.test(pass.value)) {
                    alert('Mật khẩu bắt đầu bằng chữ in hoa và có từ 6 đến 32 kí tự.');
                    pass.focus;
                    return false;
                } else if (!filtermobile.test(mobile.value)) {
                    alert('So dien thoai k dung dinh dang');
                    pass.focus;
                    return false;
                }
            }
        </script>
    </head>
    <body>

        <%
            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
            CategoryFunc cate = new CategoryFunc();
            ProductFunc prod = new ProductFunc();
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
                                    Thêm mới khách hàng
                                </h1>
                                <ol class="breadcrumb">
                                    <li>
                                        <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                                    </li>
                                    <li class="active">
                                        <i class="fa fa-bar-chart-o"></i> Thêm mới khách hàng
                                    </li>
                                </ol>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <form class="form-horizontal" method="post" action="/java/UserServlet" onsubmit="return checkValidate()" name="register">
                                    <fieldset>

                                        <!-- Form Name -->
                                        <legend>ADD CUSTOMER</legend>

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">USERNAME</label>
                                            <div class="col-md-4">
                                                <input id="username" name="name" class="form-control input-md" required="" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">PASSWORD</label>
                                            <div class="col-md-4">
                                                <input id="pass" name="pass" class="form-control input-md" required="" type="password">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">RE-PASSWORD</label>
                                            <div class="col-md-4">
                                                <input id="repass" name="repass" class="form-control input-md" required="" type="password">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">FULLNAME</label>
                                            <div class="col-md-4">
                                                <input id="fullname" name="fullname" class="form-control input-md" required="" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">EMAIL</label>
                                            <div class="col-md-4">
                                                <input id="email" name="email" class="form-control input-md" required="" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">ADDRESS</label>
                                            <div class="col-md-4">
                                                <input id="address" name="address" class="form-control input-md" required="" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">MOBILE</label>
                                            <div class="col-md-4">
                                                <input id="mobile" name="mobile" class="form-control input-md" required="" type="text">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">LEVEL</label>
                                            <div class="col-md-4 control-label">
                                                <select name="level" class="form-control input-md" required="">
                                                    <option value="1">Admin</option>
                                                    <option value="2">Khách hàng</option>
                                                </select>
                                            </div>
                                        </div>
                                        <!-- Button -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for=""></label>
                                            <div class="col-md-4">
                                                <input type="hidden" name="command" value="insertadmin">
                                                <input type="submit" id="" name="submit" class="btn btn-primary" value="Them moi">
                                            </div>
                                        </div>

                                    </fieldset>
                                </form>
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

<%@page import="Entity.UserEntity"%>
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

        <title>Thêm hãng xe</title>

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

        <script>
            $(document).ready(function (){
                $("#submit").click(function (){
                    var name=$("#category_name").val();
                    var image=$("#category_image").val();
//                    if(name.empty() && image.empty()){
                        alert("Điền đầy đủ thông tin");
//                    }
                });
            });
        </script>
    </head>
    <body>

        <%
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
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
                                    Thêm mới hãng xe
                                </h1>
                                <ol class="breadcrumb">
                                    <li>
                                        <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                                    </li>
                                    <li class="active">
                                        <i class="fa fa-bar-chart-o"></i> Thêm mới hãng xe
                                    </li>
                                </ol>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <form class="form-horizontal" method="post" action="/java/categoryServlet" enctype="multipart/form-data">
                                    <fieldset>

                                        <!-- Form Name -->
                                        <legend>ADD CATEGORY</legend>

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="category_name">CATEGORY NAME</label>
                                            <div class="col-md-4">
                                                <input id="category_name" name="name" placeholder="category name" required="" class="form-control input-md" type="text">
                                            </div>
                                        </div>

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="category_image">CATEGORY IMAGE</label>
                                            <div class="col-md-4">
                                                <input id="category_image" name="image" placeholder="category image" required="" class="form-control input-md" type="file">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-4 control-label"><% if(error!=null){ out.print(error); }%></label>                                            
                                        </div>
                                        <!-- Button -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for=""></label>
                                            <div class="col-md-4">
                                                <input type="hidden" name="command" value="insert">
                                                <input type="submit" id="submit" name="submit" class="btn btn-primary" value="Them moi">
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

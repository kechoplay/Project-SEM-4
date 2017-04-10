
<%@page import="Entity.UserEntity"%>
<%@page import="Entity.CategoryEntity"%>
<%@page import="Function.CategoryFunc"%>
<%@page import="Entity.ProductEntity"%>
<%@page import="Function.ProductFunc"%>
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

        <title>Quản lý sản phẩm</title>

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

        <script src="${root}/js/myjs.js"></script>
        <style>
            .filterable {
                margin-top: 15px;
            }
            .filterable .panel-heading .pull-right {
                margin-top: -20px;
            }
            .filterable .filters input[disabled] {
                background-color: transparent;
                border: none;
                cursor: auto;
                box-shadow: none;
                padding: 0;
                height: auto;
            }
            .filterable .filters input[disabled]::-webkit-input-placeholder {
                color: #333;
            }
            .filterable .filters input[disabled]::-moz-placeholder {
                color: #333;
            }
            .filterable .filters input[disabled]:-ms-input-placeholder {
                color: #333;
            }
        </style>

    </head>
    <body>
        <script>
            function question_delete() {
                if (window.confirm("Bạn có muốn xóa k?")) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
        <%
            ProductFunc prod = new ProductFunc();
            CategoryFunc cate = new CategoryFunc();
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
                                    Quản lý sản phẩm
                                </h1>
                                <ol class="breadcrumb">
                                    <li>
                                        <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                                    </li>
                                    <li class="active">
                                        <i class="fa fa-bar-chart-o"></i> Quản lý sản phẩm
                                    </li>
                                </ol>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-primary filterable">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Quản lý sản phẩm</h3>
                                        <div class="pull-right">
                                            <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                                        </div>
                                    </div>
                                    <table id="mytable" class="table">
                                        <thead>
                                            <tr class="filters">
                                                <th><input type="text" class="form-control" placeholder="Tên xe" disabled></th>
                                                <th><input type="text" class="form-control" placeholder="Hãng xe" disabled></th>
                                                <th><input type="text" class="form-control" placeholder="Giá" disabled></th>
                                                <th><input type="text" class="form-control" placeholder="Ảnh" disabled></th>
                                                <th><input type="text" class="form-control" placeholder="Giới thiệu" disabled></th>
                                                <th><input type="text" class="form-control" placeholder="Màu" disabled></th>
                                                <th><input type="text" class="form-control" placeholder="Năm sản xuất" disabled></th>
                                                <th text-align="center" width="5%">Edit</th>
                                                <th text-align="center" width="5%">Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            for (ProductEntity p : prod.getListProduct()) {
                                        %>
                                        <tr>

                                            <td><%=p.getPro_name()%></td>
                                            <td><%=p.getCat_name()%></td>
                                            <td><%=p.getPro_price()%></td>
                                            <td><img width="120px;" src="../ImageCar/<%=p.getPro_image()%>"</td>
                                            <td><%=p.getPro_descrip()%></td>
                                            <td><%=p.getPro_color()%></td>
                                            <td><%=p.getPro_yearsx()%></td>
                                            <td align="center"><a class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit<%=p.getPro_id()%>" ><span class="glyphicon glyphicon-pencil"></span></a></td>
                                            <td align="center"><a href="/java/productServlet?command=delete&product_id=<%=p.getPro_id()%>" onclick="return question_delete()" class="btn btn-danger btn-xs" data-title="Delete" ><span class="glyphicon glyphicon-trash"></span></a></td>             

                                    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" id="edit<%=p.getPro_id()%>">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                                    <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
                                                </div>
                                                <form method="POST" action="/java/productServlet" enctype="multipart/form-data">
                                                    <div class="modal-body">
                                                        <input class="form-control " name="proid" type="hidden" value="<%=p.getPro_id()%>">
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="category_name">PRODUCT NAME</label>
                                                            <input class="form-control " name="name" type="text" value="<%=p.getPro_name()%>">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="category_name">CATEGORY NAME</label>
                                                            <select class="form-control" name="catogory_name">
                                                                <option value="0">Hãy chọn hãng xe</option>
                                                                <%
                                                                    for (CategoryEntity c : cate.getListCategory()) {
                                                                %>
                                                                <option value="<%=c.getCategory_id()%>" <% if (c.getCategory_id() == p.getCat_id()) { %>selected="selected"<%}%>><%=c.getCategory_name()%></option>
                                                                <%
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="">PRODUCT PRICE</label>
                                                            <input class="form-control " name="price" type="text" value="<%=p.getPro_price()%>">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="">PRODUCT IMAGE</label>
                                                            <input class="form-control " name="catogery_imagehidden" type="hidden" value="<%=p.getPro_image()%>">
                                                            <input class="form-control " name="catogery_image" type="file">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-6 control-label" for="">PRODUCT DESCRIPTION</label>
                                                            <input class="form-control " name="description" type="text" value="<%=p.getPro_descrip()%>">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="">PRODUCT COLOR</label>
                                                            <input class="form-control " name="color" type="text" value="<%=p.getPro_color()%>">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label" for="">PRODUCT YEARS</label>
                                                            <input class="form-control " name="years" type="text" value="<%=p.getPro_yearsx()%>">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer ">
                                                        <input type="hidden" name="command" value="update">
                                                        <button type="submit" name="submit_update" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- /.modal-content --> 
                                        </div>
                                        <!-- /.modal-dialog --> 
                                    </div>

                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>
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

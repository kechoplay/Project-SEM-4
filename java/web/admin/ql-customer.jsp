<%-- 
    Document   : ql-category
    Created on : Feb 3, 2017, 9:56:37 AM
    Author     : TungVoDoi
--%>

<%@page import="Function.UserFunc"%>
<%@page import="Entity.UserEntity"%>
<%@page import="Entity.CategoryEntity"%>
<%@page import="java.util.ArrayList"%>
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

        <title>Quản lý khách hàng</title>

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
            function query_function() {
                if (window.confirm("Bạn có muốn xóa k?")) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
        <%
            UserFunc us = new UserFunc();
            ArrayList<UserEntity> list = us.getListUser();
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
                                    Quản lý khách hàng
                                </h1>
                                <ol class="breadcrumb">
                                    <li>
                                        <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                                    </li>
                                    <li class="active">
                                        <i class="fa fa-bar-chart-o"></i> Quản lý khách hàng
                                    </li>
                                </ol>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-primary filterable">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Quản lý khách hàng</h3>
                                        <div class="pull-right">
                                            <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
                                        </div>
                                    </div>
                                    <table id="mytable" class="table">
                                        <thead>
                                            <tr class="filters">
                                                <th><input type="text" class="form-control" placeholder="Username" disabled></th>
                                                <th><input type="text" class="form-control" placeholder="Fullname" disabled></th>
                                                <th><input type="text" class="form-control" placeholder="Email" disabled></th>
                                                <th><input type="text" class="form-control" placeholder="Address" disabled></th>
                                                <th><input type="text" class="form-control" placeholder="Mobile" disabled></th>
                                                <th><input type="text" class="form-control" placeholder="Level" disabled></th>
                                                <th text-align="center" width="5%">Edit</th>
                                                <th text-align="center" width="5%">Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%                                            
                                            for (UserEntity u : list) {                                            
                                        %>
                                        <tr>
                                            <td><%=u.getUsername()%></td>
                                            <td><%=u.getFullname()%></td>
                                            <td><%=u.getEmail()%></td>
                                            <td><%=u.getAddress()%></td>
                                            <td><%=u.getMobile()%></td>
                                            <td>
                                                <select name="level">
                                                    <% if (u.getLevel() == 1) { %>
                                                    <option value="1" selected="">Admin</option>
                                                    <option value="2">Khách hàng</option>
                                                    <%
                                                    } else {
                                                    %>
                                                    <option value="1">Admin</option>
                                                    <option value="2" selected="">Khách hàng</option>
                                                    <%
                                                        }
                                                    %>
                                                </select>
                                            </td>
                                            <td align="center"><a data-title="Edit" data-toggle="modal" data-target="#edit<%=u.getUserId()%>" class="btn btn-primary btn-xs" ><span class="glyphicon glyphicon-pencil"></span></a></td>
                                            <td align="center"><a href="/java/UserServlet?command=delete&cus_id=<%=u.getUserId()%>" class="btn btn-danger btn-xs" data-title="Delete" onclick="return query_function()" ><span class="glyphicon glyphicon-trash"></span></a></td>       

                                    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true" id="edit<%=u.getUserId()%>">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                                                    <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
                                                </div>
                                                <form method="POST" action="/java/UserServlet">
                                                    <div class="modal-body">
                                                        <div class="form-group">
                                                            <input class="form-control " name="userid" type="hidden" value="<%=u.getUserId()%>">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">USERNAME</label>
                                                            <input class="form-control " name="name" readonly type="text" value="<%=u.getUsername()%>">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">FULLNAME</label>
                                                            <input class="form-control " name="fullname" readonly type="text" value="<%=u.getFullname()%>">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">EMAIL</label>
                                                            <input class="form-control " name="email" readonly type="text" value="<%=u.getEmail()%>">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">ADDRESS</label>
                                                            <input class="form-control " name="address" readonly type="text" value="<%=u.getAddress()%>">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">MOBILE</label>
                                                            <input class="form-control " name="mobile" readonly type="text" value="<%=u.getMobile()%>">
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">LEVEL</label>
                                                            <select name="level" class="form-control" readonly>
                                                                <% if (u.getLevel() == 1) { %>
                                                                <option value="1" selected="">Admin</option>
                                                                <option value="2">Khách hàng</option>
                                                                <%
                                                                } else {
                                                                %>
                                                                <option value="1">Admin</option>
                                                                <option value="2" selected="">Khách hàng</option>
                                                                <%
                                                                    }
                                                                %>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <!-- /.modal-content --> 
                                        </div>
                                        <!-- /.modal-dialog --> 
                                    </div>
                                    </tr>
                                    <%}%>
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

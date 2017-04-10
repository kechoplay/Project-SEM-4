<%-- 
    Document   : index
    Created on : Feb 2, 2017, 10:21:01 PM
    Author     : TungVoDoi
--%>

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

        <title>SB Admin - Bootstrap Admin Template</title>

        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <!-- Bootstrap Core CSS -->
        <link href="${root}/css/bootstrap.min.css" rel='stylesheet' type='text/css' />

        <!-- Custom CSS -->
        <link href="${root}/css/sb-admin.css" rel='stylesheet' type='text/css' />

        <!-- Morris Charts CSS -->
        <link href="${root}/css/plugins/morris.css" rel='stylesheet' type='text/css' />

        <!-- Custom Fonts -->
        <link href="${root}/font-awesome-4.7.0/css/font-awesome.min.css" rel='stylesheet' type='text/css' />
    </head>
    <body>
        <%
            UserEntity users = null;
            if (session.getAttribute("user") != null) {
                users = (UserEntity) session.getAttribute("user");
            }
            if ((users != null) && (users.getLevel() == 1)) {
        %>
        <div id="wrapper">

            <jsp:include page="header.jsp"></jsp:include>

            <jsp:include page="wrapper.jsp"></jsp:include>

            </div>

            <script src="${root}/js/jquery-3.1.0.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${root}/js/bootstrap.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="${root}/js/plugins/morris/raphael.min.js"></script>
        <script src="${root}/js/plugins/morris/morris.min.js"></script>
        <script src="${root}/js/plugins/morris/morris-data.js"></script>
        <%        
            } else {
                response.sendRedirect("/java/404.jsp");
            }
        %>
    </body>
</html>

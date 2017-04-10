
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Đăng nhập</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#email_dangki").keyup(function (e) {
                    clearTimeout(x_timer);
                    var email = $(this).val();
                    x_timer = setTimeout(function () {
                        check_email_ajax(email);
                    }, 1000);
                });
                function check_email_ajax(email) {
                    $("#user-result").html('<img src="images/ajax-loader.gif" />');
                    $.post('CheckEmailServlet', {'username': email}, function (data) {
                        $("#user-result").html(data);
                    });
                }

                $("#user_dangki").keyup(function (e) {
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_username_ajax(user_name);
                    }, 1000);
                });
                function check_username_ajax(username) {
                    $("#user-ckeck").html('<img src="images/ajax-loader.gif" />');
                    $.post('CheckUsernamelServlet', {'username': username}, function (data) {
                        $("#user-ckeck").html(data);
                    });
                }
            });
            function ckeckemail() {
                var email = document.getElementById('email_dangki');
                var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                if (!filter.test(email.value)) {
                    alert('Hay nhap dia chi email hop le.\nExample@gmail.com');
                    email.focus();
                    return false;
                } else {
                    return true;
                }
            }
            function checkValidate() {
                var email = document.forms["register"]["email_dangki"];
                var pass = document.forms["register"]["pass_dangki"];
                var repass = document.forms["register"]["repass_dangki"];
                var mobile = document.forms["register"]["mobile_dangki"];
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
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
        %>
        <div class="container">    
            <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
                <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign In</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                        <form id="loginform" class="form-horizontal" action="/java/UserServlet" role="form" method="POST">

                            
                            <div>
                                <p style="color:red"><%=error%></p>
                            </div> 
                            

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="login-username" type="text" class="form-control" name='user_dangnhap' required="required" placeholder="username or email"/>                                        
                            </div>

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input id="login-password" type="password" class="form-control" name='pass_dangnhap' required="required" placeholder="password"/>
                            </div>


                            <div style="margin-top:10px" class="form-group">
                                <!-- Button -->

                                <div class="col-sm-12 controls">
                                    <input type="hidden" value="dangnhap" name="command">
                                    <input type="submit" name="submit_dangnhap" id="btn-login" class="btn btn-success" value="Login"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-md-12 control">
                                    <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                        Don't have an account! 
                                        <a href="#" onClick="$('#loginbox').hide();
                                                $('#signupbox').show()">
                                            Sign Up Here
                                        </a>
                                    </div>
                                </div>
                            </div>    
                        </form>     
                    </div>                     
                </div>  
            </div>
            <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Sign Up</div>
                        <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
                    </div>  
                    <div class="panel-body" >
                        <form id="signupform" class="form-horizontal" role="form" method="POST" action="/java/UserServlet" name="register" onsubmit="return checkValidate()">

                            <div id="signupalert" style="display:none" class="alert alert-danger">
                                <p>Error:</p>
                                <span></span>
                            </div>

                            <div class="form-group">
                                <label for="user_dangki" class="col-md-3 control-label">Tên đăng nhập</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="user_dangki" id="user_dangki" placeholder="Tên đăng nhập" required="required">
                                    <span id="user-ckeck"></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="pass_dangki" class="col-md-3 control-label">Mật khẩu</label>
                                <div class="col-md-9">
                                    <input type="password" class="form-control" name="pass_dangki" id="pass_dangki" placeholder="Mật khẩu" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="repass_dangki" class="col-md-3 control-label">Nhập lại mật khẩu</label>
                                <div class="col-md-9">
                                    <input type="password" class="form-control" name="repass_dangki" id="repass_dangki" placeholder="Nhập lại mật khẩu" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="fullname_dangki" class="col-md-3 control-label">Họ và tên</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="fullname_dangki" id="fullname_dangki" placeholder="Họ và tên" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="email_dangki" class="col-md-3 control-label">Email</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="email_dangki" id="email_dangki" placeholder="Email" required="required">
                                    <span id="user-result"></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mobile_dangki" class="col-md-3 control-label">Mobile</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="mobile_dangki" id="mobile_dangki" placeholder="Mobile" required="required">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address_dangki" class="col-md-3 control-label">Địa chỉ</label>
                                <div class="col-md-9">
                                    <input type="text" class="form-control" name="address_dangki" id="address_dangki" placeholder="Địa chỉ" >
                                </div>
                            </div>
                            <div class="form-group">
                                <!-- Button -->     
                                <div class="col-md-offset-3 col-md-9">
                                    <input type="hidden" value="dangki" name="command"/>
                                    <input id="btn-signup" type="submit" class="btn btn-info" name="submit_dangki" onclick="return ckeckemail();" value="Sign Up" />  
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div> 
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>

<meta charset="UTF-8" />
<title>BCORE Admin Dashboard Template | Login Page</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<!-- GLOBAL STYLES -->
<!-- PAGE LEVEL STYLES -->

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/bootstrap/css/bootstrap.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/login.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/magic/magic.css" />" />

<!-- END PAGE LEVEL STYLES -->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<!-- PAGE CONTENT -->
	<div class="container">
	  <div class="text-center">
                <img src="assets/img/logo.png" id="logoimg" alt=" Logo" />
            </div>
            <div class="tab-content">
                <div id="login" class="tab-pane active">
                    <form action="mainmenu/dashboard_admin/1" class="form-signin">
                        <p class="text-muted text-center btn-block btn btn-primary btn-rect">
                            Login 
                        </p>
                        
                        <div class="form-group">
                            <input type="text" placeholder="Username" class="form-control" />
                        </div>
                        
                        <div class="form-group">
                            <input type="password" placeholder="Password" class="form-control" />
                        </div>
                       
                       
                        <button class="text-muted text-center btn-block btn btn-primary btn-rect" type="submit">Sign in</button>
                        
                    </form>
                </div>

                <div id="forgot" class="tab-pane">
                    <form action="index.html" class="form-signin">
                        <p class="text-muted text-center btn-block btn btn-primary btn-rect">Enter your valid e-mail</p>
                        <input type="email"  required="required" placeholder="Your E-mail"  class="form-control" />
                        <br />
                        <button class="btn text-muted text-center btn-success" type="submit">Recover Password</button>
                    </form>
                </div>
            </div>

            <div class="text-center">
                <ul class="list-inline">
                    <li><a class="text-muted" href="#login" data-toggle="tab">Login</a></li>
                    <li><a class="text-muted" href="#forgot" data-toggle="tab">Forgot Password</a></li>
                </ul>
            </div>

	</div>

	<!--END PAGE CONTENT -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="<c:url value="/resources/plugins/jquery-2.1.4.min.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.js" />"></script>
	<script src="<c:url value="/resources/js/login.js" />"></script>

	<!--END PAGE LEVEL SCRIPTS -->
</body>
</html>

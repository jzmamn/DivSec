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

<link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap/css/bootstrap.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/login.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/plugins/magic/magic.css" />" />

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
			<div id="login" class="form-signin">

					<div>
						<a href="<c:url value="/admin" />">Admin</a>
					</div>
					<div>
						<a href="<c:url value="/hod" />">Head Of Division</a>
					</div>
					<div>
						<a href="<c:url value="/staff" />">Staff</a>
					</div>


					<c:if test="${param.error != null}">
						<div class="alert alert-danger">
							<p>Invalid username and password.</p>
						</div>
					</c:if>
					
					<c:if test="${param.logout != null}">
						<div class="alert alert-success">
							<p>You have been logged out successfully.</p>
						</div>
					</c:if>
					
			</div>
		</div>
	</div>

	<!--END PAGE CONTENT -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="<c:url value="/resources/plugins/jquery-2.1.4.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.js" />"></script>
	<script src="<c:url value="/resources/js/login.js" />"></script>
	

	<!--END PAGE LEVEL SCRIPTS -->
</body>
</html>

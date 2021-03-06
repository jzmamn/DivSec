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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Font-Awesome/css/font-awesome.css" />

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
		<div class="col-lg-12">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="panel panel-primary">

					<div class="panel-heading">
						<i class="icon-user"></i> Select Your Role
					</div>

					<div class="text-center">
						<img src="assets/img/logo.png" id="logoimg" alt=" Logo" />
					</div>
					<div class="tab-content">
						<div id="login" class="form-signin">

							<div class="row">
								<div class="col-lg-12">
									<div>
										<c:if test="${param.logout != null}">
											<h5 class="alert alert-success">You have been logged out.</h5>
										</c:if>
									</div>
									<div>
										<a class="btn btn-danger btn-block" href="<c:url value="/admin" />">Admin</a>
									</div>
									<hr />
									<div>
										<a class="btn btn-warning btn-block" href="<c:url value="/hod" />">Head Of Division</a>
									</div>
									<hr />
									<div>
										<a class="btn btn-success btn-block" href="<c:url value="/staff" />">Staff</a>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-12">
									<c:if test="${param.error != null}">
										<h5 class="alert alert-danger">Invalid username and password.</h5>
									</c:if>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4"></div>
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

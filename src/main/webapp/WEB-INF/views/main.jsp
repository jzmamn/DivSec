<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>BCORE Admin Dashboard Template | Dashboard</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <![endif]-->
<!-- GLOBAL STYLES -->

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/bootstrap/css/bootstrap.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/main.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/theme.css" />" />

<link rel="stylesheet"
	href="<c:url value="/resources/css/MoneAdmin.css" />" />

<link rel="stylesheet"
	href="<c:url value="/resources/plugins/Font-Awesome/css/font-awesome.css" />" />


<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->
<link rel="stylesheet"
	href="<c:url value="/resources/css/layout2.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/flot/examples/examples.css" />" />
<link rel="stylesheet"
	href="<c:url value="/resources/plugins/flot/examples/examples.css" />" />


<!-- END PAGE LEVEL  STYLES -->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="padTop53 ">


	<!-- MAIN WRAPPER -->
	<div id="wrap">
		<!-- HEADER SECTION -->
		<div id="top">

			<nav class="navbar navbar-inverse navbar-fixed-top "
				style="padding-top: 10px;">
				<a data-original-title="Show/Hide Menu" data-placement="bottom"
					data-tooltip="tooltip"
					class="accordion-toggle btn btn-primary btn-sm visible-xs"
					data-toggle="collapse" href="#menu" id="menu-toggle"> <i
					class="icon-align-justify"></i>
				</a>
				<!-- LOGO SECTION -->
				<header class="navbar-header">

					<a href="index.html" class="navbar-brand"> <img
						src="assets/img/logo.png" alt="" />

					</a>
				</header>
				<!-- END LOGO SECTION -->
				<ul class="nav navbar-top-links navbar-right">

					<!-- MESSAGES SECTION -->
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="label label-success">2</span> <i class="icon-envelope-alt"></i>&nbsp;
							<i class="icon-chevron-down"></i>
					</a>

						<ul class="dropdown-menu dropdown-messages">
							<li><a href="#">
									<div>
										<strong>John Smith</strong> <span
											class="pull-right text-muted"> <em>Today</em>
										</span>
									</div>
									<div>
										Lorem ipsum dolor sit amet, consectetur adipiscing. <br /> <span
											class="label label-primary">Important</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
									<div>
										<strong>Raphel Jonson</strong> <span
											class="pull-right text-muted"> <em>Yesterday</em>
										</span>
									</div>
									<div>
										Lorem ipsum dolor sit amet, consectetur adipiscing. <br /> <span
											class="label label-success"> Moderate </span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
									<div>
										<strong>Chi Ley Suk</strong> <span
											class="pull-right text-muted"> <em>26 Jan 2014</em>
										</span>
									</div>
									<div>
										Lorem ipsum dolor sit amet, consectetur adipiscing. <br /> <span
											class="label label-danger"> Low </span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a class="text-center" href="#"> <strong>Read
										All Messages</strong> <i class="icon-angle-right"></i>
							</a></li>
						</ul></li>
					<!--END MESSAGES SECTION -->

					<!--TASK SECTION -->
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="label label-danger">5</span> <i class="icon-tasks"></i>&nbsp;
							<i class="icon-chevron-down"></i>
					</a>

						<ul class="dropdown-menu dropdown-tasks">
							<li><a href="#">
									<div>
										<p>
											<strong> Profile </strong> <span
												class="pull-right text-muted">40% Complete</span>
										</p>
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-success"
												role="progressbar" aria-valuenow="40" aria-valuemin="0"
												aria-valuemax="100" style="width: 40%">
												<span class="sr-only">40% Complete (success)</span>
											</div>
										</div>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
									<div>
										<p>
											<strong> Pending Tasks </strong> <span
												class="pull-right text-muted">20% Complete</span>
										</p>
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-info"
												role="progressbar" aria-valuenow="20" aria-valuemin="0"
												aria-valuemax="100" style="width: 20%">
												<span class="sr-only">20% Complete</span>
											</div>
										</div>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
									<div>
										<p>
											<strong> Work Completed </strong> <span
												class="pull-right text-muted">60% Complete</span>
										</p>
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-warning"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: 60%">
												<span class="sr-only">60% Complete (warning)</span>
											</div>
										</div>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
									<div>
										<p>
											<strong> Summary </strong> <span
												class="pull-right text-muted">80% Complete</span>
										</p>
										<div class="progress progress-striped active">
											<div class="progress-bar progress-bar-danger"
												role="progressbar" aria-valuenow="80" aria-valuemin="0"
												aria-valuemax="100" style="width: 80%">
												<span class="sr-only">80% Complete (danger)</span>
											</div>
										</div>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a class="text-center" href="#"> <strong>See
										All Tasks</strong> <i class="icon-angle-right"></i>
							</a></li>
						</ul></li>
					<!--END TASK SECTION -->

					<!--ALERTS SECTION -->
					<li class="chat-panel dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="label label-info">8</span> <i class="icon-comments"></i>&nbsp;
							<i class="icon-chevron-down"></i>
					</a>

						<ul class="dropdown-menu dropdown-alerts">

							<li><a href="#">
									<div>
										<i class="icon-comment"></i> New Comment <span
											class="pull-right text-muted small"> 4 minutes ago</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
									<div>
										<i class="icon-twitter info"></i> 3 New Follower <span
											class="pull-right text-muted small"> 9 minutes ago</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
									<div>
										<i class="icon-envelope"></i> Message Sent <span
											class="pull-right text-muted small"> 20 minutes ago</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
									<div>
										<i class="icon-tasks"></i> New Task <span
											class="pull-right text-muted small"> 1 Hour ago</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">
									<div>
										<i class="icon-upload"></i> Server Rebooted <span
											class="pull-right text-muted small"> 2 Hour ago</span>
									</div>
							</a></li>
							<li class="divider"></li>
							<li><a class="text-center" href="#"> <strong>See
										All Alerts</strong> <i class="icon-angle-right"></i>
							</a></li>
						</ul></li>
					<!-- END ALERTS SECTION -->

					<!--ADMIN SETTINGS SECTIONS -->

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <i class="icon-user "></i>&nbsp;
							<i class="icon-chevron-down "></i>
					</a>

						<ul class="dropdown-menu dropdown-user">
							<li><a href="#"><i class="icon-user"></i> User Profile </a>
							</li>
							<li><a href="#"><i class="icon-gear"></i> Settings </a></li>
							<li class="divider"></li>
							<li><a href="login.html"><i class="icon-signout"></i>
									Logout </a></li>
						</ul></li>
					<!--END ADMIN SETTINGS -->
				</ul>

			</nav>

		</div>
		<!-- END HEADER SECTION -->

		<!-- MENU SECTION -->
		<div id="left">
			<div class="media user-media well-small">
				<a class="user-link" href="#"> <img
					class="media-object img-thumbnail user-img" alt="User Picture"
					src="assets/img/user.gif" />
				</a> <br />
				<div class="media-body">
					<h5 class="media-heading">Joe Romlin</h5>
					<ul class="list-unstyled user-info">
						<li><a class="btn btn-success btn-xs btn-circle"
							style="width: 10px; height: 12px;"></a> Online</li>
					</ul>
				</div>
				<br />
			</div>
			<ul id="menu" class="collapse">
				<!-- Dashboard -->
				<li class="panel active"><a href="index.html" id="index"> <i
						class="icon-table"></i> Dashboard
				</a></li>
				<!-- Quick View -->
				<li class="panel "><a href="#" data-parent="#menu"
					data-toggle="collapse" class="accordion-toggle"
					data-target="#component-nav"> <i class="icon-tasks"> </i> Quick
						View <span class="pull-right"> <i class="icon-angle-left"></i>
					</span> &nbsp; <span class="label label-default">10</span>&nbsp;
				</a>
					<ul class="collapse" id="component-nav">

						<li class=""><div id="button-page">
								<a href="#"><i class="icon-angle-right"></i> New Request </a>
							</div></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Opened Request </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								To Be Approved </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Open Request </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Pending Request </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Completed Request </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Closed Request </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Request Chain </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Instructions </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Request Trail </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Email History </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								SMS History </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Login History </a></li>

					</ul></li>
				<!-- Process -->
				<li class="panel "><a href="#" data-parent="#menu"
					data-toggle="collapse" class="accordion-toggle collapsed"
					data-target="#form-nav"> <i class="icon-pencil"></i> Process <span
						class="pull-right"> <i class="icon-angle-left"></i>
					</span> &nbsp; <span class="label label-success">5</span>&nbsp;
				</a>
					<ul class="collapse" id="form-nav">
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Public Details </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Request </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Request Processing </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>
								Email to Client </a></li>
						<li class=""><a href="#"><i class="icon-angle-right"></i>SMS
								to Client </a></li>
					</ul></li>
				<!-- Charts -->
				<li class="panel"><a href="#" data-parent="#menu"
					data-toggle="collapse" class="accordion-toggle"
					data-target="#pagesr-nav"> <i class="icon-table"></i> Setup <span
						class="pull-right"> <i class="icon-angle-left"></i>
					</span> &nbsp; <span class="label label-info">6</span>&nbsp;
				</a>
					<ul class="collapse" id="pagesr-nav">
						<li><a href="#"><i class="icon-angle-right" hidden></i>
								Preferences </a></li>
						<li><a href="#"><i class="icon-angle-right"></i> Division
						</a></li>
						<li><a href="#"><i class="icon-angle-right"></i> Subject
						</a></li>
						<li><a href="#"><i class="icon-angle-right"></i> Subject
								Stages </a></li>
						<li><a href="#"><i class="icon-angle-right"></i> Request
								Status </a></li>
						<li><a href="#"><i class="icon-angle-right"></i> Stage
								Status </a></li>
						<li><a href="#"><i class="icon-angle-right"></i> Email </a></li>
						<li><a href="pages_uc.html"><i class="icon-angle-right"></i>
								SMS </a></li>
					</ul></li>
			</ul>

		</div>
		<!--END MENU SECTION -->

		<!--PAGE CONTENT -->
		<div id="page-content"></div>
		<!--END PAGE CONTENT -->


	</div>
	<!--END MAIN WRAPPER -->



	<!-- FOOTER -->
	<div id="footer">
		<p>&copy; binarytheme &nbsp;2014 &nbsp;</p>
	</div>
	<!--END FOOTER -->


	<!-- GLOBAL SCRIPTS -->

	<script src="<c:url value="/resources/plugins/jquery-2.0.3.min.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>


	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->

	<script src="<c:url value="/resources/plugins/flot/jquery.flot.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/flot/jquery.flot.resize.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/flot/jquery.flot.time.js" />"></script>
	<script src="<c:url value="/resources/plugins/jquery-2.0.3.min.js" />"></script>
	<script
		src="<c:url value="/resources/plugins/flot/jquery.flot.stack.js" />"></script>
	<script src="<c:url value="/resources/js/for_index.js" />"></script>

	<script src="<c:url value="/resources/app/main-menu.js" />"></script>
	<script src="<c:url value="/resources/app/dashboard.js" />"></script>

	<!-- END PAGE LEVEL SCRIPTS -->


</body>
</html>
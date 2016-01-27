<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
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

<link rel="stylesheet" href="<c:url value="/resources/plugins/bootstrap/css/bootstrap.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/main.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/theme.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/css/MoneAdmin.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/plugins/Font-Awesome/css/font-awesome.css" />" />

<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->
<link rel="stylesheet" href="<c:url value="/resources/css/layout2.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/plugins/morris/morris-0.4.3.min.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/plugins/datepicker/css/bootstrap-datepicker.css" />" />



<!-- END PAGE LEVEL  STYLES -->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->
<body class="padTop53 ">

	<!-- MAIN WRAPPER -->
	<div id="wrap">


		<!-- HEADER SECTION -->
		<jsp:include page="include/include_header.jsp" />
		<!-- END HEADER SECTION -->

		<!-- MENU SECTION -->
		<jsp:include page="include/include_menu.jsp" />
		<!--END MENU SECTION -->

		<!--PAGE CONTENT -->
		<div id="content">

			<div class="inner" style="min-height: 700px;">
				<div class="row">
					<div class="col-lg-12">
						<h3>Admin Dashboard</h3>
					</div>
				</div>

				<hr />


				<!-- CALENDER +  WIDGETS  SECTION   -->
				<jsp:include page="include/include_user_setting.jsp" />
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-8">
							<div class="row">
								<div class="col-lg-12">
									<div style="text-align: center;">
										<a class="quick-btn" href="#"> <i class="icon-check icon-2x"></i> <span>For Approval</span> <span class="label label-danger">2</span>
										</a> <a class="quick-btn" href="#"> <i class="icon-envelope-alt icon-2x"></i> <span>New</span> <span class="label label-danger">2</span>
										</a> <a class="quick-btn" href="#"> <i class="icon-folder-open-alt icon-2x"></i> <span>Opened</span> <span
											class="label label-success">456</span>
										</a>
									</div>
								</div>
								<hr />
								<div class="row">
									<div class="col-lg-12">
										<div class="col-lg-4 col-md-4 panel panel-warning" style="width: 130px;">
											<a href="#" class="btn btn-warning btn-xs btn-block">Admin</a>
											<div id="morris-donut-chart1" style="width: 120px; height: 120px;"></div>
										</div>

										<div class="col-lg-4 col-md-4 panel panel-warning" style="width: 130px;">
											<a href="#" class="btn btn-info btn-xs btn-block">Accounts</a>
											<div id="morris-donut-chart2" style="width: 120px; height: 120px;"></div>
										</div>

										<div class="col-lg-4 col-md-4 panel panel-warning" style="width: 130px;">
											<a href="#" class="btn btn-success btn-xs btn-block">Planning</a>
											<div id="morris-donut-chart3" style="width: 120px; height: 120px;"></div>
										</div>

										<div class="col-lg-4 col-md-4 panel panel-warning" style="width: 130px;">
											<a href="#" class="btn btn-danger btn-xs btn-block">Registrar</a>
											<div id="morris-donut-chart4" style="width: 120px; height: 120px;"></div>
										</div>

									</div>
								</div>
							</div>
						</div>
						<!--REQUEST BLOCK SECTION -->
						<div class="col-lg-4">
							<div style="width: 220px;" class="panel panel-primary" id="date1"></div>
						</div>
					</div>
				</div>

				<!-- CALENDER +  WIDGETS  SECTION   -->

				<hr />

				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="col-lg-4 col-md-4 panel panel-warning" style="width: 130px;">
							<a href="#" class="btn btn-primary btn-xs btn-block">Samurdhi</a>
							<div id="morris-donut-chart5" style="width: 120px; height: 120px;"></div>
						</div>

						<div class="col-lg-4 col-md-4 panel panel-warning" style="width: 130px;">
							<a href="#" class="btn btn-warning btn-xs btn-block"> Social Welfare</a>
							<div id="morris-donut-chart6" style="width: 120px; height: 120px;"></div>
						</div>

						<div class="col-lg-4 col-md-4 panel panel-warning" style="width: 130px;">
							<a href="#" class="btn btn-success btn-xs btn-block"> Agriculture</a>
							<div id="morris-donut-chart7" style="width: 120px; height: 120px;"></div>
						</div>

						<div class="col-lg-4 col-md-4 panel panel-warning" style="width: 130px;">
							<a href="#" class="btn btn-info btn-xs btn-block"> Social Welfare</a>
							<div id="morris-donut-chart8" style="width: 120px; height: 120px;"></div>
						</div>

						<div class="col-lg-4 col-md-4 panel panel-warning" style="width: 130px;">
							<a href="#" class="btn btn-danger btn-xs btn-block"> Social Welfare</a>
							<div id="morris-donut-chart9" style="width: 120px; height: 120px;"></div>
						</div>
						<!--END DIVISION DONUT BLOCK SECTION -->
					</div>

				</div>

				<hr />

				<!--START AGING BY MONTH BLOCK SECTION -->
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-6">
							<div class="panel  panel-info">
								<div class="panel-heading">
									<strong> Request Summary </strong> - <em class="text-muted">(by Month)</em> <span class="pull-right"><small> <input
											id="dpYear" class="form-control datepicker dpYear" style="width: 60px; height: 20px;">
									</small></span>
								</div>
								<div class="panel-body">
									<div class="table-responsive">
										<div style="height: 170px; overflow: scroll;">
											<table id="tblSummaryByMonth" class="table table-striped table-bordered table-hover table-condensed">
												<thead class="alert alert-success">
													<tr>
														<th>Month</th>
														<th>New</th>
														<th>Opened</th>
														<th>Completed</th>
														<th>Closed</th>
													</tr>
												</thead>
												<tbody>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="panel panel-info">
								<div class="panel-heading">
									<strong> Request Summary </strong> - <em class="text-muted">(by Year)</em><!--  <span class="pull-right"><small> <input
											id="dpYear1" class="form-control  datepicker dpYear" style="width: 60px; height: 20px;">
									</small></span> -->

								</div>
								<div class="panel-body">
									<div class="table-responsive">
										<div style="height: 170px; overflow: scroll;">
											<table id="tblByAnnual" class="table table-striped table-bordered table-hover table-condensed">
												<thead class="alert alert-success">
													<tr>
														<th>Year</th>
														<th>New</th>
														<th>Opened</th>
														<th>Completed</th>
														<th>Closed</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<hr />
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-6">
							<div class="panel  panel-info">
								<div class="panel-heading">
									<strong> Request Summary </strong> - <em class="text-muted">(By Division)</em>
									<!-- <span class="pull-right"><small> <input
											id="dpYear3" class="form-control  datepicker dpYear" style="width: 60px; height: 20px;">
									</small></span> -->
								</div>
								<div class="panel-body">
									<div class="table-responsive">
										<div style="height: 170px; overflow: scroll;">
											<table id="tblDivisionSummary" class="table table-striped table-bordered table-hover table-condensed">
												<thead class="alert alert-success">
													<tr>
														<th>Divsn</th>
														<th>New</th>
														<th>Opnd</th>
														<th>Compltd</th>
														<th>Closed</th>
													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-6">
							<div class="panel  panel-info">
								<div class="panel-heading">
									<strong>Last Modified </strong> - <em class="text-muted">(last 25)</em>
									<!-- <span class="pull-right"><small> <input
											id="dpYear2" class="form-control  datepicker dpYear" style="width: 60px; height: 20px;">
									</small></span> -->
								</div>
								<div class="panel-body">
									<div class="table-responsive">
										<div style="height: 170px; overflow: scroll;">
											<table id="tblLastModified" class="table table-striped table-bordered table-hover table-condensed">
												<thead class="alert alert-success">
													<tr>
														<th>Req Id</th>
														<th>Entered</th>
														<th>Modified</th>
														<th>Staff</th>

													</tr>
												</thead>
												<tbody>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>



					</div>
				</div>
				<!-- END START AGING BY MONTH BLOCK SECTION -->
				<hr />

				<!--START AGING BY LAST 6 MONTH BLOCK SECTION -->
				<div class="row">
					<div class="col-lg-12 col-sm-12">
						<div class="panel panel-default panel-success">
							<div class="panel-heading">
								<strong>Analysis</strong> - <em>Year</em> <span class="pull-right"><small> <input id="dpYearBar"
										class="form-control  datepicker dpYear" style="width: 60px; height: 20px;">
								</small></span>

							</div>
							<div class="panel-body">
								<div id="barChartContent" class="table-responsive">
									<div id="morris-bar-chart"></div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- END AGING BY LAST 6 MONTH BLOCK SECTION -->
				<hr />

			</div>

		</div>
		<!--END PAGE CONTENT -->

		<!-- RIGHT STRIP  SECTION -->

		<div id="right">
			<div class="well well-small">
				<label> Logged In </label>
				<ul class="list-unstyled">
					<li>Aymen</li>
					<li>Users &nbsp; - <span>Accounts</span></li>
					<li>Registrations</li>
					<li>Aymen</li>
					<li>Users &nbsp; - <span>Accounts</span></li>
					<li>Registrations</li>
					<li>Aymen</li>
					<li>Users &nbsp; - <span>Accounts</span></li>
					<li>Registrations</li>
				</ul>
			</div>

			<div class="well well-small">
				<span>Total Request</span><span class="pull-right"><small>20%</small></span>

				<div class="progress mini">
					<div class="progress-bar progress-bar-info" style="width: 20%"></div>
				</div>
				<span>Completed</span><span class="pull-right"><small>40%</small></span>

				<div class="progress mini">
					<div class="progress-bar progress-bar-success" style="width: 40%"></div>
				</div>
				<span>Pending</span><span class="pull-right"><small>60%</small></span>

				<div class="progress mini">
					<div class="progress-bar progress-bar-warning" style="width: 60%"></div>
				</div>
				<span>Closed</span><span class="pull-right"><small>80%</small></span>

				<div class="progress mini">
					<div class="progress-bar progress-bar-danger" style="width: 80%"></div>
				</div>
			</div>

			<div class="well well-small">
				<button class="btn btn-warning btn-block">Send Instructions</button>
				<button class="btn btn-primary btn-block">Find public</button>
				<button class="btn btn-info btn-block">Find Request</button>
			</div>


		</div>
		<!-- END RIGHT STRIP  SECTION -->
	</div>




	<!--END MAIN WRAPPER -->

	<!-- FOOTER -->
	<jsp:include page="include/include_footer.jsp" />
	<!--END FOOTER -->


	<!-- GLOBAL SCRIPTS -->

	<script src="<c:url value="/resources/plugins/jquery-2.1.4.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/bootstrap/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/plugins/modernizr-2.6.2-respond-1.1.0.min.js" />"></script>

	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->

	<script src="<c:url value="/resources/plugins/morris/raphael-2.1.0.min.js"/>"></script>
	<script src="<c:url value="/resources/plugins/morris/morris.js"/>"></script>
	<script src="<c:url value="/resources/plugins/morris/morris-demo.js"/>"></script>
	<script src="<c:url value="/resources/plugins/datepicker/js/bootstrap-datepicker.js"/>"></script>
	<script src="<c:url value="/resources/plugins/fullcalendar-1.6.2/fullcalendar/fullcalendar.min.js"/>"></script>
	<script src="<c:url value="/resources/js/calendarInit.js"/>"></script>
	<script src="<c:url value="/resources/js/divsec_login.js" />"></script>
	<script src="<c:url value="/resources/js/divsec_dashboard.js" />"></script>


	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}"
		var userName = "${userName}";
		var role = "${role}"
		var stfId = "${stfId}"
		var divId = "${stfDivId}"
		var divName = "${stfDivName}"

		$("#date1").datepicker({
			todayHighlight : true
		});

		$('#dpYear').datepicker({
			format : " yyyy",
			minViewMode : 2,
			autoclose : true
		});

		$('#dpYear1').datepicker({
			format : " yyyy",
			minViewMode : 2,
			autoclose : true
		});
		
		$('#dpYearBar').datepicker({
			format : "yyyy", 
			minViewMode : 2,
			autoclose : true
		});
	</script>


</body>

<!-- END BODY -->
</html>

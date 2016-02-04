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
						<h3 class="text-info">Dashboard Head Of Division :: ${stfDivName}</h3>
					</div>
				</div>

				<hr />
				<!-- CALENDER +  WIDGETS  SECTION   -->
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div style="text-align: center;">
							<a class="quick-btn" href="${pageContext.request.contextPath}/reqprocess"> <i class="icon-check icon-2x"></i> <span>For
									Approval</span> <span id="spnIdApproval" class="label label-danger"></span>
							</a> <a class="quick-btn" href="${pageContext.request.contextPath}/reqprocess"> <i class="icon-envelope-alt icon-2x"></i> <span>New</span>
								<span id="spnIdNew" class="label label-danger"></span>
							</a> <a class="quick-btn" href="${pageContext.request.contextPath}/reqprocess"> <i class="icon-folder-open-alt icon-2x"></i> <span>Opened</span>
								<span id="spnIdOpened" class="label label-success"></span>
							</a>
						</div>
					</div>
				</div>

				<hr />

				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-6">
							<div style="width: 220px;" class="panel panel-primary" id="date1"></div>
						</div>

						<div class="col-lg-6">
							<div id="morris-donut-chart1" style="width: 240px; height: 240px;"></div>
						</div>
					</div>
				</div>
				<!-- CALENDER +  WIDGETS  SECTION   -->
				<hr />
				<!--START AGING BY MONTH BLOCK SECTION -->
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-6">
							<div class="panel  panel-info">
								<div class="panel-heading">
									<strong>Analysis </strong> - <em class="text-muted">(by Month)</em> <span class="pull-right"><small> <input
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
							<div class="panel  panel-info">
								<div class="panel-heading">
									<strong>Analysis </strong> - <em class="text-muted">(by Annual)</em>
									<!-- <span class="pull-right"><small> <input
											id="dpYear1" class="datepicker dpYear" style="width: 60px; height: 20px;">
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

				<!--START AGING BY LAST 6 MONTH BLOCK SECTION -->
				<div class="row">
					<div class="col-lg-12 col-sm-12">
						<div class="panel panel-default panel-success">
							<div class="panel-heading">
								<strong>Analysis</strong> - <em>(this Year)</em> <span class="pull-right"><small> <input id="dpYearBar"
										class="form-control datepicker dpYear" style="width: 60px; height: 20px;">
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
	<script src="<c:url value="/resources/js/divsec_dashboard_hod.js" />"></script>

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
			format : " yyyy", // Notice the Extra space at the beginning
			minViewMode : 2,
			autoclose : true
		});

		$('#dpYear1').datepicker({
			format : " yyyy", // Notice the Extra space at the beginning
			minViewMode : 2,
			autoclose : true
		});

		$('#dpYearBar').datepicker({
			format : " yyyy", // Notice the Extra space at the beginning
			minViewMode : 2,
			autoclose : true
		});
	</script>


	<!-- END PAGE LEVEL SCRIPTS -->


</body>

<!-- END BODY -->
</html>

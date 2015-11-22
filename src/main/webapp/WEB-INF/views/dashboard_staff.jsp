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
<link rel="stylesheet" href="<c:url value="/resources/plugins/datepicker/css/datepicker.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/plugins/fullcalendar-1.6.2/fullcalendar/fullcalendar.css" />" />




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
						<h3>Dashboard - Staff</h3>
					</div>
				</div>

				<hr />

				<!-- WIDGETS  SECTION   -->

				<div class="row">
					<div class="col-lg-12">

						<!--REQUEST BLOCK SECTION -->

						<div class="col-lg-12">
							<!-- <p> <strong>My Task </strong> - <em class="text-muted">()</em></p>-->

							<div style="text-align: center;">

								<a class="quick-btn" href="#"> <i class="icon-envelope-alt icon-2x"></i> <span>New</span> <span class="label label-danger">2</span>
								</a> <a class="quick-btn" href="#"> <i class="icon-folder-open-alt icon-2x"></i> <span>Opened</span> <span
									class="label label-success">456</span>
								</a> <a class="quick-btn" href="#"> <i class="icon-question-sign icon-2x"></i> <span>Pending</span> <span class="label label-danger">2</span>
								</a> <a class="quick-btn" href="#"> <i class="icon-signal icon-2x"></i> <span>In-Progress</span> <span class="label label-success">456</span>
								</a> <a class="quick-btn" href="#"> <i class="icon-thumbs-up-alt icon-2x"></i> <span>Completed</span> <span
									class="label label-success">456</span>
								</a> <a class="quick-btn" href="#"> <i class="icon-hand-right icon-2x"></i> <span>Handed Over</span> <span
									class="label label-success">456</span>
								</a> <a class="quick-btn" href="#"> <i class="icon-thumbs-down-alt icon-2x"></i> <span>Closed</span> <span
									class="label label-success">456</span>
								</a>

							</div>

						</div>

						<!--END REQUEST BLOCK SECTION -->
					</div>
				</div>

				<hr />

				<!-- END WIDGETS  SECTION   -->


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

	<script type="text/javascript">
		$("#dtpTop").datepicker({});

		var date = new Date();
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();

		var calendar = $('#calendar').fullCalendar({
			selectable : true,
			selectHelper : true,
			select : function(start, end, allDay) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.fullCalendar('renderEvent', {
						title : title,
						start : start,
						end : end,
						allDay : allDay
					}, true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
			},
			editable : true,
		//                    events: [
		//                        {
		//                            title: 'All Day Event',
		//                            start: new Date(y, m, 1)
		//                        },
		//                        {
		//                            title: 'Long Event',
		//                            start: new Date(y, m, d - 5),
		//                            end: new Date(y, m, d - 2)
		//                        },
		//                        {
		//                            id: 999,
		//                            title: 'Repeating Event',
		//                            start: new Date(y, m, d - 3, 16, 0),
		//                            allDay: false
		//                        },
		//                        {
		//                            id: 999,
		//                            title: 'Repeating Event',
		//                            start: new Date(y, m, d + 4, 16, 0),
		//                            allDay: false
		//                        },
		//                        {
		//                            title: 'Meeting',
		//                            start: new Date(y, m, d, 10, 30),
		//                            allDay: false
		//                        },
		//                        {
		//                            title: 'Lunch',
		//                            start: new Date(y, m, d, 12, 0),
		//                            end: new Date(y, m, d, 14, 0),
		//                            allDay: false
		//                        },
		//                        {
		//                            title: 'Birthday Party',
		//                            start: new Date(y, m, d + 1, 19, 0),
		//                            end: new Date(y, m, d + 1, 22, 30),
		//                            allDay: false
		//                        },
		//                        {
		//                            title: 'Click for Google',
		//                            start: new Date(y, m, 28),
		//                            end: new Date(y, m, 29),
		//                            url: 'http://google.com/'
		//                        }
		//                    ]
		});
	</script>


	<!-- END PAGE LEVEL SCRIPTS -->


</body>

<!-- END BODY -->
</html>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DivSec | Subject</title>

<!--[if IE]>
           <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
           <![endif]-->
<!-- GLOBAL STYLES -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/theme.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/MoneAdmin.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/Font-Awesome/css/font-awesome.css" />
<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/validationengine/css/validationEngine.jquery.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/dataTables/dataTables.bootstrap.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/jquery-steps-master/demo/css/normalize.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/jquery-steps-master/demo/css/wizardMain.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/jquery-steps-master/demo/css/jquery.steps.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/datepicker/css/datepicker.css" />



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
		<jsp:include page="../include/include_header.jsp" />

		<!-- END HEADER SECTION -->

		<!-- MENU SECTION -->
		<jsp:include page="../include/include_menu.jsp" />
		<!--END MENU SECTION -->

		<!--PAGE CONTENT -->
		<div id="content">
			<div class="inner">
				<div class="row">
					<div class="col-lg-12">
						<h2>Manage Public Details</h2>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li><a href="#">Library</a></li>
							<li class="active">Data</li>
						</ol>
					</div>
				</div>


				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Vertical Wizard</div>
							<div class="panel-body">

								<form id="advanced-form" action="#">
									<h3>Personal Information</h3>
									<fieldset>
										
										<div class="form-group">
											<label for="userName-2" class="input-sm">Id</label>
											<div>
												<input type="email" id="email2" name="email2"
													class="form-control" placeholder="Id" disabled />
											</div>
										</div>

										<div class="form-group">
											<label for="userName-2" class="input-sm">Name With
												Initial </label>
											<div>
												<input type="email" id="email2" name="email2"
													class="form-control" placeholder="Enter Name With Initial" />
											</div>
										</div>

										<div class="form-group">
											<label for="userName-2" class="input-sm">NIC </label>

											<div>
												<input type="email" id="email2" name="email2"
													class="form-control"
													placeholder="Enter NIC or Driving License or Passport No" />
											</div>
										</div>

										<div class="form-group">
											<label for="userName-2" class="input-sm">Date of
												Birth </label>
											<div class="input-group date form_date"
												data-date="yyyy-mm-dd" data-date-format="yyyy-mm-dd"
												data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
												<input class="form-control datepicker " size="16"
													type="text" value="" readonly placeholder="YYYY-MM-DD">
												<span class="input-group-addon"> <span
													class="glyphicon glyphicon-calendar"></span>
												</span> <span> <input class="" type="hidden" id="dtp_input2"
													value="" /></span>
											</div>
										</div>

										<div class="form-group">
											<label for="userName-2" class="input-sm">Gender </label> <select
												class="form-control">
												<option>Male</option>
												<option>Female</option>
											</select>
										</div>

										<div class="form-group">
											<label for="userName-2" class="input-sm">Note</label>
											<div>
												<input type="email" id="email2" name="email2"
													class="form-control" />
											</div>
										</div>


										
										<!-- 
										<label for="userName-2">User name *</label>
								        <input id="userName-2" name="userName" type="text" class="required">
								        <label for="password-2">Password *</label>
								        <input id="password-2" name="password" type="text" class="required">
								        <label for="confirm-2">Confirm Password *</label>
								        <input id="confirm-2" name="confirm" type="text" class="required">
         								-->

									</fieldset>

									<h3>Profile</h3>
									<fieldset>
										<legend>Profile Information</legend>


										<!--  
										<label for="name-2">First name *</label> <input id="name-2"
											name="name" type="text" class="required"> <label
											for="surname-2">Last name *</label> <input id="surname-2"
											name="surname" type="text" class="required"> <label
											for="email-2">Email *</label> <input id="email-2"
											name="email" type="text" class="required email"> <label
											for="address-2">Address</label> <input id="address-2"
											name="address" type="text"> <label for="age-2">Age
											(The warning step will show up if age is less than 18) *</label> <input
											id="age-2" name="age" type="text" class="required number">
										<p>(*) Mandatory</p>
										
										-->
									</fieldset>

									<h3>Warning</h3>
									<fieldset>
										<legend>You are to young</legend>

										<p>Please go away ;-)</p>
									</fieldset>

									<h3>Finish</h3>
									<fieldset>
										<legend>Terms and Conditions</legend>

										<input id="acceptTerms-2" name="acceptTerms" type="checkbox"
											class="required"> <label for="acceptTerms-2">I
											agree with the Terms and Conditions.</label>
									</fieldset>
								</form>

							</div>
						</div>
					</div>
				</div>




				<!--Delete Modal -->
				<div class="col-lg-12">
					<div class="modal fade" id="deleteModal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="H1">Delete User</h4>
								</div>
								<div class="modal-body">Are you sure do you want to delete
									?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-danger">Yes</button>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal">No</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--End Delete Modal -->

			</div>
		</div>
		<!--END PAGE CONTENT -->

	</div>

	<!--END MAIN WRAPPER -->

	<!-- FOOTER -->
	<jsp:include page="../include/include_footer.jsp" />
	<!--END FOOTER -->


	<!-- GLOBAL SCRIPTS -->
	<script
		src="${pageContext.request.contextPath}/resources/plugins/jquery-2.0.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/dataTables/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/dataTables/dataTables.bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/validationengine/js/jquery.validationEngine.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/validationengine/js/languages/jquery.validationEngine-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/jquery-validation-1.11.1/dist/jquery.validate.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/validationInit.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/plugins/jquery-steps-master/lib/jquery.cookie-1.3.1.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/jquery-steps-master/build/jquery.steps.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/WizardInit.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/datepicker/js/bootstrap-datepicker.js"></script>

	<script type="text/javascript">
		
	</script>


	<script>
		$(document).ready(function() {
			$('.datepicker').datepicker();

			$('#dataTables-example').dataTable({
				"lengthMenu" : [ 5, 10, 20 ]
			});

		});
	</script>
	<script>
		$(function() {
			formValidation();
		});
	</script>
	<!-- END PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>



<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- BEGIN HEAD -->
<head>

<meta charset="UTF-8" />
<title>BCORE Admin Dashboard Template | Wizard</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!--[if IE]>
           <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
           <![endif]-->
<!-- GLOBAL STYLES -->
<!-- GLOBAL STYLES -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MoneAdmin.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Font-Awesome/css/font-awesome.css" />


<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->


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
						<h2>Manage Public Information</h2>
					</div>
				</div>

				<hr />
				
				<!-- Bread Crumb -->
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li><a href="#">Home</a></li>
							<li><a href="#">Library</a></li>
							<li class="active">Data</li>
						</ol>
					</div>
				</div>
				<!--End Bread Crumb -->
<hr />
				
				<div class="row">
					<div class="col-lg-12">
						<form>
							<div class="row">
								<div class="col-lg-12">
									<div class="col-lg-3">
										<div class="form-group">
											<input type="text" id="txtIdDivId" name="txtDivId" class="form-control" placeholder="Public id" readonly="" />
										</div>
									</div>

									<div class="col-lg-6">
										<div class="form-group ">
											<input type="text" id="txtIdDivId" name="txtDivId" class="form-control" placeholder="Public Name" />
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="col-lg-3">
										<div class="form-group">
											<input type="text" id="txtIdDivId" name="txtDivId" class="form-control" placeholder="NIC" />
										</div>
									</div>

									<div class="col-lg-3">
										<div class="form-group ">
											<input type="text" id="txtIdDivId" name="txtDivId" class="form-control" placeholder="DOB" />
										</div>
									</div>

									<div class="col-lg-3">
										<div class="form-group">
											<select class="form-control" id="idGender">
											</select>
											<div id="id"></div>
											<div id="name"></div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-12">
									<div class="col-lg-6">
										<div class="form-group ">
											<input type="text" id="txtIdDivId" name="txtDivId" class="form-control" placeholder="Note" />
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<select class="form-control" id="idNotification">
											</select>
											<div id="id"></div>
											<div id="name"></div>
										</div>
									</div>




								</div>
							</div>

							<div class="row">
								<div class="col-lg-12">
									<div class="col-lg-3">
										<div class="checkbox">
											<label> Is Active &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" value="" />
											</label>
										</div>
									</div>
								</div>
							</div>

							<hr />

							<div class="row">
								<div class="col-lg-12">
									<div class="col-lg-3">
										<div class="form-group">
											<input type="text" id="txtIdDivId" name="txtDivId" class="form-control" placeholder="Address1" />
										</div>
									</div>

									<div class="col-lg-3">
										<div class="form-group ">
											<input type="text" id="txtIdDivId" name="txtDivId" class="form-control" placeholder="Address2" />
										</div>
									</div>

									<div class="col-lg-3">
										<div class="form-group ">
											<input type="text" id="txtIdDivId" name="txtDivId" class="form-control" placeholder="Address3" />
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="col-lg-3">
										<div class="form-group">
											<input type="text" id="txtIdDivId" name="txtDivId" class="form-control" placeholder="Email" />
										</div>
									</div>

									<div class="col-lg-3">
										<div class="form-group ">
											<input type="text" id="txtIdDivId" name="txtDivId" class="form-control" placeholder="Land Phone" />
										</div>
									</div>

									<div class="col-lg-3">
										<div class="form-group ">
											<input type="text" id="txtIdDivId" name="txtDivId" class="form-control" placeholder="Mobile phone" />
										</div>
									</div>
								</div>
							</div>

							<hr />
							<div class="row">
								<div class="col-lg-12">

									<div class="col-lg-3">
										<button id="btnSave" class="btn btn-success btn-block">
											<i class="icon-save icon-white"></i> Save
										</button>
									</div>
									<div class="col-lg-3"></div>
									<div class="col-lg-3">
										<button id="btnClose" class="btn btn-block" data-dismiss="modal">
											<i class="icon- icon-white"></i> Close
										</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			
			</div>
		</div>
	</div>

	<!--END PAGE CONTENT -->




	<!--END MAIN WRAPPER -->


	<!-- FOOTER -->
	<jsp:include page="../include/include_footer.jsp" />
	<!--END FOOTER -->


	<!--END FOOTER -->
	<!-- GLOBAL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/plugins/jquery-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>

	<!-- END GLOBAL SCRIPTS -->
	<!-- PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/fnReloadAjax.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/divsec_public.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/validator/validator.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.js"></script>
	<!--END PAGE LEVEL SCRIPTS -->


</body>
<!-- END BODY -->
</html>

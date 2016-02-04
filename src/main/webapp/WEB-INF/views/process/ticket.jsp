<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DivSec | Division</title>


<!-- GLOBAL STYLES -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MoneAdmin.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Font-Awesome/css/font-awesome.css" />
<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/dataTables/css/dataTables.bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datepicker/css/bootstrap-datepicker.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/form-validator/theme-default.min.css" />


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
			<!-- Inner  -->
			<div class="inner">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="text-info">Manage Public Information</h3>
					</div>
				</div>
				<hr />

				<!-- Bread Crumb -->
				<div class="row">
					<div class="col-lg-12">
						<ol class="breadcrumb">
							<li><a href="${pageContext.request.contextPath}/getDashboard">Home</a></li>
							<li>Process</li>
							<li class="active">Ticket</li>
						</ol>
					</div>
				</div>
				<!--End Bread Crumb -->

				<!-- Alert -->
				<div class="row">
					<div class="col-lg-12" id="alert"></div>
				</div>
				<!--End Alert -->

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<div class="row">
									<div class="col-lg-12">
										<div class="col-lg-2">
											<button class="btn btn-primary btn-block" id="idBtnAddPublic">
												<i class="icon-plus icon-white"></i> Add Public
											</button>
										</div>

										<div class="col-lg-2">
											<button class="btn btn-primary btn-block" id="idBtnViewPublic">
												<i class="icon-eye-open icon-white"></i> View
											</button>
										</div>

										<div class="col-lg-8"></div>
									</div>
								</div>
							</div>
							<div class="panel-body">
								<ul class="nav nav-tabs stacked">
									<li class="active" id="idTabOpened"><a href="#Opened" data-toggle="tab"> <span class="badge pull-right">25</span>Opened
											&nbsp;&nbsp;
									</a></li>
								</ul>

								<div class="tab-content">
									<div class="tab-pane fade in active" id="Opened">
										<h4>Opened Request</h4>
										<hr />
										<div id="divFrmOpened">
											<div class="row">
												<div class="col-lg-12">
													<!--Public Form  -->
													<form>
														<div class="row">
															<div class="col-lg-12">
																<div class="form-group">
																	<label for="txtIdNic" class="control-label">NIC</label> <input type="text" id="txtIdNic" name="txtNic" class="form-control"
																		placeholder="NIC" maxlength="10" />
																</div>

																<div class="form-group">
																	<label for="idGender" class="control-label">Priority</label> <select class="form-control" id="idGender">
																	</select>
																	<div id="genderId"></div>
																	<input type="text" id="genderName" name="txtGenderName" class="form-control" placeholder="gender" required="true" />
																</div>


																<div class="form-group">
																	<label for="txtIdNic" class="control-label">NIC</label>
																	<textarea type="text" id="txtIdNic" name="txtNic" class="form-control" placeholder="NIC" maxlength="10">
																		</textarea>
																</div>

																<div class="form-group">
																	<label for="idGender" class="control-label">Status</label> <select class="form-control" id="idGender">
																	</select>
																	<div id="genderId"></div>
																	<input type="text" id="genderName" name="txtGenderName" class="form-control" placeholder="gender" required="true" />
																</div>

																<div class="col-lg-3">
																	<button id="btnSave" type="submit" class="btn btn-success btn-block">
																		<i class="icon-save icon-white"></i> Add Ticket
																	</button>
																</div>

															</div>
														</div>
												</div>

												</form>
												<!-- END Public Form -->
											</div>
										</div>
									</div>

									<div id="divOpened">
										<div class="table-responsive">
											<table class="table table-striped  table-hover table-condensed" id="dtOpened">
												<thead>
													<tr>
														<th style="width: 5%">Id</th>
														<th style="width: 25%">Name</th>
														<th style="width: 15%">Add1</th>
														<th style="width: 20%">Add2</th>
														<th>Add3</th>
														<th style="width: 12%">Tel</th>
														<th style="width: 12%">Mobile</th>
														<th>Email</th>
														<th>NIC</th>
														<th>DOB</th>
														<th>Gender</th>
														<th>Note</th>
														<th>UId</th>
														<th>NtnId</th>
														<th>Ntn</th>
														<th>Active</th>
													</tr>
												</thead>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!--End of Inner  -->
	</div>
	<!--END PAGE CONTENT -->
	</div>


	<!--END MAIN WRAPPER -->

	<!-- FOOTER -->
	<jsp:include page="../include/include_footer.jsp" />
	<!--END FOOTER -->


	<!-- GLOBAL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/plugins/jquery-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>


	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/js/divsec_public.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/fnReloadAjax.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/validator/validator.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/form-validator/jquery.form-validator.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/datepicker/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/tinymce/tinymce.min.js"></script>


	<script>
		var contextPath = "${pageContext.request.contextPath}"
		var userName = "${userName}";
		var stfId = "${stfId}";
		var divId = "${stfDivId}"
		var divName = "${stfDivName}"

		$('#frmIdPublic').validator();

		tinymce
				.init({
					selector : 'textarea',
					font_formats: 'Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;AkrutiKndPadmini=Akpdmi-n',
					height : 200,
					plugins : [
							'advlist autolink lists link image charmap print preview anchor',
							'searchreplace visualblocks code fullscreen',
							'insertdatetime media table contextmenu paste code' ],
					toolbar : 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
					content_css : [],
				 menubar: false
				});
	</script>

	<!-- END PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>

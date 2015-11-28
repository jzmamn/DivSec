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
							<li><a href="#">Home</a></li>
							<li><a href="#">Library</a></li>
							<li class="active">Data</li>
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
													<form:form role="form" id="frmIdPublic" method="post" modelAttribute="maPublic" data-toggle="validator">
														<div class="row">
															<div class="col-lg-12">
																<div class="col-lg-3">
																	<div class="form-group">
																		<label for="txtIdPubId" class="control-label">Public Id</label>
																		<form:input path="piId"  type="text" id="txtIdPubId" name="txtPubId" class="form-control" placeholder="Public id" readonly="true" />
																	</div>
																</div>

																<div class="col-lg-6">
																	<div class="form-group ">
																		<label for="txtIdName" class="control-label">Name With Initial</label>
																		<form:input path="piName"  type="text" id="txtIdName" name="txtName" class="form-control" placeholder="Name With Initial"
																			required="true" maxlength="30" />
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-lg-12">
																<div class="col-lg-3">
																	<div class="form-group">
																		<label for="txtIdNic" class="control-label">NIC</label>
																		<form:input path="piNic"  type="text" id="txtIdNic" name="txtNic" class="form-control" placeholder="NIC" maxlength="10" />
																	</div>
																</div>

																<div class="col-lg-3">
																	<div class="input-group">
																		<label for="dp1" class="control-label">Date Of Birth</label>
																		<form:input path="piDob" id="dp1" type="text" data-validation="date" data-validation-format="yyyy-mm-dd" name="txtDob" class="form-control" value="12-02-2012" placeholder="yyyy-mm-dd" />

																	</div>
																</div>
																<div class="col-lg-3">
																	<div class="form-group">
																		<label for="idGender" class="control-label">Gender</label> <select class="form-control" id="idGender">
																		</select>
																		<div id="genderId"></div>
																		<form:input path="piGender" type="text" id="genderName" name="txtGenderName" class="form-control" placeholder="gender" required="true" />
																	</div>
																</div>
															</div>
														</div>

														<div class="row">
															<div class="col-lg-12">
																<div class="col-lg-6">
																	<div class="form-group ">
																		<label for="txtIdNote" class="control-label">Note</label>
																		<form:input path="piNote"  type="text" id="txtIdNote" name="txtNote" class="form-control" placeholder="Note" maxlength="50" />
																	</div>
																</div>
																<div class="col-lg-3">
																	<div class="form-group">
																		<label for="notificationId" class="control-label">Notification</label> <select class="form-control" id="idNotification">
																		</select>
																		<form:input path="notification.ntnId"  type="text" id="notificationId" name="txtNtnId" class="form-control" placeholder="nfnId"
																			required="true" />
																		<input type="text" id="notificationName"  type="text" name="txtNtnName" class="form-control" placeholder="nfnName" />
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-lg-12">
																<div class="col-lg-3">
																	<div class="checkbox">
																		<label> Is Active &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<form:checkbox path="piActive" id="chkIdPiActive" />
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
																		<label for="txtIdAdd1" class="control-label">Address1</label>
																		<form:input path="piAddress1"  type="text" id="txtIdAdd1" name="txtAdd1" class="form-control" placeholder="Address e.g. 23, Gall Road"
																			maxlength="50" />
																	</div>
																</div>

																<div class="col-lg-3">
																	<div class="form-group ">
																		<label for="txtIdAdd2" class="control-label">Address2</label>
																		<form:input path="piAddress2"  type="text" id="txtIdAdd2" name="txtAdd2" class="form-control" placeholder="City e.g. Colombo"
																			maxlength="50" />
																	</div>
																</div>

																<div class="col-lg-3">
																	<div class="form-group ">
																		<label for="txtIdAdd3" class="control-label">Address3</label>
																		<form:input path="piAddress3"  type="text" id="txtIdAdd3" name="txtAdd3" class="form-control" placeholder="Division e.g. 04"
																			maxlength="50" />
																	</div>
																</div>
															</div>
														</div>
														<div class="row">
															<div class="col-lg-12">
																<div class="col-lg-3">
																	<div class="form-group">
																		<label for="txtIdEmail" class="control-label">Email</label>
																		<form:input path="piEmail" type="email" id="txtIdEmail" name="txtEmail" class="form-control" placeholder="Email"
																		data-validation="email"	maxlength="99" />
																	</div>
																</div>

																<div class="col-lg-3">
																	<div class="form-group ">
																		<label for="txtIdTel" class="control-label">Tel</label>
																		<form:input path="piLandPhone" type="text" id="txtIdTel" name="txtTel" class="form-control" placeholder="Land Phone" maxlength="10"
																			data-validation="number"e />
																	</div>
																</div>

																<div class="col-lg-3">
																	<div class="form-group ">
																		<label for="txtIdMobile" class="control-label">Mobile</label>
																		<form:input path="piMobilePhone" type="text" id="txtIdMobile" name="txtMobile" class="form-control" placeholder="Mobile phone"
																			maxlength="10" data-validation="number" />
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
																	<div class="form-group ">
																		<form:input path="piUserId" id="txtIdUid" name="txtUid" class="form-control" placeholder="UserId" />
																	</div>
																</div>
															</div>
														</div>
													</form:form>
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

	<script>
		var ctx = "${pageContext.request.contextPath}"
	</script>

	<!-- END PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>

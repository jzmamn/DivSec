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
											<button class="btn btn-primary" id="idBtnAddPublic">
												<i class="icon-plus icon-white" ></i> Add Public
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
																		<div id="genderId"></div>
																		<div id="genderName"></div>
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
																		<div id="notificationId"></div>
																		<div id="notificationName"></div>
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
													<!-- END Public Form -->

												</div>
											</div>
										</div>

										<div id="divOpened">
											<div class="table-responsive">
												<table class="table table-striped  table-hover table-condensed" id="dtOpened">
													<thead>
														<tr>
															<th style="width: 10%">Rq Id Opepnte</th>
															<th style="width: 12%">Status</th>
															<th style="width: 15%">Subject</th>
															<th style="width: 12%">Date</th>
															<th style="width: 12%">Pb Id</th>
															<th style="width: 20%">Pb Name</th>

														</tr>
													</thead>
													<tbody>
														<tr class="odd gradeX">
															<td>120</td>
															<td class="center"><span class="label label-warning">New</span></td>
															<td class="center">Sand Permit</td>
															<td class="center">2015-01-23</td>
															<td>432</td>
															<td>AbcAbcAbcAbc</td>
														</tr>
														<tr class="even gradeC">
															<td>145</td>
															<td><span class="label label-success">Opened</span></td>
															<td>Win 95+</td>
															<td class="center">5</td>
															<td class="center">C</td>
															<td class="center">5</td>

														</tr>
														<tr class="odd gradeA">
															<td>160</td>
															<td><span class="label label-success">Opened</span></td>
															<td>Win 95+</td>
															<td class="center">5.5</td>
															<td class="center">A</td>
															<td class="center">5</td>

														</tr>
														<tr class="odd gradeX">
															<td>161</td>
															<td><span class="label label-success">Opened</span></td>
															<td>Win 95+</td>
															<td class="center">4</td>
															<td class="center">X</td>
															<td class="center">5</td>

														</tr>
														<tr class="even gradeC">
															<td>170</td>
															<td><span class="label label-default">Closed</span></td>
															<td>Win 95+</td>
															<td class="center">5</td>
															<td class="center">C</td>
															<td class="center">5</td>

														</tr>
														<tr class="182 gradeA">
															<td>Trident</td>
															<td>Internet Explorer 5.5</td>
															<td>Win 95+</td>
															<td class="center">5.5</td>
															<td class="center">A</td>
															<td class="center">5</td>
														</tr>
													</tbody>
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
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/dataTables.bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/fnReloadAjax.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/divsec_public.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/validator/validator.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/form-validator/jquery.form-validator.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.js"></script>
	<script>
		var ctx = "${pageContext.request.contextPath}"
	</script>

	<!-- END PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>

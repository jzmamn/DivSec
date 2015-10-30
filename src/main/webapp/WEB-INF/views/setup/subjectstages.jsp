<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DivSec | Subject Stage</title>


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
						<h3 class="text-info">Manage Subject Stages</h3>
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
								Subject Stages
								<button id="btnAddDivision" data-toggle="modal" data-target="#modalSubject" class="btn btn-primary">
									<i class="icon-plus icon-white"></i> Add
								</button>

								<button id="btn" class="btn btn-primary">
									<i class="icon-plus icon-white"></i> test
								</button>
							</div>


							<div class="panel-body">
								<div class="row">
									<div class="col-lg-12">
										<div class="col-lg-4 ">
											<form:form role="form" id="frmIdSbjStg" method="POST" modelAttribute="maSbjStg" data-toggle="validator">
												<div class="form-group">
													<label for="txtIdSbj" class="control-label">Subject</label>
													<div class="input-group">
														<form:input path="subject.sbjName" class="form-control" id="txtIdSbjName" name="txtSbjName" readonly="true"
															placeholder="select a Subject" />
														<span class="input-group-btn">
															<button id="btnIdShowSbj" name="btnShowSbj" class="btn btn-warning" type="button" data-toggle="modal"
																data-target="#modalSubject">
																<i class="icon-search"></i>
															</button>
														</span>
														<form:input path="subject.sbjId" type="hidden" class="form-control" id="txtIdSbjId" name="txtSbjId" required="true" />
													</div>
												</div>

												<div class="form-group">
													<label for="txtIdSbj" class="control-label">Stage Name</label>
													<form:input path="stgName" class="form-control" id="txtIdStgName" name="txtStgName" required="true"
														placeholder="select user category" />
													<form:input path="stgId" type="hidden" class="form-control" id="txtIdStgId" name="txtStgId" />
												</div>

												<div class="form-group">
													<label for="txtIdStgCost" class="control-label">Cost</label>
													<form:input path="stgCost" class="form-control" id="txtIdStgCost" name="txtStgCost" value="100.0"
														placeholder="select user category" />
												</div>

												<div class="form-group">
													<form:checkbox path="stgActive" id="chkSbjStgIsActive" />
													<label>Is Active</label>
												</div>

												<div class="col-lg-4 col-sm-4 col-xs-4">
													<button id="btnDelete" class="btn btn-danger btn-block">
														<i class="glyphicon glyphicon-trash"></i> Delete
													</button>
												</div>

												<div class="col-lg-4 col-sm-4 col-xs-4">
													<button id="btnSave" type="submit" class="btn btn-success btn-block">
														<i class="icon-save icon-white"></i> Save
													</button>
												</div>

												<div class="col-lg-4 col-sm-4 col-xs-4">
													<button id="btnClose" class="btn btn-block" data-dismiss="modal">
														<i class="icon-remove icon-white"></i> Close
													</button>
												</div>
											</form:form>
										</div>



										<div class="col-lg-8">
											<div class="panel-body">
												<div class="table-responsive">
													<table class="table table-striped table-bordered table-hover table-condensed" id="dtSbjStg">
														<thead>
															<tr>
																<th style="width:10%;">Id</th>
																<th>Stage</th>
																<th style="width:10%;">Active</th>
															</tr>
														</thead>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- Subject Modal -->
							<div class="col-lg-12">
								<div class="modal fade" id="modalSubject" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
									<div class="modal-dialog">
										<div class="modal-content">

											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title" id="H4">Subject</h4>
											</div>
											<div class="modal-body">
												<div class="table-responsive">
													<table class="table table-striped table-bordered table-hover table-condensed" id="dtSubject">
														<thead>
															<tr>
																<th style="width:10%;">SbjId</th>
																<th style="width:80%;">Name</th>
																<th style="width:10%;">Active</th>
															</tr>
														</thead>
													</table>
												</div>
											</div>

											<div class="modal-footer">
												<div class="col-lg-4 col-sm-4 col-xs-4">
													<button id="btnClose" class="btn btn-block" data-dismiss="modal">
														<i class="icon-remove icon-white"></i> Close
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- End Subject Modal -->
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
	<script src="${pageContext.request.contextPath}/resources/js/divsec_subjectstage.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/validator/validator.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.js"></script>


	<!-- END PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>

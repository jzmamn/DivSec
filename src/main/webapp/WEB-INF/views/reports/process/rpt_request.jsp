<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DivSec | Request Report</title>


<!-- GLOBAL STYLES -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/MoneAdmin.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Font-Awesome/css/font-awesome.css" />
<!--END GLOBAL STYLES -->

<!-- PAGE LEVEL STYLES -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/dataTables/css/dataTables.bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/dataTables/css/buttons.dataTables.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datepicker/css/bootstrap-datepicker.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/datepicker/css/datepicker.css" />


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
		<jsp:include page="../../include/include_header.jsp" />

		<!-- END HEADER SECTION -->

		<!-- MENU SECTION -->
		<jsp:include page="../../include/include_menu.jsp" />
		<!--END MENU SECTION -->

		<!--PAGE CONTENT -->
		<div id="content">
			<!-- Inner  -->
			<div class="inner">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="text-info">Request Report</h3>
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

							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover table-condensed" id="dtTable">
										<thead>
											<tr>
												<th style="width: 10%">Rq Id</th>
												<th style="width: 12%">Status</th>
												<th>StatusName</th>
												<th>SbjId</th>
												<th style="width: 15%">Subject</th>
												<th style="width: 12%">Date</th>
												<th style="width: 12%">Pb Id</th>
												<th style="width: 20%">Pb Name</th>
												<th>Div Id</th>
												<th>Div Name</th>
												<th>Note</th>
												<th>Stf Id</th>
												<th>Stf Name</th>
												<th>Fee</th>
												<th>Duration</th>
												<th>Void</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--Report Filter Modal -->
				<div class="col-lg-12">
					<div class="modal fade" id="mdlReqFilter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="H4">Report Filter</h4>
								</div>
								<div class="modal-body">
									<form role="form" id="block-validate">

										<div class="row">
											<div class="col-lg-12">

												<div class="col-lg-6">
																										<div class="form-group">
														<input type="text" id="idTxtRequest"  name="txtRequest"  class="form-control" placeholder="Request Id" />
														
														 <!-- <span class="input-group-btn">
															<button class="btn btn-warning" type="button">
																<i class="icon-search"></i>
															</button> -->

														</span>

													</div>

												</div>

												<div class="col-lg-6">
													<input type="text"id="txtIdSbjId" name="txtSbjId" />
													<div class="form-group input-group">
														<input type="text" id="txtIdSbjName" name="txtSbjName" class="form-control" placeholder="Subject Code" /> <span class="input-group-btn">
															<button class="btn btn-warning" type="button" data-toggle="modal" data-target="#modalSubject">
																<i class="icon-search"></i>
															</button>
														</span>
													</div>

												</div>
											</div>
										</div>


										<div class="row">
											<div class="col-lg-12">
												<div class="col-lg-6">
													<input type="text" id="txtIdPublicId" name="txtPublicId"  />
													<div class="form-group input-group">
														<input type="text" class="form-control" id="txtIdPublicName" name ="txtPublicName" placeholder="Public Id" /> <span class="input-group-btn">
															<button class="btn btn-warning" type="button" data-toggle="modal" data-target="#modalPublic">
																<i class="icon-search"></i>
															</button>
														</span>
													</div>
												</div>

												<div class="col-lg-6">
													<input type="text" id="txtIdDivisionId" name="txtDivisionId" />
													<div class="form-group input-group">
														<input type="text" class="form-control" id="txtIdDivision" name="txtDivision" placeholder="Division" /> <span class="input-group-btn">
															<button class="btn btn-warning" type="button" data-toggle="modal"
														data-target="#modalDivision">
																<i class="icon-search"></i>
															</button>
														</span>
													</div>
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-lg-12">
												<div class="col-lg-6">
													<div>
														<select id="cmdIdReqStatus" class="form-control">
														</select> <input type="text" id="idCmbReqStausId" name="txtStatusId" />
													</div>
												</div>
												<!-- <div class="col-lg-6">
													<input type="text" />
													<div class="form-group input-group">
														<input type="text" class="form-control" /> <span class="input-group-btn">
															<button class="btn btn-warning" type="button">
																<i class="icon-search"></i>
															</button>
														</span>
													</div>

												</div> -->
											</div>
										</div>

										<div class="row">
											<div class="col-lg-12">
												<div class="col-lg-12">
													<div class="input-group input-daterange">
														<span class="input-group-addon">From</span> <input id="dpFrom" type="text" class="form-control"
															placeholder="from date yyyy-mm-dd"> <span class="input-group-addon">to</span> <input id="dpTo" type="text"
															class="form-control" placeholder="to date yyyy-mm-dd">
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<div class="col-lg-4">
												<button id="btnEdit" class="btn btn-success btn-block">
												
													<i class="icon-filter icon-white"></i> Apply Filter
												</button>
											</div>
											<div class="col-lg-4"></div>
											<div class="col-lg-4">
												<button id="btnClose" class="btn btn-block" data-dismiss="modal">
													<i class="icon- icon-white"></i> Close
												</button>
											</div>
										</div>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
				<!--End Report Filter Modal -->

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
													<th style="width: 10%;">SbjId</th>
													<th style="width: 80%;">Name</th>
													<th style="width: 10%;">Active</th>
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
				
				
				<!-- Public Modal -->
				<div class="col-lg-12">
					<div class="modal fade" id="modalPublic" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
						<div class="modal-dialog">
							<div class="modal-content">

								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="H4">Select Public</h4>
								</div>
								<div class="modal-body">
									<div class="table-responsive">
										<table class="table table-striped table-bordered table-hover table-condensed" id="dtPublic">
											<thead>
												<tr>
													<th style="width: 10%;">Id</th>
													<th style="width: 80%;">Name</th>
													<th style="width: 10%;">NIC</th>
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
				<!-- End Public Modal -->
				
				<!-- Division Modal -->
				<div class="col-lg-12">
					<div class="modal fade" id="modalDivision" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
						<div class="modal-dialog">

							<div class="modal-content">

								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="H4">Division</h4>
								</div>
								<div class="modal-body">
									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover" id="dtDivision">
												<thead>
													<tr>
														<th>DivId</th>
														<th>Name</th>
														<th>Active</th>
													</tr>
												</thead>

											</table>
										</div>
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
				<!-- End Division Modal -->

			</div>
			<!--End of Inner  -->
		</div>
		<!--END PAGE CONTENT -->
	</div>


	<!--END MAIN WRAPPER -->

	<!-- FOOTER -->
	<jsp:include page="../../include/include_footer.jsp" />
	<!--END FOOTER -->


	<!-- GLOBAL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/plugins/jquery-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/modernizr-2.6.2-respond-1.1.0.min.js"></script>


	<!-- END GLOBAL SCRIPTS -->

	<!-- PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/dataTables.bootstrap.js"></script>

	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/buttons.colVis.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/buttons.print.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/buttons.html5.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/dataTables.buttons.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/jszip.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/pdfmake.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/vfs_fonts.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/dataTables/js/fnReloadAjax.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/divsec_rpt_request.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/validator/validator.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/datepicker/js/bootstrap-datepicker.min.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/divsec_rpt_filter.js"></script>

	<script>
		$('.input-daterange input').each(function() {
			$(this).datepicker({
				format : "yyyy-mm-dd"
			});
		});
	</script>

	<!-- END PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>

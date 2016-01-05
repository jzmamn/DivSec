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
			<div class="inner">
				<div class="row">
					<div class="col-lg-12">
						<h2>Request Form</h2>
					</div>
				</div>
				<hr />

				<div class="row">
					<div class="col-lg-12">

						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-2">
									<button class="btn btn-primary" data-toggle="modal" data-target="#idModalRequest">
										<i class="icon-plus icon-white"></i> New Request
									</button>
								</div>
								<div class="col-lg-8"></div>
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="col-lg-12">
								<div class="col-lg-12">
									<ul class="nav nav-pills" style="max-width: 300%;">

										<li class="active" id="idAll"><a href="#" data-toggle="tab"> <span class="badge pull-right">25 </span> All
										</a></li>

										<li id="idApprove"><a href="#" data-toggle="tab"> <span class="badge pull-right">25</span> Approval
										</a></li>

										<li id="idOpened"><a href="#" data-toggle="tab"> <span class="badge pull-right">25</span> Opened
										</a></li>

										<li id="idApproval"><a href="#" data-toggle="tab"> <span class="badge pull-right">8</span> Approval
										</a></li>

										<li id="idCompleted"><a href="#" data-toggle="tab"> <span class="badge pull-right">65</span> Completed
										</a></li>

										<li id="idClosed"><a href="#" data-toggle="tab"> <span class="badge pull-right">3</span> Closed
										</a></li>
									</ul>
								</div>
							</div>
						</div>

						<hr />

						<div class="row">
							<div class="col-lg-12">
								<div class="table-responsive" id="idContent">
									<div id="tblProcessRequest">
										<table class="table table-striped  table-hover table-condensed" id="dtTable">
											<thead>
												<tr>
													<th style="width: 10%">Rq Id</th>
													<th style="width: 12%">Status</th>
													<th style="width: 12%">StatusName</th>
													<th style="width: 15%">SbjId</th>
													<th style="width: 15%">Subject</th>
													<th style="width: 12%">Date</th>
													<th style="width: 12%">Pb Id</th>
													<th style="width: 20%">Pb Name</th>
													<th style="width: 12%">Div Id</th>
													<th style="width: 20%">Div Name</th>
													<th style="width: 12%">Note</th>
													<th style="width: 20%">Stf Id</th>
													<th style="width: 12%">Stf Name</th>
													<th style="width: 12%">Fee</th>
													<th style="width: 12%">Duration</th>
													<th style="width: 12%">Date</th>

												</tr>
											</thead>
										</table>
									</div>

									<!-- The Request Status Process -->
									<div id="frmProcessRequest" class="row">
										<div class="col-lg-12">
											<div class="col-lg-8 col-md-8 col-sm-8">
												<table class="table table-striped  table-hover table-condensed" id="dtStage">
													<thead>
														<tr>
															<th style="width: 10%">PrcStage</th>
															<th style="width: 10%">StgId</th>
															<th style="width: 60%">Stage</th>
															<th style="width: 30%">Status</th>
															<th style="width: 20%">ReqId</th>
														</tr>
													</thead>


												</table>
											</div>


											<!--Request Info Panel -->

											<div class="col-lg-4 col-md-4 col-sm-4">
												<div class="panel panel-primary">
													<div class="panel-heading">
														<i class="icon-bell"> Request Info</i>
													</div>

													<div class="panel-body">
														<form>
															<div>
																<div>
																	Request Id : <span id="spnReqId" class="pull-right text-muted small"></span> <span class="pull-right text-muted small">
																		<input type="text" style="width: 30px; height: 15px;" id="txtIdReqId" />
																	</span>

																</div>

																<div style="display: none;">
																	Subject Id : <span id="spnSbjId" class="pull-right text-muted small"></span>
																</div>

																<div>
																	Subject : <span id="spnSbj" class="pull-right text-muted small"></span>
																</div>
																<div>
																	Public Id : <span id="spnPubId" class=" pull-right text-muted small"></span>
																</div>
																<div>
																	Public Name : <span id="spnPubName" class=" pull-right text-muted small"></span>
																</div>

																<div style="display: none;">
																	Division Id : <span id="spnDivId" class="pull-right text-muted small"></span>
																</div>

																<div>
																	Division : <span id="spnDivision" class="pull-right text-muted small"></span>
																</div>

																<div style="display: none;">
																	Staff Id : <span id="spnStaffId" class="pull-right text-muted small"></span>
																</div>

																<div>
																	Staff Accepted : <span id="spnStaff" class="pull-right text-muted small"></span>
																</div>

																<div>
																	Req Status <span class="pull-right text-muted small"> <select id="cmdIdReqStatus">

																	</select>
																	</span> <span class="pull-right text-muted small"> <input type="text" id="idCmbReqStausId" />
																	</span>
																</div>

																<div>
																	Fee : <span id="spnFee" class="pull-right text-muted small"> <em>Yesterday esterday esterday esterday </em></span>
																</div>

																<div>
																	Duration : <span id="spnDuration" class="pull-right text-muted small"> <em>Yesterday esterday esterday esterday
																	</em></span>
																</div>

																<div>
																	Accepted on : <span id="spnDate" class="pull-right text-muted small"> <em>Yesterday esterday esterday esterday
																	</em></span>
																</div>

																<div>
																	Remark : <span id="spnRemark" class="text-muted small"> <em>Yesterday esterday esterday esterday </em></span>
																</div>

																<div>
																<span class="label label-warning">Void Request:</span>	 <span id="spnDate" class="pull-right"> <input type="checkbox" id="chkIdPiActive" /></span>
																</div>
																
																<br/>

																<div class="list-group-item">
																	<button class="btn  btn-block btn-primary">
																		<span class="icon-save"></span> Save Changes
																	</button>
																</div>

																<div class="list-group-item">
																	<button class="btn  btn-block btn-primary">
																		<span class="icon-envelope-alt"></span> Send Email
																	</button>
																</div>

																<div class="list-group-item">
																	<button class="btn  btn-block btn-primary">
																		<span class="icon-mobile-phone"></span> Send SMS
																	</button>
																</div>

															</div>
														</form>
													</div>
												</div>
											</div>
											<!--End Request Info Panel -->
										</div>
									</div>
									<!-- END Request Status Process -->
								</div>
							</div>
						</div>
					</div>
					<hr />
				</div>


				<!--New Request Modal -->

				<div class="col-lg-12">
					<div class="modal fade" id="idModalRequest" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="H4">Public Request Form</h4>
								</div>
								<div class="modal-body">
									<form:form data-toggle="validator" role="form" id="frmIdRequest" method="POST" modelAttribute="maRequest">

										<div class="form-group">
											<label for="txtIdReqId" class="control-label">Request Id</label>
											<form:input path="reqId" type="text" id="txtIdReqId" name="txtRequestId" class="form-control" readonly="true"
												placeholder="Request Ref No." />
										</div>

										<div class="form-group">
											<label for="txtIdPublicId" class="control-label">Public Name</label>
											<div class="input-group">
												<input type="text" class="form-control" id="txtIdPublicName" name="txtPublicName" disabled placeholder="Select Public" /> <span
													class="input-group-btn">
													<button class="btn btn-warning" type="button" data-toggle="modal" data-target="#modalPublic">
														<i class="icon-search"></i>
													</button>
												</span>
												<form:input path="publicIndividual.piId" type="text" class="form-control" id="txtIdPublicId" name="txtIdPublicId" />
											</div>
										</div>

										<div class="form-group">
											<label for="txtIdSubjectId" class="control-label">Subject</label>
											<div class="input-group">
												<input type="text" class="form-control" id="txtIdSubject" name="txtSubject" disabled placeholder="Select Subject" /> <span
													class="input-group-btn">
													<button class="btn btn-warning" type="button" data-toggle="modal" data-target="#modalSubject">
														<i class="icon-search"></i>
													</button>
												</span>
												<form:input path="subject.sbjId" type="text" class="form-control" id="txtIdSubjectId" name="txtSearch" />
											</div>
										</div>

										<div class="form-group">
											<form:input path="division.divId" type="text" id="txtIdDivisionId" name="txtDivisionId" class="form-control"
												placeholder="Division ID" />
										</div>

										<div class="form-group">
											<label for="txtIdDivisionName" class="control-label">Division</label> <input type="text" id="txtIdDivisionName"
												name="txtDivisionName" class="form-control" placeholder="Division" />
										</div>

										<div class="input-group">
											<form:input path="reqEntDate" type="text" id="dp1" data-validation="date" data-validation-format="yyyy-mm-dd" name="txtDob"
												class="form-control" />
										</div>

										<div class="form-group">
											<div>
												<form:input path="reqNote" type="text" id="txtIdNote" name="txtNote" class="form-control" placeholder="Note" />
											</div>
										</div>
										<div class="form-group">
											<div>
												<form:input path="reqFees" type="text" id="txtIdReqFee" name="txtReqFee" class="form-control" placeholder="Request Fee in Rs" />
											</div>
										</div>

										<div class="form-group">
											<div>
												<form:input path="reqDurartion" type="text" id="txtIdDuration" name="txtDuration" class="form-control" placeholder="Duration" />
											</div>
										</div>

										<div class="form-group">
											<div>
												<form:input path="staff.stfId" type="text" id="txtIdStaff" name="txtStaff" class="form-control" placeholder="staff Id"
													value="${stfId}" />
											</div>
										</div>

										<div class="form-group">
											<div>
												<form:input path="requestStatus.rsId" type="text" id="txtIdReqid" name="txtReqId" class="form-control" value="1" />
											</div>
										</div>

										<div class="form-group">
											<div>
												<form:input path="reqIsVoid" type="text" id="txtIdVoid" name="txtVoid" class="form-control" value="0" />
											</div>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
											<button id="btnSave" type="submit" class="btn btn-success">
												<i class="icon-save icon-white"></i> Save
											</button>
										</div>

									</form:form>

								</div>



							</div>
						</div>
					</div>
				</div>

				<!--End New Request Modal -->


				<!--Process Request Stage Modal -->
				<div class="col-lg-12">
					<div class="modal fade" id="idModalReqStage" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="H4">Process Request Stage</h4>
								</div>
								<div class="modal-body">
									<form role="form" id="block-validate1">

										<div class="form-group">
											<div>
												<input type="text" id="txtIdReqId1" name="txtRequestId" class="form-control" placeholder="RequestId" />
											</div>
										</div>

										<div class="form-group">
											<div>
												<input type="text" id="txtIdReqStageId" name="txtReqStageId" class="form-control" placeholder="Request Stage Id." />
											</div>
										</div>

										<div class="form-group">
											<div>
												<input type="text" id="txtIdSeqNo" name="txtIdSeqNo" class="form-control" placeholder="SequenceNo" />
											</div>
										</div>

										<div class="form-group">
											<div>
												<input type="text" id="txtIdTxnDate" name="txtTxnDate" class="form-control" placeholder="User Id" />
											</div>
										</div>

										<div class="form-group">
											<div>
												<input type="text" id="txtIdUserId" name="txtUserId" class="form-control" placeholder="User Id" />
											</div>
										</div>

										<div class="form-group">
											<select class="form-control" id="people">
											</select>
										</div>

										<div id="id"></div>
										<div id="name"></div>

										<div class="form-group">
											<div>
												<input type="text" id="txtIdNote" name="txtNote" class="form-control" placeholder="Note" />
											</div>
										</div>

									</form>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary">Save changes</button>
								</div>

							</div>
						</div>
					</div>
				</div>
				<!--End Process Request Stage Modal -->


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
													<th style="width: 10%;">DivId</th>
													<th style="width: 10%;">DivName</th>
													<th style="width: 10%;">Duration</th>
													<th style="width: 10%;">Cost</th>
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
		<!--END MAIN WRAPPER -->

	</div>
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
	<script src="${pageContext.request.contextPath}/resources/plugins/validator/validator.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/form-validator/jquery.form-validator.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/datepicker/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/divsec_request.js"></script>
	<script>
		$('#dp1').datepicker({
			format : "yyyy-mm-dd"
		});

		var contextPath = "${pageContext.request.contextPath}"
		var userName = "${userName}";
		var divId = "${stfDivId}"
		var divName = "${stfDivName}"

		$('#frmIdPublic').validator();
	</script>

	<!-- END PAGE LEVEL SCRIPTS -->
</body>

<!-- END BODY -->
</html>

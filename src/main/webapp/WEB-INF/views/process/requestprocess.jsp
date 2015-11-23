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

										<li class="active" id="idApprove"><a href="#" data-toggle="tab"> <span class="badge pull-right">25</span> To Be Approved
										</a></li>

										<li class="active" id="idOpened"><a href="#" data-toggle="tab"> <span class="badge pull-right">25</span> Opened
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
													<td><span class="label label-info">Approved</span></td>
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


									<!-- The Request Status Process -->
									<div id="frmProcessRequest" class="row">
										<div class="col-lg-12">

											<div class="col-lg-8 col-md-8 col-sm-8">
												<table class="table table-striped  table-hover table-condensed" id="dtStage">
													<thead>
														<tr>
															<th style="width: 10%">StgId</th>
															<th style="width: 60%">Stage</th>
															<th style="width: 20%">Status</th>
														</tr>
													</thead>

													<tbody>
														<tr class="odd gradeX">
															<td>1</td>
															<td class="center">Fill all the forms</td>
															<td class="center"><span class="label label-success">In-Progress</span></td>


														</tr>
														<tr class="even gradeC">
															<td>2</td>
															<td>Submit to the cleark</td>
															<td><span class="label label-info">Completed</span></td>
														</tr>
														<tr class="odd gradeA">
															<td>3</td>
															<td>send for verification</td>
															<td><span class="label label-warning">Pending</span></td>


														</tr>
														<tr class="odd gradeX">
															<td>4</td>
															<td>send for land registry</td>
															<td><span class="label label-warning">Pending</span></td>



														</tr>
														<tr class="even gradeC">
															<td>5</td>
															<td>Attest surveyor plan</td>
															<td><span class="label label-info">completed</span></td>

														</tr>

													</tbody>
												</table>
											</div>


											<!--Request Info Panel -->

											<div class="col-lg-4 col-md-4 col-sm-4">
												<div class="panel panel-primary">
													<div class="panel-heading">
														<i class="icon-bell"> Request Info</i>
													</div>

													<div class="panel-body">
														<div class="list-group">
															<div>
																Request Id : <span class="pull-right text-muted small"><em> 4 minutes ago</em> </span>
															</div>
															<div>
																Subject : <span class="pull-right text-muted small"><em> 12 minutes ago</em> </span>
															</div>
															<div>
																Public Id : <span class="pull-right text-muted small"><em> 27 minutes ago</em> </span>
															</div>
															<div>
																Public Name : <span class="pull-right text-muted small"><em>43 minutes ago</em> </span>
															</div>
															<div>
																Division : <span class="pull-right text-muted small"><em>11:32 AM</em> </span>
															</div>
															<div>
																Staff Accepted : <span class="pull-right text-muted small"><em>11:13 AM</em> </span>
															</div>

															<div>
																Req Status <span class="pull-right text-muted small"> <select id="cmdIdReqStatus">

																</select>
																</span>
																<div id="idCmbReqStausId"></div>
																<div id="idCmbReqStausName"></div>
															</div>

															<div>
																To be Approved : <span class="pull-right text-muted small"> <input type="checkbox" id="d" value="" />
																</span>
															</div>

															<div>
																Remark : <span class="text-muted small"> <em>Yesterday esterday esterday esterday </em></span>
															</div>

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
									<form role="form" id="block-validate">

										<div class="form-group">
											<div>
												<input type="text" id="txtIdReqId" name="txtRequestId" class="form-control" disabled placeholder="Request Ref No." />
											</div>
										</div>


										<div class="form-group input-group">
											<input type="text" class="form-control" id="txtIdPublicName" name="txtPublicName" disabled placeholder="Select Public" /> <span
												class="input-group-btn">
												<button class="btn btn-warning" type="button" data-toggle="modal" data-target="#subjecSelection">
													<i class="icon-search"></i>
												</button>
											</span> <input type="text" class="form-control" id="txtIdPublicId" name="txtIdPublicId" />
										</div>


										<div class="form-group input-group">
											<input type="text" class="form-control" id="txtIdSubject" name="txtSubject" disabled placeholder="Select Subject" /> <span
												class="input-group-btn">
												<button class="btn btn-warning" type="button" data-toggle="modal" data-target="#subjecSelection">
													<i class="icon-search"></i>
												</button>
											</span> <input type="text" class="form-control" id="txtIdSubjectId" name="txtSearch" />
										</div>

										<div class="form-group ">
											<div class="input-group">
												<input type="text" class="form-control" id="txtIdDivision" name="txtDivision" disabled placeholder="Select the division" /> <span
													class="input-group-btn">
													<button class="btn btn-warning" type="button" data-toggle="modal" data-target="#subjecSelection">
														<i class="icon-search"></i>
													</button>
												</span> <input type="text" class="form-control" id="txtIdDivisionId" name="txtDivisionId" />
											</div>
										</div>

										<div class="form-group">
											<input type="text" id="idTxtTxnDate" name="txtTxnDate" class="form-control" placeholder="Current date to be hidden" />
										</div>

										<div class="form-group">
											<div>
												<input type="text" id="txtIdNote" name="txtNote" class="form-control" placeholder="Note" />
											</div>
										</div>
										<div class="form-group">
											<div>
												<input type="text" id="txtIdReqFee" name="txtReqFee" class="form-control" placeholder="Request Fee in Rs" />
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
				<!--Process Request Stage Modal -->

				<!--Subject Selection Modal -->
				<div class="col-lg-12">
					<div class="modal fade" id="subjecSelection" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="H4">New Registration</h4>
								</div>
								<div class="modal-body col-lg-12">
									<div class="col-lg-12">
										<div class="panel panel-default">

											<div class="panel-body">
												<div class="table-responsive">
													<table class="table table-hover" id="dataTables-example1">
														<thead>
															<tr>
																<th>Subject Id</th>
																<th>Subject Name</th>

															</tr>
														</thead>
														<tbody>
															<tr class="odd gradeX">
																<td>Trident</td>
																<td>Internet Explorer 4.0</td>


															</tr>
															<tr class="even gradeC">
																<td>Trident</td>
																<td>Internet Explorer 5.0</td>

															</tr>

															<tr class="odd gradeX">
																<td>Trident</td>
																<td>Internet Explorer 4.0</td>


															</tr>
															<tr class="even gradeC">
																<td>Trident</td>
																<td>Internet Explorer 5.0</td>

															</tr>
															<tr class="odd gradeX">
																<td>Trident</td>
																<td>Internet Explorer 4.0</td>

															</tr>
															<tr class="even gradeC">
																<td>Trident</td>
																<td>Internet Explorer 5.0</td>
															</tr>
															<tr class="odd gradeX">
																<td>Trident</td>
																<td>Internet Explorer 4.0</td>

															</tr>
															<tr class="even gradeC">
																<td>Trident</td>
																<td>Internet Explorer 5.0</td>
															</tr>

														</tbody>
													</table>
												</div>

											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary">Save changes</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--Subject Selection Modal -->

				</div>
				<!--END PAGE CONTENT -->

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


			<!-- END PAGE LEVEL SCRIPTS -->
</body>

<!-- END BODY -->
</html>
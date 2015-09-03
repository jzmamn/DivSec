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
						<h2>Manage Division</h2>
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
					<div class="col-lg-12" id="alert">
						
					</div>
				</div>
				<!--End Alert -->

				<div class="row">
					<div class="col-lg-12">

						<div class="panel panel-default">
							<div class="panel-heading">
								<div>
									<button class="btn btn-primary" data-toggle="modal"
										data-target="#subjectModal">
										<i class="icon-plus icon-white"></i> Add Division
									</button>
								</div>
							</div>


							<div class="panel-body">
								<div class="table-responsive">
									<c:if test="${!empty listDivision}">
										<table class="table table-striped table-bordered table-hover"
											id="dataTables-example">
											<thead>
												<tr>
													<th>Division Id</th>
													<th>Division</th>
													<th>Division Active</th>
													<th>View</th>
													<th>Edit</th>
													<th>Delete</th>

												</tr>
											</thead>
											<tbody>
												<c:forEach items="${listDivision}" var="division">
													<tr class="odd gradeX">
														<td>${division.divId}</td>
														<td>${division.divName}</td>
														<td>${division.divActive}</td>
														<td class="center">
															<button class="btn btn-success" data-toggle="modal"
																data-target="#viewModel">
																<i class="icon-eye-open"></i> View
															</button>
														</td>
														<td class="center"><button class="btn btn-warning"
																data-toggle="modal" data-target="#subjectModal">
																<i class="icon-pencil icon-white"></i> Edit
															</button></td>
														<td class="center">
															<button class="btn btn-danger" data-toggle="modal"
																data-target="#deleteModal">
																<i class="icon-remove icon-white"></i> Delete
															</button>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!--Save and Update Modal -->
			<div class="col-lg-12">
				<div class="modal fade" id="subjectModal" tabindex="-1"
					role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header primary">
								<button type="button" class="close " data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="H4">Dvision</h4>
							</div>

							<!-- ------------------------------------------------------ -->

							<form:form action="division/create" id="frmIdDivision"
								class="form-signin" modelAttribute="maDivision"
								commandName="cmdDivision" method="Post">

								<div class="modal-body">
									<div class="form-group">
										<form:input path="divId" id="txtIdDivId" name="txtDivId"
											placeholder="Division Id" class="form-control" />
									</div>


									<div class="form-group">
										<form:input path="divName" id="txtIdDivName" name="txtDivName"
											placeholder="Division Name" class="form-control" />
									</div>

									<div class="form-group">
										Active
										<form:checkbox path="divActive" id="chkIdDivActive"
											name="chkDivActive" />
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<input type="submit" class="btn btn-primary"
											value="Save Changes">
									</div>

								</div>
							</form:form>
							<!--  ------------------------------------------------------ -->
						</div>
					</div>
				</div>
			</div>
			<!--End Save and Update Modal -->

			<!--View Details -->
			<div class="col-lg-12">
				<div class="modal fade" id="viewModel" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header primary">
								<button type="button" class="close " data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="H4">View User's Detail</h4>
							</div>
							<div class="modal-body">
								<div>
									<p>First Name:</p>
								</div>

								<div>
									<p>Last Name:</p>
								</div>

								<div>
									<p>User Name:</p>
								</div>

								<div>
									<p>E-mail:</p>
								</div>
								<div>
									<p>Active:</p>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--End View Details -->

			<!--Delete Modal -->
			<div class="col-lg-12">
				<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
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
		<!--END PAGE CONTENT -->

	</div>

	<!--END MAIN WRAPPER -->

	<!-- FOOTER -->
	<div class="row">
		<div class="alert center-text" role="alert" id="alert"></div>
	</div>

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
		src="${pageContext.request.contextPath}/resources/js/divsec_division.js"  type="text/javascript"></script>



	<!-- END PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- BEGIN HEAD -->
<head>
<meta charset="UTF-8" />
<title>BCORE Admin Dashboard Template | Data Tables</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
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
						<h2>Manage User</h2>
					</div>
				</div>
				<hr />
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<button class="btn btn-primary" data-toggle="modal"
									data-target="#subjectModal">
									<i class="icon-plus icon-white"></i> Add
								</button>
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>Rendering engine</th>
												<th>Browser</th>
												<th>Platform(s)</th>
												<th>Engine version</th>
												<th>CSS grade</th>
												<th>Engine version</th>
												<th>View</th>
												<th>Edit</th>
												<th>Delete</th>

											</tr>
										</thead>
										<tbody>
											<tr class="odd gradeX">
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td class="center">4</td>
												<td class="center">X</td>
												<td class="center">5</td>
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
											
											<tr class="odd gradeX">
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td class="center">4</td>
												<td class="center">X</td>
												<td class="center">5</td>
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
											
											<tr class="odd gradeX">
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td class="center">4</td>
												<td class="center">X</td>
												<td class="center">5</td>
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
											
											<tr class="odd gradeX">
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td class="center">4</td>
												<td class="center">X</td>
												<td class="center">5</td>
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
											
											<tr class="odd gradeX">
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td class="center">4</td>
												<td class="center">X</td>
												<td class="center">5</td>
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
											
											<tr class="odd gradeX">
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td class="center">4</td>
												<td class="center">X</td>
												<td class="center">5</td>
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
											
											<tr class="odd gradeX">
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td class="center">4</td>
												<td class="center">X</td>
												<td class="center">5</td>
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
											
											<tr class="odd gradeX">
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td class="center">4</td>
												<td class="center">X</td>
												<td class="center">5</td>
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
											
											<tr class="odd gradeX">
												<td>Trident</td>
												<td>Internet Explorer 4.0</td>
												<td>Win 95+</td>
												<td class="center">4</td>
												<td class="center">X</td>
												<td class="center">5</td>
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
											

										</tbody>
									</table>
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
								<h4 class="modal-title" id="H4">User Registration</h4>
							</div>
							<div class="modal-body">
								<form action="index.html" class="form-signin">

									<div class="form-group">
										<div>
											<input type="email" id="email2" name="email2"
												placeholder="First Name" class="form-control" />
										</div>
									</div>

									<div class="form-group">
										<div>
											<input type="email" id="email2" name="email2"
												placeholder="Last Name" class="form-control" />
										</div>
									</div>

									<div class="form-group">
										<div>
											<input type="email" id="email2" name="email2"
												placeholder="User Name" class="form-control" />
										</div>
									</div>

									<div class="form-group">
										<div>
											<input type="email" id="email2" name="email2"
												placeholder="E-mail" class="form-control" />
										</div>
									</div>

									<div class="form-group">
										<div>
											<input type="password" id="email2" name="email2"
												placeholder="Type password" class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<div>
											<input type="password" id="email2" name="email2"
												placeholder="Re type password" class="form-control" />
										</div>
									</div>

									<div class="form-group">
										<div class="checkbox">
											<label> <input type="checkbox" value="" />Active
											</label>
										</div>
									</div>
								</form>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save
									changes</button>
							</div>
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
			<jsp:include page="../include/include_delete_modal.jsp" />
			<!--End Delete Modal -->


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

	<script>
		$(document).ready(function() {
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

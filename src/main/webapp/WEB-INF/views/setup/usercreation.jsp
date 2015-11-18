<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DivSec | User Creation</title>


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
						<h3 class="text-info">Manage Users</h3>
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
								<button id="btnAddUser" data-toggle="modal" data-target="#modalUser" class="btn btn-primary">
									<i class="icon-plus icon-white"></i> Add
								</button>

								<button id="btn" class="btn btn-primary">
									<i class="icon-plus icon-white"></i> test
								</button>
							</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover" id="dtUser">
										<thead>
											<tr>
												<th>Id</th>
												<th>Name</th>
												<th>CatId</th>
												<th>Cat.</th>
												<th>DivId</th>
												<th>DivName</th>
												<th>UserId</th>
												<th>Password</th>
												<th>Email</th>
												<th>Mobile</th>
												<th>Note</th>
												<th>Active</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!--Save and Update Modal -->
				<div class="col-lg-12">
					<div class="modal fade" id="modalUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
						<div class="modal-dialog">
							<form:form role="form" id="frmIdUser" method="post" modelAttribute="maStaff" data-toggle="validator">
								<div class="modal-content">

									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="H4">User Creation</h4>
									</div>

									<div class="modal-body">
										<div class="form-group input-group">
											<span class="input-group-addon">Id</span> 
											<form:input path="stfId"  type="text" id="txtIdUCId" name="txtUCId" class="form-control" placeholder="Id"
												readonly="true" />
										</div>

										<div class="form-group input-group">
											<span class="input-group-addon ">Name</span> <form:input path="stfName" type="text" id="txtIdName" name="txtName" class="clsString form-control"
												placeholder="Enter User or Staff Name" required="true" maxlength="30" />
										</div>

										<div class="form-group input-group">
											<input type="text" class="form-control" id="txtIdDivision" name="txtDivision" readonly="true" required="true" placeholder="select a division" /> <span
												class="input-group-btn">
												<button id="btnIdShowDiv" name="btnShoeDiv" class="btn btn-warning" type="button" data-toggle="modal"
													data-target="#modalDivision">
													<i class="icon-search"></i>
												</button>
											</span> <form:input path="division.divId" type="text" class="form-control" id="txtIdDivisionId" name="txtDivisionId" readonly="true" required="true" />
										</div>

										<div class="form-group input-group">
											<input type="text" class="form-control" id="txtIdCatName" name="txtCatName" readonly="true" required="true" placeholder="select user category" /> <span
												class="input-group-btn">
												<button id="btnIdUserCat" name="btnUserCat" class="btn btn-warning" type="button" data-toggle="modal"
													data-target="#modalCategory">
													<i class="icon-search"></i>
												</button>
											</span> <form:input path="stfCategoryId" type="text" class="form-control" id="txtIdCatId" name="txtCatId" readonly="true" required="true" />
										</div>

										<div class="form-group input-group">
											<span class="input-group-addon ">User Id</span> <form:input path="stfUserId" type="text" id="txtIdUserId" name="txtUserId"
												class="clsString form-control" required="true" maxlength="8" placeholder="Enter Division Name" />
										</div>

										<div class="form-group input-group">
											<span class="input-group-addon ">Password</span> <form:input path="stfPassword" type="password" id="txtIdPwd" name="txtPwd"
												class="clsString form-control" required="true" maxlength="8" placeholder="Enter User Password" />
										</div>

										<div class="form-group input-group">
											<span class="input-group-addon "><i class="glyphicon glyphicon-phone"></i></span> <form:input path="stfMobile" type="number" id="txtIdMobile"
												name="txtMobile" class="form-control"  maxlength="10" placeholder="Mobile phone number. e.g. 07xx xxxxxxx" />
										</div>


										<div class="form-group input-group">
											<span class="input-group-addon ">@</span> <form:input path="stfEmail" type="email" id="txtIdEmail" name="txtEmail" class="form-control"
												placeholder="Enter Email address. e.g. divsec@gmail.com"  maxlength="100" />
										</div>

										<div class="form-group input-group">
											<span class="input-group-addon ">Note</span> <form:input path="stfNote" type="text" id="txtIdNote" name="txtNote" class="clsString form-control"
												maxlength="80" placeholder="Note" />
										</div>

										<div class="form-group">
											Is Active <form:checkbox path="stfActive" id="chkUserIsActive"  />
										</div>
									</div>

									<div class="modal-footer">
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
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!--End of Save and Update Modal -->

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

				<!-- Category Modal -->
				<div class="col-lg-12">
					<div class="modal fade" id="modalCategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
						<div class="modal-dialog">

							<div class="modal-content">

								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="H4">Division</h4>
								</div>
								<div class="modal-body">
									<div class="panel-body">
										<div class="table-responsive">
											<table class="table table-striped table-bordered table-hover" id="dtCategory">
												<thead>
													<tr>
														<th>Id</th>
														<th>Category</th>
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
				<!-- End Category Modal -->
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
	<script src="${pageContext.request.contextPath}/resources/js/divsec_usercreation.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/validator/validator.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/plugins/Sweetalert-master/lib/sweet-alert.js"></script>




	<!-- END PAGE LEVEL SCRIPTS -->
</body>
<!-- END BODY -->
</html>

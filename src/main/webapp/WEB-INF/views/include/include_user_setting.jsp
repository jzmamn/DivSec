	<!--Save and Update Modal -->
				<div class="col-lg-12">
					<div class="modal fade" id="modalUserAccount" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
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
											<form:input path="stfId" type="text" id="txtIdUCId" name="txtUCId" class="form-control" placeholder="Id" readonly="true" />
										</div>

										<div class="form-group input-group">
											<span class="input-group-addon ">Name</span>
											<form:input path="stfName" type="text" id="txtIdName" name="txtName" class="clsString form-control"
												placeholder="Enter User or Staff Name" required="true" maxlength="30" />
										</div>

										<div class="form-group input-group">
											<input type="text" class="form-control" id="txtIdDivision" name="txtDivision" readonly="true" required="true"
												placeholder="select a division" /> <span class="input-group-btn">
												<button id="btnIdShowDiv" name="btnShoeDiv" class="btn btn-warning" type="button" data-toggle="modal"
													data-target="#modalDivision">
													<i class="icon-search"></i>
												</button>
											</span>
											<form:input path="division.divId" type="text" class="form-control" id="txtIdDivisionId" name="txtDivisionId" readonly="true"
												required="true" />
										</div>

										<div class="form-group input-group">
											<input type="text" class="form-control" id="txtIdCatName" name="txtCatName" readonly="true" required="true"
												placeholder="select user category" /> <span class="input-group-btn">
												<button id="btnIdUserCat" name="btnUserCat" class="btn btn-warning" type="button" data-toggle="modal"
													data-target="#modalCategory">
													<i class="icon-search"></i>
												</button>
											</span>
											<form:input path="stfCategoryId" type="text" class="form-control" id="txtIdCatId" name="txtCatId" readonly="true" required="true" />

											<%-- <form:select path="userCategories" items="${roles}" multiple="true" itemValue="catId" itemLabel="catName" class="form-control input-sm" /> --%>
										</div>

										<div class="form-group input-group">
											<span class="input-group-addon ">User Id</span>
											<form:input path="stfUserId" type="text" id="txtIdUserId" name="txtUserId" class="clsString form-control" required="true"
												maxlength="8" placeholder="Enter Division Name" />
										</div>

										<div class="form-group input-group">
											<span class="input-group-addon ">Password</span>
											<form:input path="stfPassword" type="password" id="txtIdPwd" name="txtPwd" class="clsString form-control" required="true"
												maxlength="8" placeholder="Enter User Password" />
										</div>

										<div class="form-group input-group">
											<span class="input-group-addon "><i class="glyphicon glyphicon-phone"></i></span>
											<form:input path="stfMobile" type="number" id="txtIdMobile" name="txtMobile" class="form-control" maxlength="10"
												placeholder="Mobile phone number. e.g. 07xx xxxxxxx" />
										</div>


										<div class="form-group input-group">
											<span class="input-group-addon ">@</span>
											<form:input path="stfEmail" type="email" id="txtIdEmail" name="txtEmail" class="form-control"
												placeholder="Enter Email address. e.g. divsec@gmail.com" maxlength="100" />
										</div>

										<div class="form-group input-group">
											<span class="input-group-addon ">Note</span>
											<form:input path="stfNote" type="text" id="txtIdNote" name="txtNote" class="clsString form-control" maxlength="80"
												placeholder="Note" />
										</div>

										<div class="form-group">
											Is Active
											<form:checkbox path="stfActive" id="chkUserIsActive" />
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
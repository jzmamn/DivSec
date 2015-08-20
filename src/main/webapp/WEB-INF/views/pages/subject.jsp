
<div id="content">
	<div class="inner">
		<div class="row">
			<div class="col-lg-12">
				<h2>Subject</h2>
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
											<button class="btn">
												<i class="icon-eye-open"></i> View
											</button>
										</td>
										<td class="center"><button class="btn btn-primary">
												<i class="icon-pencil icon-white"></i> Edit
											</button></td>
										<td class="center">
											<button class="btn btn-danger">
												<i class="icon-remove icon-white"></i> Delete
											</button>
										</td>
									</tr>
									<tr class="even gradeC">
										<td>Trident</td>
										<td>Internet Explorer 5.0</td>
										<td>Win 95+</td>
										<td class="center">5</td>
										<td class="center">C</td>
										<td class="center">5</td>
										<td class="center">
											<button class="btn">
												<i class="icon-eye-open"></i> View
											</button>
										</td>
										<td class="center"><button class="btn btn-primary">
												<i class="icon-pencil icon-white"></i> Edit
											</button></td>
										<td class="center">
											<button class="btn btn-danger">
												<i class="icon-remove icon-white"></i> Delete
											</button>
										</td>

									</tr>
									<tr class="odd gradeA">
										<td>Trident</td>
										<td>Internet Explorer 5.5</td>
										<td>Win 95+</td>
										<td class="center">5.5</td>
										<td class="center">A</td>
										<td class="center">5</td>
										<td class="center">
											<button class="btn">
												<i class="icon-eye-open"></i> View
											</button>
										</td>
										<td class="center"><button class="btn btn-primary">
												<i class="icon-pencil icon-white"></i> Edit
											</button></td>
										<td class="center">
											<button class="btn btn-danger">
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
											<button class="btn">
												<i class="icon-eye-open"></i> View
											</button>
										</td>
										<td class="center"><button class="btn btn-primary">
												<i class="icon-pencil icon-white"></i> Edit
											</button></td>
										<td class="center">
											<button class="btn btn-danger">
												<i class="icon-remove icon-white"></i> Delete
											</button>
										</td>

									</tr>
									<tr class="even gradeC">
										<td>Trident</td>
										<td>Internet Explorer 5.0</td>
										<td>Win 95+</td>
										<td class="center">5</td>
										<td class="center">C</td>
										<td class="center">5</td>
										<td class="center">
											<button class="btn">
												<i class="icon-eye-open"></i> View
											</button>
										</td>
										<td class="center"><button class="btn btn-primary">
												<i class="icon-pencil icon-white"></i> Edit
											</button></td>
										<td class="center">
											<button class="btn btn-danger">
												<i class="icon-remove icon-white"></i> Delete
											</button>
										</td>

									</tr>
									<tr class="odd gradeA">
										<td>Trident</td>
										<td>Internet Explorer 5.5</td>
										<td>Win 95+</td>
										<td class="center">5.5</td>
										<td class="center">A</td>
										<td class="center">5</td>
										<td class="center">
											<button class="btn">
												<i class="icon-eye-open"></i> View
											</button>
										</td>
										<td class="center"><button class="btn btn-primary">
												<i class="icon-pencil icon-white"></i> Edit
											</button></td>
										<td class="center">
											<button class="btn btn-danger">
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
</div>

<!--Save and Update Modal -->
<div class="col-lg-12">
	<div class="modal fade" id="subjectModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="H4">New Registration</h4>
				</div>
				<div class="modal-body">
					<form role="form" id="block-validate">

						<div class="form-group">
							<label>Username</label> <input class="form-control" />
							<p class="help-block">Example block-level help text here.</p>
						</div>

						<div class="form-group">
							<label class="control-label">E-mail</label>
							<div>
								<input type="email" id="email2" name="email2"
									class="form-control" />
							</div>
						</div>

						<div class="form-group">
							<label>Email</label> <input class="form-control" />
							<p class="help-block">Example block-level help text here.</p>
						</div>
						<div class="form-group">
							<label>Password</label> <input class="form-control" />
							<p class="help-block">Example block-level help text here.</p>
						</div>
						<div class="form-group">
							<label>Retype Password</label> <input class="form-control" />
							<p class="help-block">Example block-level help text here.</p>
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
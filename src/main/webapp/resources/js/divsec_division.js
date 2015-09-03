$(document)
		.ready(
				function() {

					$('#chkIdDivActive').prop('checked', true);

					$('#dataTables-example').dataTable({
						"lengthMenu" : [ 5, 10, 20 ]
					});

					// Save Division Ajax function
					$("#frmIdDivision")
							.submit(
									function() {

										// the Controller request mapping value
										// as url.
										var url = "division/create";
										var strAlertSuccess = "<div class='alert alert-success fade in'>\
    <a href='#' class='close' data-dismiss='alert'>&times;</a>\
    <strong>Success!</strong> Your message has been sent successfully.\
</div>"

										$.ajax({
											type : "POST",
											url : url,
											data : $("#frmIdDivision")
													.serialize(),
											success : function(data) {
												$('#subjectModal')
														.modal('hide');

												alert('Saved Successfully');
												$('#alert').html(
														strAlertSuccess);

											},

											fail : function(data) {
												$('#subjectModal')
														.modal('hide');
												alert('failed');
											}
										});

										// avoid to execute the actual submit of
										// the form.
										return false;
									});

					$(function() {
						formValidation();
					});

				});

jQuery(function() {
	$('#chkIdDivActive').prop('checked', true); // check true when loading

	// Intialize Division Data Table

	var dt = $('#dtDivision').dataTable({

		// No of records should be displayed
		"lengthMenu" : [ 5, 10, 20 ],

		// Load table using JSON data by ajax
		"ajax" : {
			"url" : "division/create1",
			"dataSrc" : ""
		},

		"columns" : [ {
			"data" : "divId"
		}, {
			"data" : "divName"
		}, {
			"data" : "divActive"
		}

		],

	});

	// Form submission save and edit
	$("#frmIdDivision").submit(function() {
		// the Controller request mapping value as url.
		var url = "division/create";
		$.ajax({
			type : "POST",
			url : url,
			data : $("#frmIdDivision").serialize(),
			success : function() {
				$("#modalDivisionSave").modal("hide");
				// window.location.reload();
				dt.fnReloadAjax('division/create1');
				swal("Saved Sucessfully !", "....", "success");
			},

			fail : function() {
				$("#modalDivisionSave").modal("hide");
				swal("Save Failed !", "....", "error");
			}
		});

		// avoid to execute the actual submit of the form.
		return false;
	});

	// GET VALUE ON TABLE ROW CLICK
	$('#dtDivision tbody').on('click', 'tr', function(e) {
		var data = $(this).children("td").map(function() {
			return $(this).text();
		}).get();

		$('#txtIdDivId').val(data[0]);
		$('#txtIdDivName').val(data[1]);
		// $('#chkDivIsActive').val(data[2]);

		if (data[2] == "true") {
			blnIsDivActive = true;
		} else {
			blnIsDivActive = false;
		}

		$('#chkIdDivActive').prop('checked', blnIsDivActive);

		$("#modalDivisionSave").modal("show");

	});

	// Test function for JSON response
	$("#btn").click(function() {
		// alert('division/create1');
		// $.ajax({
		// url : 'division/create1',
		// dataType : "json"
		// }).done(function(json) {
		// alert("Success: " + json);
		// });
		// dt.fnReloadAjax();
		// table.fnReloadAjax();
		dt.fnReloadAjax('division/create1');

	});

	// Delete function
	$("#btnDelete").click(
			function(e) {
				e.preventDefault();

				if ($('#txtIdDivId').val() == "") {
					swal("Oops",
							"Please Select an Appropreate record to delete !",
							"error");
					$("#modalDivisionSave").modal("hide");
					return;
				}

				var divId = $('#txtIdDivId').val();
				var divName = $('#txtIdDivName').val();
				var url = "division/delete/" + divId;
				// alert(url);
				swal({
					title : "Are you sure?",
					text : "Are you sure that you want to delete this photo?",
					type : "warning",
					showCancelButton : true,
					closeOnConfirm : false,
					confirmButtonText : "Yes, delete it!",
					confirmButtonColor : "#ec6c62"
				}, function() {
					$.ajax({
						url : url,
						success : function(data) {
							if (data == "1") {
								swal("Deleted!",
										"Division Was Successfully Deleted!",
										"success");
								$("#modalDivisionSave").modal("hide");
								dt.fnReloadAjax('division/create1');
							} else {
								swal("Oops", data, "error");
							}
						},

						fail : function(data) {
							alert(data);
							swal("Oops", "Could Not Connect to the server!",
									"error");
						}

					});
				});
			});
});

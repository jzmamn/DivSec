jQuery(function() {

	// ==============Start Subject===================

	$('#chkSbjStgIsActive').prop('checked', true); // check true when loading

	// Intialize Subject Table

	var dtSubject = $('#dtSubject').dataTable({

		// No of records should be displayed
		"lengthMenu" : [ 5, 10, 20 ],

		// Load table using JSON data by ajax
		"ajax" : {
			"url" : "subject/loadsubject",
			"dataSrc" : ""
		},

		"columns" : [ {
			"data" : "sbjId"
		}, {
			"data" : "sbjName"
		}, {
			"data" : "sbjActive"
		}

		]
	});

	// Intialize Subject Stage Table
	var dtSbjStage = $('#dtSbjStg').dataTable({

		// No of records should be displayed
		"lengthMenu" : [ 5, 10, 20 ],

		// Load table using JSON data by ajax
		"ajax" : {
			"url" : "sbjstages/loadsbjstage/0",
			"dataSrc" : ""
		},

		"columns" : [ {
			"data" : "stgId"
		}, {
			"data" : "stgName"
		}, {
			"data" : "subject.sbjName"
		}, {
			"data" : "stgActive"
		}

		]
	});

	// Form submission save and edit
	$("#frmIdSbjStg").submit(function() {

		if ($('#txtIdSbjId').val() == "") {
			alert('Select a Subject');
			return;
		}

		if ($('#txtIdStgName').val() == "") {
			alert('Enter a Subject Stage');
			return;
		}

		var sbjId = ('#txtIdSbjId').val();

		// the Controller request mapping value as url.
		var url = "sbjstages/create";
		$.ajax({
			type : "POST",
			url : url,
			data : $("#frmIdSubject").serialize(),
			success : function(res) {

				if (res == "1") {

					dtSbjStage.fnReloadAjax('sbjstages/loadsbjstage/' + sbjId);
					swal("Saved Sucessfully !", "....", "success");
					('#txtIdStgName').val() == "";

				} else {
					swal("Oops", res, "error");
				}
			},

			fail : function(res) {
				$("#modalSubject").modal("hide");
				swal("Save Failed !", res, "error");
			}
		});

		// avoid to execute the actual submit of the form.
		return false;
	});

	$("#btn").click(function() {
		dtSubject.fnReloadAjax('subject/loadsubject');
		// alert('usercreation/loaduser');
		// $.ajax({
		// url : 'usercreation/loaduser',
		// dataType : "json"
		// }).done(function(json) {
		// alert("Success: " + json);
		// });

	});

	// GET VALUE ON TABLE ROW CLICK From Subject table

	$('#dtSubject tbody').on('click', 'tr', function(e) {

		var aPos = dtSubject.fnGetPosition(this);
		var sbjId = dtSubject.fnGetData(aPos, 0)
		$('#txtIdSbjId').val(dtSubject.fnGetData(aPos, 0));
		$('#txtIdSbjName').val(dtSubject.fnGetData(aPos, 1));
		$("#modalSubject").modal("hide");
		dtSbjStage.fnReloadAjax('sbjstages/loadsbjstage/' + sbjId);
	});

	// Delete function
	$("#btnDelete").click(
			function(e) {
				e.preventDefault();

				var sbjId = ('#txtIdSbjId').val();

				if ($('#txtIdSbjId').val() == "") {
					swal("Oops", "Select a record to delete !", "error");
					$("#modalSubject").modal("hide");
					return;
				}

				var subjectId = $('#txtIdSbjId').val();

				var url = "subject/delete/" + subjectId;
				// alert(url);
				swal({
					title : "Are you sure?",
					text : "Are you sure that you want to delete this Staff?",
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
								dtSbjStage
										.fnReloadAjax('sbjstages/loadsbjstage/'
												+ sbjId);
								swal("Deleted!",
										"Stage has been Successfully Deleted!",
										"success");
							} else {
								swal("Error", data, "error");
							}
						},

						fail : function(data) {
							alert(data);
							swal("Error", "Could Not Connect to the server!",
									"error");
						}
					});
				});
			});

});
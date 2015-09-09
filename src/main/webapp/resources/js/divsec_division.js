jQuery(function() {
	$('#chkIdDivActive').prop('checked', true); // check true when loading

	// Intialise Data Table
	$('#dtDivision').dataTable({
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

		]
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

		$("#modlDivisionSave").modal("show");

	});

	// Test function for JSON response
	$("#btn").click(function() {
		alert('division/create1');
		$.ajax({
			url : 'division/create1',
			cache : false
		}).done(function(html) {
			alert(html);
		});

	});

	// =====Display View=====
	$("#btnView").click(function() {
		oTable = $('#dtDivision').dataTable();
		oTable.$('tr').click(function() {
			var data = oTable.fnGetData(this);

			$('#lblDivId').html(data[0]);
			$('#lblDivName').html(data[1]);
			$('#lblDivActive').html(data[2]);

		});
	});

	// =====Save Division Ajax function=====

	$("#btnSave").click(function() {

		// the Controller request mapping value as url.
		var url = "division/create";

		$.ajax({
			type : "POST",
			url : url,
			data : $("#frmIdDivision").serialize(),
			success : function() {
				$('#modlDivisionSave').modal('hide');
				swal("Saved Sucessfully !", "....", "success");
			},

			fail : function() {
				$('#subjectModal').modal('hide');
				swal("Saved Sucessfully !", "....", "error");
			}
		});

		// avoid to execute the actual submit of the form.

		return false;

	});

	$(function() {
		formValidation();
	});

});

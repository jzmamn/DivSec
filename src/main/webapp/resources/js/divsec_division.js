jQuery(function() {
	$('#chkIdDivActive').prop('checked', true); // check true when loading

	initDatatable();
	frmDivsSubmit();
	rowClick();

	// Test function for JSON response
	$("#btn").click(function() {
		// alert('division/create1');
		// $.ajax({
		// url : 'division/create1',
		// cache : false
		// }).done(function(html) {
		// alert(html);
		// });

	});

	// =====Save Division Ajax function=====

	$(function() {
		formValidation();
	});

});

function frmDivsSubmit() {
	$("#frmIdDivision").submit(function() {
		// the Controller request mapping value as url.
		var url = "division/create";
		$.ajax({
			type : "POST",
			url : url,
			data : $("#frmIdDivision").serialize(),
			success : function() {
				$("#modalDivisionSave").modal("hide");
				window.location.reload();
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

}

function initDatatable() {
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
}

function rowClick() {
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

}

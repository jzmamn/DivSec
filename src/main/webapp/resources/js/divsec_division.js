$(document).ready(function() {

	$('#chkIdDivActive').prop('checked', true);

	$("#btn").click(function() {
		alert('division/create1');
		$.ajax({
			url : 'division/create1',
			cache : false
		}).done(function(html) {
			alert(html);
		});

	});

	$('#dtDivision').dataTable({
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

	// 'open' an information row when a row is clicked on
	oTable = $('#dtDivision').dataTable();
	oTable.$('tr').click(function() {
		alert(data[0])

	});

	// =====Load row values in to the feilds====

	$("#btnEdit").click(function() {
		var blnIsDivActive = false;
		oTable = $('#dtDivision').dataTable();
		oTable.$('tr').click(function() {
			var data = oTable.fnGetData(this);
			$('#txtIdDivId').val(data[0]);
			$('#txtIdDivName').val(data[1]);

			if (data[2] == "true") {
				blnIsDivActive = true;
			} else {
				blnIsDivActive = false;
			}

			$('#chkIdDivActive').prop('checked', blnIsDivActive);

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
	$("#frmIdDivision").submit(function() {

		// the Controller request mapping value as url.
		var url = "division/create";

		$.ajax({
			type : "POST",
			url : url,
			data : $("#frmIdDivision").serialize(),
			success : function() {
				$('#subjectModal').modal('hide');
				alert('hi');
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

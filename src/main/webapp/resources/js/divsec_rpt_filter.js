jQuery(function() {

	// Load Requests in the report

	// Filter for request Id

	// ------------------Filter for Subject---------------

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
			"data" : "sbjCode"
		}, {
			"data" : "sbjActive"
		}

		]
	});

	$('#dtSubject tbody').on('click', 'tr', function(e) {
		var aPos = dtSubject.fnGetPosition(this);
		var sbjId = dtSubject.fnGetData(aPos, 0)
		$('#txtIdSbjId').val(dtSubject.fnGetData(aPos, 0));
		$('#txtIdSbjName').val(dtSubject.fnGetData(aPos, 1));
		$("#modalSubject").modal("hide");

	});

	// ------------------End Filter for Subject---------------

	// ------------------ Filter for Public Id ------------------

	// Intialize Public Table
	var dtPublic = $('#dtPublic').dataTable({

		// No of records should be displayed
		"lengthMenu" : [ 5, 10, 20 ],

		// Load table using JSON data by ajax
		"ajax" : {
			"url" : "public/loadpi",
			"dataSrc" : ""
		},

		"columns" : [ {
			"data" : "piId"
		}, {
			"data" : "piName"
		}, {
			"data" : "piNic"
		}

		]

	});

	$('#dtPublic tbody').on('click', 'tr', function(e) {
		var aPos = dtPublic.fnGetPosition(this);
		var sbjId = dtPublic.fnGetData(aPos, 0)
		$('#txtIdPublicId').val(dtPublic.fnGetData(aPos, 0));
		$('#txtIdPublicName').val(dtPublic.fnGetData(aPos, 1));
		$("#modalPublic").modal("hide");
	});

	// ------------------ End Filter for Public Id ------------------

	// ------------------Filter for Division ------------------

	// Intialize Division Data Table
	var dtDivision = $('#dtDivision').dataTable({

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

	// GET VALUE ON TABLE ROW CLICK FROM DIVISION TABLE
	$('#dtDivision tbody').on('click', 'tr', function(e) {
		var data = $(this).children("td").map(function() {
			return $(this).text();
		}).get();

		$('#txtIdDivisionId').val(data[0]);
		$('#txtIdDivision').val(data[1]);

		$("#modalDivision").modal("hide");
	});

	// ------------------End Filter for Division ------------------

	// ------------------ Filter for Request Status ------------------

	// request the JSON data and parse into the select element
	$.ajax({
		url : 'requestStatus/load-req-status',
		dataType : 'JSON',
		success : function(res) {
			$("#cmdIdReqStatus").select2({
				placeholder : "Select a Stauts",
				allowClear : true,
				data : res
			});
		},
		error : function(err) {
			alert(err);
		}
	});

	$("#cmdIdReqStatus").change(function() {
		var theID = $("#cmdIdReqStatus").val();
		$("#idCmbReqStausId").val(theID);
	});

	var selStaff = ""

	$.ajax({
		url : 'usercreation/load-staff-dropdown',
		dataType : 'JSON',
		success : function(res) {
			$("#selStaff").select2({
				placeholder : "Select a staff",
				allowClear : true,
				data : res
			});
		},
		error : function(err) {
			alert("Load Staff \n" + err);
		}
	});

	$("#selStaff").change(function() {
		var theID = $("#selStaff").val();
		$("#idStaff").val(theID);
	});

	// ------------------ END Filter for Request Status ------------------

	// ------------------ Filter for Date Range ------------------
	// ------------------ END Filter for Date Range ------------------

});

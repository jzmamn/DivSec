jQuery(function() {

	$("#frmProcessRequest").hide({});

	$('#dtTable').dataTable({
		"lengthMenu" : [ 5, 10, 20 ],
	// url: '/api/myData',
	// columns: [
	// {data: 'name'},
	// {data: 'position'},
	// {data: 'salary'},
	// ]

	});

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
			"data" : "sbjCode"
		}, {
			"data" : "sbjActive"
		}, {
			"data" : "division.divId"
		}, {
			"data" : "division.divName"
		}, {
			"data" : "sbjDuration"
		}, {
			"data" : "sbjCost"
		}

		],

		"columnDefs" : [ {
			"targets" : [ 3 ],
			"visible" : false
		}, {
			"targets" : [ 4 ],
			"visible" : false
		}, {
			"targets" : [ 5 ],
			"visible" : false
		}, {
			"targets" : [ 6 ],
			"visible" : false
		} ]
	});

	// GET VALUE ON TABLE ROW CLICK From Subject table

	$('#dtPublic tbody').on('click', 'tr', function(e) {
		var aPos = dtPublic.fnGetPosition(this);
		var sbjId = dtPublic.fnGetData(aPos, 0)
		$('#txtIdPublicId').val(dtPublic.fnGetData(aPos, 0));
		$('#txtIdPublicName').val(dtPublic.fnGetData(aPos, 1));
		$("#modalPublic").modal("hide");
	});

	// GET VALUE ON TABLE ROW CLICK From PUBLIC table

	$('#dtSubject tbody').on('click', 'tr', function(e) {
		var aPos = dtSubject.fnGetPosition(this);
		var sbjId = dtSubject.fnGetData(aPos, 0)
		$('#txtIdSubjectId').val(dtSubject.fnGetData(aPos, 0));
		$('#txtIdSubject').val(dtSubject.fnGetData(aPos, 1));
		$('#txtIdDivisionId').val(dtSubject.fnGetData(aPos, 3));
		$('#txtIdDivisionName').val(dtSubject.fnGetData(aPos, 4));
		$('#txtIdReqFee').val(dtSubject.fnGetData(aPos, 5));
		$('#txtIdDuration').val(dtSubject.fnGetData(aPos, 6));

		$("#modalSubject").modal("hide");
		dtSbjStg.fnReloadAjax('sbjstages/loadsbjstage');
	});

	$('#dp1').datepicker('setDate', new Date());
	$('#dp1').datepicker('update');

	oTable = $('#dtTable').dataTable();
	oTable.$('tr').click(function() {
		$("#frmProcessRequest").show({});
		$('#tblProcessRequest').hide({});
	});

	$("#idApprove").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
	});

	$("#idOpened").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
	});

	$("#idApproval").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
	});

	$("#idCompleted").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
	});

	$("#idClosed").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});

	});

	// Load Public Table

	$('#dtStage').dataTable({
		"lengthMenu" : [ 5, 10, 20 ],
	});

	oTable1 = $('#dtStage').dataTable();
	oTable1.$('tr').click(function() {
		$("#idModalReqStage").modal('show');
	});

	var $select = $('#people');
	// request the JSON data and parse into the select element
	$.ajax({
		url : 'request_status_stages.JSON',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the select
			$select.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
				$select.append('<option id="' + val.id + '">' + val.name
						+ '</option>');
			})
		},
		error : function() {
			// if there is an error append a 'none available' option
			$select.html('<option id="-1">none available</option>');
		}
	});

	$select.change(function() {
		var str1 = "";
		var str2 = "";
		str1 = $(this).children(":selected").attr("id");

		$("select option:selected").each(function() {
			str2 = $(this).text() + " ";
			$("#id").text(str1);
			$("#name").text(str2);
		});

	}).trigger("change");

	var $select1 = $('#cmdIdReqStatus');
	// request the JSON data and parse into the select element
	$.ajax({
		url : 'request_status.JSON',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the select
			$select1.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
				$select1.append('<option id="' + val.id + '">' + val.name
						+ '</option>');
			})
		},
		error : function() {
			// if there is an error append a 'none available' option
			$select1.html('<option id="-1">none available</option>');
		}
	});

	$select1.change(function() {
		var str1 = "";
		var str2 = "";
		str1 = $(this).children(":selected").attr("id");

		$("select option:selected").each(function() {
			str2 = $(this).text() + " ";
			$("#idCmbReqStausId").text(str1);
			$("#idCmbReqStausName").text(str2);
		});

	}).trigger("change");

});

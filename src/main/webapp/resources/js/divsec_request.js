jQuery(function() {

	$("#frmProcessRequest").hide({});

	var dtRequest = $('#dtTable')
			.dataTable(
					{

						// No of records should be displayed
						"lengthMenu" : [ 5, 10, 20 ],

						// Load table using JSON data by ajax
						"ajax" : {
							"url" : "reqprocess/loadrequest",
							"dataSrc" : ""
						},

						"columns" : [ {
							"data" : "reqId"
						}, {
							"data" : "requestStatus.rsId"
						}, {
							"data" : "requestStatus.rsName"
						}, {
							"data" : "subject.sbjId"
						}, {
							"data" : "subject.sbjCode"
						}, {
							"data" : "reqEntDate"
						}, {
							"data" : "publicIndividual.piId"
						}, {
							"data" : "publicIndividual.piName"
						}, {
							"data" : "division.divId"
						}, {
							"data" : "division.divName"
						}, {
							"data" : "reqNote"
						}, {
							"data" : "staff.stfId"
						}, {
							"data" : "staff.stfName"
						}, {
							"data" : "reqFees"
						}, {
							"data" : "reqDurartion"
						} ],

						"columnDefs" : [
								{
									"targets" : [ 2 ],
									"visible" : false
								},
								{
									"targets" : [ 3 ],
									"visible" : false
								},
								{
									"targets" : [ 1 ],
									"render" : function(data, type, full, meta) {

										switch (data) {
										case 1:
											return '<span class="label label-info">New</span>';
											break;
										case 2:
											return '<span class="label label-warning">Opened</span>';
											break;
										case 3:
											return '<span class="label label-success">completed</span>';
											break;
										case 4:
											return '<span class="label label-default">Closed</span>';
											break;
										case 5:
											return '<span class="label label-danger">For Approval</span>';
											break;
										}
									}
								}, {
									"targets" : [ 8 ],
									"visible" : false
								}, {
									"targets" : [ 9 ],
									"visible" : false
								}, {
									"targets" : [ 10 ],
									"visible" : false
								}, {
									"targets" : [ 11 ],
									"visible" : false
								}, {
									"targets" : [ 12 ],
									"visible" : false
								}, {
									"targets" : [ 13 ],
									"visible" : false
								}, {
									"targets" : [ 14 ],
									"visible" : false
								} ]

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

	// Load Request stage table

	var dtStage = $('#dtStage')
			.dataTable(
					{
						"lengthMenu" : [ 5, 10, 20 ],

						// Load table using JSON data by ajax
						"ajax" : {
							"url" : "processstg/loadreqstage/0",
							"dataSrc" : ""
						},

						"columns" : [ {
							"data" : "rstId"
						}, {
							"data" : "subjecStage.stgId"
						}, {
							"data" : "subjecStage.stgName"
						}, {
							"data" : "stageStatus.ssId"
						}, {
							"data" : "request.reqId"
						}

						],

						"columnDefs" : [
								{
									"targets" : [ 1 ],
									"visible" : false
								},
								{
									"targets" : [ 4 ],
									"visible" : false
								},
								{
									"targets" : [ 3 ],
									"render" : function(data, type, full, meta) {

										switch (data) {
										case 1:
											return '<span class="label label-warning">Pending</span>';
											break;
										case 2:
											return '<span class="label label-success">In-Progress</span>';
											break;
										case 3:
											return '<span class="label label-info">completed</span>';
											break;

										}
									}
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
		$('#txtIdDuration').val(dtSubject.fnGetData(aPos, 5));
		$('#txtIdReqFee').val(dtSubject.fnGetData(aPos, 6));

		$("#modalSubject").modal("hide");

	});

	// New Request Form submission save and edit
	$("#frmIdRequest").submit(function() {
		// the Controller request mapping value as url.
		var url = "reqprocess/create";
		$.ajax({
			type : "POST",
			url : url,
			data : $("#frmIdRequest").serialize(),
			success : function() {
				$("#idModalRequest").modal("hide");
				swal("Saved Sucessfully !", "....", "success");
				dtRequest.fnReloadAjax('reqprocess/loadrequest');

			},

			fail : function() {
				$("#idModalRequest").modal("hide");
				swal("Save Failed !", "....", "error");
			}
		});

		// avoid to execute the actual submit of the form.
		return false;
	});

	$('#dp1').datepicker('setDate', new Date());
	$('#dp1').datepicker('update');

	// Request table row Click and Fill the request info
	// PublicId,Status and void can be updated manually

	$('#dtTable tbody').on('click', 'tr', function(e) {
		$("#frmProcessRequest").show({});
		$('#tblProcessRequest').hide({});

		var aPos = dtRequest.fnGetPosition(this);
		var reqId = dtRequest.fnGetData(aPos, 0);

		$('#spnReqId').text(dtRequest.fnGetData(aPos, 0));
		$('#txtIdReqId').val(dtRequest.fnGetData(aPos, 0));

		$('#idCmbReqStausId').val(dtRequest.fnGetData(aPos, 1));
		$('#cmdIdReqStatus').val(dtRequest.fnGetData(aPos, 2));

		$('#spnSbjId').text(dtRequest.fnGetData(aPos, 3));
		$('#spnSbj').text(dtRequest.fnGetData(aPos, 4));
		$('#spnDate').text(dtRequest.fnGetData(aPos, 5));

		$('#spnPubId').text(dtRequest.fnGetData(aPos, 6));
		$('#txtIdPublic').val(dtRequest.fnGetData(aPos, 6));

		$('#spnPubName').text(dtRequest.fnGetData(aPos, 7));
		$('#spnDivId').text(dtRequest.fnGetData(aPos, 8));
		$('#spnDivision').text(dtRequest.fnGetData(aPos, 9));
		$('#spnRemark').text(dtRequest.fnGetData(aPos, 10));

		$('#spnStaffId').text(dtRequest.fnGetData(aPos, 11));
		$('#txtIdStaff').val(dtRequest.fnGetData(aPos, 11));

		$('#spnStaff').text(dtRequest.fnGetData(aPos, 12));

		$('#spnFee').text(dtRequest.fnGetData(aPos, 13));
		$('#spnDuration').text(dtRequest.fnGetData(aPos, 14));

		dtStage.fnReloadAjax('processstg/loadreqstage/' + reqId);

	});

	$('#dtStage tbody').on('click', 'tr', function(e) {
		$('#idModalReqStage').modal('show');

	});

	$("#idAll").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
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
		url : 'requestStatus/loadStatus',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the select
			$select1.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
				$select1.append('<option id="' + val.rsId + '">' + val.rsName
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
			$("#idCmbReqStausId").val(str1);
			$("#idCmbReqStausName").text(str2);
		});

	}).trigger("change");

	// Update Request after changing status
	$("#btnIdSaveChanges").click(function(e) {

		var reqId = $("#txtIdReqId").val();
		var stausId = $("#idCmbReqStausId").val();
		var url = 'reqprocess/requestid/requestId/statusid/statusId'
		alert(url);
		e.preventDefault(),

		function() {
			$.ajax({
				type : "POST",
				url : url,
				data : {
					requestId : $("#txtIdReqId").val(),
					statusId : $("#idCmbReqStausId").val()
				},
				dataType : 'json',
				success : function(data) {
					alert(data);
				},

				fail : function(data) {
					alert(data);
				}

			});
		};
	});

});

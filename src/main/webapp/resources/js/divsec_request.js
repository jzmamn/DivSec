jQuery(function() {

	$("#frmProcessRequest").hide({});

	// batch numbers load

	$.ajax({
		type : 'GET',
		url : 'reqprocess/batchcount',
		dataType : 'json',
		success : function(data) {
			var newReq = 0;
			var opened = 0;

			$.each(data, function(index, element) {
				newReq += element.count;
			});

			$.each(data, function(index, element) {

				switch (element.rs_name) {
				case "New":
					// All pills batch number
					$("#spnIdNew").text(newReq);
					break;
				case "Opened":
					$("#spnIdOpened").text(element.count);
					break;
				case "Completed":
					$("#spnIdCompleted").text(element.count);
					break;
				case "Closed":
					$("#spnIdClosed").text(element.count);
					break;
				// case "Rejected":
				// break;
				case "Approved":
					$("#spnIdApprove").text(element.count);
					break;
				case "ToBeApp":
					$("#spnIdApproval").text(element.count);
					break;
				}

				// alert(element.rs_name + ':' + index);
			});
		},
		error : function(data) {
			alert('aymen2 fail' + data);
		}
	});

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
						}, {
							"data" : "reqIsVoid"
						} ],

						"order" : [ [ 0, "desc" ] ],

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
							"data" : "stageStatus.ssName"
						}, {
							"data" : "request.reqId"
						}, {
							"data" : "rstNote"
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
									"targets" : [ 5 ],
									"visible" : false
								},
								{
									"targets" : [ 6 ],
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
				$("#frmProcessRequest").hide({});
				$('#tblProcessRequest').show({});
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

	$('#idTxtInstDate').datepicker('setDate', new Date());
	$('#idTxtInstDate').datepicker('update');

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

		// $('#spnRemark').text(dtRequest.fnGetData(aPos, 10));
		$('#txtIdNote').val(dtRequest.fnGetData(aPos, 10));

		$('#spnStaffId').text(dtRequest.fnGetData(aPos, 11));
		$('#txtIdStaff').val(dtRequest.fnGetData(aPos, 11));
		$('#txtIdUserId').val(dtRequest.fnGetData(aPos, 11));

		$('#spnStaff').text(dtRequest.fnGetData(aPos, 12));

		$('#spnFee').text(dtRequest.fnGetData(aPos, 13));
		$('#spnDuration').text(dtRequest.fnGetData(aPos, 14));

		if (dtRequest.fnGetData(aPos, 15) == true) {
			blnIsDivActive = true;
		} else {
			blnIsDivActive = false;
		}

		$('#chkIdPiActive').prop('checked', blnIsDivActive);
		dtStage.fnReloadAjax('processstg/loadreqstage/' + reqId);

		// Instruction
		$('#txtIdInsStfId').val(dtRequest.fnGetData(aPos, 11));
		$('#txtIdInsIsRead').val(0);
		$('#txtIdInstReqId').val(dtRequest.fnGetData(aPos, 0));

		getInstruction(parseInt(reqId));

	});

	$('#dtStage tbody').on('click', 'tr', function(e) {
		var aPos = dtStage.fnGetPosition(this);
		var reqId = dtStage.fnGetData(aPos, 0);
		$('#txtIdReqStgId').val(dtStage.fnGetData(aPos, 0));
		$('#idTxtReqStgSts').val(dtStage.fnGetData(aPos, 3));
		$('#idCmbReqStgSts').val(dtStage.fnGetData(aPos, 4));
		$('#txtIdStgNote').val(dtStage.fnGetData(aPos, 6));

		$('#idModalReqStage').modal('show');
	});

	$("#idAll").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
		dtRequest.fnReloadAjax('reqprocess/loadrequest');
	});

	$("#idApprove").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
		dtRequest.fnReloadAjax('reqprocess/status/6');
	});

	$("#idOpened").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
		dtRequest.fnReloadAjax('reqprocess/status/2');
	});

	$("#idApproval").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
		dtRequest.fnReloadAjax('reqprocess/status/5');
	});

	$("#idCompleted").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
		dtRequest.fnReloadAjax('reqprocess/status/3');
	});

	$("#idClosed").click(function() {
		$("#frmProcessRequest").hide({});
		$('#tblProcessRequest').show({});
		dtRequest.fnReloadAjax('reqprocess/status/4');

	});

	// var $select = $('#people');
	// // request the JSON data and parse into the select element
	// $.ajax({
	// url : 'request_status_stages.JSON',
	// dataType : 'JSON',
	// success : function(data) {
	// // clear the current content of the select
	// $select.html('');
	// // iterate over the data and append a select option
	// $.each(data, function(key, val) {
	// $select.append('<option id="' + val.id + '">' + val.name
	// + '</option>');
	// })
	// },
	// error : function() {
	// // if there is an error append a 'none available' option
	// $select.html('<option id="-1">none available</option>');
	// }
	// });

	// $select.change(function() {
	// var str1 = "";
	// var str2 = "";
	// str1 = $(this).children(":selected").attr("id");
	//
	// $("select option:selected").each(function() {
	// str2 = $(this).text() + " ";
	// $("#id").text(str1);
	// $("#name").text(str2);
	// });
	//
	// }).trigger("change");

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

	// Load Stage status in the Dropdown
	var $select2 = $('#idCmbReqStgSts');
	// request the JSON data and parse into the select element
	$.ajax({
		url : 'stageStatus/loadStageStaus',
		dataType : 'JSON',
		success : function(data) {
			// clear the current content of the select
			$select2.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
				$select2.append('<option id="' + val.ssId + '">' + val.ssName
						+ '</option>');
			})
		},
		error : function() {
			// if there is an error append a 'none available' option
			$select2.html('<option id="-1">none available</option>');
		}
	});

	$select2.change(function() {
		var str1 = "";
		var str2 = "";
		str1 = $(this).children(":selected").attr("id");

		$("select option:selected").each(function() {
			str2 = $(this).text() + " ";
			$("#idTxtReqStgSts").val(str1);
			$("#idCmbReqStausName").text(str2);
		});

	}).trigger("change");

	// Update Request after changing status
	$("#btnIdSaveChanges").click(
			function(e) {
				var reqId = $("#txtIdReqId").val();
				var stausId = $("#idCmbReqStausId").val();
				var d = $("#txtIdNote").val();

				var a = parseInt(reqId);
				var b = parseInt(stausId);
				var d = $("#txtIdNote").val();

				if ($('#chkIdPiActive').is(":checked")) {
					c = true;
				} else {
					c = false;
				}

				var url1 = 'reqprocess/requestid/' + a + '/statusid/' + b
						+ '/void/' + c + '/note/' + d;

				$.ajax({
					type : 'GET',
					url : url1,
					success : function() {
						dtRequest.fnReloadAjax('reqprocess/loadrequest');
						$("#frmProcessRequest").hide({});
						$('#tblProcessRequest').show({});
					},
					error : function(data) {
						alert('aymen2 fail' + data);
					}
				});
			});

	$("#btnSaveStg").click(
			function(e) {
				var reqId = $("#txtIdReqId").val();
				var reqStgId = $("#txtIdReqStgId").val();
				var stausId = $("#idTxtReqStgSts").val();
				var c = $("#txtIdStgNote").val();

				var a = parseInt(reqStgId);
				var b = parseInt(stausId);

				// alert('/reqstgid/' + a + '/statusid/' + b + '/note/' + c);

				if (c == "") {
					c = "stage";
				}

				var url1 = 'processstg/reqstgid/' + a + '/statusid/' + b
						+ '/note/' + c;

				$.ajax({
					type : 'GET',
					url : url1,
					success : function() {
						$("#idModalReqStage").modal("hide");
						dtStage
								.fnReloadAjax('processstg/loadreqstage/'
										+ reqId);
					},
					error : function(data) {
						alert('fail ' + data);
					}
				});
			});

	// Instruction submission

	// Update Request after changing status
	$("#btnIdAddInstruction").click(
			function(e) {

				// /{requestId}/{instruction}/{instDate}/{isRead}/{stfId}/

				var reqId = $("#txtIdInstReqId").val();
				var inst = $("#txtIdInstruction").val();
				var instDate = $("#idTxtInstDate").val();
				var isRead = $("#txtIdInsIsRead").val();
				var instStaffId = $("#txtIdInsStfId").val();

				var a = parseInt(reqId);

				var b = parseInt(instStaffId);

				if (isRead == "1") {
					c = true;
				} else {
					c = false;
				}

				var url1 = 'reqprocess/instruction/' + a + '/' + inst + '/' + c
						+ '/' + b;

				// alert(url1);

				$.ajax({
					type : 'GET',
					url : url1,
					success : function() {
						getInstruction(a);
					},
					error : function(data) {
						alert('aymen2 fail' + data);
					}
				});
			});

	var $textArea = $('#txtIdAreaInstruction');

	// function getInstruction(reqId) {
	// alert('reqprocess/inst/' + reqId);
	//
	// $textArea.html('');
	//
	// $.ajax({
	// type : 'GET',
	// url : 'reqprocess/inst/' + reqId,
	//
	// success : function(data) {
	// $.each(data, function(key, val) {
	// $textArea.append(val.insInstruction);
	// $('#fake_textarea_content').val(
	// $('#txtIdAreaInstruction').html());
	// })
	// },
	// error : function(data) {
	// alert('getInstruction fail' + data);
	// }
	// });

	var list = '';
	var list1 = '';
	var list2 = '';

	function getInstruction(reqId) {
		alert('reqprocess/inst/' + reqId);

		$textArea.html('');

		$
				.ajax({
					type : 'GET',
					url : 'reqprocess/inst/' + reqId,

					success : function(data) {

						var x = 1;
						$
								.each(
										data,
										function(key, val) {

											x = x + 1;
											res = x % 2;

											if (res == 0) {

												list1 = '<li> \n<div class="chat-body clearfix"> \n<div class="header"> \n<p class= "text-left"> \n<strong>Division </strong> \n</p> \n</div> \n<p>'
														+ val.insInstruction
														+ '</p> \n<p class="text-primary pull-right"> \n<i class="icon-time"></i><em>'
														+ val.insDate
														+ '</em> \n</p> \n</div> \n</li> <hr/>';

											} else {

												list1 = '<li> \n<div class="chat-body clearfix"> \n<div class="header"> \n<p class= "text-right"> \n<strong>Division </strong> \n</p> \n</div> \n<p>'
														+ val.insInstruction
														+ '</p> \n<p class="text-primary pull-left"> \n<i class="icon-time"></i><em>'
														+ val.insDate
														+ '</em> \n</p> \n</div> \n</li> <hr/>';

											}

											list += list1;

										})
						alert('completed ' + list);
						$('#idInst').append(list);

					},
					error : function(data) {
						alert('getInstruction fail' + data);
					}
				});

	}

});

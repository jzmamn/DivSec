jQuery(function() {
	var dtRequest = $('#dtTable')
			.dataTable(
					{
						// No of records should be displayed
						"lengthMenu" : [ 40 ],

						// Load table using JSON data by ajax
						"ajax" : {
							"url" : "rptrequeststage/loadrequestStage",
							"dataSrc" : ""
						},

						"columns" : [ {
							"data" : "req_id"
						}, {
							"data" : "req_status_id"
						}, {
							"data" : "rs_name"
						}, {
							"data" : "req_subject_id"
						}, {
							"data" : "sbj_code"
						}, {
							"data" : "rst_stg_id"
						}, {
							"data" : "stg_name"
						}, {
							"data" : "rst_stage_status_id"
						}, {
							"data" : "ss_name"
						}, {
							"data" : "req_ent_date"
						}, {
							"data" : "req_public_id"
						}, {
							"data" : "pi_name"
						}, {
							"data" : "req_division_id"
						}, {
							"data" : "div_name"
						}, {
							"data" : "req_note"
						}, {
							"data" : "rst_user_id"
						}, {
							"data" : "stf_name"
						}, {
							"data" : "req_fees"
						}, {
							"data" : "req_durartion"
						}, {
							"data" : "req_is_void"
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
									"targets" : [ 5 ],
									"visible" : false
								},

								{
									"targets" : [ 8 ],
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
										default:
											return 'Stage Not Available';

										}
									}
								},
								{
									"targets" : [ 7 ],
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
								},
								{
									"targets" : [ 9 ],
									"render" : function(data, type, full, meta) {
										var currentTime = new Date(data);
										var month = currentTime.getMonth() + 1;
										var month1 = month.toString();

										if (month1.length < 2) {
											month1 = "0" + month1;
										}

										var day = currentTime.getDate();
										var day1 = day.toString();

										if (day1.length < 2) {
											day1 = "0" + day1;
										}

										var year = currentTime.getFullYear();

										var date = year + "-" + month1 + "-"
												+ day1;

										return date;

									}
								}, {
									"targets" : [ 10 ],
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
								}, {
									"targets" : [ 15 ],
									"visible" : false
								}, {
									"targets" : [ 16 ],
									"visible" : false
								}, {
									"targets" : [ 17 ],
									"visible" : false
								}, {
									"targets" : [ 18 ],
									"visible" : false
								}, {
									"targets" : [ 19 ],
									"visible" : false
								} ],
						dom : 'Bfrtip',
						buttons : [
								{
									extend : 'copyHtml5',
									exportOptions : {
										columns : [ 0, ':visible' ]
									}
								},
								{
									extend : 'excelHtml5',
									exportOptions : {
										columns : ':visible'
									}
								},

								{
									extend : 'pdfHtml5',

								},
								'colvis',

								{
									text : 'Filter',
									action : function(e, dt, node, config) {
										$("#mdlReqFilter").modal("show");
									}

								},
								{
									extend : 'print',
									message : 'Request List',
									exportOptions : {
										columns : ':visible'
									}

								},
								{
									text : 'Refresh',
									action : function(e, dt, node, config) {
										dtRequest
												.fnReloadAjax('rptrequeststage/loadrequestStage');
									}

								} ]

					});

	// ------------------ Apply Filter------------------
	$("#btnIdApplyFilter").click(
			function(e) {
				var url1 = "";
				var reqId = $("#idTxtRequest").val();
				var sbjId = $("#txtIdSbjId").val();
				var pubId = $("#txtIdPublicId").val();
				var divId = $("#txtIdDivisionId").val();
				var statusId = $("#idCmbReqStausId").val();
				var fromDate = $("#dpFrom").val();
				var toDate = $("#dpTo").val();

				if (reqId === "") {
					reqId = "0";
				}

				if (sbjId === "") {
					sbjId = "0";
				}

				if (pubId === "") {
					pubId = "0";
				}

				if (divId === "") {
					divId = "0";
				}

				if (statusId === "") {
					statusId = "0";
				}

				if (fromDate === "") {
					fromDate = "0";
				}

				if (toDate === "") {
					toDate = "0";
				}

				var intReqId = parseInt(reqId);
				var intSbjId = parseInt(sbjId);
				var intPubId = parseInt(pubId);
				var intDivId = parseInt(divId);
				var intStausId = parseInt(statusId);

				if (intReqId == 0 && intSbjId == 0 && intPubId == 0
						&& intDivId == 0 && intStausId == 0 && fromDate === "0"
						&& toDate === "0") {

					$("#mdlReqFilter").modal("hide")
					dtRequest.fnReloadAjax('rptrequeststage/loadrequestStage');

				} else {
					url1 = 'rptrequeststage/filterby/' + intReqId + '/'
							+ intSbjId + '/' + intPubId + '/' + intDivId + '/'
							+ intStausId + '/' + fromDate + '/' + toDate;

					alert(url1);

					$("#mdlReqFilter").modal("hide")
					dtRequest.fnReloadAjax(url1);
				}

			});

});
// ------------------ END Apply Filter------------------

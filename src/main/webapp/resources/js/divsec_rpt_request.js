jQuery(function() {
	var dtRequest = $('#dtTable')
			.dataTable(
					{
						// No of records should be displayed
						"lengthMenu" : [ 40 ],

						// Load table using JSON data by ajax
						"ajax" : {
							"url" : "rptrequest/loadrequest",
							"dataSrc" : ""
						},

						"columns" : [ {
							"data" : "Request.reqId"
						}, {
							"data" : "Request.requestStatus.rsId"
						}, {
							"data" : "Request.requestStatus.rsName"
						}, {
							"data" : "Request.subject.sbjId"
						}, {
							"data" : "Request.subject.sbjCode"
						}, {
							"data" : "Request.reqEntDate"
						}, {
							"data" : "Request.publicIndividual.piId"
						}, {
							"data" : "Request.publicIndividual.piName"
						}, {
							"data" : "Request.division.divId"
						}, {
							"data" : "Request.division.divName"
						}, {
							"data" : "Request.reqNote"
						}, {
							"data" : "Request.staff.stfId"
						}, {
							"data" : "Request.staff.stfName"
						}, {
							"data" : "Request.reqFees"
						}, {
							"data" : "Request.reqDurartion"
						}, {
							"data" : "Request.reqIsVoid"
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
										case 6:
											return '<span class="label label-yellow">Approved</span>';
											break;
										case 7:
											return '<span class="label label-maroon">Rejected</span>';
											break;
										default:
											return 'N/A';
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
												.fnReloadAjax('rptrequest/loadrequest');
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

				var idStaff = $("#idStaff").val();
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

				if (idStaff === "") {
					idStaff = "0";

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
				var intStaffId = parseInt(idStaff);

				if (intReqId == 0 && intSbjId == 0 && intPubId == 0
						&& intDivId == 0 && intStausId == 0 && intStaffId == 0
						&& fromDate === "0" && toDate === "0") {

					$("#mdlReqFilter").modal("hide")
					dtRequest.fnReloadAjax('rptrequest/loadrequest');

				} else {
					url1 = 'rptrequest/filterby/' + intReqId + '/' + intSbjId
							+ '/' + intPubId + '/' + intDivId + '/'
							+ intStausId + '/' + intStaffId + '/' + fromDate
							+ '/' + toDate;

					// alert(url1);

					$("#mdlReqFilter").modal("hide")
					dtRequest.fnReloadAjax(url1);
				}

			});
});
// ------------------ END Apply Filter------------------

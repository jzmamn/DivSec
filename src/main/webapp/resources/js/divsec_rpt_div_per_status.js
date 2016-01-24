jQuery(function() {
	var dtRequest = $('#dtTable').dataTable({
		// No of records should be displayed
		"lengthMenu" : [ 40 ],

		// Load table using JSON data by ajax
		"ajax" : {
			"url" : "divperstatus/filterby/0/0/0",
			"dataSrc" : ""
		},

		"columns" : [ {
			"data" : "div_id"
		}, {
			"data" : "div_name"
		}, {
			"data" : "EntMonth1"
		}, {
			"data" : "EntMonth"
		}, {
			"data" : "EntYear"
		}, {
			"data" : "New"
		}, {
			"data" : "Opend"
		}, {
			"data" : "Completed"
		}, {
			"data" : "Closed"
		} ],

		"columnDefs" : [ {
			"targets" : [ 0 ],
			"visible" : false
		}, {
			"targets" : [ 2 ],
			"visible" : false
		} ],
		dom : 'Bfrtip',
		buttons : [ {
			extend : 'copyHtml5',
			exportOptions : {
				columns : [ 0, ':visible' ]
			}
		}, {
			extend : 'excelHtml5',
			exportOptions : {
				columns : ':visible'
			}
		},

		{
			extend : 'pdfHtml5',

		}, 'colvis',

		{
			text : 'Filter',
			action : function(e, dt, node, config) {
				$("#mdlReqFilter").modal("show");
			}

		}, {
			extend : 'print',
			message : 'Request List',
			exportOptions : {
				columns : ':visible'
			}

		}, {
			text : 'Refresh',
			action : function(e, dt, node, config) {
				dtRequest.fnReloadAjax('rptrequest/loadrequest');
			}
		} ]

	});

	// ------------------ Apply Filter------------------
	$("#btnIdApplyFilter").click(
			function(e) {
				var url1 = "";
				var reqId = $("#idTxtRequest").val();
				var fromDate = $("#dpFrom").val();
				var toDate = $("#dpTo").val();

				if (reqId === "") {
					reqId = "0";

				}

				if (fromDate === "") {
					fromDate = "0";

				}

				if (toDate === "") {
					toDate = "0";

				}

				var intReqId = parseInt(reqId);

				if (intReqId == 0 && intSbjId == 0 && intPubId == 0
						&& intDivId == 0 && intStausId == 0 && fromDate === "0"
						&& toDate === "0") {

					$("#mdlReqFilter").modal("hide")
					dtRequest.fnReloadAjax('rptrequest/loadrequest');

				} else {
					url1 = 'rptrequest/filterby/' + intReqId + '/' + intSbjId
							+ '/' + intPubId + '/' + intDivId + '/'
							+ intStausId + '/' + fromDate + '/' + toDate;

					alert(url1);

					$("#mdlReqFilter").modal("hide")
					dtRequest.fnReloadAjax(url1);
				}

			});
});
// ------------------ END Apply Filter------------------

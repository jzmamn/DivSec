jQuery(function() {
	var dtRequest = $('#dtTable')
			.dataTable(
					{
						// No of records should be displayed
						"lengthMenu" : [ 40 ],

						// Load table using JSON data by ajax
						"ajax" : {
							"url" : "rptrequeststagetrail/loadTrail/0/0/0/0",
							"dataSrc" : ""
						},

						"columns" : [ {
							"data" : "Status"
						}, {
							"data" : "rst_pr_id"
						}, {
							"data" : "rst_txn_date"
						}, {
							"data" : "Modified"
						}, {
							"data" : "rst_stg_id"
						}, {
							"data" : "stg_name"
						}, {
							"data" : "rst_stage_status_id"
						}, {
							"data" : "ss_name"
						}, {
							"data" : "rst_note"
						}, {
							"data" : "rst_user_id"
						}, {
							"data" : "stf_name"
						} ],

						"columnDefs" : [

						{
							"targets" : [ 6 ],
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
												.fnReloadAjax('rptrequeststagetrail/loadTrail/0/0/0/0');
									}
								} ]

					});

	// ------------------ Apply Filter------------------
	$("#btnIdApplyFilter")
			.click(
					function(e) {
						var url1 = "";
						var reqId = $("#idTxtRequest").val();
						var idStaff = $("#idStaff").val();
						var fromDate = $("#dpFrom").val();
						var toDate = $("#dpTo").val();

						if (reqId === "") {
							reqId = "0";

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
						var idStaff = parseInt(idStaff);

						if (intReqId == 0 && idStaff == 0 && fromDate === "0"
								&& toDate === "0") {
							$("#mdlReqFilter").modal("hide")
							dtRequest
									.fnReloadAjax('rptrequeststagetrail/loadTrail/0/0/0/0');

						} else {
							url1 = 'rptrequeststagetrail/loadTrail/' + intReqId
									+ '/' + +idStaff + '/' + fromDate + '/'
									+ toDate;
							alert(url1);
							$("#mdlReqFilter").modal("hide")
							dtRequest.fnReloadAjax(url1);
						}

					});
});
// ------------------ END Apply Filter------------------

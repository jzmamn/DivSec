jQuery(function() {

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
		}

		]
	});

	// Intialize Subject Stage Table
	var dtSbjStg = $('#dtSbjStg').dataTable({

		// No of records should be displayed
		"lengthMenu" : [ 40 ],

		// Load table using JSON data by ajax
		"ajax" : {
			"url" : "rptsubjectstage/loadallsbjstage",
			"dataSrc" : ""
		},

		"columns" : [ {
			"data" : "stgId"
		}, {
			"data" : "subject.sbjId"
		}, {
			"data" : "subject.sbjCode"
		}, {
			"data" : "stgName"
		}, {
			"data" : "stgCost"
		}, {
			"data" : "stgActive"
		}

		],
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

//		{
//			text : 'Filter',
//			action : function(e, dt, node, config) {
//				alert('Button activated');
//			}
//		}, 
                
            {
			extend : 'print',
			message : 'Request List',
			exportOptions : {
				columns : ':visible'
			}

		} ]

	});

	$("#btn").click(function() {
		dtSubject.fnReloadAjax('subject/loadsubject');
		// alert('usercreation/loaduser');
		// $.ajax({
		// url : 'usercreation/loaduser',
		// dataType : "json"
		// }).done(function(json) {
		// alert("Success: " + json);
		// });

	});

	// GET VALUE ON TABLE ROW CLICK From Subject table

	$('#dtSubject tbody').on('click', 'tr', function(e) {
		var aPos = dtSubject.fnGetPosition(this);
		var sbjId = dtSubject.fnGetData(aPos, 0)
		$('#txtIdSbjId').val(dtSubject.fnGetData(aPos, 0));
		$('#txtIdSbjName').val(dtSubject.fnGetData(aPos, 1));
		$("#modalSubject").modal("hide");
		dtSbjStg.fnReloadAjax('sbjstages/loadsbjstage/' + sbjId);
	});

	// GET VALUE ON TABLE ROW CLICK From Subject Stage table

});
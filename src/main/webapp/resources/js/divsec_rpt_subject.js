jQuery(function() {

	var dtSubject = $('#dtSubject').dataTable({

		// No of records should be displayed
		"lengthMenu" : [ 40 ],

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
			"data" : "sbjName"
		}, {
			"data" : "division.divId"
		}, {
			"data" : "division.divName"
		}, {
			"data" : "sbjDuration"
		}, {
			"data" : "sbjCost"
		}, {
			"data" : "sbjActive"
		}

		],

		"columnDefs" : [ {
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

});
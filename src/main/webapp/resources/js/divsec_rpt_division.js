var dt = $('#dtDivision').dataTable({

	// No of records should be displayed
	"lengthMenu" : [ 40 ],

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

	{
		text : 'Filter',
		action : function(e, dt, node, config) {
			alert('Button activated');
		}
	}, {
		extend : 'print',
		message : 'Request List',
		exportOptions : {
			columns : ':visible'
		}

	} ]

});
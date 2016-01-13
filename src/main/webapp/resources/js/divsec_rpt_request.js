var dtRequest = $('#dtTable').dataTable({
	// No of records should be displayed
	"lengthMenu" : [ 5, 10, 20 ],

	// Load table using JSON data by ajax
	"ajax" : {
		"url" : "rptrequest/loadrequest",
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

	"columnDefs" : [ {
		"targets" : [ 2 ],
		"visible" : false
	}, {
		"targets" : [ 3 ],
		"visible" : false
	}, {
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
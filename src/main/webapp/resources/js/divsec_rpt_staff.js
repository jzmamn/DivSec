var dt = $('#dtStaff').dataTable({
    // No of records should be displayed
    "lengthMenu": [40],
    // Load table using JSON data by ajax
    // Load table using JSON data by ajax
    "ajax": {
        "url": "usercreation/loaduser",
        "dataSrc": ""
    },
    "columns": [{
            "data": "stf_id"
        }, {
            "data": "stf_name"
        }, {
            "data": "stf_dvision_id"
        }, {
            "data": "div_name"
        }, {
            "data": "stf_user_id"
        }, {
            "data": "stf_email"
        }, {
            "data": "stf_mobile"
        }, {
            "data": "stf_note"
        }, {
            "data": "stf_active"
        }

    ],
    "columnDefs": [{
            "targets": [2],
            "visible": false
        }, {
            "targets": [5],
            "visible": false
        }, {
            "targets": [8],
            "visible": false
        }

    ],
    dom: 'Bfrtip',
    buttons: [{
            extend: 'copyHtml5',
            exportOptions: {
                columns: [0, ':visible']
            }
        }, {
            extend: 'excelHtml5',
            exportOptions: {
                columns: ':visible'
            }
        },
        {
            extend: 'pdfHtml5',
        }, 'colvis',
//	{
//		text : 'Filter',
//		action : function(e, dt, node, config) {
//			alert('Button activated');
//		}
//	}, 
        {
            extend: 'print',
            message: 'Request List',
            exportOptions: {
                columns: ':visible'
            }

        }]

});
jQuery(function () {

    $("#frmUndoPrint").submit(function () {
        if ($('#dtDivision').find('input[type=checkbox]:checked').length === 0)
        {
            alert('Please select atleast one checkbox');
            return false;
        }
        
        
    });

    if (undo === "1") {
        alert('printed');
        dt.fnReloadAjax('loadundo');
    } else if (undo === "0") {
        alert('not printed');
        dt.fnReloadAjax('loadundo');
    } else if (undo === "2") {
        alert('not printed');
        dt.fnReloadAjax('loadundo');
    } else {
        var dt = $('#dtDivision').dataTable({
            // No of records should be displayed
            "lengthMenu": [5, 10, 20],
            // Load table using JSON data by ajax
            "ajax": {
                "url": "undoprinted/loadundo",
                "dataSrc": ""
            },
            "columns": [{
                    "data": "app_request_id"
                }, {
                    "data": "app_request_id"
                }, {
                    "data": "sbj_code"
                }, {
                    "data": "app_req_status"
                },{
                    "data": "app_printed_date"
                }, {
                    "data": "app_is_printed"
                }

            ], "columnDefs": [{
                    "targets": [0],
                    'searchable': false,
                    'orderable': false,
                    'render': function (data, type, full, meta) {
                        // alert(JSON.stringify(full));
                        //var x = full.db_id + ' ' + full.db_code;
                        var x = full.app_request_id;


                        return '<input name="chkMa" value="' + x
                                + '"  type="checkbox" class={roles: true}>';
                    }

                }, {
                    "targets": [3],
                    "render": function (data, type, full, meta) {

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
                        }
                    }
                }, {
                    "targets": [5],
                    "render": function (data, type, full, meta) {

                        switch (data) {
                            case true:
                                return '<span class="label label-info">Printed</span>';
                                break;
                            case false:
                                return '<span class="label label-warning">Not Printed</span>';
                                break;
                        }
                    }
                }]
        });

    }



}
);

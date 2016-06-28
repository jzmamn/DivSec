jQuery(function () {

    var urlReqNewAndOpen = 'dboard/newandopened/' + stfPiId;
    var urlReqApproval = 'dboard/approval/' + stfPiId;
    var urlReqCompleted = 'dboard/completed/' + stfPiId;
    var urlReqRejected = 'dboard/rejected/' + stfPiId;
    var urlReqClosed = 'dboard/closed/' + stfPiId;

    var dtRequest = $('#dtTableNewAndOpened')
            .dataTable(
                    {
                        // No of records should be displayed
                        "lengthMenu": [40],
                        "bLengthChange": false,
                        // Load table using JSON data by ajax
                        "ajax": {
                            "url": urlReqNewAndOpen,
                            "dataSrc": ""
                        },
                        "columns": [{
                                "data": "req_id"
                            }, {
                                "data": "req_status_id"
                            }, {
                                "data": "rs_name"
                            }, {
                                "data": "req_subject_id"
                            }, {
                                "data": "sbj_code"
                            }, {
                                "data": "sbj_name"
                            }, {
                                "data": "req_ent_date"
                            }, {
                                "data": "req_public_id"
                            }, {
                                "data": "pi_name"
                            }, {
                                "data": "req_division_id"
                            }, {
                                "data": "div_name"
                            }, {
                                "data": "req_note"
                            }, {
                                "data": "req_user_id"
                            }, {
                                "data": "stf_name"
                            }, {
                                "data": "req_fees"
                            }, {
                                "data": "req_durartion"
                            }, {
                                "data": "req_fees"
                            }],
                        "order": [[0, "desc"]],
                        "columnDefs": [
                            {
                                "targets": [2],
                                "visible": false
                            },
                            {
                                "targets": [3],
                                "visible": false
                            }, {
                                "targets": [4],
                                "visible": false
                            },
                            {
                                "targets": [1],
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
                                "targets": [7],
                                "visible": false
                            }, {
                                "targets": [8],
                                "visible": false
                            }, {
                                "targets": [9],
                                "visible": false
                            }, {
                                "targets": [10],
                                "visible": false
                            }, {
                                "targets": [11],
                                "visible": false
                            }, {
                                "targets": [12],
                                "visible": false
                            }, {
                                "targets": [13],
                                "visible": false
                            }, {
                                "targets": [14],
                                "visible": false
                            }, {
                                "targets": [15],
                                "visible": false
                            }, {
                                "targets": [16],
                                "visible": false
                            }]

                    });

//======================================
    var dtRequest = $('#dtTableApprove')
            .dataTable(
                    {
                        // No of records should be displayed
                        "lengthMenu": [10],
                        "bLengthChange": false,
                        // Load table using JSON data by ajax
                        "ajax": {
                            "url": urlReqApproval,
                            "dataSrc": ""
                        },
                        "columns": [{
                                "data": "req_id"
                            }, {
                                "data": "req_status_id"
                            }, {
                                "data": "rs_name"
                            }, {
                                "data": "req_subject_id"
                            }, {
                                "data": "sbj_code"
                            }, {
                                "data": "sbj_name"
                            }, {
                                "data": "req_ent_date"
                            }, {
                                "data": "req_public_id"
                            }, {
                                "data": "pi_name"
                            }, {
                                "data": "req_division_id"
                            }, {
                                "data": "div_name"
                            }, {
                                "data": "req_note"
                            }, {
                                "data": "req_user_id"
                            }, {
                                "data": "stf_name"
                            }, {
                                "data": "req_fees"
                            }, {
                                "data": "req_durartion"
                            }, {
                                "data": "req_fees"
                            }],
                        "order": [[0, "desc"]],
                        "columnDefs": [
                            {
                                "targets": [2],
                                "visible": false
                            },
                            {
                                "targets": [3],
                                "visible": false
                            }, {
                                "targets": [4],
                                "visible": false
                            },
                            {
                                "targets": [1],
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
                                "targets": [7],
                                "visible": false
                            }, {
                                "targets": [8],
                                "visible": false
                            }, {
                                "targets": [9],
                                "visible": false
                            }, {
                                "targets": [10],
                                "visible": false
                            }, {
                                "targets": [11],
                                "visible": false
                            }, {
                                "targets": [12],
                                "visible": false
                            }, {
                                "targets": [13],
                                "visible": false
                            }, {
                                "targets": [14],
                                "visible": false
                            }, {
                                "targets": [15],
                                "visible": false
                            }, {
                                "targets": [16],
                                "visible": false
                            }]

                    });

    //============================================
    var dtRequest = $('#dtTableCompleted')
            .dataTable(
                    {
                        // No of records should be displayed
                        "lengthMenu": [10],
                        "bLengthChange": false,
                        // Load table using JSON data by ajax
                        "ajax": {
                            "url": urlReqCompleted,
                            "dataSrc": ""
                        },
                        "columns": [{
                                "data": "req_id"
                            }, {
                                "data": "req_status_id"
                            }, {
                                "data": "rs_name"
                            }, {
                                "data": "req_subject_id"
                            }, {
                                "data": "sbj_code"
                            }, {
                                "data": "sbj_name"
                            }, {
                                "data": "req_ent_date"
                            }, {
                                "data": "req_public_id"
                            }, {
                                "data": "pi_name"
                            }, {
                                "data": "req_division_id"
                            }, {
                                "data": "div_name"
                            }, {
                                "data": "req_note"
                            }, {
                                "data": "req_user_id"
                            }, {
                                "data": "stf_name"
                            }, {
                                "data": "req_fees"
                            }, {
                                "data": "req_durartion"
                            }, {
                                "data": "req_fees"
                            }],
                        "order": [[0, "desc"]],
                        "columnDefs": [
                            {
                                "targets": [2],
                                "visible": false
                            },
                            {
                                "targets": [3],
                                "visible": false
                            }, {
                                "targets": [4],
                                "visible": false
                            },
                            {
                                "targets": [1],
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
                                "targets": [7],
                                "visible": false
                            }, {
                                "targets": [8],
                                "visible": false
                            }, {
                                "targets": [9],
                                "visible": false
                            }, {
                                "targets": [10],
                                "visible": false
                            }, {
                                "targets": [11],
                                "visible": false
                            }, {
                                "targets": [12],
                                "visible": false
                            }, {
                                "targets": [13],
                                "visible": false
                            }, {
                                "targets": [14],
                                "visible": false
                            }, {
                                "targets": [15],
                                "visible": false
                            }, {
                                "targets": [16],
                                "visible": false
                            }]

                    });
    //=================================================
    var dtRequest = $('#dtTableClosed')
            .dataTable(
                    {
                        // No of records should be displayed
                        "lengthMenu": [10],
                        "bLengthChange": false,
                        // Load table using JSON data by ajax
                        "ajax": {
                            "url": urlReqClosed,
                            "dataSrc": ""
                        },
                        "columns": [{
                                "data": "req_id"
                            }, {
                                "data": "req_status_id"
                            }, {
                                "data": "rs_name"
                            }, {
                                "data": "req_subject_id"
                            }, {
                                "data": "sbj_code"
                            }, {
                                "data": "req_ent_date"
                            }, {
                                "data": "req_public_id"
                            }, {
                                "data": "pi_name"
                            }, {
                                "data": "req_division_id"
                            }, {
                                "data": "div_name"
                            }, {
                                "data": "req_note"
                            }, {
                                "data": "req_user_id"
                            }, {
                                "data": "stf_name"
                            }, {
                                "data": "req_fees"
                            }, {
                                "data": "req_durartion"
                            }, {
                                "data": "req_fees"
                            }],
                        "order": [[0, "desc"]],
                        "columns": [{
                                "data": "req_id"
                            }, {
                                "data": "req_status_id"
                            }, {
                                "data": "rs_name"
                            }, {
                                "data": "req_subject_id"
                            }, {
                                "data": "sbj_code"
                            }, {
                                "data": "sbj_name"
                            }, {
                                "data": "req_ent_date"
                            }, {
                                "data": "req_public_id"
                            }, {
                                "data": "pi_name"
                            }, {
                                "data": "req_division_id"
                            }, {
                                "data": "div_name"
                            }, {
                                "data": "req_note"
                            }, {
                                "data": "req_user_id"
                            }, {
                                "data": "stf_name"
                            }, {
                                "data": "req_fees"
                            }, {
                                "data": "req_durartion"
                            }, {
                                "data": "req_fees"
                            }],
                                "order": [[0, "desc"]],
                                "columnDefs": [
                                    {
                                        "targets": [2],
                                        "visible": false
                                    },
                                    {
                                        "targets": [3],
                                        "visible": false
                                    }, {
                                        "targets": [4],
                                        "visible": false
                                    },
                                    {
                                        "targets": [1],
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
                                        "targets": [7],
                                        "visible": false
                                    }, {
                                        "targets": [8],
                                        "visible": false
                                    }, {
                                        "targets": [9],
                                        "visible": false
                                    }, {
                                        "targets": [10],
                                        "visible": false
                                    }, {
                                        "targets": [11],
                                        "visible": false
                                    }, {
                                        "targets": [12],
                                        "visible": false
                                    }, {
                                        "targets": [13],
                                        "visible": false
                                    }, {
                                        "targets": [14],
                                        "visible": false
                                    }, {
                                        "targets": [15],
                                        "visible": false
                                    }, {
                                        "targets": [16],
                                        "visible": false
                                    }]

                    });

    var dtRequest = $('#dtTableRejected')
            .dataTable(
                    {
                        // No of records should be displayed
                        "lengthMenu": [10],
                        "bLengthChange": false,
                        // Load table using JSON data by ajax
                        "ajax": {
                            "url": urlReqRejected,
                            "dataSrc": ""
                        },
                        "columns": [{
                                "data": "req_id"
                            }, {
                                "data": "req_status_id"
                            }, {
                                "data": "rs_name"
                            }, {
                                "data": "req_subject_id"
                            }, {
                                "data": "sbj_code"
                            }, {
                                "data": "sbj_name"
                            }, {
                                "data": "req_ent_date"
                            }, {
                                "data": "req_public_id"
                            }, {
                                "data": "pi_name"
                            }, {
                                "data": "req_division_id"
                            }, {
                                "data": "div_name"
                            }, {
                                "data": "req_note"
                            }, {
                                "data": "req_user_id"
                            }, {
                                "data": "stf_name"
                            }, {
                                "data": "req_fees"
                            }, {
                                "data": "req_durartion"
                            }, {
                                "data": "req_fees"
                            }],
                        "order": [[0, "desc"]],
                        "columnDefs": [
                            {
                                "targets": [2],
                                "visible": false
                            },
                            {
                                "targets": [3],
                                "visible": false
                            }, {
                                "targets": [4],
                                "visible": false
                            },
                            {
                                "targets": [1],
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
                                "targets": [7],
                                "visible": false
                            }, {
                                "targets": [8],
                                "visible": false
                            }, {
                                "targets": [9],
                                "visible": false
                            }, {
                                "targets": [10],
                                "visible": false
                            }, {
                                "targets": [11],
                                "visible": false
                            }, {
                                "targets": [12],
                                "visible": false
                            }, {
                                "targets": [13],
                                "visible": false
                            }, {
                                "targets": [14],
                                "visible": false
                            }, {
                                "targets": [15],
                                "visible": false
                            }, {
                                "targets": [16],
                                "visible": false
                            }]

                    });

});

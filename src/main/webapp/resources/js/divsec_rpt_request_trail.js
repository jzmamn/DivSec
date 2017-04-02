jQuery(function () {
//hide filter controles
    $('#divIdDivision').hide();
    $('#divIdPublic').hide();
    $('#divIdDateRange').hide();
    $('#divIdSubject').hide();
    $('#divIdStatus').hide();
    $('#divIdUser').hide();


    var dtRequest = $('#dtTable')
            .dataTable(
                    {
                        // No of records should be displayed
                        "lengthMenu": [40],
                        // Load table using JSON data by ajax
                        "ajax": {
                            "url": "rptrequesttrail/loadTrail/0/0/0/0/0/0/0/0",
                            "dataSrc": ""
                        },
                        "columns": [{
                                "data": "Status"
                            }, {
                                "data": "req_id"
                            }, {
                                "data": "req_ent_date"
                            }, {
                                "data": "Modified"
                            }, {
                                "data": "stf_name"
                            }, {
                                "data": "rs_name"
                            }, {
                                "data": "req_status_id"
                            }, {
                                "data": "req_is_void"
                            }, {
                                "data": "req_note"
                            }, {
                                "data": "req_user_id"
                            }],
                        "columnDefs": [{
                                "targets": [0],
                                "visible": false
                            }, {
                                "targets": [5],
                                "visible": false
                            }, {
                                "targets": [7],
                                "visible": false
                            },{
                                "targets": [8],
                                "visible": false
                            }, {
                                "targets": [9],
                                "visible": false
                            },
                            {
                                "targets": [6],
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
                                        case 8:
                                            return '<span class="label label-dark">Void</span>';
                                            break;
                                    }
                                }
                            }],
                        dom: 'Bfrtip',
                        buttons: [
                            {
                                extend: 'copyHtml5',
                                exportOptions: {
                                    columns: [0, ':visible']
                                }
                            },
                            {
                                extend: 'excelHtml5',
                                exportOptions: {
                                    columns: ':visible'
                                }
                            },
                            {
                                extend: 'pdfHtml5',
                            },
                            'colvis',
                            {
                                text: 'Filter',
                                action: function (e, dt, node, config) {
                                    $("#mdlReqFilter").modal("show");
                                }

                            },
                            {
                                extend: 'print',
                                message: 'Request List',
                                exportOptions: {
                                    columns: ':visible'
                                }

                            },
                            {
                                text: 'Refresh',
                                action: function (e, dt, node, config) {
                                    dtRequest
                                            .fnReloadAjax('rptrequesttrail/loadTrail/0/0/0/0/0/0/0/0');
                                }
                            }],
                        "drawCallback": function (settings) {
                            var api = this.api();
                            var rows = api.rows({page: 'current'}).nodes();
                            var last = null;

                            api.column(0, {page: 'current'}).data().each(function (group, i) {
                                if (last !== group) {
                                    $(rows).eq(i).before(
                                            '<tr class="group" style="background-color: #deb"><td colspan="9">' + group + ' - Record(s)</td></tr>'
                                            );
                                    last = group;
                                }
                            });
                        }

                    });

    // ------------------ Apply Filter------------------
    $("#btnIdApplyFilter").click(function (e) {
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
                && intDivId == 0 && intStausId == 0
                && intStaffId == 0 && fromDate === "0"
                && toDate === "0") {

            $("#mdlReqFilter").modal("hide")
            dtRequest
                    .fnReloadAjax('rptrequesttrail/loadTrail/0/0/0/0/0/0/0/0');

        } else {
            url1 = 'rptrequesttrail/loadTrail/' + intReqId
                    + '/' + intSbjId + '/' + intPubId + '/'
                    + intDivId + '/' + intStausId + '/'
                    + intStaffId + '/' + fromDate + '/'
                    + toDate;

//                            alert(url1);
            console.log(url1);

            $("#mdlReqFilter").modal("hide")
            dtRequest.fnReloadAjax(url1);
        }

    });
});
// ------------------ END Apply Filter------------------

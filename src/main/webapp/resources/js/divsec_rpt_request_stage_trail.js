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
                            "url": "rptrequeststagetrail/loadTrail/0/0/0/0",
                            "dataSrc": ""
                        },
                        "columns": [{
                                "data": "Status"
                            }, {
                                "data": "rst_pr_id"
                            }, {
                                "data": "rst_txn_date"
                            }, {
                                "data": "Modified"
                            }, {
                                "data": "subjectCode"
                            }, {
                                "data": "rst_stg_id"
                            }, {
                                "data": "stg_name"
                            }, {
                                "data": "rst_stage_status_id"
                            }, {
                                "data": "rst_note"
                            }, {
                                "data": "rst_user_id"
                            }, {
                                "data": "stf_name"
                            }],
                        "columnDefs": [{
                                "targets": [0], "visible": false
                            },
                            {
                                "targets": [7],
                                "render": function (data, type, full, meta) {

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
                            }, {
                                "targets": [5], "visible": false
                            }, {
                                "targets": [8], "visible": false
                            }, {
                                "targets": [9], "visible": false
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
                                            .fnReloadAjax('rptrequeststagetrail/loadTrail/0/0/0/0');
                                }
                            }],
                        "drawCallback": function (settings) {
                            var api = this.api();
                            var rows = api.rows({page: 'current'}).nodes();
                            var last = null;

                            api.column(0, {page: 'current'}).data().each(function (group, i) {
                                if (last !== group) {
                                    $(rows).eq(i).before(
                                            '<tr class="group" style="background-color: #deb"><td colspan="9">' + group + '</td></tr>'
                                            );

                                    last = group;
                                }
                            });
                        }


                    });


    // Order by the grouping
    $('#example tbody').on('click', 'tr.group', function () {
        var currentOrder = dtRequest.order()[0];
        if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
            dtRequest.order([0, 'desc']).draw();
        } else {
            dtRequest.order([0, 'asc']).draw();
        }
    });

    // ------------------ Apply Filter------------------
    $("#btnIdApplyFilter")
            .click(
                    function (e) {
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
                                    + '/' + idStaff + '/' + fromDate + '/'
                                    + toDate;
                            //alert(url1);
                            $("#mdlReqFilter").modal("hide")
                            dtRequest.fnReloadAjax(url1);
                        }

                    });
});
// ------------------ END Apply Filter------------------

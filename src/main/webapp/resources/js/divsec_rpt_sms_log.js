jQuery(function () {
    var dtRequest = $('#dtTable')
            .dataTable(
                    {
                        // No of records should be displayed
                        "lengthMenu": [40],
                        // Load table using JSON data by ajax
                        "ajax": {
                            "url": "rptsmslog/list-sms-log",
                            "dataSrc": ""
                        },
                        "columns": [{
                                "data": "sms_id"
                            }, {
                                "data": "sms_date"
                            }, {
                                "data": "sms_req_id"
                            }, {
                                "data": "sbj_code"
                            }, {
                                "data": "pi_id"
                            }, {
                                "data": "pi_name"
                            }, {
                                "data": "sms_response"
                            }, {
                                "data": "sms_status"
                            }, {
                                "data": "sms_charges"
                            }, {
                                "data": "sms_user_id"
                            }, {
                                "data": "stf_name"
                            }],
                        "order": [[0, "desc"]],
                        "columnDefs": [
                            {
                                "targets": [4],
                                "visible": false
                            }, {
                                "targets": [6],
                                "visible": false
                            }, {
                                "targets": [7],
                                "visible": false
                            }, {
                                "targets": [8],
                                "visible": false
                            },
                            {
                                "targets": [9],
                                "visible": false
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
                                            .fnReloadAjax('rptrequest/loadrequest');
                                }
                            }]

                    });

    // ------------------ Apply Filter------------------
    $("#btnIdApplyFilter").click(
            function (e) {
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
                        && intDivId == 0 && intStausId == 0 && intStaffId == 0
                        && fromDate === "0" && toDate === "0") {

                    $("#mdlReqFilter").modal("hide")
                    dtRequest.fnReloadAjax('rptrequest/loadrequest');

                } else {
                    url1 = 'rptrequest/filterby/' + intReqId + '/' + intSbjId
                            + '/' + intPubId + '/' + intDivId + '/'
                            + intStausId + '/' + intStaffId + '/' + fromDate
                            + '/' + toDate;

                    // alert(url1);

                    $("#mdlReqFilter").modal("hide")
                    dtRequest.fnReloadAjax(url1);
                }

            });
});
// ------------------ END Apply Filter------------------

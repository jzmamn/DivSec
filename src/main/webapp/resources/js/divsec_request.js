jQuery(function () {



    //alert("hello" + divId);
    $("#frmProcessRequest").hide({});
    // batch numbers load

    if (role === "ROLE_STAFF") {
        $("#idAddInst").hide();
    }

    loadBatchCount(divId);

    function loadBatchCount(divId1) {

        var intDivId = parseInt(divId1);
        //alert("Hi" + intDivId);
        var urlBadge = '';
        if (role === "ROLE_STAFF" || role === "ROLE_HOD") {
            urlBadge = 'reqprocess/batchcount/' + intDivId;
            console.log(urlBadge);
        } else {
            urlBadge = 'reqprocess/batchcount';
        }

        $.ajax({
            type: 'GET',
            url: urlBadge,
            dataType: 'json',
            success: function (data) {
                var allReq = 0;
                var opened = 0;
                $.each(data, function (index, element) {
                    allReq += element.count;
                });
                $("#spnIdNew").text(allReq);

                $.each(data, function (index, element) {

                    switch (element.rs_name) {
//                        case "New":
//                            // All pills batch number
//                           // $("#spnIdNew").text(newReq);
//                            break;
                        case "Opened":
                            $("#spnIdOpened").text(element.count);
                            break;
                        case "Completed":
                            $("#spnIdCompleted").text(element.count);
                            break;
                        case "Closed":
                            $("#spnIdClosed").text(element.count);
                            break;
                        case "Rejected":
                            $("#spnIdRejected").text(element.count);
                            break;
                        case "Approved":
                            $("#spnIdApprove").text(element.count);
                            break;
                        case "For Approval":
                            $("#spnIdApproval").text(element.count);
                            break;
                        case "Void":
                            $("#spnIdVoid").text(element.count);
                            break;

                    }

                });
            },
            error: function (data) {
                alert('1111. aymen2 fail' + data);
            }
        });
    }

    function filterReqByStatus(statusId, divisionId) {
        var url = '';
        if (role === "ROLE_STAFF" || role === "ROLE_HOD") {
            url = 'reqprocess/status/' + statusId + '/' + divId;
            dtRequest.fnReloadAjax(url)

        } else {
            url = 'reqprocess/status/' + statusId;
            dtRequest.fnReloadAjax(url)
        }

    }

    var urlReq = '';
    if (role === "ROLE_STAFF" || role === "ROLE_HOD") {
        urlReq = 'reqprocess/loadrequest/' + divId;
    } else {
        urlReq = 'reqprocess/loadrequest';
    }

    var dtRequest = $('#dtTable').dataTable({
        // No of records should be displayed
        "lengthMenu": [10,20, 40],
        // Load table using JSON data by ajax
        "ajax": {
            "url": urlReq,
            "dataSrc": ""
        },
        "columns": [{
                "data": "reqId"
            }, {
                "data": "requestStatus.rsId"
            }, {
                "data": "requestStatus.rsName"
            }, {
                "data": "subject.sbjId"
            }, {
                "data": "subject.sbjCode"
            }, {
                "data": "reqEntDate"
            }, {
                "data": "publicIndividual.piId"
            }, {
                "data": "publicIndividual.piName"
            }, {
                "data": "division.divId"
            }, {
                "data": "division.divName"
            }, {
                "data": "reqNote"
            }, {
                "data": "staff.stfId"
            }, {
                "data": "staff.stfName"
            }, {
                "data": "reqFees"
            }, {
                "data": "reqDurartion"
            }, {
                "data": "reqIsVoid"
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
                        case 8:
                            return '<span class="label label-dark">Void</span>';
                            break;
                    }
                }
            },
//                            {
//                                "targets": [6],
//                                "visible": false
//                            }, {
//                                "targets": [7],
//                                "visible": false
//                            }, 

            {
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
            }]
       

    });


    /* Custom filtering function which will search data in column four between two values */
    $.fn.dataTable.ext.search.push(
            function (settings, data, dataIndex) {
                var reqId = parseInt($('#idReqId').val(), 10);
                var reqId1 = parseFloat(data[0]) || 0; // use data for the age column

                if (isNaN(reqId) || (reqId1 === reqId))
                {
                    return true;
                }
            }
    );

    $('#idReqId').keyup(function () {
        dtRequest.fnReloadAjax(urlReq);
        loadBatchCount(divId);
    });


    // Intialize Public Table
    var dtPublic = $('#dtPublic').dataTable({
// No of records should be displayed
        "lengthMenu": [5, 10, 20],
        // Load table using JSON data by ajax
        "ajax": {
            "url": "public/loadpi",
            "dataSrc": ""
        },
        "columns": [{
                "data": "piId"
            }, {
                "data": "piName"
            }, {
                "data": "piNic"
            }

        ]

    });
    // Intialize Subject Table
    var dtSubject = $('#dtSubject').dataTable({
// No of records should be displayed
        "lengthMenu": [5, 10, 20],
        // Load table using JSON data by ajax
        "ajax": {
            "url": "subject/loadactivesubject",
            "dataSrc": ""
        },
        "columns": [{
                "data": "sbjId"
            }, {
                "data": "sbjCode"
            }, {
                "data": "sbjActive"
            }, {
                "data": "division.divId"
            }, {
                "data": "division.divName"
            }, {
                "data": "sbjDuration"
            }, {
                "data": "sbjCost"
            }

        ],
        "columnDefs": [{
                "targets": [3],
                "visible": false
            }, {
                "targets": [4],
                "visible": false
            }, {
                "targets": [5],
                "visible": false
            }, {
                "targets": [6],
                "visible": false
            }]
    });
    // Load Request stage table

    var dtStage = $('#dtStage')
            .dataTable(
                    {
                        "lengthMenu": [5, 10, 20],
                        // Load table using JSON data by ajax
                        "ajax": {
                            "url": "processstg/loadreqstage/0",
                            "dataSrc": ""
                        },
                        "columns": [{
                                "data": "rstId"
                            }, {
                                "data": "subjecStage.stgId"
                            }, {
                                "data": "subjecStage.stgName"
                            }, {
                                "data": "stageStatus.ssId"
                            }, {
                                "data": "stageStatus.ssName"
                            }, {
                                "data": "request.reqId"
                            }, {
                                "data": "rstNote"
                            }

                        ],
                        "columnDefs": [
                            {
                                "targets": [1],
                                "visible": false
                            },
                            {
                                "targets": [4],
                                "visible": false
                            },
                            {
                                "targets": [5],
                                "visible": false
                            },
                            {
                                "targets": [6],
                                "visible": false
                            },
                            {
                                "targets": [3],
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
                            }]
                    });
    // GET VALUE ON TABLE ROW CLICK From Subject table

    $('#dtPublic tbody').on('click', 'tr', function (e) {
        var aPos = dtPublic.fnGetPosition(this);
        var sbjId = dtPublic.fnGetData(aPos, 0)
        $('#txtIdPublicId').val(dtPublic.fnGetData(aPos, 0));
        $('#txtIdPublicName').val(dtPublic.fnGetData(aPos, 1));
        $("#modalPublic").modal("hide");
    });
    // GET VALUE ON TABLE ROW CLICK From PUBLIC table

    $('#dtSubject tbody').on('click', 'tr', function (e) {
        var aPos = dtSubject.fnGetPosition(this);
        var sbjId = dtSubject.fnGetData(aPos, 0)
        $('#txtIdSubjectId').val(dtSubject.fnGetData(aPos, 0));
        $('#txtIdSubject').val(dtSubject.fnGetData(aPos, 1));
        $('#txtIdDivisionId').val(dtSubject.fnGetData(aPos, 3));
        $('#txtIdDivisionName').val(dtSubject.fnGetData(aPos, 4));
        $('#txtIdDuration').val(dtSubject.fnGetData(aPos, 5));
        $('#txtIdReqFee').val(dtSubject.fnGetData(aPos, 6));
        $("#modalSubject").modal("hide");
    });
    // New Request Form submission save and edit
    $("#frmIdRequest").submit(function () {
// the Controller request mapping value as url.
        var url = "reqprocess/create";
        $.ajax({
            type: "POST",
            url: url,
            data: $("#frmIdRequest").serialize(),
            success: function () {
                $("#idModalRequest").modal("hide");
                swal("Saved Sucessfully !", "....", "success");

                if (role === "ROLE_STAFF" || role === "ROLE_HOD") {
                    // urlReq = 'reqprocess/loadrequest/' + divId;
                    dtRequest.fnReloadAjax('reqprocess/loadrequest/' + divId);
                } else {
                    dtRequest.fnReloadAjax('reqprocess/loadrequest');
                }

                $("#frmProcessRequest").hide({});
                $('#tblProcessRequest').show({});
                loadBatchCount(divId);
            },
            fail: function () {
                $("#idModalRequest").modal("hide");
                swal("Save Failed !", "....", "error");
                loadBatchCount(divId);
            }
        });
        // avoid to execute the actual submit of the form.
        return false;
    });

    $('#dp1').datepicker('setDate', new Date());
    $('#dp1').datepicker('update');
    $('#idTxtInstDate').datepicker('setDate', new Date());
    $('#idTxtInstDate').datepicker('update');
    // Request table row Click and Fill the request info
    // PublicId,Status and void can be updated manually

    $('#dtTable tbody').on('click', 'tr', function (e) {
// /*$("#frmProcessRequest").show({});
// $('#tblProcessRequest').hide({});*/
// inactivate the status dropdown for staffs when the status is
// "Rejected"

        var aPos = dtRequest.fnGetPosition(this);
        var reqId = dtRequest.fnGetData(aPos, 0);


        if (dtRequest.fnGetData(aPos, 0).length === 0) {
            alert("No data in the row of the table");
            return;
        }

        //check new and update on click
        if (dtRequest.fnGetData(aPos, 1) === 1) {
            newClicked(dtRequest.fnGetData(aPos, 0));

        }

        if (role === "ROLE_STAFF" && dtRequest.fnGetData(aPos, 1) === 7) {
            $('#cmdIdReqStatus').hide();
            alert('The Status is Rejected. This can be seen only by admin');
        } else {
            $('#cmdIdReqStatus').show();
            $("#frmProcessRequest").show({});
            $('#tblProcessRequest').hide({});
        }

        $('#spnReqId').text(dtRequest.fnGetData(aPos, 0));
        $('#txtIdReqId').val(dtRequest.fnGetData(aPos, 0));
        $('#idCmbReqStausId').val(dtRequest.fnGetData(aPos, 1));
        $('#cmdIdReqStatus').val(dtRequest.fnGetData(aPos, 2));
        // // inactivate the status dropdown for staffs when the status is
        // // "Rejected"
        //
        // if (role === "ROLE_STAFF" && dtRequest.fnGetData(aPos, 1) == 7) {
        // $('#cmdIdReqStatus').hide();
        // alert('hidden');
        // } else {
        // $('#cmdIdReqStatus').show();
        // }

        $('#spnSbjId').text(dtRequest.fnGetData(aPos, 3));
        $('#spnSbj').text(dtRequest.fnGetData(aPos, 4));
        $('#spnDate').text(dtRequest.fnGetData(aPos, 5));
        $('#spnPubId').text(dtRequest.fnGetData(aPos, 6));
        $('#txtIdPublic').val(dtRequest.fnGetData(aPos, 6));
        $('#spnPubName').text(dtRequest.fnGetData(aPos, 7));
        $('#spnDivId').text(dtRequest.fnGetData(aPos, 8));
        $('#spnDivision').text(dtRequest.fnGetData(aPos, 9));
        // $('#spnRemark').text(dtRequest.fnGetData(aPos, 10));
        $('#txtIdNote').val(dtRequest.fnGetData(aPos, 10));
        $('#spnStaffId').text(dtRequest.fnGetData(aPos, 11));
        $('#txtIdStaff').val(dtRequest.fnGetData(aPos, 11));
        $('#txtIdUserId').val(dtRequest.fnGetData(aPos, 11));
        $('#spnStaff').text(dtRequest.fnGetData(aPos, 12));
        $('#spnFee').text(dtRequest.fnGetData(aPos, 13));
        $('#spnDuration').text(dtRequest.fnGetData(aPos, 14));

        if (dtRequest.fnGetData(aPos, 15) === true) {
            blnIsDivActive = true;
        } else {
            blnIsDivActive = false;
        }

        $('#chkIdPiActive').prop('checked', blnIsDivActive);
        dtStage.fnReloadAjax('processstg/loadreqstage/' + reqId);
        // Instruction
        $('#txtIdInsStfId').val(dtRequest.fnGetData(aPos, 11));
        $('#txtIdInsIsRead').val(0);
        $('#txtIdInstReqId').val(dtRequest.fnGetData(aPos, 0));
        getInstruction(parseInt(reqId));
        e.preventDefault();
    });
    $('#dtStage tbody').on('click', 'tr', function (e) {
        var aPos = dtStage.fnGetPosition(this);
        var reqId = dtStage.fnGetData(aPos, 0);
        $('#txtIdReqStgId').val(dtStage.fnGetData(aPos, 0));
        $('#idTxtReqStgSts').val(dtStage.fnGetData(aPos, 3));
        $('#idCmbReqStgSts').val(dtStage.fnGetData(aPos, 4));
        $('#txtIdStgNote').val(dtStage.fnGetData(aPos, 6));
        $('#idModalReqStage').modal('show');
    });
    $("#idAll").click(function () {
        $("#frmProcessRequest").hide({});
        $('#tblProcessRequest').show({});
        dtRequest.fnReloadAjax(urlReq);
        loadBatchCount(divId);
    });
    $("#idApprove").click(function () {
        $("#frmProcessRequest").hide({});
        $('#tblProcessRequest').show({});
        filterReqByStatus(6, divId)
        loadBatchCount(divId);
    });
    $("#idOpened").click(function () {
        $("#frmProcessRequest").hide({});
        $('#tblProcessRequest').show({});
        filterReqByStatus(2, divId)
        loadBatchCount(divId);
    });
    $("#idApproval").click(function () {
        $("#frmProcessRequest").hide({});
        $('#tblProcessRequest').show({});
        filterReqByStatus(5, divId)
        loadBatchCount(divId);
    });
    $("#idCompleted").click(function () {
        $("#frmProcessRequest").hide({});
        $('#tblProcessRequest').show({});
        filterReqByStatus(3, divId)
        loadBatchCount(divId);
    });
    $("#idClosed").click(function () {
        $("#frmProcessRequest").hide({});
        $('#tblProcessRequest').show({});
        filterReqByStatus(4, divId)
        loadBatchCount(divId);
    });
    $("#idRejected").click(function () {
        $("#frmProcessRequest").hide({});
        $('#tblProcessRequest').show({});
        filterReqByStatus(7, divId)
        loadBatchCount(divId);

    });

    $("#idVoid").click(function () {
        $("#frmProcessRequest").hide({});
        $('#tblProcessRequest').show({});
        filterReqByStatus(8, divId)
        loadBatchCount(divId);

    });

    var $select1 = $('#cmdIdReqStatus');
    // request the JSON data and parse into the select element
    $.ajax({
        url: 'requestStatus/loadStatus/ROLE_STAFF',
        dataType: 'JSON',
        success: function (data) {
            // clear the current content of the select
            $select1.html('');
            // iterate over the data and append a select option
            $.each(data, function (key, val) {
                $select1.append('<option id="' + val.rsId + '">' + val.rsName
                        + '</option>');
            })
        },
        error: function () {
            // if there is an error append a 'none available' option
            $select1.html('<option id="-1">none available</option>');
        }
    });
    $select1.change(function () {
        var str1 = "";
        var str2 = "";
        str1 = $(this).children(":selected").attr("id");
        $("select option:selected").each(function () {
            str2 = $(this).text() + " ";
            $("#idCmbReqStausId").val(str1);
            $("#idCmbReqStausName").text(str2);
        });
    }).trigger("change");
    // Load Stage status in the Dropdown
    var $select2 = $('#idCmbReqStgSts');
    // request the JSON data and parse into the select element
    $.ajax({
        url: 'stageStatus/loadStageStaus',
        dataType: 'JSON',
        success: function (data) {
            // clear the current content of the select
            $select2.html('');
            // iterate over the data and append a select option
            $.each(data, function (key, val) {
                $select2.append('<option id="' + val.ssId + '">' + val.ssName
                        + '</option>');
            })
        },
        error: function () {
            // if there is an error append a 'none available' option
            $select2.html('<option id="-1">none available</option>');
        }
    });
    $select2.change(function () {
        var str1 = "";
        var str2 = "";
        str1 = $(this).children(":selected").attr("id");
        $("select option:selected").each(function () {
            str2 = $(this).text() + " ";
            $("#idTxtReqStgSts").val(str1);
            $("#idCmbReqStausName").text(str2);
        });
    }).trigger("change");
    // Update Request after clicking status 'New'

    function newClicked(requestId) {

        var a = parseInt(requestId);
        var b = 2;
        var c = true;
        var url1 = '';

        url1 = 'reqprocess/requestid/' + a + '/statusid/' + b
                + '/void/' + c + '/note/first seen';

        // alert(url1);

        $.ajax({
            type: 'GET',
            url: url1,
            success: function () {
                dtRequest.fnReloadAjax('reqprocess/loadrequest');
                // $("#frmProcessRequest").hide({});
                //$('#tblProcessRequest').show({});
                loadBatchCount(divId);
            },
            error: function (data) {
                alert('2. aymen2 fail' + data);
            }
        });
    }

    // Update Request after changing status
    $("#btnIdSaveChanges").click(
            function (e) {
                var reqId = $("#txtIdReqId").val();
                var stausId = $("#idCmbReqStausId").val();
                var statusText = $("#cmdIdReqStatus").val();
                //alert(statusText);
                var d = $("#txtIdNote").val();
                var a = parseInt(reqId);
                var b = parseInt(stausId);
                var d = $("#txtIdNote").val();

                if (statusText === null) {
                    alert('Please select a status');
                    return;
                }


                if ($('#chkIdPiActive').is(":checked")) {
                    c = true;
                } else {
                    c = false;
                }

                var url1 = '';
                if (d === "") {
                    url1 = 'reqprocess/requestid/' + a + '/statusid/' + b
                            + '/void/' + c + '/note/new';
                } else {
                    url1 = 'reqprocess/requestid/' + a + '/statusid/' + b
                            + '/void/' + c + '/note/' + d;
                }

                // alert(url1);

                $.ajax({
                    type: 'GET',
                    url: url1,
                    success: function () {
                        dtRequest.fnReloadAjax('reqprocess/loadrequest');
                        $("#frmProcessRequest").hide({});
                        $('#tblProcessRequest').show({});
                        dtRequest.fnReloadAjax(urlReq);
                        loadBatchCount(divId);
                    },
                    error: function (data) {
                        alert('2. aymen2 fail' + data);
                    }
                });
            });
    $("#btnSaveStg").click(
            function (e) {
                var reqId = $("#txtIdReqId").val();
                var reqStgId = $("#txtIdReqStgId").val();
                var stausId = $("#idTxtReqStgSts").val();
                var c = $("#txtIdStgNote").val();
                var a = parseInt(reqStgId);
                var b = parseInt(stausId);
                // alert('/reqstgid/' + a + '/statusid/' + b + '/note/' + c);

                if (c == "") {
                    c = "stage";
                }

                var url1 = 'processstg/reqstgid/' + a + '/statusid/' + b
                        + '/note/' + c;
                $.ajax({
                    type: 'GET',
                    url: url1,
                    success: function () {
                        $("#idModalReqStage").modal("hide");
                        dtStage.fnReloadAjax('processstg/loadreqstage/' + reqId);
                        loadBatchCount(divId);
                    },
                    error: function (data) {
                        alert('fail ' + data);
                    }
                });
            });
    // Instruction submission

    // Update Request after changing status
    $("#btnIdAddInstruction").click(
            function (e) {

                // /{requestId}/{instruction}/{instDate}/{isRead}/{stfId}/

                var reqId = $("#txtIdInstReqId").val();
                var inst = $("#txtIdInstruction").val();
                // var instDate = $("#idTxtInstDate").val();
                var isRead = $("#txtIdInsIsRead").val();
                // var instStaffId = $("#txtIdInsStfId").val();
                //var instStaffId = stfId;

                var a = parseInt(reqId);
                // var b = parseInt(instStaffId);
                if (isRead === "1") {
                    c = true;
                } else {
                    c = false;
                }

                var url1 = 'reqprocess/instruction/' + a + '/' + inst + '/' + c;

                //console.log(url1);

                $.ajax({
                    type: 'GET',
                    url: url1,
                    success: function () {
                        $("#txtIdInstruction").val('');
                        getInstruction(a);
                    },
                    error: function () {
                        alert('Please enter an instruction');
                    }
                });
            });
    function getInstruction(reqId) {

        var list = '';
        var list1 = '';
        $('#idInst').html('');
        $.ajax({
            type: 'GET',
            url: 'reqprocess/inst/' + reqId,
            success: function (data) {
                var x = 1;
                $.each(data, function (key, val) {
//alert(val);
                    x = x + 1;
                    res = x % 2;
                    if (res === 0) {
                        list1 = '<div class="chat-body clearfix"> \n<div class="header"> \n<p class= "text-left text-success" > \n<strong>Dear Staff </strong> \n</p> \n</div> \n<p>'
                                + val.insInstruction
                                + '</p> \n<p class="text-primary pull-right"> \n<i class="icon-time"></i><em> By '
                                + val.staff.stfName + ' on ' + val.insDate
                                + '</em> \n</p> \n</div> \n <hr/>';
                    } else {

                        list1 = '<div class="chat-body clearfix"> \n<div class="header"> \n<p class= "text-left text-success"> \n<strong>Dear Staff </strong> \n</p> \n</div> \n<p>'
                                + val.insInstruction
                                + '</p> \n<p class="text-primary pull-right"> \n<i class="icon-time"></i><em> By '
                                + val.staff.stfName + ' on ' + val.insDate
                                + '</em> \n</p> \n</div> \n <hr/>';
                    }

                    list += list1;
                });

                $('#idInst').html(list);
            },
            error: function (data) {
                alert("Get Instruction");
            }
        });
    }


// Send Email

    $("#btnIdSendEmail").click(function (e) {
        var reqId = $("#txtIdReqId").val();
        var a = parseInt(reqId);
        var url1 = "mail/sendmail/" + a;
        $.ajax({
            type: 'GET',
            url: url1,
            dataType: 'JSON',
            beforeSend: function () {
                $('#modalSendBulkEmail').modal('show');
            },
            success: function (res) {
                alert('success ' + res);
            },
            error: function (res) {
                alert(res.responseText);
            },
            complete: function () {
                $('#modalSendBulkEmail').modal('hide');
            }
        });
        e.preventDefault();
    });
    // Send Bulk Email
    $('#btnIdSendBulkEmail').click(function (event) {
        var url1 = "mail/send-bulk-email";
        $.ajax({
            type: 'GET',
            url: url1,
            dataType: 'JSON',
            beforeSend: function () {
                $('#modalSendBulkEmail').modal('show');
            },
            success: function (res) {
                alert('success ' + res);
            },
            error: function (res) {
                alert(res.responseText);
            },
            complete: function () {
                $('#modalSendBulkEmail').modal('hide');
            }
        });
        event.preventDefault();
    });
//send sms for a request id
    $('#btnIdSendSMS').click(function (event) {
        var reqId1 = $("#txtIdInstReqId").val();
        var a1 = parseInt(reqId1);
        //var url1 = 'bulk-sms/send-sms/' + a1;
        var url1 = 'bulk-sms/send-sms-gsm/' + a1;

        $.ajax({
            type: 'GET',
            url: url1,
            dataType: 'JSON',
            beforeSend: function () {
                $('#modalSendBulkSMS').modal('show');
            },
            success: function (res) {
                //alert('SMS Sent Successfully');
                alert(res);
            },
            error: function (res) {
                alert(res.responseText);
            },
            complete: function () {
                $('#modalSendBulkSMS').modal('hide');
            }
        });
        event.preventDefault();
    });
//Send bulk SMS
    $('#btnIdSendBulkSMS').click(function (event) {
        $.ajax({
            type: 'GET',
            //url: 'bulk-sms/send-sms',
            url: 'bulk-sms/send-sms-gsm',
            dataType: 'JSON',
            beforeSend: function () {
                $('#modalSendBulkSMS').modal('show');
            },
            success: function (res) {
                alert(res);
            },
            error: function (res) {
                alert(res.responseText);
            },
            complete: function () {
                $('#modalSendBulkSMS').modal('hide');
            }
        });
        event.preventDefault();
    });
});

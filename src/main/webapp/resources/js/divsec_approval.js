jQuery(function () {

    $("#frmProcessRequest").hide({});
    $("#divIdPrintThis").hide();

    // batch numbers load

    if (role === "ROLE_STAFF") {
        $("#idAddInst").hide();

    }

    loadBatchCount(divId);

    function loadBatchCount(divId) {
        var urlBadge = '';
        if (role === "ROLE_STAFF" || role === "ROLE_HOD") {
            urlBadge = 'reqprocess/batchcount/' + divId;

        } else {
            urlBadge = 'reqprocess/batchcount';
        }

        $.ajax({
            type: 'GET',
            url: urlBadge,
            dataType: 'json',
            success: function (data) {
                var newReq = 0;
                var opened = 0;

                $.each(data, function (index, element) {
                    newReq += element.count;
                });

                $.each(data, function (index, element) {

                    switch (element.rs_name) {
                        case "New":
                            // All pills batch number
                            $("#spnIdNew").text(newReq);
                            break;
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
                    }

                    // alert(element.rs_name + ':' + index);
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
        urlReq = 'reqprocess/status/' + 5;
    }

    var dtRequest = $('#dtTable')
            .dataTable(
                    {
                        // No of records should be displayed
                        "lengthMenu": [40],
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
                                    }
                                }
                            }, {
                                "targets": [6],
                                "visible": false
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

//        if (role === "ROLE_STAFF" && dtRequest.fnGetData(aPos, 1) == 7) {
//            $('#cmdIdReqStatus').hide();
//            alert('The Status is Rejected. This can be seen by admin');
//        } else {
//            $('#cmdIdReqStatus').show();
//            $("#frmProcessRequest").show({});
//            $('#tblProcessRequest').hide({});
//        }

        $("#idModalApproval").modal('show');

        $('#spnReqId').text(dtRequest.fnGetData(aPos, 0));
        $('#txtIdReqId').val(dtRequest.fnGetData(aPos, 0));

        $('#idCmbReqStausId').val(dtRequest.fnGetData(aPos, 1));
        $('#cmdIdReqStatus').val(dtRequest.fnGetData(aPos, 2));

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

        if (dtRequest.fnGetData(aPos, 15) == true) {
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

    });



    $("#btnIdSaveChanges").click(
            function (e) {



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

//    $("#idAll").click(function () {
//        $("#frmProcessRequest").hide({});
//        $('#tblProcessRequest').show({});
//        dtRequest.fnReloadAjax(urlReq);
//        loadBatchCount(divId);
//    });

    $("#idApprove").click(function () {
        $("#frmProcessRequest").hide({});
        $('#tblProcessRequest').show({});
        filterReqByStatus(6, divId)
        loadBatchCount(divId);
       // $("#divIdPrintThis").show();
    });

    $("#idRejected").click(function () {
        $("#frmProcessRequest").hide({});
        $('#tblProcessRequest').show({});
        filterReqByStatus(7, divId)
        loadBatchCount(divId);
       // $("#divIdPrintThis").show();
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
        $("#divIdPrintThis").hide();
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

  

    var $select1 = $('#cmdIdReqStatus');

    // request the JSON data and parse into the select element
    $.ajax({
        url: 'requestStatus/req_status_approval',
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

    // Update Request after changing status
    $("#btnIdSaveChanges").click(
            function (e) {
                var reqId = $("#txtIdReqId").val();
                var stausId = $("#idCmbReqStausId").val();
                var d = $("#txtIdNote").val();

                var a = parseInt(reqId);
                var b = parseInt(stausId);
                var d = $("#txtIdNote").val();

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
                        dtRequest.fnReloadAjax(urlReq);

                        $('#tblProcessRequest').show({});
                        loadBatchCount();
                        $("#idModalApproval").modal('hide');
                    },
                    error: function (data) {
                        $("#idModalApproval").modal('hide');
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
                        dtStage
                                .fnReloadAjax('processstg/loadreqstage/'
                                        + reqId);
                        loadBatchCount();
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
                var instDate = $("#idTxtInstDate").val();
                var isRead = $("#txtIdInsIsRead").val();
                var instStaffId = $("#txtIdInsStfId").val();

                var a = parseInt(reqId);

                var b = parseInt(instStaffId);

                if (isRead == "1") {
                    c = true;
                } else {
                    c = false;
                }

                var url1 = 'reqprocess/instruction/' + a + '/' + inst + '/' + c
                        + '/' + b;

                // alert(url1);

                $.ajax({
                    type: 'GET',
                    url: url1,
                    success: function () {
                        getInstruction(a);
                    },
                    error: function (data) {
                        alert('Please enter an instruction');
                    }
                });
            });

    function getInstruction(reqId) {

        var list = '';
        var list1 = '';

        $('#idInst').html('');
        $
                .ajax({
                    type: 'GET',
                    url: 'reqprocess/inst/' + reqId,
                    success: function (data) {

                        var x = 1;
                        $
                                .each(
                                        data,
                                        function (key, val) {

                                            x = x + 1;
                                            res = x % 2;

                                            if (res == 0) {

                                                list1 = '<li> \n<div class="chat-body clearfix"> \n<div class="header"> \n<p class= "text-left"> \n<strong>Division </strong> \n</p> \n</div> \n<p>'
                                                        + val.insInstruction
                                                        + '</p> \n<p class="text-primary pull-right"> \n<i class="icon-time"></i><em>'
                                                        + val.insDate
                                                        + '</em> \n</p> \n</div> \n</li> <hr/>';

                                            } else {

                                                list1 = '<li> \n<div class="chat-body clearfix"> \n<div class="header"> \n<p class= "text-right"> \n<strong>Division </strong> \n</p> \n</div> \n<p>'
                                                        + val.insInstruction
                                                        + '</p> \n<p class="text-primary pull-left"> \n<i class="icon-time"></i><em>'
                                                        + val.insDate
                                                        + '</em> \n</p> \n</div> \n</li> <hr/>';

                                            }

                                            list += list1;

                                        })

                        $('#idInst').html(list);

                    },
                    error: function (data) {
                        alert("Get Instruction");
                    }
                });

    }

    $("#btnIdSendSMS")
            .click(
                    function (e) {

                        var reqId1 = $("#txtIdInstReqId").val();
                        var status = '';
                        var subject = '';
                        var mobileNo = '';
                        var isMobileExists = false;
                        var a1 = parseInt(reqId1);
                        var pubId = '';
                        var pubName = '';
                        var url1 = 'reqprocess/send-sms/' + a1;
                        // alert(url1);

                        $
                                .ajax({
                                    type: 'GET',
                                    url: url1,
                                    dataType: 'JSON',
                                    success: function (data) {
                                        $.each(data, function (key, val) {
                                            if (val.pi_mobile_phone != "") {
                                                isMobileExists = true;
                                                // alert('Mobile number is not
                                                // blank');
                                                reqId1 = val.req_id;
                                                status = val.rs_name;
                                                subject = val.sbj_name;
                                                mobileNo = val.pi_mobile_phone;
                                                pubId = val.req_public_id;
                                                pubName = val.pi_name;
                                                return;
                                            }
                                        });

                                        if (isMobileExists == false) {
                                            alert('Mobile number does not exist for public Id: '
                                                    + pubId
                                                    + ' Public Name: '
                                                    + pubName);
                                        } else {

                                            // alert(reqId1);
                                            // alert(status);
                                            // alert(subject);
                                            // alert(mobileNo);

                                            var msg1 = "your  \nRequest id= "
                                                    + reqId1 + "\nSubject = "
                                                    + subject + "\nStatus = "
                                                    + status

                                            alert(msg1);
                                            // var msg = "hi";
                                            sendSMS(msg1, mobileNo);
                                            alert('SMS sent successfully ! to public Id: '
                                                    + pubId
                                                    + ' Public Name: '
                                                    + pubName);
                                        }

                                    },
                                    error: function (data) {
                                        alert('fail ' + data);
                                    }
                                });

                    });

    function sendSMS(msg, to) {
        var url1 = 'http://api.clickatell.com/http/sendmsg?user=jzmamn&password=QLOWTWTDbHbVGA&api_id=3583362&to=94'
                + to + '&text=' + msg;
        alert(url1);

        $.getJSON(url1, function (jd) {
            alert(jd.id.toString());
        });
    }

    // Send Email

    $("#btnIdSendEmail").click(function (e) {
        var reqId = $("#txtIdReqId").val();
        var a = parseInt(reqId);

        var url1 = "mail/sendmail/" + a;

        // $.getJSON(url1, function(jd) {
        // alert('Email has been sent to ' + jd);
        // });

        $.ajax({
            type: 'GET',
            url: url1,
            dataType: 'JSON',
            success: function (res) {
                alert('success ' + res);
            },
            error: function (res) {
                alert(res.responseText);
            }
        });
        e.preventDefault();
    });

});

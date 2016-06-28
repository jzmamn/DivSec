jQuery(function () {
    loadToBePrinted();
    $('#btnIdPrintThis').click(function () {
        window.print();
        // confirm("printed successfully?");

        if (confirm(" Did your Approval Printed Successfully ? ") === true) {
            $.ajax({
                type: 'GET',
                url: 'print_approval/update_printed',
                success: function (data) {
                    alert('Printed Successfully');
                }
            });

        } else {
            alert('Not Printed');
        }
    });
    function loadToBePrinted() {

        var list = '';
        var list1 = '';
        var reqStatus = '';
        $('#divIdPrint').html('');
        $.ajax({
            type: 'GET',
            url: 'print_approval/loadprintapproval',
            success: function (data) {

                var x = 1;
                $.each(data, function (key, val) {
                    switch (val.app_req_status) {
                        case 6:
                            reqStatus = "Approved";
                            break;
                        case 7:
                            reqStatus = "Rejected";
                            break;
                    }

                    x = x + 1;
                    list1 = '<div><lable><strong>Status:' + reqStatus + '</strong></lable></div>'
                            + '<div><lable><strong>Request Id: ' + val.app_request_id + '</strong></lable></div>'
                            + '<div><lable><strong>Subject Code: ' + val.sbj_code + '</strong></lable></div>'
                            + '<div> <lable><strong>By:' + val.stf_name + '</strong></lable></div>'
                            + '<div><lable><strong>Date:' + val.app_date + '</strong></lable></div>'
                            + '<div><lable><strong>Note:' + val.req_note + '</strong></lable></div>'
                            + ' <hr/>';
                    list += list1;
                });
                $('#divIdPrint').html(list);
            },
            error: function (data) {
                alert("Batch Print" + data);
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

                        $.ajax({
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
                                if (isMobileExists === false) {
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

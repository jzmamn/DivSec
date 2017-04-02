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
                            reqStatus = 'Status:<span class="text-success">Approved</span>';
                            break;
                        case 7:
                            reqStatus = 'Status:<span class="text-danger">Rejected</span>';
                            break;
                    }

                    x = x + 1;
                    list1 = '<div><lable><strong>' + reqStatus + '</strong></lable></div>'
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
 
});

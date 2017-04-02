jQuery(function () {



    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            //right: 'month,agendaWeek,agendaDay'
            right: 'month'
        },
        defaultDate: moment(),
        default: 1,
        businessHours: true,
        editable: false,
        eventLimit: true, // allow "more" link when too many events
        events: {
            url: 'holiday/holidayforcal',
            error: function () {
                $('#script-warning').show();
            }
        },
        loading: function (bool) {
            $('#loading').toggle(bool);
        }
    });

    $('#chkIdHolActive').prop('checked', true); // check true when loading
    // Intialize Division Data Table
    var dt = $('#dtHoliday').dataTable({
        // No of records should be displayed
        "lengthMenu": [20, 40, 60],
        // Load table using JSON data by ajax
        "ajax": {
            "url": "holiday/loadholiday",
            "dataSrc": ""
        },
        "columns": [{
                "data": "holId"
            }, {
                "data": "holDate"
            }, {
                "data": "holDesc"
            }, {
                "data": "holIsActive"
            }
        ], dom: 'Bfrtip',
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
                extend: 'pdfHtml5'
            }, 'colvis',
            {
                extend: 'print',
                message: 'Request List',
                exportOptions: {
                    columns: ':visible'
                }

            }]
    });



    // Form submission save and edit
    $("#frmIdHoliday").submit(function () {
        // the Controller request mapping value as url.
        var url = "holiday/create";
        $.ajax({
            type: "POST",
            url: url,
            data: $("#frmIdHoliday").serialize(),
            success: function () {
                $("#modalHolidaySave").modal("hide");
                // window.location.reload();
                dt.fnReloadAjax('holiday/loadholiday');
                swal("Saved Sucessfully !", "....", "success");
            },
            fail: function (data) {
                $("#modalHolidaySave").modal("hide");
                swal("Save Failed !", "....", "error" + data);
            }
        });

        // avoid to execute the actual submit of the form.
        return false;
    });



    // Test function for JSON response
    $("#btn").click(function () {
        // alert('division/create1');
        // $.ajax({
        // url : 'division/create1',
        // dataType : "json"
        // }).done(function(json) {
        // alert("Success: " + json);
        // });
        // dt.fnReloadAjax();
        // table.fnReloadAjax();
        dt.fnReloadAjax('holiday/loadholiday');

    });


});

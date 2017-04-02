jQuery(function () {

    $('#chkIdHolActive').prop('checked', true); // check true when loading

    // Intialize Division Data Table
    var dt = $('#dtHoliday').dataTable({
        // No of records should be displayed
        "lengthMenu": [5, 10, 20],
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
        ]
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

    // GET VALUE ON TABLE ROW CLICK
    $('#dtHoliday tbody').on('click', 'tr', function (e) {
        var data = $(this).children("td").map(function () {
            return $(this).text();
        }).get();

        $('#txtIdHolId').val(data[0]);
        $('#dp1').val(data[1]);
        $('#txtIdHolName').val(data[2]);
        // $('#chkDivIsActive').val(data[2]);

        if (data[2] == "true") {
            blnIsDivActive = true;
        } else {
            blnIsDivActive = false;
        }

        $('#chkIdHolActive').prop('checked', blnIsDivActive);

        $("#modalHolidaySave").modal("show");

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

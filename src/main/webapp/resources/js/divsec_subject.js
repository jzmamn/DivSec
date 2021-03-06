jQuery(function () {

    // ============Form validation==============
    $.validate({
        form: '#frmIdSubject',
        modules: 'toggleDisabled',
        disabledFormFilter: 'form.toggle-disabled',
        onError: function ($form) {
            event.preventDefault();
        }

    });



    $("#btnAddDivision").click(function () {
        $('#txtIdSbjId').val("");
        $('#txtIdSbjCode').val("");
        $('#txtIdSbjName').val("");
        $('#txtIdDivisionId').val("");
        $('#txtIdDivision').val("");
        $('#txtIdSbjDuration').val("");
        $('#txtIdSbjCost').val("");
// Modal will be loaded by the bootstrap command in subject.jsp
    });


    // ==============Start Subject===================

    $('#chkIdSbjActive').prop('checked', true); // check true when loading

    // Intialize Data Table

    var dtSubject = $('#dtSubject').dataTable({
        // No of records should be displayed
        "lengthMenu": [5, 10, 20],
        // Load table using JSON data by ajax
        "ajax": {
            "url": "subject/loadsubject",
            "dataSrc": ""
        },
        "columns": [{
                "data": "sbjId"
            }, {
                "data": "sbjCode"
            }, {
                "data": "sbjName"
            }, {
                "data": "division.divId"
            }, {
                "data": "division.divName"
            }, {
                "data": "sbjDuration"
            }, {
                "data": "sbjCost"
            }, {
                "data": "sbjActive"
            }

        ],
        "columnDefs": [{
                "targets": [0],
                "visible": false
            }, {
                "targets": [3],
                "visible": false
            }]

    });

    // Form submission save and edit
    $("#frmIdSubject").submit(function () {

        if ($('#txtIdCatId').val() == "") {
            alert('Please select a user category');
            return;
        }

        if ($('#txtIdDivisionId').val() == "") {
            alert('Please select a user Division');
            return;
        }

        // the Controller request mapping value as url.
        var url = "subject/create";
        $.ajax({
            type: "POST",
            url: url,
            data: $("#frmIdSubject").serialize(),
            success: function (res) {

                if (res == "1") {
                    dtSubject.fnReloadAjax('subject/loadsubject');
                    swal("Saved Sucessfully !", "....", "success");
                    $("#modalSubject").modal("hide");

                } else {
                    swal("Oops", res, "error");
                }

            },
            fail: function (res) {
                $("#modalSubject").modal("hide");
                swal("Save Failed !", res, "error");
            }
        });

        // avoid to execute the actual submit of the form.
        return false;
    });

    $("#btn").click(function () {
        dtSubject.fnReloadAjax('subject/loadsubject');
        // alert('usercreation/loaduser');
        // $.ajax({
        // url : 'usercreation/loaduser',
        // dataType : "json"
        // }).done(function(json) {
        // alert("Success: " + json);
        // });

    });

    // GET VALUE ON TABLE ROW CLICK From Subject table

    $('#dtSubject tbody').on('click', 'tr', function (e) {

        var aPos = dtSubject.fnGetPosition(this);
        // alert(aPos);
        $('#txtIdSbjId').val(dtSubject.fnGetData(aPos, 0));
        $('#txtIdSbjCode').val(dtSubject.fnGetData(aPos, 1));
        $('#txtIdSbjName').val(dtSubject.fnGetData(aPos, 2));
        $('#txtIdDivisionId').val(dtSubject.fnGetData(aPos, 3));
        $('#txtIdDivision').val(dtSubject.fnGetData(aPos, 4));
        $('#txtIdSbjDuration').val(dtSubject.fnGetData(aPos, 5));
        $('#txtIdSbjCost').val(dtSubject.fnGetData(aPos, 6));

        var varChkActive = dtSubject.fnGetData(aPos, 7);

        if (varChkActive == true) {
            blnIsDivActive = true;
        } else {
            blnIsDivActive = false;
        }

        $('#chkIdSbjActive').prop('checked', blnIsDivActive);
        $("#modalSubject").modal("show");

    });

    // Delete function
    $("#btnDelete").click(
            function (e) {
                e.preventDefault();

                if ($('#txtIdDivId').val() == "") {
                    swal("Oops",
                            "Please Select an Appropreate record to delete !",
                            "error");
                    $("#modalSubject").modal("hide");
                    return;
                }

                var subjectId = $('#txtIdSbjId').val();

                var url = "subject/delete/" + subjectId;
                // alert(url);
                swal({
                    title: "Are you sure?",
                    text: "Are you sure that you want to delete this Staff?",
                    type: "warning",
                    showCancelButton: true,
                    closeOnConfirm: false,
                    confirmButtonText: "Yes, delete it!",
                    confirmButtonColor: "#ec6c62"
                }, function () {
                    $.ajax({
                        url: url,
                        success: function (data) {
                            if (data == "1") {
                                dtSubject.fnReloadAjax('subject/loadsubject');
                                swal("Deleted!",
                                        "Staff has been Successfully Deleted!",
                                        "success");
                                $("#modalSubject").modal("hide");

                            } else {
                                swal("Oops", data, "error");
                            }
                        },
                        fail: function (data) {
                            alert(data);
                            swal("Oops", "Could Not Connect to the server!",
                                    "error");
                        }

                    });
                });
            });

    // ==============End Subject===================

    // =======================START DIVISION MODAL=========================

    // Intialize Division Data Table
    var dtDivision = $('#dtDivision').dataTable({
        // No of records should be displayed
        "lengthMenu": [5, 10, 20],
        // Load table using JSON data by ajax
        "ajax": {
            "url": "division/loadactivedivision",
            "dataSrc": ""
        },
        "columns": [{
                "data": "divId"
            }, {
                "data": "divName"
            }, {
                "data": "divActive"
            }

        ],
        "columnDefs": [{
                "targets": [2],
                "visible": false
            }]

    });

    // GET VALUE ON TABLE ROW CLICK FROM DIVISION TABLE
    $('#dtDivision tbody').on('click', 'tr', function (e) {
        var data = $(this).children("td").map(function () {
            return $(this).text();
        }).get();

        $('#txtIdDivisionId').val(data[0]);
        $('#txtIdDivision').val(data[1]);

        $("#modalDivision").modal("hide");
    });

    $("#btnIdShowDiv").click(function () {
        dtDivision.fnReloadAjax('division/create1');
    });

    // =======================END DIVISION MODAL=========================
});
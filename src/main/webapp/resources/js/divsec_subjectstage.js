jQuery(function () {

    // ==============Start Subject===================
    $("#txtIdSbjId").val("");
    $("#txtIdSbjName").val("");
    $("#txtIdStgCost").val("");

    $('#chkSbjStgIsActive').prop('checked', true); // check true when loading

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
            }

        ]
    });

    // Intialize Subject Stage Table
    var dtSbjStg = $('#dtSbjStg').dataTable({
        // No of records should be displayed
        "lengthMenu": [5, 10, 20],
        // Load table using JSON data by ajax
        "ajax": {
            "url": "sbjstages/loadsbjstage/0",
            "dataSrc": ""
        },
        "columns": [{
                "data": "stgId"
            }, {
                "data": "subject.sbjId"
            }, {
                "data": "stgName"
            }, {
                "data": "stgCost"
            }, {
                "data": "stgActive"
            }

        ],
        "columnDefs": [{
                "targets": [0],
                "visible": false
            },{
                "targets": [1],
                "visible": false
            }, {
                "targets": [3],
                "visible": false
            }

        ]

    });

    // Form submission save and edit
    $("#frmIdSbjStg").submit(function () {

        if ($('#txtIdSbjId').val() == "") {
            alert('Select a Subject');
            return;
        }

        if ($('#txtIdStgName').val() == "") {
            alert('Enter a Subject Stage');
            return;
        }

        var sbjId1 = $("#txtIdSbjId").val();

        // the Controller request mapping value as url.
        var url = "sbjstages/create";
        $.ajax({
            type: "POST",
            url: url,
            data: $("#frmIdSbjStg").serialize(),
            success: function (res) {

                if (res == "1") {
                    dtSbjStg.fnReloadAjax('sbjstages/loadsbjstage/' + sbjId1);
                    swal("Saved Sucessfully !", "....", "success");
                    $("#txtIdStgId").val("");
                    $("#txtIdStgName").val("");

                } else {
                    swal("Oops", res, "error");
                    $("#txtIdStgId").val("");
                    $("#txtIdStgName").val("");
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
        var sbjId = dtSubject.fnGetData(aPos, 0)
        $('#txtIdSbjId').val(dtSubject.fnGetData(aPos, 0));
        $('#txtIdSbjName').val(dtSubject.fnGetData(aPos, 1));
        $("#modalSubject").modal("hide");
        dtSbjStg.fnReloadAjax('sbjstages/loadsbjstage/' + sbjId);
    });

    // GET VALUE ON TABLE ROW CLICK From Subject Stage table

    $('#dtSbjStg tbody').on('click', 'tr', function (e) {
        var aPos1 = dtSbjStg.fnGetPosition(this);
        $('#txtIdStgId').val(dtSbjStg.fnGetData(aPos1, 0));
        $('#txtIdSbjId').val(dtSbjStg.fnGetData(aPos1, 1));
        $('#txtIdStgName').val(dtSbjStg.fnGetData(aPos1, 2));
        $('#txtIdStgCost').val(dtSbjStg.fnGetData(aPos1, 3));
        var varChkActive = dtSbjStg.fnGetData(aPos1, 4);
        if (varChkActive == true) {
            blnIsDivActive = true;
        } else {
            blnIsDivActive = false;
        }

        $('#chkIdSbjActive').prop('checked', blnIsDivActive);
    });

    // Delete function
    $("#btnDelete").click(
            function (e) {
                e.preventDefault();

                var sbjId = ('#txtIdSbjId').val();

                if ($('#txtIdSbjId').val() == "") {
                    swal("Oops", "Select a record to delete !", "error");
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
                                dtSbjStage
                                        .fnReloadAjax('sbjstages/loadsbjstage/'
                                                + sbjId);
                                swal("Deleted!",
                                        "Stage has been Successfully Deleted!",
                                        "success");
                            } else {
                                swal("Error", data, "error");
                            }
                        },
                        fail: function (data) {
                            alert(data);
                            swal("Error", "Could Not Connect to the server!",
                                    "error");
                        }
                    });
                });
            });

});
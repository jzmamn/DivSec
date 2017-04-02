jQuery(function () {
    $('#chkUserIsActive').prop('checked', true); // check true when loading

    if (role === "ROLE_CLIENT") {

        $('#txtIdUserId').attr('readonly', true);
        $("#divIdEmail").hide();
        $("#divIdMobile").hide();

    }

    // Intialize Data Table
    var dtUser = $('#dtUser').dataTable({
        // No of records should be displayed
        "lengthMenu": [5, 10, 20],
        // Load table using JSON data by ajax
        "ajax": {
            "url": "mysetup/loadbystfId/" + staffId,
            "dataSrc": ""
        },
        "columns": [{
                "data": "stf_id"
            }, {
                "data": "stf_name"
            }, {
                "data": "stf_dvision_id"
            }, {
                "data": "div_name"
            }, {
                "data": "role_id"
            }, {
                "data": "role_name"
            }, {
                "data": "stf_user_id"
            }, {
                "data": "stf_password"
            }, {
                "data": "stf_email"
            }, {
                "data": "stf_mobile"
            }, {
                "data": "stf_note"
            }, {
                "data": "stf_active"
            }, {
                "data": "stf_pi_id"
            }

        ],
        "columnDefs": [{
                "targets": [2],
                "visible": false
            }, {
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
            }, {
                "targets": [9],
                "visible": false
            }, {
                "targets": [10],
                "visible": false
            }, {
                "targets": [12],
                "visible": false
            }]

    });

    // GET VALUE ON TABLE ROW CLICK From Staff table

    $('#dtUser tbody').on('click', 'tr', function (e) {

        var aPos = dtUser.fnGetPosition(this);
        // alert(aPos);
        $('#txtIdUCId').val(dtUser.fnGetData(aPos, 0));
        $('#txtIdName').val(dtUser.fnGetData(aPos, 1));
        $('#txtIdDivisionId').val(dtUser.fnGetData(aPos, 2));
        $('#txtIdDivision').val(dtUser.fnGetData(aPos, 3));

        $('#txtIdCatId').val(dtUser.fnGetData(aPos, 4));
        $('#txtIdCatName').val(dtUser.fnGetData(aPos, 5));

        $('#txtIdUserId').val(dtUser.fnGetData(aPos, 6));
        $('#txtIdPwd').val(dtUser.fnGetData(aPos, 7));
        $('#txtIdEmail').val(dtUser.fnGetData(aPos, 8));
        $('#txtIdMobile').val(dtUser.fnGetData(aPos, 9));
        $('#txtIdNote').val(dtUser.fnGetData(aPos, 10));
        $('#txtIdPublicId').val(dtUser.fnGetData(aPos, 12));
        var varChkActive = dtUser.fnGetData(aPos, 11);

        if (varChkActive == true) {
            blnIsDivActive = true;
        } else {
            blnIsDivActive = false;
        }

        $('#chkUserIsActive').prop('checked', blnIsDivActive);

        // $('#txtIdCatId').val(dtUser.fnGetData(aPos, 10));
        // $('#txtCatName').val(dtUser.fnGetData(aPos, 11));




        $("#modalUser").modal("show");

    });

    // Form submission save and edit
    $("#frmIdUser").submit(function () {

        if ($('#txtIdCatId').val() == "") {
            alert('Please select a user category');
            return;
        }

        if ($('#txtIdDivisionId').val() == "") {
            alert('Please select a user Division');
            return;
        }

        // the Controller request mapping value as url.
        var url = "usercreation/create";
        $.ajax({
            type: "POST",
            url: url,
            data: $("#frmIdUser").serialize(),
            success: function (res) {

                if (res == "1") {
                    dtUser.fnReloadAjax('usercreation/loaduser');
                    swal("Saved Sucessfully !", "....", "success");
                    $("#modalUser").modal("hide");

                } else {
                    swal("Oops", res, "error");
                }

                dtUser.fnReloadAjax('mysetup/loadbystfId/' + staffId);

            },
            fail: function (res) {
                $("#modalUser").modal("hide");
                swal("Save Failed !", res, "error");
            }

        });

        // avoid to execute the actual submit of the form.
        return false;
    });

});

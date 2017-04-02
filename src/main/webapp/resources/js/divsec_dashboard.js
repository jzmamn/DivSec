jQuery(function () {
    var intDivId = parseInt(divId);

    var dateObj = new Date();
    var month = dateObj.getUTCMonth() + 1; // months from 1-12
    var day = dateObj.getUTCDate();
    var year = dateObj.getUTCFullYear();

    // Morris chart
    createDonut("dboard/donut-by-division/1", "morris-donut-admin");
    createDonut("dboard/donut-by-division/2", "morris-donut-palaning");
    createDonut("dboard/donut-by-division/3", "morris-donut-registrar");
    createDonut("dboard/donut-by-division/4", "morris-donut-agri");
    createDonut("dboard/donut-by-division/5", "morris-donut-accounts");
    createDonut("dboard/donut-by-division/6", "morris-donut-social");
    createDonut("dboard/donut-by-division/7", "morris-donut-disaster");
    createDonut("dboard/donut-by-division/8", "morris-donut-samurdhi");
    createDonut("dboard/donut-by-division/9", "morris-donut-land");

    createSummaryByMonth(year);
    $("#dpYear").change(function () {

        var filterYear = $("#dpYear").val();
        createSummaryByMonth(filterYear);
    });

    createBar("dboard/barchart-current-year/" + year, "morris-bar-chart");
    $("#dpYearBar")
            .change(
                    function () {

                        $("#barChartContent").html('');
                        $("#barChartContent").html(
                                '<div id="morris-bar-chart"></div>');

                        var filterYear = $("#dpYearBar").val();

                        createBar("dboard/barchart-current-year/" + filterYear,
                                "morris-bar-chart");
                    });

    function createDonut(url, element) {
        $.getJSON(url, function (ab) {
            Morris.Donut({
                element: element,
                data: ab,
                // backgroundColor: '#ccc',
                labelColor: '#449D45',
                colors: ['#31B0D5', '#EC971F', '#3071A9', '#449D44', '#ff0000', '#F7EF09'],
                formatter: function (x) {
                    return x;
                }
            }).on('click', function (i, row) {
                // console.log(i, row[1]);
                // alert(i, row[1]);
            });
        });
    }

    // Plot barchart current year
    // createBar("dboard/barchart-current-year", "morris-bar-chart");

    function createBar(url, element) {
        $.getJSON(url, function (ab) {
            Morris.Bar({
                element: element,
                data: ab,
                xkey: 'EntMonth',
                ykeys: ['New', 'Opend', 'Completed', 'Closed', 'For Approval', 'Approved', 'Rejected'],
                labels: ['New', 'Opend', 'Completed', 'Closed', 'For Approval', 'Approved', 'Rejected'],
                hideHover: 'auto',
                resize: true,
                barColors: ['#31B0D5', '#EC971F', '#3071A9', '#e6e6e6', '#449D44', '#F7EF09', '#ff0000']

            });
        });
    }

    // Summary by division
    $.ajax({
        url: 'dboard/table-last-modified',
        dataType: 'JSON',
        success: function (data) {

            var table = $("#tblLastModified tbody");
            // $select.html('');
            // iterate over the data and append a select option
            $.each(data, function (key, val) {
                // alert(val);
                table.append('<tr>' + '<td style="text-align: center;" >'
                        + val.rl_pr_id + '</td>'
                        + '<td style="text-align: center;">' + val.DateEnt
                        + '</td>' + '<td style="text-align: center;">'
                        + val.Modified + '</td>'
                        + '<td style="text-align: center;">' + val.stf_name
                        + '</td>' + '</tr>');
            })
        },
        error: function () {
            // if there is an error append a 'none available' option
            $select.html('<option id="-1">none available</option>');
        }
    });

    // Summary by year
    $.ajax({
        url: 'dboard/table-summary-by-annually',
        dataType: 'JSON',
        success: function (data) {

            var table = $("#tblByAnnual tbody");
            // $select.html('');
            // iterate over the data and append a select option
            $.each(data, function (key, val) {
                // alert(val);
                table.append('<tr>' + '<td style="text-align: center;" >'
                        + val.EntYear + '</td>'
                        + '<td style="text-align: center;">' + val.New
                        + '</td>' + '<td style="text-align: center;">'
                        + val.Opend + '</td>'
                        + '<td style="text-align: center;">' + val.Completed
                        + '</td>' + '<td style="text-align: center;">'
                        + val.Closed + '</td>' + '</tr>');
            })
        },
        error: function () {
            // if there is an error append a 'none available' option
            $select.html('<option id="-1">none available</option>');
        }
    });

    // Summary by month

    function createSummaryByMonth(y) {
        $.ajax({
            url: 'dboard/table-summary-by-monthly/' + y,
            dataType: 'JSON',
            success: function (data) {

                var table = $("#tblSummaryByMonth tbody");
                table.html('');
                // iterate over the data and append a select option
                $.each(data, function (key, val) {
                    // alert(val);
                    table.append('<tr>' + '<td style="text-align: center;" >'
                            + val.EntMonth + '</td>'
                            + '<td style="text-align: center;">' + val.New
                            + '</td>' + '<td style="text-align: center;">'
                            + val.Opend + '</td>'
                            + '<td style="text-align: center;">'
                            + val.Completed + '</td>'
                            + '<td style="text-align: center;">' + val.Closed
                            + '</td>' + '</tr>');
                })
            },
            error: function () {
                // if there is an error append a 'none available' option
                $select.html('<option id="-1">none available</option>');
            }
        });
    }

    // Summary by month
    $.ajax({
        url: 'dboard/table-summary-by-division',
        dataType: 'JSON',
        success: function (data) {

            var table = $("#tblDivisionSummary tbody");
            // $select.html('');
            // iterate over the data and append a select option
            $.each(data, function (key, val) {
                // alert(val);
                table.append('<tr>' + '<td style="text-align: center;" >'
                        + val.div_name + '</td>'
                        + '<td style="text-align: center;">' + val.New
                        + '</td>' + '<td style="text-align: center;">'
                        + val.Opend + '</td>'
                        + '<td style="text-align: center;">' + val.Completed
                        + '</td>' + '<td style="text-align: center;">'
                        + val.Closed + '</td>' + '</tr>');
            })
        },
        error: function () {
            // if there is an error append a 'none available' option
            $select.html('<option id="-1">none available</option>');
        }
    });

    // Loads batch count in the status icons

    $.ajax({
        type: 'GET',
        url: 'reqprocess/batchcount',
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
                        $("#spnIdNew").text(element.count);
                        break;
                    case "Opened":
                        $("#spnIdOpened").text(element.count);
                        break;
                    case "Completed":
                        $("#spnIdCompleted").text(element.count);
                        break;
                    case "For Approval":
                        $("#spnIdApproval").text(element.count);
                        break;
                    case "Closed":
                        $("#spnIdClosed").text(element.count);
                        break;
                        // case "Rejected":
                        // break;
                    case "Approved":
                        $("#spnIdApprove").text(element.count);
                        break;

                    case "Void":
                        $("#spnIdVoid").text(element.count);
                        break;

                }

                // alert(element.rs_name + ':' + index);
            });
        },
        error: function (data) {
            alert('1. aymen2 fail' + data);
        }
    });

//Load Over due
    var dtRequestOverdue = $('#tblOverdue')
            .dataTable(
                    {
                        // No of records should be displayed
                        "lengthMenu": [40],
                        "paging": false,
                        "ordering": false,
                        "info": false,
                        "bFilter": false,
                        // Load table using JSON data by ajax
                        "ajax": {
                            "url": "rptrequestoverdue/loadoverdue/0/0/0",
                            "dataSrc": ""
                        },
                        "columns": [{
                                "data": "req_id"
                            }, {
                                "data": "req_subject_id"
                            }, {
                                "data": "sbj_code"
                            }, {
                                "data": "req_division_id"
                            }, {
                                "data": "div_name"
                            }, {
                                "data": "req_public_id"
                            }, {
                                "data": "pi_name"
                            }, {
                                "data": "req_status_id"
                            }, {
                                "data": "rs_name"
                            }, {
                                "data": "EntDate"
                            }, {
                                "data": "today"
                            }, {
                                "data": "sbj_duration"
                            }, {
                                "data": "OverDue"
                            }],
                        "columnDefs": [
                            {
                                "targets": [1],
                                "visible": false
                            },
                            {
                                "targets": [3],
                                "visible": false
                            }, {
                                "targets": [4],
                                "visible": false
                            },
                            {
                                "targets": [5],
                                "visible": false
                            }, {
                                "targets": [6],
                                "visible": false
                            },
                            {
                                "targets": [7],
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
                            }]

                    });


//Load Reminder
    var dtRequestReminder = $('#tblReminder')
            .dataTable(
                    {
                        // No of records should be displayed
                        "lengthMenu": [40],
                        "paging": false,
                        "ordering": false,
                        "info": false,
                        "bFilter": false,
                        // Load table using JSON data by ajax
                        "ajax": {
                            "url": "rptrequestremider/loadreminder/0/0/0",
                            "dataSrc": ""
                        },
                        "columns": [{
                                "data": "req_id"
                            }, {
                                "data": "req_subject_id"
                            }, {
                                "data": "sbj_code"
                            }, {
                                "data": "req_division_id"
                            }, {
                                "data": "div_name"
                            }, {
                                "data": "req_public_id"
                            }, {
                                "data": "pi_name"
                            }, {
                                "data": "req_status_id"
                            }, {
                                "data": "rs_name"
                            }, {
                                "data": "EntDate"
                            }, {
                                "data": "today"
                            }, {
                                "data": "sbj_duration"
                            }, {
                                "data": "Reminder"
                            }],
                        "columnDefs": [
                            {
                                "targets": [1],
                                "visible": false
                            },
                            {
                                "targets": [3],
                                "visible": false
                            }, {
                                "targets": [4],
                                "visible": false
                            },
                            {
                                "targets": [5],
                                "visible": false
                            }, {
                                "targets": [6],
                                "visible": false
                            },
                            {
                                "targets": [7],
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
                            }]

                    });

});

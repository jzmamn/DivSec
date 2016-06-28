jQuery(function () {

    var intDivId = parseInt(divId);

    var dateObj = new Date();
    var month = dateObj.getUTCMonth() + 1; // months from 1-12
    var day = dateObj.getUTCDate();
    var year = dateObj.getUTCFullYear();

    getSummaryByMonth(year, intDivId);
    getSummaryByYear(year, intDivId);

    $("#dpYear").change(function () {
        var filterYear = $("#dpYear").val();
        getSummaryByMonth(filterYear, intDivId);
    });

    $("#dpYear1").change(function () {
        var filterYear = $("#dpYear1").val();
        getSummaryByYear(filterYear, intDivId);
    });

    // Morris chart Donut
    createDonut("dboard/donut-by-division/" + intDivId, "morris-donut-chart1");

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
            })
//                                .on('click', function(i, row) {
//				// console.log(i, row[1]);
//				alert(i, row[1]);
//			});
        });
    }

    // Plot barchart current year
    // createBar("dboard/barchart-current-year", "morris-bar-chart");

    createBar("dboard/barchart_division/" + year + "/" + intDivId,
            "morris-bar-chart");

    $("#dpYearBar").change(
            function () {

                $("#barChartContent").html('');
                $("#barChartContent").html(
                        '<div id="morris-bar-chart"></div>');

                var filterYear = $("#dpYearBar").val();

                createBar("dboard/barchart_division/" + filterYear
                        + "/" + intDivId, "morris-bar-chart");

            });

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

    // Summary by year
    function getSummaryByYear(filterYear, intDivId) {
        $
                .ajax({
                    url: 'dboard/table-summary-by-year/' + filterYear + '/'
                            + intDivId,
                    dataType: 'JSON',
                    success: function (data) {

                        var table = $("#tblByAnnual tbody");
                        table.html('');
                        // iterate over the data and append a select option
                        $.each(data, function (key, val) {
                            // alert(val);
                            table.append('<tr>'
                                    + '<td style="text-align: center;" >'
                                    + val.EntYear + '</td>'
                                    + '<td style="text-align: center;">'
                                    + val.New + '</td>'
                                    + '<td style="text-align: center;">'
                                    + val.Opend + '</td>'
                                    + '<td style="text-align: center;">'
                                    + val.Completed + '</td>'
                                    + '<td style="text-align: center;">'
                                    + val.Closed + '</td>' + '</tr>');
                        })
                    },
                    error: function () {
                        // if there is an error append a 'none available' option
                        $select.html('<option id="-1">none available</option>');
                    }
                });

    }

    // Summary by month
    function getSummaryByMonth(filterYear, intDivId) {

        $.ajax({
            url: 'dboard/table-summary-by-month/' + filterYear + '/'
                    + intDivId,
            dataType: 'JSON',
            success: function (data) {

                var table = $("#tblSummaryByMonth tbody");
                table.html('');
                // iterate over the data and append a select option
                $.each(data, function (key, val) {
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

    // Loads batch count in the status icons
    $.ajax({
        type: 'GET',
        url: 'reqprocess/batchcount/' + intDivId,
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
                    case "Closed":
                        $("#spnIdClosed").text(element.count);
                        break;
                        // case "Rejected":
                        // break;
                    case "Approved":
                        $("#spnIdApprove").text(element.count);
                        break;
                    case "ToBeApp":
                        $("#spnIdApproval").text(element.count);
                        break;
                }

                // alert(element.rs_name + ':' + index);
            });
        },
        error: function (data) {
            alert('1. aymen2 fail' + data);
        }
    });

})

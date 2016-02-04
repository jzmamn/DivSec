jQuery(function() {
	var intDivId = parseInt(divId);

	var dateObj = new Date();
	var month = dateObj.getUTCMonth() + 1; // months from 1-12
	var day = dateObj.getUTCDate();
	var year = dateObj.getUTCFullYear();

	// Morris chart
	createDonut("dboard/donut-by-division/1", "morris-donut-chart1");
	createDonut("dboard/donut-by-division/3", "morris-donut-chart2");
	createDonut("dboard/donut-by-division/2", "morris-donut-chart3");
	createDonut("dboard/donut-by-division/4", "morris-donut-chart4");
	createDonut("dboard/donut-by-division/5", "morris-donut-chart5");
	createDonut("dboard/donut-by-division/6", "morris-donut-chart6");
	createDonut("dboard/donut-by-division/7", "morris-donut-chart7");
	createDonut("dboard/donut-by-division/8", "morris-donut-chart8");
	createDonut("dboard/donut-by-division/9", "morris-donut-chart9");

	createSummaryByMonth(year);
	$("#dpYear").change(function() {

		var filterYear = $("#dpYear").val();
		createSummaryByMonth(filterYear);
	});

	createBar("dboard/barchart-current-year/" + year, "morris-bar-chart");
	$("#dpYearBar")
			.change(
					function() {

						$("#barChartContent").html('');
						$("#barChartContent").html(
								'<div id="morris-bar-chart"></div>');

						var filterYear = $("#dpYearBar").val();

						createBar("dboard/barchart-current-year/" + filterYear,
								"morris-bar-chart");
					});

	function createDonut(url, element) {
		$.getJSON(url, function(ab) {
			Morris.Donut({
				element : element,
				data : ab,
				// backgroundColor: '#ccc',
				labelColor : '#449D45',
				colors : [ '#31B0D5', '#EC971F', '#3071A9', '#449D44' ],
				formatter : function(x) {
					return x;
				}
			}).on('click', function(i, row) {
				// console.log(i, row[1]);
				alert(i, row[1]);
			});
		});
	}

	// Plot barchart current year
	// createBar("dboard/barchart-current-year", "morris-bar-chart");

	function createBar(url, element) {
		$.getJSON(url, function(ab) {
			Morris.Bar({
				element : element,
				data : ab,
				xkey : 'EntMonth',
				ykeys : [ 'New', 'Opend', 'Completed', 'Closed' ],
				labels : [ 'New', 'Opend', 'Completed', 'Closed' ],
				hideHover : 'auto',
				resize : true,
				barColors : [ '#31B0D5', '#EC971F', '#3071A9', '#000' ]

			});
		});
	}

	// Summary by division
	$.ajax({
		url : 'dboard/table-last-modified',
		dataType : 'JSON',
		success : function(data) {

			var table = $("#tblLastModified tbody");
			// $select.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
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
		error : function() {
			// if there is an error append a 'none available' option
			$select.html('<option id="-1">none available</option>');
		}
	});

	// Summary by year
	$.ajax({
		url : 'dboard/table-summary-by-annually',
		dataType : 'JSON',
		success : function(data) {

			var table = $("#tblByAnnual tbody");
			// $select.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
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
		error : function() {
			// if there is an error append a 'none available' option
			$select.html('<option id="-1">none available</option>');
		}
	});

	// Summary by month

	function createSummaryByMonth(y) {
		$.ajax({
			url : 'dboard/table-summary-by-monthly/' + y,
			dataType : 'JSON',
			success : function(data) {

				var table = $("#tblSummaryByMonth tbody");
				table.html('');
				// iterate over the data and append a select option
				$.each(data, function(key, val) {
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
			error : function() {
				// if there is an error append a 'none available' option
				$select.html('<option id="-1">none available</option>');
			}
		});
	}

	// Summary by month
	$.ajax({
		url : 'dboard/table-summary-by-division',
		dataType : 'JSON',
		success : function(data) {

			var table = $("#tblDivisionSummary tbody");
			// $select.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
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
		error : function() {
			// if there is an error append a 'none available' option
			$select.html('<option id="-1">none available</option>');
		}
	});

	// Loads batch count in the status icons

	$.ajax({
		type : 'GET',
		url : 'reqprocess/batchcount',
		dataType : 'json',
		success : function(data) {
			var newReq = 0;
			var opened = 0;

			$.each(data, function(index, element) {
				newReq += element.count;
			});

			$.each(data, function(index, element) {

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
		error : function(data) {
			alert('1. aymen2 fail' + data);
		}
	});

})

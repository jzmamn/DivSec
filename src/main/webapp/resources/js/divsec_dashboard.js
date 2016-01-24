jQuery(function() {

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
	createBar("dboard/barchart-current-year", "morris-bar-chart");

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
		url : 'statusbydivision.json',
		dataType : 'JSON',
		success : function(data) {

			var table = $("#tblByDivision tbody");
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
	$.ajax({
		url : 'dboard/table-summary-by-monthly/2016',
		dataType : 'JSON',
		success : function(data) {

			var table = $("#tblSummaryByMonth tbody");
			// $select.html('');
			// iterate over the data and append a select option
			$.each(data, function(key, val) {
				// alert(val);
				table.append('<tr>' + '<td style="text-align: center;" >'
						+ val.EntMonth + '</td>'
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

})

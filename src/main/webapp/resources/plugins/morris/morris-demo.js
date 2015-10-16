$(function() {

	Morris.Donut({
		element : 'morris-donut-chart1',
		data : [ {
			label : "Pending",
			value : 12
		}, {
			label : "In Progress",
			value : 30
		}, {
			label : "Opened",
			value : 20
		} ],
		resize : true
	});

	Morris.Donut({
		element : 'morris-donut-chart2',
		data : [ {
			label : "Pending",
			value : 12
		}, {
			label : "In Progress",
			value : 30
		}, {
			label : "Opened",
			value : 20
		} ],
		resize : true
	});

	Morris.Donut({
		element : 'morris-donut-chart3',
		data : [ {
			label : "Pending",
			value : 12
		}, {
			label : "In Progress",
			value : 30
		}, {
			label : "Opened",
			value : 20
		} ],
		resize : true
	});

	Morris.Donut({
		element : 'morris-donut-chart4',
		data : [ {
			label : "Pending",
			value : 12
		}, {
			label : "In Progress",
			value : 30
		}, {
			label : "Opened",
			value : 20
		} ],
		resize : true
	});

	Morris.Donut({
		element : 'morris-donut-chart5',
		data : [ {
			label : "Pending",
			value : 12
		}, {
			label : "In Progress",
			value : 30
		}, {
			label : "Opened",
			value : 20
		} ],
		resize : true
	});

	Morris.Donut({
		element : 'morris-donut-chart6',
		data : [ {
			label : "Pending",
			value : 12
		}, {
			label : "In Progress",
			value : 30
		}, {
			label : "Opened",
			value : 20
		} ],
		resize : true
	});

	Morris.Donut({
		element : 'morris-donut-chart7',
		data : [ {
			label : "Pending",
			value : 12
		}, {
			label : "In Progress",
			value : 30
		}, {
			label : "Opened",
			value : 20
		} ],
		resize : true
	});

	Morris.Donut({
		element : 'morris-donut-chart8',
		data : [ {
			label : "Pending",
			value : 12
		}, {
			label : "In Progress",
			value : 30
		}, {
			label : "Opened",
			value : 20
		} ],
		resize : true
	});

	Morris.Donut({
		element : 'morris-donut-chart9',
		data : [ {
			label : "Pending",
			value : 12
		}, {
			label : "In Progress",
			value : 30
		}, {
			label : "Opened",
			value : 20
		} ],
		resize : true
	});
	Morris.Bar({
		element : 'morris-bar-chart',
		data : [ {
			y : 'Oct',
			a : 100,
			b : 90,
			c : 150
		}, {
			y : 'Sep',
			a : 75,
			b : 65,
			c : 251
		}, {
			y : 'Aug',
			a : 50,
			b : 40,
			c : 128
		}, {
			y : 'Jul',
			a : 75,
			b : 65,
			c : 146
		}, {
			y : 'Jun',
			a : 50,
			b : 40,
			c : 155
		}, {
			y : 'May',
			a : 75,
			b : 65,
			c : 150
		} ],
		xkey : 'y',
		ykeys : [ 'a', 'b', 'c' ],
		labels : [ 'Completed', 'Pending', 'Total' ],
		hideHover : 'auto',
		resize : true
	});

});
